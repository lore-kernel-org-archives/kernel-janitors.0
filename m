From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Fri, 13 Apr 2007 15:04:14 +0000
Subject: Re: [KJ] Confusion about build cycle and vmlinux/bzImage (need
Message-Id: <alpine.DEB.0.83.0704131047100.21820@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
In-Reply-To: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > static char *make_block_name(struct gendisk *disk)
> > {
> > -	static char *block_str = "block:";
> > +	static char block_str[] = "block:";
> > 
> > <fs/partitions/check.o> goes from 8149 bytes to 8137 bytes. 'readelf' 
> > shows that "block:" got moved from .rodata.str1.1 to .data and a 
> > relocation token got removed that pointed into .rodata.str1.1, saving 12 
> > bytes.
> 
> Make it:
> +	static const char block_str[] = "block:";
> 
> That should move it back into rodata.
> 
> > <fs/built-in.o> goes from 1337360 to 1337320, saving 40 bytes.
> > 
> > <vmlinux>, however, stays exactly the same, at 4520468 bytes. And 
> 
> Is that using ls or size?

Using 'ls -l' and 'du -b' to make sure I wasn't getting fs block sizes. 
Which can't be, since it's not even a multiple of 512. Individual section 
sizes I'm using 'readelf -a' to check.

I've been doing more tests. I've tried all of these with and without 
const. From within <fs/ntfs/super.c> (and the function 
'load_system_files'), both inside a function and global to the file, and 
using a printk() to make sure gcc uses the variable "for real".

static [const] char *foofoo = "foo1foo2foo3foo4foo5foo", 24 bytes.

But I'm actually getting an increase of eight bytes, and I can't figure 
out why. Going from "static char *foofoo" to "static char foofoo[]" takes 
24 bytes out of '.rodata' and adds 30 bytes to '.data'. I even tried using 
an array initializer as "static char foofoo[] = {'f','o', .. , 'o',0}" but 
it ended up the same size.

When I tried it with const, "static const char *foofoo" to "static const 
char foofoo[]" from within function context, I got an increase as well: 
'.rodata' increased by 8 bytes. All other sections stayed the same. Each 
section after '.rodata' got moved forward by 8 bytes until 
'__ksymtab_strings' which was aligned at 32 bytes so there was space 
before it to expand, meaning the overall file size stayed the same.

My architecture is 32-bit (i386). Would a pointer be 8 bytes? Storing a 
segment register or something? But anyway, I just do not understand why 
it's increasing now when it was decreasing before. If I create a dummy 
module and try these tests, the sizes go down, the same as I do if I 
create dummy userspace executables to test.

(On a side note, I was surprised that initializing static variables to 
zero still does take them out of bss. Seems like an idiotic GCC failing, 
especially since it has an optimization to put non-static zero-initialized 
data INTO bss. Left hand, right hand, I guess. Somebody less lazy than me 
should file a bug report.)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
