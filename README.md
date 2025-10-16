# 🎯 Hangman (Ruby)

A simple command-line implementation of the classic Hangman game built in Ruby. The game gives a secret word for the player to guess with only 10 chances. The player loses a chance for every incorrect guess of an alphabet. I omitted writing a hangman stickman figure for accessibility and potentially removing distressing imagery.

---

## ✨ Features

- Detailed Interactive Menu
- Player can save his/her progress
- Input validation for variables that require choices
- Computer word generation from txt.file
- Feedback from guesses

---

## Project Structure
```

.
├── main.rb              # Entry point to start the game
└── lib/
    ├── menu.rb         # Menu inteface, save, load, name
    ├── game.rb         # Game logic and flow
    ├── player.rb       # Human player class
    └── word.rb         # Word generator class
    ├── alphabets.rb    # Alphabets state class
```
---

## 🛠 Installation & Usage

1. Clone the repository:
   ```
   git clone https://github.com/your-username/odin-hangman/git
   cd odin-hangman
   ```

2. Install dependencies:
   ```
   bundle install
   (Requires the `colorize` and `debug` gems. Development also uses `rubocop`.)
   ```
   
3. Run the game:
   ```
   ruby main.rb
   ```
---

## 🧑‍💻 How to Play

1. Enter your name.
2. If there is a saved file it will ask if you want to load it.
3. Game begins by giving you blanks which you will let you guess the alphabets.
4. After each guess it will ask whether you want to continue or save progress.
5. You win by guessing the entire word.

---

## 📚 Concepts Practiced

- Object-Oriented Programming (OOP)
- Class composition and modular (Manu, Game, Player, etc.)
- User input handling & validation
- Files serialization with YAML

---

## 📄 License

This project is licensed for educational purposes only.  
You may use, modify, and share it for learning or personal projects.  
Commercial use requires explicit permission.

---

Made with 💎 Ruby for learning and fun!
