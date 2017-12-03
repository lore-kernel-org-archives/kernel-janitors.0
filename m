From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Dec 2017 20:46:55 +0000
Subject: selftests: Testing a write attempt into a full file?
Message-Id: <428c83c2-4752-0fe4-b135-fa23b69dca78@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

I have constructed another demonstration program.


#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *f = fopen("/dev/full", "a");

	if (!f)
		goto report_failure;

	{
	int const c = 'X';

	if (fputc(c, f) != c)
		goto report_failure;
	}

	return EXIT_SUCCESS;

report_failure:
	perror(__func__);
	return errno;
}


I got the following result.

elfring@Sonne:~/Projekte/selftests> gcc-7 putc_into_full_file1.c && ./a.out; echo $?
0


Does such a simple test example need further software development considerations?

Regards,
Markus
