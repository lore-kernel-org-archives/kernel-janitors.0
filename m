From: Dan Carpenter <error27@gmail.com>
Date: Wed, 07 Apr 2010 09:18:50 +0000
Subject: smatch: leds: potential null deref
Message-Id: <20100407091850.GB5157@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

Smatch complains about a potential null dereference but I don't know how
to fix it.  Could you take a look?

drivers/leds/leds-88pm860x.c +269 pm860x_led_probe(28)
	error: potential null derefence 'pdata'.
   256          if (pdev->dev.parent->platform_data) {
   257                  pm860x_pdata = pdev->dev.parent->platform_data;
   258                  pdata = pm860x_pdata->led;
   259          } else
   260                  pdata = NULL;
                        ^^^^^^^^^^^^^

	We set pdata to NULL here.

   261  
   262          data = kzalloc(sizeof(struct pm860x_led), GFP_KERNEL);
   263          if (data = NULL)
   264                  return -ENOMEM;
   265          strncpy(data->name, res->name, MFD_NAME_SIZE);
   266          dev_set_drvdata(&pdev->dev, data);
   267          data->chip = chip;
   268          data->i2c = (chip->id = CHIP_PM8606) ? chip->client : chip->companion;
   269          data->iset = pdata->iset;
                             ^^^^^^^^^^^^

	We dereference it here.

regards,
dan carpenter
