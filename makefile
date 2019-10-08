SrcFiles=$(wildcard *.cpp)
ObjFiles=$(patsubst %.cpp,./bin/%.o,$(SrcFiles))

all:main

main:$(ObjFiles)
	g++ -o $@ -I ./include $(ObjFiles)
./bin/%.o:%.cpp
	g++ -c -I ./include $< -o $@
.PHONY:clean all
clean:
	find . -name *.o | xargs rm -f
	rm -f main
