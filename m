From: JOUANNE Mickael <grigouze@noos.fr>
Date: Sun, 25 Jan 2004 12:37:47 +0000
Subject: [Kernel-janitors] New guy here, and patch for kj.pl
Message-Id: <20040125123747.GA21585@noos.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi all.

Here is a patch for kj.pl
It doesn't detect the MOD_{INC,DEC}_USE_COUNT correctly because of a
false regexp !

The message is also to be change it says : "Net drivers should call
SET_MODULE_OWNER instead of MOD_{INC,DEC}_USE_COUNT" but
MOD_{INC,DEC}_USE_COUNT is deprecated for all not only for netdrivers.

I also got a question, If i want to patch something on kernel with help
of TODO document, do i have to tell semeone before to not work on same
files that someone else or not ?

--=20
Micka=EBl GRIGOUZE	      grigouze@noos.fr	        ICQ : 42799256
*** \-/ ***  In a World Without Fences Who Needs Gates *** \-/ ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
