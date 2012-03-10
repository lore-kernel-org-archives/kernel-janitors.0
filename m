From: Joe Perches <joe@perches.com>
Date: Sat, 10 Mar 2012 18:32:57 +0000
Subject: Re: [PATCH] drivers/ata/pata_mpc52xx.c: add missing kfree
Message-Id: <1331404377.14442.19.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331402199-8000-1-git-send-email-Julia.Lawall@lip6.fr>
	 <20120310181315.GA4139@pengutronix.de>
In-Reply-To: <20120310181315.GA4139@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>, Anatolij Gustschin <agust@denx.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Jeff Garzik <jgarzik@pobox.com>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On Sat, 2012-03-10 at 19:13 +0100, Wolfram Sang wrote:
> On Sat, Mar 10, 2012 at 06:56:39PM +0100, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> > There is no need to call the devm cleanup functions on failure of a probe
> > or remove function.
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> the maintainer for MPC5xxx is Anatolij

Anatolij is not listed as a maintainer for this file
nor has he ever written or signed a patch for it.

It'd be possible to add patterns to MAINTAINERS
if Anatolij really wants to see changes to drivers.

Something like:

LINUX FOR POWERPC EMBEDDED MPC5XXX
M:	Anatolij Gustschin <agust@denx.de>
L:	linuxppc-dev@lists.ozlabs.org
T:	git git://git.denx.de/linux-2.6-agust.git
S:	Maintained
F:	arch/powerpc/platforms/512x/
F:	arch/powerpc/platforms/52xx/
F:	*/*/*mpc5[\dx][\dx][\dx]*
F:	*/*/*/*mpc5[\dx][\dx][\dx]*
F:	*/*/*/*/*mpc5[\dx][\dx][\dx]*


