---
name: gibberish
description: Translates English text into the project's deterministic Gibberish language. Use whenever the user asks to translate English to Gibberish.
---

# Gibberish translator

Translate English to Gibberish with these rules:

1. Process every word from left to right.
2. Before every vowel (`a`, `e`, `i`, `o`, or `u`), insert `idig`.
3. Keep consonants, whitespace, punctuation, and the original vowel.
4. Return only the translated text unless the user explicitly asks for an explanation.

Examples:

- `hello world` becomes `hidigellidigo widigorld`
- `cat` becomes `cidigat`
- `quiet` becomes `qidiguidigiidiget`
