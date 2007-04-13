From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Fri, 13 Apr 2007 02:15:33 +0000
Subject: [KJ] Confusion about build cycle and vmlinux/bzImage (need
Message-Id: <alpine.DEB.0.83.0704122214440.4489@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

(Meant to CC this list, sorry. Same thread as on kernelnewbies.)

I did a few simple independent tests between 'char *foo = "foo"' and 'char 
foo[] = "foo"' and they confirmed what the KJ docs say, that the latter 
results in a smaller object. So I did a test with <fs/partitions/check.c>.

static char *make_block_name(struct gendisk *disk)
{
-	static char *block_str = "block:";
+	static char block_str[] = "block:";

<fs/partitions/check.o> goes from 8149 bytes to 8137 bytes. 'readelf' 
shows that "block:" got moved from .rodata.str1.1 to .data and a 
relocation token got removed that pointed into .rodata.str1.1, saving 12 
bytes.

<fs/built-in.o> goes from 1337360 to 1337320, saving 40 bytes.

<vmlinux>, however, stays exactly the same, at 4520468 bytes. And 
<arch/i386/boot/bzImage> actually increases from 1702520 to 1072552, 
losing 32 bytes.

I could assume that the latter could be due to happenstance of data 
ordering before compression, but I'm sure I'm looking at the wrong 
pre-compression file. What file should I be looking at if I want the ELF 
image of the kernel fully-built but before the bootsector and so forth get 
added to it?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
