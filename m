From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 May 2018 13:26:59 +0000
Subject: [bug report] net: dsa: mv88e6xxx: Add support for EEPROM via platform data
Message-Id: <20180530132659.lotqhn42b5wj3rzn@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andrew Lunn,

This is a semi-automatic email about new static checker warnings.

The patch 00baabe5286c: "net: dsa: mv88e6xxx: Add support for EEPROM 
via platform data" from May 19, 2018, leads to the following Smatch 
complaint:

    drivers/net/dsa/mv88e6xxx/chip.c:4443 mv88e6xxx_probe()
     error: we previously assumed 'pdata' could be null (see line 4395)

drivers/net/dsa/mv88e6xxx/chip.c
  4394	
  4395		if (pdata) {
                    ^^^^^
  4396			compat_info = pdata_device_get_match_data(dev);
  4397	
  4398			if (!pdata->netdev)
  4399				return -EINVAL;
  4400	
  4401			for (port = 0; port < DSA_MAX_PORTS; port++) {
  4402				if (!(pdata->enabled_ports & (1 << port)))
  4403					continue;
  4404				if (strcmp(pdata->cd.port_names[port], "cpu"))
  4405					continue;
  4406				pdata->cd.netdev[port] = &pdata->netdev->dev;
  4407				break;
  4408			}
  4409		}
  4410	
  4411		if (!compat_info)
  4412			return -EINVAL;
  4413	
  4414		chip = mv88e6xxx_alloc_chip(dev);
  4415		if (!chip) {
  4416			err = -ENOMEM;
  4417			goto out;
  4418		}
  4419	
  4420		chip->info = compat_info;
  4421	
  4422		err = mv88e6xxx_smi_init(chip, mdiodev->bus, mdiodev->addr);
  4423		if (err)
  4424			goto out;
  4425	
  4426		chip->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
  4427		if (IS_ERR(chip->reset)) {
  4428			err = PTR_ERR(chip->reset);
  4429			goto out;
  4430		}
  4431	
  4432		err = mv88e6xxx_detect(chip);
  4433		if (err)
  4434			goto out;
  4435	
  4436		mv88e6xxx_phy_init(chip);
  4437	
  4438		if (chip->info->ops->get_eeprom) {
  4439			if (np)
  4440				of_property_read_u32(np, "eeprom-length",
  4441						     &chip->eeprom_len);
  4442			else
  4443				chip->eeprom_len = pdata->eeprom_len;
                                                   ^^^^^^^
It's possible that if pdata is NULL then "np" must be non-NULL.  In that
case ignore the static checker.

  4444		}
  4445	

regards,
dan carpenter
