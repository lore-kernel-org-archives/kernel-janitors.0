From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 22 Sep 2015 01:35:27 +0000
Subject: Re: dsa: mv88e6xxx: Allow speed/duplex of port to be configured
Message-Id: <20150922013527.GD20288@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150912195913.GA11157@mwanda>
In-Reply-To: <20150912195913.GA11157@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 12, 2015 at 10:59:13PM +0300, Dan Carpenter wrote:
> Hello Andrew Lunn,
> 
> The patch dea870242a9c: "dsa: mv88e6xxx: Allow speed/duplex of port
> to be configured" from Aug 31, 2015, leads to the following static
> checker warning:
> 
> 	drivers/net/dsa/mv88e6xxx.c:585 mv88e6xxx_adjust_link()
> 	warn: unsigned 'ret' is never less than zero.
> 
> drivers/net/dsa/mv88e6xxx.c
>    573  void mv88e6xxx_adjust_link(struct dsa_switch *ds, int port,
>    574                             struct phy_device *phydev)
>    575  {
>    576          struct mv88e6xxx_priv_state *ps = ds_to_priv(ds);
>    577          u32 ret, reg;
>    578  
>    579          if (!phy_is_pseudo_fixed_link(phydev))
>    580                  return;
>    581  
>    582          mutex_lock(&ps->smi_mutex);
>    583  
>    584          ret = _mv88e6xxx_reg_read(ds, REG_PORT(port), PORT_PCS_CTRL);
>    585          if (ret < 0)
> 
> Probably make ret an int.

Hi Dan

Thanks for the report. I agree, it should be an int. I will cook up a
patch.

Thanks
	Andrew
