From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2021 07:27:53 +0000
Subject: Re: [PATCH v2 1/2 net-next] net: mscc: ocelot: fix error handling bugs in mscc_ocelot_init_ports()
Message-Id: <20210126072753.GU2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210125081940.GK20820@kadam>
 <YA6EW9SPE4q6x7d3@mwanda>
 <20210125161806.q5rmiqj6r3yvp3ke@skbuf>
In-Reply-To: <20210125161806.q5rmiqj6r3yvp3ke@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Jan 25, 2021 at 04:18:07PM +0000, Vladimir Oltean wrote:
> Hi Dan,
> 
> On Mon, Jan 25, 2021 at 11:42:03AM +0300, Dan Carpenter wrote:
> > diff --git a/drivers/net/ethernet/mscc/ocelot_net.c b/drivers/net/ethernet/mscc/ocelot_net.c
> > index 9553eb3e441c..875ab8532d8c 100644
> > --- a/drivers/net/ethernet/mscc/ocelot_net.c
> > +++ b/drivers/net/ethernet/mscc/ocelot_net.c
> > @@ -1262,7 +1262,6 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
> >  	ocelot_port = &priv->port;
> >  	ocelot_port->ocelot = ocelot;
> >  	ocelot_port->target = target;
> > -	ocelot->ports[port] = ocelot_port;
> 
> You cannot remove this from here just like that, because
> ocelot_init_port right below accesses ocelot->ports[port], and it will
> dereference through a NULL pointer otherwise.
> 

Argh...  Thanks for spotting that.

> >  	dev->netdev_ops = &ocelot_port_netdev_ops;
> >  	dev->ethtool_ops = &ocelot_ethtool_ops;
> > @@ -1282,7 +1281,19 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
> >  	if (err) {
> >  		dev_err(ocelot->dev, "register_netdev failed\n");
> >  		free_netdev(dev);
> > +		return err;
> >  	}
> >  
> > -	return err;
> > +	ocelot->ports[port] = ocelot_port;
> > +	return 0;
> > +}
> > +
> > +void ocelot_release_port(struct ocelot_port *ocelot_port)
> > +{
> > +	struct ocelot_port_private *priv = container_of(ocelot_port,
> > +						struct ocelot_port_private,
> > +						port);
> 
> Can this assignment please be done separately from the declaration?
> 
> 	struct ocelot_port_private *priv;
> 
> 	priv = container_of(ocelot_port, struct ocelot_port_private, port);
> 
> > +
> > +	unregister_netdev(priv->dev);
> > +	free_netdev(priv->dev);
> >  }
> 
> Fun, isn't it? :D
> Thanks for taking the time to untangle this.
> 
> Additionally, you have changed the meaning of "registered_ports" from
> "this port had its net_device registered" to "this port had its
> devlink_port registered". This is ok, but I would like the variable
> renamed now, too. I think devlink_ports_registered would be ok.
> 
> In hindsight, I was foolish for using a heap-allocated boolean array for
> registered_ports, because this switch architecture is guaranteed to not
> have more than 32 ports, so a u32 bitmask is fine.
> 
> If you resend, can you please squash this diff on top of your patch?

Yep.  I will resend.  Thanks for basically writing v2 for me.  Your
review comments were very clear but code is always 100% clear so that's
really great.  I've never seen anyone do that before.  I should copy
that for my own reviews and hopefully it's a new trend.

> 
> Then you can add:
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> Also, it's strange but I don't see the v2 patches in patchwork. Did you
> send them in-reply-to v1 or something?

I did send them as a reply to v1.  Patchwork doesn't like that?

regards,
dan carpenter
