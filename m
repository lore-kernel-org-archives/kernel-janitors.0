From: Jesse Millan <jessem@cs.pdx.edu>
Date: Sun, 22 May 2005 18:33:18 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning, idx may be used uninitialized
Message-Id: <4290D06E.7040505@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3FDD.5000601@gmail.com>
In-Reply-To: <428E3FDD.5000601@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Its not easy to reproduce this warning in a simple program. And, I am
not sure that it is a bug on gcc4's part. It looks like gcc4 emits the
warning when it cannot prove beyond a shadow of doubt that the variable
is initialized before use.

In an effort to cut down on warnings, should these be fixed? It can go
either way, the compiler should be smart enough and maybe it will be
someday, or, do the initialization to get rid of a bunch of warnings.

Any feed back would be appreciated.

Arnd Bergmann wrote:
> On Freedag 20 Mai 2005 21:51, Jesse Millan wrote:
> 
>>So, the compiler should be able to tell that either one of the two cases
>>apply?
>>
>>a: an assignment statement will be done on idx before its ever read
>>
>>or
>>
>>b: no assignment statement, control flow will never allow idx to be read
> 
> 
> gcc is normally pretty good at detecting this. Since gcc-4.0, it 
> appears to do more checking inside inline functions, where older
> versions just assumed that a variable is initialized after a reference
> to it is passed to an inline function.
> 
> I'd suggest fixing the inline function to always do this instead of
> fixing the caller. After all, this needs to be fixed in the kernel,
> even if future gcc versions become smarter about it gcc-4.0 will
> continue to be used.
> 
> 	Arnd <><
> 
> --- a/fs/bio.c	2005-03-29 03:42:37 +02:00
> +++ b/fs/bio.c	2005-05-22 11:22:17 +02:00
> @@ -90,6 +90,7 @@
>  		case  65 ... 128: *idx = 4; break;
>  		case 129 ... BIO_MAX_PAGES: *idx = 5; break;
>  		default:
> +			*idx = 0;
>  			return NULL;
>  	}
>  	/*
> 

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
