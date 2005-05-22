From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 22 May 2005 09:25:13 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <200505221125.13999.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Freedag 20 Mai 2005 21:51, Jesse Millan wrote:
> 
> So, the compiler should be able to tell that either one of the two cases
> apply?
> 
> a: an assignment statement will be done on idx before its ever read
> 
> or
> 
> b: no assignment statement, control flow will never allow idx to be read

gcc is normally pretty good at detecting this. Since gcc-4.0, it 
appears to do more checking inside inline functions, where older
versions just assumed that a variable is initialized after a reference
to it is passed to an inline function.

I'd suggest fixing the inline function to always do this instead of
fixing the caller. After all, this needs to be fixed in the kernel,
even if future gcc versions become smarter about it gcc-4.0 will
continue to be used.

	Arnd <><

--- a/fs/bio.c	2005-03-29 03:42:37 +02:00
+++ b/fs/bio.c	2005-05-22 11:22:17 +02:00
@@ -90,6 +90,7 @@
 		case  65 ... 128: *idx = 4; break;
 		case 129 ... BIO_MAX_PAGES: *idx = 5; break;
 		default:
+			*idx = 0;
 			return NULL;
 	}
 	/*
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
