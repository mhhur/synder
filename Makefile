TARGET=fagin
SOURCE=src
CFLAGS=-Wall -g -o $(TARGET)
CC=cc

# If anything changes, recompile the whole thing
all:
	$(CC) $(CFLAGS) $(SOURCE)/*c $(SOURCE)/*h || rm -f $(SOURCE)/*.gch
	[[ -d db ]] || mkdir db
	util/prepare-data.sh -a at -b al -i sample-inputs/a.syn -d db

clean:
	rm -f $(TARGET) $(SOURCE)/*.gch
	rm -rf db