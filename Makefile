CFLAGS=-g -O3 -fPIC
LDFLAGS=-Isundown/src -Isundown/html
ERLANG_FLAGS=-I/usr/local/Cellar/erlang/R15B/lib/erlang/erts-5.9/include
CC=gcc

SUNDOWN_SRC=\
	    sundown/src/buffer.o\
	    sundown/src/markdown.o\
	    sundown/src/stack.o\
	    sundown/src/autolink.o\
	    sundown/html/html.o\
	    sundown/html/html_smartypants.o\
	    sundown/html/houdini_html_e.o\
	    sundown/html/houdini_href_e.o

NIF_SRC=\
	src/markdown_nif.o
		
OUTPUT=markdown.so

markdown.so: $(SUNDOWN_SRC) $(NIF_SRC)
	$(CC) $(CFLAGS) $(ERLANG_FLAGS) -dynamiclib -undefined dynamic_lookup -o $@ $(SUNDOWN_SRC) $(NIF_SRC)

clean:
	rm -f sundown/src/*.o sundown/html/*.o src/*.o
	rm markdown.so

%.o: %.c 
	$(CC) $(CFLAGS) $(LDFLAGS) $(ERLANG_FLAGS) -c -o $@ $^	
