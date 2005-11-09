From: "David S. Miller" <davem@davemloft.net>
Date: Wed, 09 Nov 2005 20:03:15 +0000
Subject: [KJ] Re: [PATCH] arch/sparc: Use ARRAY_SIZE macro
Message-Id: <20051109.120315.108937810.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38647408943695161=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38647408943695161==
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 8 Nov 2005 21:17:06 +0100

> Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove a
> duplicate of ARRAY_SIZE which is never used anyways.
> 
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

Applied, thanks.

--===============38647408943695161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38647408943695161==--
