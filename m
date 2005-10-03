From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 03 Oct 2005 05:44:51 +0000
Subject: [KJ] [PATCH 0/13] fix all sparse gfp 'nocast' warnings
Message-Id: <20051002224451.0bb9d272.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============911826317485114=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============911826317485114==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi,

I have 13 patches for 'nocast' warnings from sparse.
I'm cc-ing various maintainers and Alexey.
Some of them are sent here (kernel-janitors), lots of them are
sent to netdev@vger.kernel.org, and a few are to other various
places.


Fix all warnings of the type

  warning: implicit cast to nocast type

that are for gfp_flags not being 'unsigned int'
(lots of places declared them as plain 'int').

---
~Randy

--===============911826317485114==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============911826317485114==--
