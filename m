From: Robert Richter <rrichter@marvell.com>
Date: Mon, 23 Sep 2019 08:11:27 +0000
Subject: Re: [PATCH] EDAC: Armada XP: Use devm_platform_ioremap_resource() in two functions
Message-Id: <20190923081117.4p4mwqz35fzavkeg@rric.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3cf2076e-6394-4997-613d-cbf5b6dbee1e@web.de>
In-Reply-To: <3cf2076e-6394-4997-613d-cbf5b6dbee1e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>, =?iso-8859-1?Q?Jan_L=FCbbe?= <jlu@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Markus,

On 21.09.19 17:57:24, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 17:50:17 +0200
> 
> Simplify these function implementations by using a known function.
> 
> This issue was detected by using the Coccinelle software.

Which semantic patch did you use here?

The kernel's spatch for this pattern only found and fixed the
following:

 $ make coccicheck COCCI=scripts/coccinelle/api/devm_platform_ioremap_resource.cocci MODE=patch M=drivers/edac | patch -p1
 patching file drivers/edac/ti_edac.c
 patching file drivers/edac/xgene_edac.c
 patching file drivers/edac/synopsys_edac.c

There are probably more drivers to fix than the above and the one you
fixed:

 $ git grep -l platform_get_resource drivers/edac/
 drivers/edac/altera_edac.c
 drivers/edac/armada_xp_edac.c
 drivers/edac/aspeed_edac.c
 drivers/edac/bluefield_edac.c
 drivers/edac/cpc925_edac.c
 drivers/edac/highbank_l2_edac.c
 drivers/edac/highbank_mc_edac.c
 drivers/edac/mv64x60_edac.c
 drivers/edac/synopsys_edac.c
 drivers/edac/ti_edac.c
 drivers/edac/xgene_edac.c

So while at it, how about fixing the .cocci patch in scripts/ and run
it for drivers/edac? There should be one patch only for all edac
drivers.

Thanks,

-Robert
