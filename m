From: Joe Perches <joe@perches.com>
Date: Tue, 08 Dec 2009 01:47:13 +0000
Subject: Re: [PATCH] NTFS: Change string pointers to string constants.
Message-Id: <1260236833.3215.237.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1259808806-27279-1-git-send-email-daikerjohn@gmail.com>
	 <C1806924-DE57-4FBA-A67C-85C618FE6639@cam.ac.uk>
In-Reply-To: <C1806924-DE57-4FBA-A67C-85C618FE6639@cam.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <aia21@cam.ac.uk>
Cc: John Daiker <daikerjohn@gmail.com>, kernel-janitors@vger.kernel.org, aia21@cantab.net, linux-ntfs-dev@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>

On Tue, 2009-12-08 at 00:57 +0000, Anton Altaparmakov wrote:
> Can you please explain the rational for making this change?

Perhaps it's not worth much, but it saves a pointer reference.

$ cat pointer.c
#include <string.h>
#include <stdio.h>

int main (int argc, char** argv)
{
	static const char *foo = "abcdefg";
	printf("%s\n", foo);
	return 0;
}

$ gcc -c pointer.c
$ size pointer.o
   text	   data	    bss	    dec	    hex	filename
     37	      4	      0	     41	     29	pointer.o

$ cat reference.c
#include <string.h>
#include <stdio.h>

int main (int argc, char** argv)
{
static const char foo[] = "abcdefg";
printf("%s\n", foo);
return 0;
}

$ gcc -c reference.c
$ size reference.o
   text    data     bss     dec     hex filename
     36       0       0      36      24 reference.o



