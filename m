From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 01 Jun 2004 17:40:49 +0000
Subject: Re: [Kernel-janitors]  linux-2.6.6/drivers/mtd/devices/doc2000.c:
Message-Id: <20040601104049.5b18ae4e.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74540971658779265=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74540971658779265==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Jun 2004 19:04:29 +0200 (Walter Harms) wrote:

| hi list,
| some problem as in doc2001 is here (wrong argument type).
| I have no mtd and no idea how to test it. at least it
| compiles without problems now.
| 
| walter

Similar patches were submitted on 2004-feb-20 by
Vinay K Nallamothu (to lkml).  They were rejected by the
MTD maintainer like so:

"Nack. The warning is valid, and probably ought to stay there till the
driver in question gets updated to conform to the new ECC API."

--
~Randy

--===============74540971658779265==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74540971658779265==--
