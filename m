From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 13 Apr 2007 14:17:40 +0000
Subject: Re: [KJ] Confusion about build cycle and vmlinux/bzImage (need
Message-Id: <20070413141740.GB19584@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
In-Reply-To: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 12, 2007 at 10:15:33PM -0400, John Anthony Kazos Jr. wrote:
> static char *make_block_name(struct gendisk *disk)
> {
> -	static char *block_str = "block:";
> +	static char block_str[] = "block:";
> 
> <fs/partitions/check.o> goes from 8149 bytes to 8137 bytes. 'readelf' 
> shows that "block:" got moved from .rodata.str1.1 to .data and a 
> relocation token got removed that pointed into .rodata.str1.1, saving 12 
> bytes.

Make it:
+	static const char block_str[] = "block:";

That should move it back into rodata.

> <fs/built-in.o> goes from 1337360 to 1337320, saving 40 bytes.
> 
> <vmlinux>, however, stays exactly the same, at 4520468 bytes. And 

Is that using ls or size?

> <arch/i386/boot/bzImage> actually increases from 1702520 to 1072552, 
> losing 32 bytes.

Don't worry about bzImage.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
