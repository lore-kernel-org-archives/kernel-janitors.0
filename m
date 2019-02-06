From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 06 Feb 2019 17:42:46 +0000
Subject: Re: [PATCH net] net: dsa: Fix NULL checking in dsa_slave_set_eee()
Message-Id: <325618d9-934e-dcd5-0032-26823c971c4a@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190206153514.GA11033@kadam>
In-Reply-To: <20190206153514.GA11033@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/6/19 7:35 AM, Dan Carpenter wrote:
> This function can't succeed if dp->pl is NULL.  It will Oops inside the
> call to return phylink_ethtool_get_eee(dp->pl, e);
> 
> Fixes: 1be52e97ed3e ("dsa: slave: eee: Allow ports to use phylink")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

thanks Dan!
-- 
Florian
