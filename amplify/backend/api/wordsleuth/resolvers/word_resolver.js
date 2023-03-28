function addWord(id, text, char_count) {
  return context.db
    .loadWordByText(args.id)
    .then((wordData) => new Word(wordData));
}

/* human(obj, args, context, info) {
    return context.db.loadHumanByID(args.id).then(
      userData => new Human(userData)
    )
  }
 */
