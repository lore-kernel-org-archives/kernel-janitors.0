From: Joel Becker <Joel.Becker@oracle.com>
Date: Fri, 27 Jan 2006 19:51:13 +0000
Subject: [KJ] Re: [Patch 2/12] BUG_ON() Conversion in fs/configfs/
Message-Id: <20060127195113.GH24478@ca-server1.us.oracle.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36757533374890095=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36757533374890095==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Fri, Jan 27, 2006 at 10:32:24AM +0100, Eric Sesterhenn / snakebyte wrote:
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner, contains unlikely() and can better optimized away.

This looks good, thanks.

Joel


-- 

"The real reason GNU ls is 8-bit-clean is so that they can
 start using ISO-8859-1 option characters."
	- Christopher Davis (ckd@loiosh.kei.com)

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127

--===============36757533374890095==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36757533374890095==--
