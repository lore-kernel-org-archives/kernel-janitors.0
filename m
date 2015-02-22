From: David Miller <davem@davemloft.net>
Date: Sun, 22 Feb 2015 02:59:25 +0000
Subject: Re: [patch] ethtool: use "ops" name consistenty in ethtool_set_rxfh()
Message-Id: <20150221.215925.91114669130700758.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150220105405.GC7895@mwanda>
In-Reply-To: <20150220105405.GC7895@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ben@decadent.org.uk, amirv@mellanox.com, edumazet@google.com, VenkatKumar.Duvvuru@Emulex.Com, eswierk@skyportsystems.com, jiri@resnulli.us, _govind@gmx.com, eyalpe@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Feb 2015 13:54:05 +0300

> "dev->ethtool_ops" and "ops" are the same, but we should use "ops"
> everywhere to be consistent.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks Dan.
