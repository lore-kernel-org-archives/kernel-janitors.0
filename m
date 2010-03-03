From: David Miller <davem@davemloft.net>
Date: Wed, 03 Mar 2010 09:08:14 +0000
Subject: Re: [patch] davinci_emac: off by one
Message-Id: <20100303.010814.246406195.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100303070724.GC5086@bicker>
In-Reply-To: <20100303070724.GC5086@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, chaithrika@ti.com, srk@ti.com, khilman@deeprootsystems.com, anantgole@ti.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 3 Mar 2010 10:07:24 +0300

> This off by one error was found by smatch.
> 
> drivers/net/davinci_emac.c +2390 emac_dev_open(13) error: buffer overflow 'priv->mac_addr' 6 <= 6
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> I don't have the hardware to test this.  If would be cool if someone
> would verify that the hardware still works after the patch is applied.

It looks obvious enough for me, taking in more than 6 address
bytes make no sense in an ethernet driver, so I'll apply this.

Thanks.
