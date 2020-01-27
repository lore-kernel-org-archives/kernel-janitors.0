From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jan 2020 10:18:30 +0000
Subject: Re: [PATCH] drivers: net: xgene: Fix the order
Message-Id: <20200127.111830.1055640381586578614.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126104429.15156-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200126104429.15156-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: isubramanian@apm.com, keyur@os.amperecomputing.com, quan@os.amperecomputing.com, tinamdar@apm.com, kdinh@apm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Jan 2020 11:44:29 +0100

> 'alloc_etherdev_mqs()' expects first 'tx', then 'rx'. The semantic here
> looks reversed.
> 
> Reorder the arguments passed to 'alloc_etherdev_mqs()' in order to keep
> the correct semantic.
> 
> In fact, this is a no-op because both XGENE_NUM_[RT]X_RING are 8.
> 
> Fixes: 107dec2749fe ("drivers: net: xgene: Add support for multiple queues")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
