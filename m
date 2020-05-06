From: David Miller <davem@davemloft.net>
Date: Wed, 06 May 2020 21:18:09 +0000
Subject: Re: [PATCH 1/2 net] net: mvpp2: prevent buffer overflow in mvpp22_rss_ctx()
Message-Id: <20200506.141809.1664241067295315347.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506101622.GB77004@mwanda>
In-Reply-To: <20200506101622.GB77004@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: maxime.chevallier@bootlin.com, mcroce@redhat.com, rmk+kernel@armlinux.org.uk, antoine.tenart@bootlin.com, ioana.ciornei@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 May 2020 13:16:22 +0300

> The "rss_context" variable comes from the user via  ethtool_get_rxfh().
> It can be any u32 value except zero.  Eventually it gets passed to
> mvpp22_rss_ctx() and if it is over MVPP22_N_RSS_TABLES (8) then it
> results in an array overflow.
> 
> Fixes: 895586d5dc32 ("net: mvpp2: cls: Use RSS contexts to handle RSS tables")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
