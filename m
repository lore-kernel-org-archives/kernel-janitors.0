From: John Daiker <daikerjohn@gmail.com>
Date: Tue, 08 Dec 2009 19:16:42 +0000
Subject: Re: [PATCH] NTFS: Change string pointers to string constants.
Message-Id: <4B1EA61A.2000804@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1259808806-27279-1-git-send-email-daikerjohn@gmail.com>	 <C1806924-DE57-4FBA-A67C-85C618FE6639@cam.ac.uk> <1260236833.3215.237.camel@Joe-Laptop.home>
In-Reply-To: <1260236833.3215.237.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <aia21@cam.ac.uk>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, aia21@cantab.net, linux-ntfs-dev@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>

On 12/07/2009 05:47 PM, Joe Perches wrote:
> On Tue, 2009-12-08 at 00:57 +0000, Anton Altaparmakov wrote:
>> Can you please explain the rational for making this change?
>
> Perhaps it's not worth much, but it saves a pointer reference.
>
> $ cat pointer.c
> #include<string.h>
> #include<stdio.h>
>
> int main (int argc, char** argv)
> {
> 	static const char *foo = "abcdefg";
> 	printf("%s\n", foo);
> 	return 0;
> }
>
> $ gcc -c pointer.c
> $ size pointer.o
>     text	   data	    bss	    dec	    hex	filename
>       37	      4	      0	     41	     29	pointer.o
>
> $ cat reference.c
> #include<string.h>
> #include<stdio.h>
>
> int main (int argc, char** argv)
> {
> static const char foo[] = "abcdefg";
> printf("%s\n", foo);
> return 0;
> }
>
> $ gcc -c reference.c
> $ size reference.o
>     text    data     bss     dec     hex filename
>       36       0       0      36      24 reference.o
>
>
>

As Joe mentioned above (thanks Joe!) it saves a pointer reference.

It is also listed as a KernelJanitors ToDo item (about 2/3 of the way 
down the page).  Searching for 'From: Jeff Garzik' should find it.

John

[1] http://kernelnewbies.org/KernelJanitors/Todo
