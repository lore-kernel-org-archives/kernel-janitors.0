From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Mon, 25 Jan 2021 16:18:07 +0000
Subject: Re: [PATCH v2 1/2 net-next] net: mscc: ocelot: fix error handling bugs in mscc_ocelot_init_ports()
Message-Id: <20210125161806.q5rmiqj6r3yvp3ke@skbuf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210125081940.GK20820@kadam> <YA6EW9SPE4q6x7d3@mwanda>
In-Reply-To: <YA6EW9SPE4q6x7d3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

On Mon, Jan 25, 2021 at 11:42:03AM +0300, Dan Carpenter wrote:
> diff --git a/drivers/net/ethernet/mscc/ocelot_net.c b/drivers/net/ethernet/mscc/ocelot_net.c
> index 9553eb3e441c..875ab8532d8c 100644
> --- a/drivers/net/ethernet/mscc/ocelot_net.c
> +++ b/drivers/net/ethernet/mscc/ocelot_net.c
> @@ -1262,7 +1262,6 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
>  	ocelot_port = &priv->port;
>  	ocelot_port->ocelot = ocelot;
>  	ocelot_port->target = target;
> -	ocelot->ports[port] = ocelot_port;

You cannot remove this from here just like that, because
ocelot_init_port right below accesses ocelot->ports[port], and it will
dereference through a NULL pointer otherwise.

>  	dev->netdev_ops = &ocelot_port_netdev_ops;
>  	dev->ethtool_ops = &ocelot_ethtool_ops;
> @@ -1282,7 +1281,19 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
>  	if (err) {
>  		dev_err(ocelot->dev, "register_netdev failed\n");
>  		free_netdev(dev);
> +		return err;
>  	}
>  
> -	return err;
> +	ocelot->ports[port] = ocelot_port;
> +	return 0;
> +}
> +
> +void ocelot_release_port(struct ocelot_port *ocelot_port)
> +{
> +	struct ocelot_port_private *priv = container_of(ocelot_port,
> +						struct ocelot_port_private,
> +						port);

Can this assignment please be done separately from the declaration?

	struct ocelot_port_private *priv;

	priv = container_of(ocelot_port, struct ocelot_port_private, port);

> +
> +	unregister_netdev(priv->dev);
> +	free_netdev(priv->dev);
>  }

Fun, isn't it? :D
Thanks for taking the time to untangle this.

Additionally, you have changed the meaning of "registered_ports" from
"this port had its net_device registered" to "this port had its
devlink_port registered". This is ok, but I would like the variable
renamed now, too. I think devlink_ports_registered would be ok.

In hindsight, I was foolish for using a heap-allocated boolean array for
registered_ports, because this switch architecture is guaranteed to not
have more than 32 ports, so a u32 bitmask is fine.

If you resend, can you please squash this diff on top of your patch?

-----------------------------[cut here]-----------------------------
diff --git a/drivers/net/ethernet/mscc/ocelot_net.c b/drivers/net/ethernet/mscc/ocelot_net.c
index 1ca531b13497..7b2045707c5a 100644
--- a/drivers/net/ethernet/mscc/ocelot_net.c
+++ b/drivers/net/ethernet/mscc/ocelot_net.c
@@ -1196,6 +1196,7 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
 	ocelot_port = &priv->port;
 	ocelot_port->ocelot = ocelot;
 	ocelot_port->target = target;
+	ocelot->ports[port] = ocelot_port;
 
 	dev->netdev_ops = &ocelot_port_netdev_ops;
 	dev->ethtool_ops = &ocelot_ethtool_ops;
@@ -1215,10 +1216,10 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
 	if (err) {
 		dev_err(ocelot->dev, "register_netdev failed\n");
 		free_netdev(dev);
+		ocelot->ports[port] = NULL;
 		return err;
 	}
 
-	ocelot->ports[port] = ocelot_port;
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mscc/ocelot_vsc7514.c b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
index e99b9cdcc4a7..761834466541 100644
--- a/drivers/net/ethernet/mscc/ocelot_vsc7514.c
+++ b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
@@ -939,8 +939,8 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 				  struct device_node *ports)
 {
 	struct ocelot *ocelot = platform_get_drvdata(pdev);
+	u32 devlink_ports_registered = 0;
 	struct device_node *portnp;
-	bool *registered_ports;
 	int port, err;
 	u32 reg;
 
@@ -956,11 +956,6 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 	if (!ocelot->devlink_ports)
 		return -ENOMEM;
 
-	registered_ports = kcalloc(ocelot->num_phys_ports, sizeof(bool),
-				   GFP_KERNEL);
-	if (!registered_ports)
-		return -ENOMEM;
-
 	for_each_available_child_of_node(ports, portnp) {
 		struct ocelot_port_private *priv;
 		struct ocelot_port *ocelot_port;
@@ -1009,7 +1004,7 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 			of_node_put(portnp);
 			goto out_teardown;
 		}
-		registered_ports[port] = true;
+		devlink_ports_registered |= BIT(port);
 
 		err = ocelot_probe_port(ocelot, port, target, phy);
 		if (err) {
@@ -1069,17 +1064,16 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 
 	/* Initialize unused devlink ports at the end */
 	for (port = 0; port < ocelot->num_phys_ports; port++) {
-		if (registered_ports[port])
+		if (devlink_ports_registered & BIT(port))
 			continue;
 
 		err = ocelot_port_devlink_init(ocelot, port,
 					       DEVLINK_PORT_FLAVOUR_UNUSED);
 		if (err)
 			goto out_teardown;
-		registered_ports[port] = true;
-	}
 
-	kfree(registered_ports);
+		devlink_ports_registered |= BIT(port);
+	}
 
 	return 0;
 
@@ -1088,10 +1082,9 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 	mscc_ocelot_release_ports(ocelot);
 	/* Tear down devlink ports for the registered network interfaces */
 	for (port = 0; port < ocelot->num_phys_ports; port++) {
-		if (registered_ports[port])
+		if (devlink_ports_registered & BIT(port))
 			ocelot_port_devlink_teardown(ocelot, port);
 	}
-	kfree(registered_ports);
 	return err;
 }
 
-----------------------------[cut here]-----------------------------

Then you can add:

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Also, it's strange but I don't see the v2 patches in patchwork. Did you
send them in-reply-to v1 or something?

Thanks!
