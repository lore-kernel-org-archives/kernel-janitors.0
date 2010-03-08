From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Mar 2010 12:48:34 +0000
Subject: leds: dereferencing null
Message-Id: <20100308124834.GB19256@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

drivers/leds/leds-88pm860x.c +268 pm860x_led_probe(28) error: dereferencing undefined:  'pdata'
   255          if (pdev->dev.parent->platform_data) {
   256                  pm860x_pdata = pdev->dev.parent->platform_data;
   257                  pdata = pm860x_pdata->led;
   258          } else
   259                  pdata = NULL;

	We set pdata to null here.

   260
   261          data = kzalloc(sizeof(struct pm860x_led), GFP_KERNEL);
   262          if (data = NULL)
   263                  return -ENOMEM;
   264          strncpy(data->name, res->name, MFD_NAME_SIZE);
   265          dev_set_drvdata(&pdev->dev, data);
   266          data->chip = chip;
   267          data->i2c = (chip->id = CHIP_PM8606) ? chip->client : chip->companion;
   268          data->iset = pdata->iset;
                             ^^^^^^^^^^^
	We dereference it here.

regards,
dan carpenter
