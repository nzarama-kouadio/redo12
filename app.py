from flask import Flask, request, render_template
from random_word import RandomWords

app = Flask(__name__)
r = RandomWords()

# Initialize game variables
random_word = ""
guessed_letters = set()
max_attempts = 6

# Route for the game homepage
@app.route("/", methods=["GET", "POST"])
def hangman():
    global random_word, guessed_letters, max_attempts

    if not random_word:
        random_word = r.get_random_word()
        if not random_word:
            return "Error: Could not fetch a random word. Please try again later."

    message = ""
    if request.method == "POST":
        guess = request.form.get("guess").lower()

        if len(guess) != 1 or not guess.isalpha():
            message = "Enter a single valid letter."
        elif guess in guessed_letters:
            message = "You already guessed this letter."
        else:
            guessed_letters.add(guess)
            if guess not in random_word:
                global max_attempts
                max_attempts -= 1
                message = f"Wrong guess! {max_attempts} attempts left."

        if max_attempts == 0:
            word = random_word
            reset_game()
            return render_template("game_over.html", word=word)
        elif all(letter in guessed_letters for letter in random_word):
            word = random_word
            reset_game()
            return render_template("win.html", word=word)

    displayed_word = " ".join([letter if letter in guessed_letters else "_" for letter in random_word])
    return render_template("index.html", word=displayed_word, guessed=" ".join(sorted(guessed_letters)), message=message)

def reset_game():
    global random_word, guessed_letters, max_attempts
    random_word = ""
    guessed_letters = set()
    max_attempts = 6

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)