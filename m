From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 15:12:40 +0000
Subject: [KJ] [Patch 0/4] ide cleanups
Message-Id: <1138806760.22662.22.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17559674221278332=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17559674221278332==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> Patch looks fine but maybe we can try to fix few
> underlying problems while at it?

ok, lets try, hope i got your intentions right

> minor: please use drive->hwif->hwgroup instead of HWGROUP() macro

i did the cleanups, but fail to see why the are necessary
or useful. Is there a way to mark the #define as depreciated
Do you want to cleanup the HWIF() macro too?

The patches apply on top of the ide bug_on cleanup patch i send earlier.

Eric


--===============17559674221278332==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17559674221278332==--
