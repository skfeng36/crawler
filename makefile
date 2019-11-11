CXX = g++
CC  = gcc


CXXFLAGS = 	-g -Wall -fmessage-length=0
CCFLAGS = 	-g -Wall -fmessage-length=0

DEST = 		./
INCLUDES += 	-I./include 
LDFLAGS +=	
LIBS +=		

#%.o:%.cpp
#	$(CXX) $(CCFLAGS) $(INCLUDES)  -o $@  -c $< 

INCLUDEDIRS =  -I./include/ 

SRC = $(wildcard *.cpp) 

OBJS =		$(SRC:.cpp=.o) $(SRC_PB:.cc=.o)
LIBS =		-lpthread 
TARGET =	crawler

.cpp.o:
	$(CXX) $(CCFLAGS) $(INCLUDEDIRS)  -c $< -o $@
.cc.o:
	$(CXX) $(CXXFLAGS) $(INCLUDEDIRS) -c $< -o $@

$(TARGET):	$(OBJS)

	$(CXX) $(CCFLAGS) $(LDFLAGS) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET) 
	rm -f $(OBJS)
install:
	
clean:
	rm -f $(OBJS) $(TARGET)



