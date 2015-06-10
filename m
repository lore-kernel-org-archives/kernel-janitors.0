From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 15:51:54 +0000
Subject: re: dsa: add device tree bindings to register DSA switches
Message-Id: <20150610155154.GL10549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch 5e95329b701c: "dsa: add device tree bindings to register
DSA switches" from Mar 22, 2013, leads to the following static
checker warning:

	net/dsa/dsa.c:669 dsa_of_probe()
	error: testing array offset 'port_index' after use.

net/dsa/dsa.c
   644                          port_index = be32_to_cpup(port_reg);
   645  
   646                          port_name = of_get_property(port, "label", NULL);
   647                          if (!port_name)
   648                                  continue;
   649  
   650                          cd->port_dn[port_index] = port;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Write.

   651  
   652                          cd->port_names[port_index] = kstrdup(port_name,
   653                                          GFP_KERNEL);
   654                          if (!cd->port_names[port_index]) {
   655                                  ret = -ENOMEM;
   656                                  goto out_free_chip;
   657                          }
   658  
   659                          link = of_parse_phandle(port, "link", 0);
   660  
   661                          if (!strcmp(port_name, "dsa") && link &&
   662                                          pd->nr_chips > 1) {
   663                                  ret = dsa_of_setup_routing_table(pd, cd,
   664                                                  chip_index, port_index, link);
   665                                  if (ret)
   666                                          goto out_free_chip;
   667                          }
   668  
   669                          if (port_index = DSA_MAX_PORTS)
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
The write was out of bounds memory corruption.  Oops.  Too late.

   670                                  break;
   671                  }

regards,
dan carpenter
