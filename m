From: David Miller <davem@davemloft.net>
Date: Wed, 06 May 2020 21:18:14 +0000
Subject: Re: [PATCH 2/2 net] net: mvpp2: cls: Prevent buffer overflow in mvpp2_ethtool_cls_rule_del()
Message-Id: <20200506.141814.1060708966400070196.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506101622.GB77004@mwanda>
        <20200506101656.GC77004@mwanda>
In-Reply-To: <20200506101656.GC77004@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: maxime.chevallier@bootlin.com, kuba@kernel.org, jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 May 2020 13:16:56 +0300

> The "info->fs.location" is a u32 that comes from the user via the
> ethtool_set_rxnfc() function.  We need to check for invalid values to
> prevent a buffer overflow.
> 
> I copy and pasted this check from the mvpp2_ethtool_cls_rule_ins()
> function.
> 
> Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
