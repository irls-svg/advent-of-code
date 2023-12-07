#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

FILE *file;

int main()
{
    char buf[1024];
    int total = 0;
    int i = 0; // removing this breaks it (i do not know why)

    file = fopen("input.txt", "r");

    if (file == NULL)
    {
        printf("Error! Could not open file\n");
        return 1;
    }

    while (fgets(buf, 1024, file))
    {
        printf("------------------- LINE: -------------------\n");
        printf("%s", buf);

        char line[1024], rev[1024];
        char nums[2];

        strcpy(rev, buf);
        strcpy(line, buf);

        // reverse string
        int length = strlen(rev);
        int start = 0;
        int end = length - 1;

        while (start < end)
        {
            char temp = rev[start];
            rev[start] = rev[end];
            rev[end] = temp;

            start++;
            end--;
        }

        char *first = strpbrk(line, "0123456789");
        if (first)
        {
            printf("first num: %c\n", first[0]);
            nums[0] = first[0];
        }

        char *last = strpbrk(rev, "0123456789");
        if (last)
        {
            printf("last num: %c\n", last[0]);
            nums[1] = last[0];
        }

        printf("both nums: %s\n", nums);

        total += atoi(nums);

        printf("total: %d\n", total);
        printf("---------------------------------------------\n");
    }

    fclose(file);
    return 0;
}
