Integer chunkSize = 3;
List<String> strings = new List<String>{
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 
    'Fig', 'Grape', 'Honeydew', 'Indian Fig', 'Jackfruit',
    'Kiwi', 'Lemon', 'Mango', 'Nectarine', 'Orange',
    'Papaya', 'Quince', 'Raspberry', 'Strawberry', 'Tangerine'
};

while(!strings.isEmpty()) {
    List<String> currentChunk = cutChankFromList(strings, chunkSize);
    System.debug('Processing chunk: ' + currentChunk);
}


List<String> cutChankFromList(List<String> inputList, Integer chankSize) {
    List<String> chankList = new List<String>();

    Integer itemsToProcess = Math.min(chankSize, inputList.size());
    
    for (Integer i = 0; i < itemsToProcess; i++) {
        chankList.add(inputList.remove(0));
    }

    return chankList;
}