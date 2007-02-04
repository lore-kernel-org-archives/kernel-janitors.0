From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sun, 04 Feb 2007 17:36:07 +0000
Subject: Re: [KJ] still wondering how to generate a short kernel API list
Message-Id: <20070204093607.f6dab5f5.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702040410530.26537@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702040410530.26537@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 4 Feb 2007 04:12:49 -0500 (EST) Robert P. J. Day wrote:

> 
>   i'm still wondering if there's a way, using the in-kernel
> documentation, to generate a condensed list for the kernel API similar
> to this:
> 
> http://www.gnugeneration.com/mirrors/kernel-api/book1.html
> 
> any ideas?

Have you tried an -mm kernel to see what it generates for kernel-doc?
IIRC, there's a patch in -mm to do that.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
