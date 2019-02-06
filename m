From: David Miller <davem@davemloft.net>
Date: Wed, 06 Feb 2019 22:03:39 +0000
Subject: Re: [PATCH net] net: dsa: Fix NULL checking in dsa_slave_set_eee()
Message-Id: <20190206.140339.924202706474639419.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190206153514.GA11033@kadam>
In-Reply-To: <20190206153514.GA11033@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 Feb 2019 18:35:15 +0300

> This function can't succeed if dp->pl is NULL.  It will Oops inside the
> call to return phylink_ethtool_get_eee(dp->pl, e);
> 
> Fixes: 1be52e97ed3e ("dsa: slave: eee: Allow ports to use phylink")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable.
