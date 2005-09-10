From: Paul Mackerras <paulus@samba.org>
Date: Sat, 10 Sep 2005 13:26:14 +0000
Subject: [KJ] Re: [PATCH 2/4] arch/ppc: Replace custom macro with isdigit()
Message-Id: <17186.57078.514661.712234@cargo.ozlabs.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81486326214955951=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050910121633.GC1218@neon.tklauser.home>
In-Reply-To: <20050910121633.GC1218@neon.tklauser.home>
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: akpm@osdl.org, kernel-janitors@lists.osdl.org, linuxppc-dev@ozlabs.org, trini@kernel.crashing.org

--===============81486326214955951==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Tobias Klauser writes:

> Replace the custom is_digit() macro with isdigit() from <linux/ctype.h>

NAK.  No point pulling in 256 bytes of _ctype array when all we use it
for is two '0' <= c <= '9' comparisons.

In fact Tom Rini maintains this code, so it's his opinion that counts.

Paul.

--===============81486326214955951==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81486326214955951==--
