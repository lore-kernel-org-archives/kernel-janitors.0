From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 02 Apr 2004 17:05:49 +0000
Subject: Re: [Kernel-janitors] [REDIFF] - drivers/block/floppy.c audit.
Message-Id: <20040402090549.2bf72d80.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078867777.28746.11.camel@telecentrolivre>
In-Reply-To: <1078867777.28746.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2 Apr 2004 13:58:45 -0300 Luiz Fernando N. Capitulino wrote:

| 
|  Hi Randy,
| 
| Em Thu, 1 Apr 2004 16:44:37 -0800
| "Randy.Dunlap" <rddunlap@osdl.org> escreveu:
| 
| | On Fri, 19 Mar 2004 16:30:57 -0300 Luiz Fernando Capitulino wrote:
| | 
| | | 
| | | Hi people,
| | | 
| | |  This version comes with the Randy suggestions, the changes
| | | are:
| | | 
| | | - <unsigned char> to <int>;
| | | - del_gendisk() insteed of put_disk();
| | 
| | I was wrong about that one.
| | alloc_disk() is reversed by put_disk() and
| | add_disk() is reversed by del_gendisk() AFAICT.
| | Is that right .... ??
| 
|  I think so. I made the change because I was not certain
| about add_disk().
| 
|  I need to contest you sometimes. :-)

Sure, that's OK.

| | Anyway, I've made that change, but it needs review, of course,
| | when I post the new patchset, hopefully later tonight, Friday
| | at latest.
| | 
| | 
| | | - del_timer() for all disks.
| | | 
| | |  Randy, I'm using del_timer in the while() loop. Do you
| | | still believe that is wrong ?
| | 
| | You mean in out_del_gendisk: ?
| 
|  don't, I'm speaking about out_put_disk.

I renamed it to out_put_disk.  AFAIK the code in the new
2.6.5-rc3-kj1 patchset is OK.  Did you check it?
   http://developer.osdl.org/rddunlap/kj-patches/2.6.5-rc3/split/patches/floppy_audit_v2.patch

--
~Randy
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
