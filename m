From: walter harms <wharms@bfs.de>
Date: Sun, 03 Dec 2017 21:59:01 +0000
Subject: Re: selftests: Testing a write attempt into a full file?
Message-Id: <5A2473A5.2070601@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428c83c2-4752-0fe4-b135-fa23b69dca78@users.sourceforge.net>
In-Reply-To: <428c83c2-4752-0fe4-b135-fa23b69dca78@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 03.12.2017 21:46, schrieb SF Markus Elfring:
> Hello,
> 
> I have constructed another demonstration program.
> 
> 
> #include <errno.h>
> #include <stdio.h>
> #include <stdlib.h>
> 
> int main(void)
> {
> 	FILE *f = fopen("/dev/full", "a");
> 
> 	if (!f)
> 		goto report_failure;
> 
> 	{
> 	int const c = 'X';
> 
> 	if (fputc(c, f) != c)
> 		goto report_failure;
> 	}
> 
Your test is broken, you are writing actualy into a buffer.
Adding setbuf(f,NULL) to disable buffering will return
main: No space left on device

Otherwise force the buffer to be fflush()ed and i it will also
report an error.

> 	return EXIT_SUCCESS;
> 
> report_failure:
> 	perror(__func__);
from perror(3):
 errno is undefined after a successful library call

so this may or may not return what you expect.

re,
 wh
> 	return errno;
> }
> 
> 
> I got the following result.
> 
> elfring@Sonne:~/Projekte/selftests> gcc-7 putc_into_full_file1.c && ./a.out; echo $?
> 0
> 
> 
> Does such a simple test example need further software development considerations?
> 
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
