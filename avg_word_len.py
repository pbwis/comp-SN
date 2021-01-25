# Average word length. Special characters excluded.

example = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."


def avg_word_len(sentence):
    spec_char = ".,':?!"  # ignore special characters
    for spec in spec_char:
        sentence = sentence.replace(spec, '')
    words = sentence.split()
    avg = sum(len(word) for word in words)/len(words)
    return round(avg, 2)


print(avg_word_len(example))
