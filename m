From: David Miller <davem@davemloft.net>
Date: Sun, 01 Sep 2019 06:53:34 +0000
Subject: Re: [PATCH] enetc: Add missing call to 'pci_free_irq_vectors()' in probe and remove functions
Message-Id: <20190831.235334.383882811136027003.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830202312.21287-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190830202312.21287-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: yangbo.lu@nxp.com, claudiu.manoil@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 30 Aug 2019 22:23:12 +0200

> Call to 'pci_free_irq_vectors()' are missing both in the error handling
> path of the probe function, and in the remove function.
> Add them.
> 
> Fixes: 19971f5ea0ab ("enetc: add PTP clock driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
