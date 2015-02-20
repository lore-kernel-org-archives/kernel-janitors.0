From: David Miller <davem@davemloft.net>
Date: Fri, 20 Feb 2015 22:35:26 +0000
Subject: Re: [patch] caif: fix a signedness bug in cfpkt_iterate()
Message-Id: <20150220.173526.1527625915242269739.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150219091313.GA29358@mwanda>
In-Reply-To: <20150219091313.GA29358@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: dmitry.tarnyagin@lockless.no, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Feb 2015 12:13:13 +0300

> The cfpkt_iterate() function can return -EPROTO on error, but the
> function is a u16 so the negative value gets truncated to a positive
> unsigned short.  This causes a static checker warning.
> 
> The only caller which might care is cffrml_receive(), when it's checking
> the frame checksum.  I modified cffrml_receive() so that it never says
> -EPROTO is a valid checksum.
> 
> Also this isn't ever going to be inlined so I removed the "inline".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
