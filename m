From: "David S. Miller" <davem@davemloft.net>
Date: Fri, 10 Mar 2006 10:55:33 +0000
Subject: [KJ] Re: [Patch] BUG_ON() Conversion in arch/sparc/kernel/ioport.c
Message-Id: <20060310.025533.71195150.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============042402711021358286=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============042402711021358286==
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 20:12:04 +0100

> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner and can better optimized away
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

Patch applied, thanks Eric.

--===============042402711021358286==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============042402711021358286==--
