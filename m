From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Sat, 12 Feb 2005 21:38:31 +0000
Subject: [KJ] TODO: 5 new items.
Message-Id: <200502130029.41718.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84942960491764508=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84942960491764508==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Domen, if you want the patch tell me against 1.25, 1.26 or 1.27 should it be.

Anyway, people, what do you think about these?

1. Fix sparse warnings.

Read section "Where to get sparse" in Documentation/sparse.txt.
$ make allyesconfig	or whatever config you like.
Set CONFIG_DEBUG_INFO=n to make compiles faster and smaller.
$ make -k C=1 2>&1 | tee ../W_sparse
	or
$ make -k C=1 CHECK="sparse -Wbitwise" 2>&1 | tee ../W_sparse

_Plenty_ of patches here (well, not all of them fix sparse warnings ;-) ):
[E: http://linux.bkbits.net:8080/linux-2.6/search/?expr=sparse&search=ChangeSet+comments]

2.

For portability reasons pointers should be printed as ("%p", ptr), not
("%08x", (int) ptr) or similar.

3.

$ make randconfig
$ make -k 2>&1 | tee ../W_randconfig

Find out why it doesn't build. Fix warnings that aren't seen with usual
"allyesconfig", "allmodconfig", ...

P. S.: Run it several times, think a little and take bets on whether it'll
build or not on the next party among local linuxoids. :-)

4.

Some drivers do:

	if ((jiffies - data->last_updated > HZ * 2) ||
            (jiffies < data->last_updated))

Should be:

	#include <linux/jiffies.h>
	if (time_after(jiffies, data->last_updated + HZ * 2))

Have a patch for drivers/i2c/chips/*.

5. verify_area() is obsoleted. Use access_ok() instead.

Jesper Juhl gave excellent description:

http://marc.theaimsgroup.com/?l=linux-kernel&m=110601151424338&w=2

	1) verify_area has been obsolete for quite a while. It was commented
	   in the source as being obsolete 23 months ago. The replacement
	   function is access_ok. It's about time it dies.
	2) verify_area is just a wrapper around verify_area (or equivalent)
	   on all archs - it's just a waste of space.

What is already done but not yet merged (maybe) into mainline:

http://marc.theaimsgroup.com/?l=linux-kernel&m=110557975201349&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601188609975&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601188728046&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601253108292&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601220107990&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601253131716&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601286014600&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601286031535&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601392122266&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601375625922&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110601350702969&w=2

	Alexey

--===============84942960491764508==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84942960491764508==--
