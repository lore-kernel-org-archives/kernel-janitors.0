From: randy_dunlap <rdunlap@xenotime.net>
Date: Sat, 28 May 2005 18:20:47 +0000
Subject: Re: [KJ] init_module / cleanup_module cleanup
Message-Id: <20050528112047.6448ff14.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91735375279755549=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42984D00.8070003@reiner-h.de>
In-Reply-To: <42984D00.8070003@reiner-h.de>
To: kernel-janitors@vger.kernel.org

--===============91735375279755549==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 May 2005 15:13:04 +0200 Domen Puncer wrote:

| On 28/05/05 12:50 +0200, Reiner Herrmann wrote:
| > Hi!
| > 
| > This is my first kernel patch, so I did a rather simple cleanup.
| > Some network-drivers still used the old
| > init_module() / cleanup_module() way of de-/registering
| > at the kernel.
| 
| Hi Reiner.
| 
| Nice, you got tabs and linewraps right the first time.
| Still, some issues and nitpicks:
| 
| Missing "Signed-off-by:";
| Patch should probably be split per dir (diffsplit -d) and if some patch
| touches >1 file of a driver, per driver.
| Also, diffstat -p1 when patching multiple files is great.
| (http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt is a nice
|  read).
| 
| > 
| > diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c linux-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c
| > --- vanilla-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c	2005-03-02 08:38:26.000000000 +0100
| > +++ linux-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c	2005-05-28 01:10:59.000000000 +0200
| 
| This one (and probably some others) won't compile on !MODULE, because
| it includes wavelan.p.h with variables only defined on MODULE.
| 
| An ugly hack i used to quickly compile test it:
| 	egrep "^--- " ~/netdrivers_module_cleanup.diff | cut -f2 -d' '| cut -f1 | cut -f2- -d'/' | sed 's/.c$/.o/g' | xargs -n1 make 2>&1
| 
| Btw. anyone knows how to make ie.
| "make CFLAGS=-DMODULE drivers/net/3c59x.o" work?

AFAIK, you need CONFIG_VORTEX=m in .conifg and then do:

rm drivers/net/3c59x*o

make modules SUBDIRS=drivers/net
or
make drivers/net/3c59x.o

| Also, when playing with __init and __exit, "make namespacecheck" can
| catch some errors.

---
~Randy

--===============91735375279755549==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91735375279755549==--
