From: Tom Rini <trini@kernel.crashing.org>
Date: Sat, 10 Sep 2005 16:23:37 +0000
Subject: [KJ] Re: [PATCH 2/4] arch/ppc: Replace custom macro with isdigit()
Message-Id: <20050910162337.GA17038@smtp.west.cox.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27479449852467863=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050910121633.GC1218@neon.tklauser.home>
In-Reply-To: <20050910121633.GC1218@neon.tklauser.home>
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: akpm@osdl.org, kernel-janitors@lists.osdl.org, linuxppc-dev@ozlabs.org

--===============27479449852467863==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 10, 2005 at 02:16:33PM +0200, Tobias Klauser wrote:

> Replace the custom is_digit() macro with isdigit() from <linux/ctype.h>
> 
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

NAK, in the boot code we don't want to be adding dependanies on external
things without good reason to.

-- 
Tom Rini
http://gate.crashing.org/~trini/

--===============27479449852467863==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27479449852467863==--
