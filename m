From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 02 Apr 2004 00:44:37 +0000
Subject: Re: [Kernel-janitors] [REDIFF] - drivers/block/floppy.c audit.
Message-Id: <20040401164437.78885fc9.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078867777.28746.11.camel@telecentrolivre>
In-Reply-To: <1078867777.28746.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 19 Mar 2004 16:30:57 -0300 Luiz Fernando Capitulino wrote:

| 
| Hi people,
| 
|  This version comes with the Randy suggestions, the changes
| are:
| 
| - <unsigned char> to <int>;
| - del_gendisk() insteed of put_disk();

I was wrong about that one.
alloc_disk() is reversed by put_disk() and
add_disk() is reversed by del_gendisk() AFAICT.
Is that right .... ??

Anyway, I've made that change, but it needs review, of course,
when I post the new patchset, hopefully later tonight, Friday
at latest.


| - del_timer() for all disks.
| 
|  Randy, I'm using del_timer in the while() loop. Do you
| still believe that is wrong ?

You mean in out_del_gendisk: ?
That looks correct to me.  I don't know what I was thinking
earlier.

|  I'll love to hear comments, because I have no certain of the
| correctnes of this version.

Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
