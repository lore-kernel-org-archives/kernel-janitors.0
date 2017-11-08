From: David Miller <davem@davemloft.net>
Date: Wed, 08 Nov 2017 04:53:51 +0000
Subject: Re: [PATCH 0/4] fsl/fman: Fix some error handling code in mac_probe
Message-Id: <20171108.135351.1010349507668232046.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon,  6 Nov 2017 22:53:28 +0100

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

Series applied to net-next, thank you.
