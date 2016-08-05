From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 05 Aug 2016 10:08:35 +0000
Subject: Re: [PATCH 08/11] net/fsl: use of_property_read_bool
Message-Id: <alpine.DEB.2.10.1608051207510.2999@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1410669134-1470391715=:2999"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>  <1470387411-15879-9-git-send-email-Julia.Lawall@lip6.fr>  (sfid-20160805_111640_944584_00A38E89) <1470389433.2977.31.camel@sipsolutions.net>
In-Reply-To: <1470389433.2977.31.camel@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1410669134-1470391715=:2999
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 5 Aug 2016, Johannes Berg wrote:

>
> > -	if (of_get_property(pdev->dev.of_node,
> > -			    "little-endian", NULL))
> > +	if (of_property_read_bool(pdev->dev.of_node, "little-
> > endian"))
> >  		priv->is_little_endian = true;
> >  	else
> >  		priv->is_little_endian = false;
> >
>
> Perhaps, while changing this, that'd be better as
>
> 	priv->is_little_endian = of_property_read_bool(...);
>
> Obviously that would've worked before, but now it'd be even easier to
> understand, it seems.

Can I do the same for:

	if (of_property_read_bool(np, "phy-clk-valid"))
                pdata->check_phy_clk_valid = 1;
	else
                pdata->check_phy_clk_valid = 0;

The type is not bool, but:

include/linux/fsl_devices.h:    unsigned        check_phy_clk_valid:1;

thanks,
julia
--8323329-1410669134-1470391715=:2999--
