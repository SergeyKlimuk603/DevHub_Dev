Integer chunkSize = 3;
List<String> strings = new List<String>{
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 
    'Fig', 'Grape', 'Honeydew', 'Indian Fig', 'Jackfruit',
    'Kiwi', 'Lemon', 'Mango', 'Nectarine', 'Orange',
    'Papaya', 'Quince', 'Raspberry', 'Strawberry', 'Tangerine'
};

while(!strings.isEmpty()) {
    List<String> currentChunk = cutChunkFromList(strings, chunkSize);
    System.debug('Processing chunk: ' + currentChunk);
}


List<String> cutChunkFromList(List<String> inputList, Integer chunkSize) {
    List<String> chunkList = new List<String>();

    Integer itemsToProcess = Math.min(chunkSize, inputList.size());
    
    for (Integer i = 0; i < itemsToProcess; i++) {
        chunkList.add(inputList.remove(0));
    }

    return chunkList;
}