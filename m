From: David Miller <davem@davemloft.net>
Date: Mon, 28 Jan 2013 00:31:28 +0000
Subject: Re: [patch] ip6mr: limit IPv6 MRT_TABLE identifiers
Message-Id: <20130127.193128.794894878150200946.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130124063834.GA5611@elgon.mountain>
In-Reply-To: <20130124063834.GA5611@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Jan 2013 09:38:34 +0300

> We did this for IPv4 in b49d3c1e1c "net: ipmr: limit MRT_TABLE
> identifiers" but we need to do it for IPv6 as well.  On IPv6 the name
> is "pim6reg" instead of "pimreg" so there is one less digit allowed.
> 
> The strcpy() is in ip6mr_reg_vif().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
