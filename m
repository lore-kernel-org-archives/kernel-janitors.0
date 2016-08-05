From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 05 Aug 2016 10:12:28 +0000
Subject: Re: [PATCH 08/11] net/fsl: use of_property_read_bool
Message-Id: <1470391948.2977.33.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
	  <1470387411-15879-9-git-send-email-Julia.Lawall@lip6.fr>
	  (sfid-20160805_111640_944584_00A38E89) <1470389433.2977.31.camel@sipsolutions.net>
	 <alpine.DEB.2.10.1608051207510.2999@hadrien>
In-Reply-To: <alpine.DEB.2.10.1608051207510.2999@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2016-08-05 at 12:08 +0200, Julia Lawall wrote:
> 
> Can I do the same for:
> 
>         if (of_property_read_bool(np, "phy-clk-valid"))
>                 pdata->check_phy_clk_valid = 1;
>         else
>                 pdata->check_phy_clk_valid = 0;
> 
> The type is not bool, but:
> 
> include/linux/fsl_devices.h:    unsigned        check_phy_clk_valid:1;
> 
The type doesn't even matter, does it? Any bool->int conversion should
result in 0/1.

johannes
