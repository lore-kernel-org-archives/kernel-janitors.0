From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Sep 2020 08:40:48 +0000
Subject: [bug report] mfd: ene-kb3930: Add driver for ENE KB3930 Embedded Controller
Message-Id: <20200910084048.GA64765@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Lubomir Rintel,

The patch 753bd752e181: "mfd: ene-kb3930: Add driver for ENE KB3930
Embedded Controller" from Jul 10, 2020, leads to the following static
checker warning:

	drivers/mfd/ene-kb3930.c:165 kb3930_probe()
	warn: 'ddata->off_gpios' can also be NULL

drivers/mfd/ene-kb3930.c
   152  
   153          ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
   154                                     ariel_ec_cells,
   155                                     ARRAY_SIZE(ariel_ec_cells),
   156                                     NULL, 0, NULL);
   157          if (ret)
   158                  return ret;
   159  
   160          if (of_property_read_bool(np, "system-power-controller")) {
   161                  ddata->off_gpios    162                          devm_gpiod_get_array_optional(dev, "off", GPIOD_IN);

The devm_gpiod_get_array_optional() function can return NULL in the
sitation where the optional array is not there.  It's not an error
because it's an optional thing, but there is also no valid pointer to
return.  So because it's not an error pointer, or a valid pointer then
it's NULL.

   163                  if (IS_ERR(ddata->off_gpios))
   164                          return PTR_ERR(ddata->off_gpios);
   165                  if (ddata->off_gpios->ndescs < 2) {
   166                          dev_err(dev, "invalid off-gpios property\n");
   167                          return -EINVAL;
   168                  }
   169          }
   170  
   171          if (ddata->off_gpios) {
   172                  register_restart_handler(&kb3930_restart_nb);
   173                  if (!pm_power_off)
   174                          pm_power_off = kb3930_pm_power_off;
   175          }
   176  
   177          return 0;

regards,
dan carpenter
