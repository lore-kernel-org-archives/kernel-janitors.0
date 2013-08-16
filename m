From: Tejun Heo <tj@kernel.org>
Date: Fri, 16 Aug 2013 16:53:50 +0000
Subject: Re: [patch] sata, highbank: clear whole array in highbank_initialize_phys()
Message-Id: <20130816165350.GL2505@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816073336.GA9881@elgon.mountain>
In-Reply-To: <20130816073336.GA9881@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello, Dan.

On Fri, Aug 16, 2013 at 10:33:36AM +0300, Dan Carpenter wrote:
> @@ -347,9 +347,9 @@ static int highbank_initialize_phys(struct device *dev, void __iomem *addr)
>  	struct device_node *phy_nodes[CPHY_PHY_COUNT];
>  	u32 tx_atten[CPHY_PORT_COUNT];
>  
> -	memset(port_data, 0, sizeof(struct phy_lane_info) * CPHY_PORT_COUNT);
> -	memset(phy_nodes, 0, sizeof(struct device_node*) * CPHY_PHY_COUNT);
> -	memset(tx_atten, 0xff, CPHY_PORT_COUNT);
> +	memset(port_data, 0, sizeof(port_data));
> +	memset(phy_nodes, 0, sizeof(phy_nodes));
> +	memset(tx_atten, 0xff, sizeof(tx_atten));

Ugh... why would anybody name a global variable port_data[]?  So,
port_data is global and the other two are local.  Wouldn't it be
better to just do "= { }" on declaration for the local ones?

Thanks.

-- 
tejun
