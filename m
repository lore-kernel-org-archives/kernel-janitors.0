From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:04:12 +0000
Subject: Re: [PATCH net] enetc: Fix a signedness bug in enetc_of_get_phy()
Message-Id: <20190927.100412.283048791655860337.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105714.GF3264@mwanda>
In-Reply-To: <20190925105714.GF3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: claudiu.manoil@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:57:14 +0300

> The "priv->if_mode" is type phy_interface_t which is an enum.  In this
> context GCC will treat the enum as an unsigned int so this error
> handling is never triggered.
> 
> Fixes: d4fd0404c1c9 ("enetc: Introduce basic PF and VF ENETC ethernet drivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
