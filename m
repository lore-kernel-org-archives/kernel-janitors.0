From: David Miller <davem@davemloft.net>
Date: Mon, 25 Nov 2019 19:05:54 +0000
Subject: Re: [PATCH net v3] net: dsa: ocelot: add dependency for NET_DSA_MSCC_FELIX
Message-Id: <20191125.110554.14941471233332672.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3e9d6100-6965-da85-c310-6e1a9318f61d@huawei.com>
        <20191125124110.145595-1-maowenan@huawei.com>
In-Reply-To: <20191125124110.145595-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 25 Nov 2019 20:41:10 +0800

> +	select NET_VENDOR_MICROSEMI

This is never correct.
