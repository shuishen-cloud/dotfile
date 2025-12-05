#include <stddef.h>	// offsetof
#include <stdlib.h>	// malloc

#define container_of(ptr, type, member) ({	\
	const typeof(((type *) 0) -> member) * __mptr = (ptr);	\
	(type *)( (char *) __mptr - offsetof(type, member));})

struct Human {
	int head;
	int tail;
};

struct Link {
	void * prev;
	void * next;
};

#include <stdio.h>

int main(){
	// a interesting grammar
	// - ? why () will counteract the {} ?
	int a = ({1;2;3;}) + 10;
	typeof(a) b = 12;
	printf("%d %d\n", a, b);
	
	// a example and test of container_of
	// - I think MSVC couldn't complie this.
	struct Human * human = (struct Human *) malloc(sizeof(struct Human));
	human->tail = 5;
	
	int * head_ptr = &human->head;	
	struct Human * struct_ptr = container_of(head_ptr, struct Human, head);
	
	printf("%d", struct_ptr->tail);
}
