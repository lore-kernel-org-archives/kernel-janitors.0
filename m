From: David Miller <davem@davemloft.net>
Date: Thu, 12 Mar 2020 22:53:21 +0000
Subject: Re: [PATCH] octeontx2-pf: unlock on error path in otx2_config_pause_frm()
Message-Id: <20200312.155321.1860923182739836747.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113048.GB20562@mwanda>
In-Reply-To: <20200312113048.GB20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com, andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 14:30:48 +0300

> We need to unlock before returning if this allocation fails.
> 
> Fixes: 75f36270990c ("octeontx2-pf: Support to enable/disable pause frames via ethtool")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next.

Dan, please indicate the appropriate target tree in your Subject lines
in the future.  I have to dance around my GIT trees to figure out where
your patches apply and that eats up more time than necessary.

Thanks.
