From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 24 Jan 2005 23:47:54 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41F5892A.7090700@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:

>  ------------------------------------------------------------------------
> -From: Keith Owens 
> -To: Andrew Morton 
> -Subject: Re: Latest reference_init.pl script
> -
> ->Error: ./arch/i386/kernel/smpboot.o .altinstructions refers to 00000000 R_386_32          .init.text
> -
> -altinstructions is a false positive, tweak reference_init.pl
> -
> ---- reference_init.pl.orig	2004-06-01 20:30:27.000000000 +1000
> -+++ reference_init.pl	2004-06-01 20:31:01.000000000 +1000
> -@@ -93,6 +93,7 @@
> - 		     $from !~ /\.stab$/ &&
> - 		     $from !~ /\.rodata$/ &&
> - 		     $from !~ /\.text\.lock$/ &&
> -+		     $from !~ /\.altinstructions$/ &&
> - 		     $from !~ /\.debug_/)) {
> - 			printf("Error: %s %s refers to %s\n", $object, $from, $line);
> - 		}

This patch to reference_init.pl can be removed.  It has already
been merged.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
