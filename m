From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Dec 2020 11:48:31 +0000
Subject: Re: [PATCH] net: mscc: ocelot: Fix a resource leak in the error handling path of the probe function
Message-Id: <20201214114831.GE2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: UNGLinuxDriver@microchip.com, vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com, davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Dec 13, 2020 at 12:48:38PM +0100, Christophe JAILLET wrote:
> In case of error after calling 'ocelot_init()', it must be undone by a
> corresponding 'ocelot_deinit()' call, as already done in the remove
> function.
> 

This changes the behavior slightly in another way as well, but it's
probably a bug fix.

drivers/net/ethernet/mscc/ocelot_vsc7514.c
  1250          ports = of_get_child_by_name(np, "ethernet-ports");
  1251          if (!ports) {
  1252                  dev_err(ocelot->dev, "no ethernet-ports child node found\n");
  1253                  return -ENODEV;
  1254          }
  1255  
  1256          ocelot->num_phys_ports = of_get_child_count(ports);
  1257          ocelot->num_flooding_pgids = 1;
  1258  
  1259          ocelot->vcap = vsc7514_vcap_props;
  1260          ocelot->inj_prefix = OCELOT_TAG_PREFIX_NONE;
  1261          ocelot->xtr_prefix = OCELOT_TAG_PREFIX_NONE;
  1262          ocelot->npi = -1;
  1263  
  1264          err = ocelot_init(ocelot);
  1265          if (err)
  1266                  goto out_put_ports;
  1267  
  1268          err = mscc_ocelot_init_ports(pdev, ports);
  1269          if (err)
  1270                  goto out_put_ports;
  1271  
  1272          if (ocelot->ptp) {
  1273                  err = ocelot_init_timestamp(ocelot, &ocelot_ptp_clock_info);
  1274                  if (err) {
  1275                          dev_err(ocelot->dev,
  1276                                  "Timestamp initialization failed\n");
  1277                          ocelot->ptp = 0;
  1278                  }

In the original code, if ocelot_init_timestamp() failed we returned
a negative error code but now we return success.  This probably is what
the original authors intended, though.

  1279          }
  1280  
  1281          register_netdevice_notifier(&ocelot_netdevice_nb);
  1282          register_switchdev_notifier(&ocelot_switchdev_nb);
  1283          register_switchdev_blocking_notifier(&ocelot_switchdev_blocking_nb);
  1284  
  1285          dev_info(&pdev->dev, "Ocelot switch probed\n");
  1286  
  1287  out_put_ports:
  1288          of_node_put(ports);
  1289          return err;
  1290  }

regards,
dan carpenter
