From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 01:46:27 +0000
Subject: Re: [PATCH net] dpaa2-eth: prevent array underflow in update_cls_rule()
Message-Id: <20200508184627.70e76aa3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508143720.GA410645@mwanda>
In-Reply-To: <20200508143720.GA410645@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Ioana Radulescu <ruxandra.radulescu@nxp.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 8 May 2020 17:37:20 +0300 Dan Carpenter wrote:
> The "location" is controlled by the user via the ethtool_set_rxnfc()
> function.  This update_cls_rule() function checks for array overflows
> but it doesn't check if the value is negative.  I have changed the type
> to unsigned to prevent array underflows.
> 
> Fixes: afb90dbb5f78 ("dpaa2-eth: Add ethtool support for flow classification")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you!
