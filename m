From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 18 Jan 2005 09:08:08 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <200501181203.58712.adobriyan@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 18 January 2005 02:08, Randy.Dunlap wrote:

> Here are 2 recent janitor suggestions from lkml:
>
> http://lkml.org/lkml/2005/1/5/117
>
> http://lkml.org/lkml/2005/1/17/94

Another one:

http://marc.theaimsgroup.com/?t8001993000001&r=1&w=2

Macros in question are called DMA_32BIT_MASK and DMA_64BIT_MASK now.

Sample patch:

http://linux.bkbits.net:8080/linux-2.6/patch@1.1938.471.9?nav=cset@1.1938.471.9

	Alexey
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
