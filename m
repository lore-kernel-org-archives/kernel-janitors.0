From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Wed, 06 Feb 2019 17:48:26 +0000
Subject: Re: [PATCH net] net: dsa: Fix NULL checking in dsa_slave_set_eee()
Message-Id: <20190206124826.GB9278@t480s.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190206153514.GA11033@kadam>
In-Reply-To: <20190206153514.GA11033@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 6 Feb 2019 18:35:15 +0300, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This function can't succeed if dp->pl is NULL.  It will Oops inside the
> call to return phylink_ethtool_get_eee(dp->pl, e);
> 
> Fixes: 1be52e97ed3e ("dsa: slave: eee: Allow ports to use phylink")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Vivien Didelot <vivien.didelot@gmail.com>
