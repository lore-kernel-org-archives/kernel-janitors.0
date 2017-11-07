From: Madalin-cristian Bucur <madalin.bucur@nxp.com>
Date: Tue, 07 Nov 2017 07:14:07 +0000
Subject: RE: [PATCH 0/4] fsl/fman: Fix some error handling code in mac_probe
Message-Id: <DB3PR0402MB3849FA89B92E53974A46F488EC510@DB3PR0402MB3849.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Christophe,

I'll review and test your fixes.

Thank you!
Madalin

> -----Original Message-----
> From: Christophe JAILLET [mailto:christophe.jaillet@wanadoo.fr]
> Sent: Monday, November 06, 2017 11:53 PM
> To: Madalin-cristian Bucur <madalin.bucur@nxp.com>
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org; Christophe JAILLET
> <christophe.jaillet@wanadoo.fr>
> Subject: [PATCH 0/4] fsl/fman: Fix some error handling code in mac_probe
> 
> Commit c6e26ea8c893 ("dpaa_eth: change device used") generated some
> conflicts in my patches waiting for submission. So I took a closer look at
> it.
> 
> 
> So here is a serie of 4 patches.
> 
> The 1st one is just about a spurious call to 'dev_set_drvdata()', which is
> done in only 1 error handling path in the function.
> 
> The 2nd one removes some devm_iounmap/release/kfree functions which look
> useless to me.
> 
> The 3rd one fixes a missing of_node_put.
> 
> The 4th one is just cosmetic and removes a useless message.
> 
> 
> Christophe JAILLET (4):
>   fsl/fman: Remove a useless call to 'dev_set_drvdata()'
>   fsl/fman: Remove some useless code
>   fsl/fman: Add a missing 'of_node_put()' call in an error handling path
>   fsl/fman: Remove a useless 'dev_err()' call
> 
>  drivers/net/ethernet/freescale/fman/mac.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> --
> 2.14.1

