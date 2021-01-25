From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:42:03 +0000
Subject: [PATCH v2 1/2 net-next] net: mscc: ocelot: fix error handling bugs in mscc_ocelot_init_ports()
Message-Id: <YA6EW9SPE4q6x7d3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20210125081940.GK20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, UNGLinuxDriver@microchip.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There are several error handling bugs in mscc_ocelot_init_ports().  I
went through the code, and carefully audited it and made fixes and
cleanups.

1) The ocelot_probe_port() function didn't have a mirror release function
   so it was hard to follow.  I created the ocelot_release_port()
   function.
2) In the ocelot_probe_port() function, if the register_netdev() call
   failed, then it lead to a double free_netdev(dev) bug.  Fix this
   by moving the "ocelot->ports[port] = ocelot_port;" assignment to the
   end of the function after everything has succeeded.
3) I was concerned that the "port" which comes from of_property_read_u32()
   might be out of bounds so I added a check for that.
4) In the original code if ocelot_regmap_init() failed then the driver
   tried to continue but I think that should be a fatal error.
5) If ocelot_probe_port() failed then the most recent devlink was leaked.
   Fix this by moving the "registered_ports[port] = true;" assignment
   earlier.
6) The error handling if the final ocelot_port_devlink_init() failed had
   two problems.  The "while (port-- >= 0)" loop should have been
   "--port" pre-op instead of a post-op to avoid a buffer underflow.
   The "if (!registered_ports[port])" condition was reversed leading to
   resource leaks and double frees.

Fixes: 6c30384eb1de ("net: mscc: ocelot: register devlink ports")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In v1, I accidentally left out parts of the commit so it didn't
compile.

 drivers/net/ethernet/mscc/ocelot.h         |  1 +
 drivers/net/ethernet/mscc/ocelot_net.c     | 15 +++++++--
 drivers/net/ethernet/mscc/ocelot_vsc7514.c | 39 +++++++++-------------
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot.h b/drivers/net/ethernet/mscc/ocelot.h
index e8621dbc14f7..76b8d8ce3b48 100644
--- a/drivers/net/ethernet/mscc/ocelot.h
+++ b/drivers/net/ethernet/mscc/ocelot.h
@@ -121,6 +121,7 @@ void ocelot_port_writel(struct ocelot_port *port, u32 val, u32 reg);
 
 int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
 		      struct phy_device *phy);
+void ocelot_release_port(struct ocelot_port *ocelot_port);
 int ocelot_devlink_init(struct ocelot *ocelot);
 void ocelot_devlink_teardown(struct ocelot *ocelot);
 int ocelot_port_devlink_init(struct ocelot *ocelot, int port,
diff --git a/drivers/net/ethernet/mscc/ocelot_net.c b/drivers/net/ethernet/mscc/ocelot_net.c
index 9553eb3e441c..875ab8532d8c 100644
--- a/drivers/net/ethernet/mscc/ocelot_net.c
+++ b/drivers/net/ethernet/mscc/ocelot_net.c
@@ -1262,7 +1262,6 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
 	ocelot_port = &priv->port;
 	ocelot_port->ocelot = ocelot;
 	ocelot_port->target = target;
-	ocelot->ports[port] = ocelot_port;
 
 	dev->netdev_ops = &ocelot_port_netdev_ops;
 	dev->ethtool_ops = &ocelot_ethtool_ops;
@@ -1282,7 +1281,19 @@ int ocelot_probe_port(struct ocelot *ocelot, int port, struct regmap *target,
 	if (err) {
 		dev_err(ocelot->dev, "register_netdev failed\n");
 		free_netdev(dev);
+		return err;
 	}
 
-	return err;
+	ocelot->ports[port] = ocelot_port;
+	return 0;
+}
+
+void ocelot_release_port(struct ocelot_port *ocelot_port)
+{
+	struct ocelot_port_private *priv = container_of(ocelot_port,
+						struct ocelot_port_private,
+						port);
+
+	unregister_netdev(priv->dev);
+	free_netdev(priv->dev);
 }
diff --git a/drivers/net/ethernet/mscc/ocelot_vsc7514.c b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
index 30a38df08a21..2c82ffe2c611 100644
--- a/drivers/net/ethernet/mscc/ocelot_vsc7514.c
+++ b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
@@ -1064,7 +1064,6 @@ static void mscc_ocelot_release_ports(struct ocelot *ocelot)
 	int port;
 
 	for (port = 0; port < ocelot->num_phys_ports; port++) {
-		struct ocelot_port_private *priv;
 		struct ocelot_port *ocelot_port;
 
 		ocelot_port = ocelot->ports[port];
@@ -1072,12 +1071,7 @@ static void mscc_ocelot_release_ports(struct ocelot *ocelot)
 			continue;
 
 		ocelot_deinit_port(ocelot, port);
-
-		priv = container_of(ocelot_port, struct ocelot_port_private,
-				    port);
-
-		unregister_netdev(priv->dev);
-		free_netdev(priv->dev);
+		ocelot_release_port(ocelot_port);
 	}
 }
 
@@ -1123,14 +1117,22 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 			continue;
 
 		port = reg;
+		if (port < 0 || port >= ocelot->num_phys_ports) {
+			dev_err(ocelot->dev,
+				"invalid port number: %d >= %d\n", port,
+				ocelot->num_phys_ports);
+			continue;
+		}
 
 		snprintf(res_name, sizeof(res_name), "port%d", port);
 
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						   res_name);
 		target = ocelot_regmap_init(ocelot, res);
-		if (IS_ERR(target))
-			continue;
+		if (IS_ERR(target)) {
+			err = PTR_ERR(target);
+			goto out_teardown;
+		}
 
 		phy_node = of_parse_phandle(portnp, "phy-handle", 0);
 		if (!phy_node)
@@ -1147,6 +1149,7 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 			of_node_put(portnp);
 			goto out_teardown;
 		}
+		registered_ports[port] = true;
 
 		err = ocelot_probe_port(ocelot, port, target, phy);
 		if (err) {
@@ -1154,8 +1157,6 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 			goto out_teardown;
 		}
 
-		registered_ports[port] = true;
-
 		ocelot_port = ocelot->ports[port];
 		priv = container_of(ocelot_port, struct ocelot_port_private,
 				    port);
@@ -1213,15 +1214,9 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 
 		err = ocelot_port_devlink_init(ocelot, port,
 					       DEVLINK_PORT_FLAVOUR_UNUSED);
-		if (err) {
-			while (port-- >= 0) {
-				if (!registered_ports[port])
-					continue;
-				ocelot_port_devlink_teardown(ocelot, port);
-			}
-
+		if (err)
 			goto out_teardown;
-		}
+		registered_ports[port] = true;
 	}
 
 	kfree(registered_ports);
@@ -1233,10 +1228,8 @@ static int mscc_ocelot_init_ports(struct platform_device *pdev,
 	mscc_ocelot_release_ports(ocelot);
 	/* Tear down devlink ports for the registered network interfaces */
 	for (port = 0; port < ocelot->num_phys_ports; port++) {
-		if (!registered_ports[port])
-			continue;
-
-		ocelot_port_devlink_teardown(ocelot, port);
+		if (registered_ports[port])
+			ocelot_port_devlink_teardown(ocelot, port);
 	}
 	kfree(registered_ports);
 	return err;
-- 
2.29.2
