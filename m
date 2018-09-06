From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 06 Sep 2018 12:13:31 +0000
Subject: Re: [bug report] memory: aemif: add support for board files
Message-Id: <CAMpxmJV+A-9UVcrDBbCc6ej7FbdD8BW=eqJmLXsdWWHp-8mPqw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180906114112.4t3xe4kntptm55rh@kili.mountain>
In-Reply-To: <20180906114112.4t3xe4kntptm55rh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2018-09-06 13:41 GMT+02:00 Dan Carpenter <dan.carpenter@oracle.com>:
> Hello Bartosz Golaszewski,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 8af70cd2ca50: "memory: aemif: add support for board files"
> from Apr 20, 2018, leads to the following Smatch complaint:
>
>     drivers/memory/ti-aemif.c:415 aemif_probe()
>      error: we previously assumed 'pdata' could be null (see line 387)
>
> drivers/memory/ti-aemif.c
>    363          if (np && of_device_is_compatible(np, "ti,da850-aemif"))
>    364                  aemif->cs_offset = 2;
>    365          else if (pdata)
>                          ^^^^^
> It's possible that when "np" is NULL that means pdata is non-NULL?
>
>    366                  aemif->cs_offset = pdata->cs_offset;
>    367
>    368          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>    369          aemif->base = devm_ioremap_resource(dev, res);
>    370          if (IS_ERR(aemif->base)) {
>    371                  ret = PTR_ERR(aemif->base);
>    372                  goto error;
>    373          }
>    374
>    375          if (np) {
>    376                  /*
>    377                   * For every controller device node, there is a cs device node
>    378                   * that describe the bus configuration parameters. This
>    379                   * functions iterate over these nodes and update the cs data
>    380                   * array.
>    381                   */
>    382                  for_each_available_child_of_node(np, child_np) {
>    383                          ret = of_aemif_parse_abus_config(pdev, child_np);
>    384                          if (ret < 0)
>    385                                  goto error;
>    386                  }
>    387          } else if (pdata && pdata->num_abus_data > 0) {
>    388                  for (i = 0; i < pdata->num_abus_data; i++, aemif->num_cs++) {
>    389                          aemif->cs_data[i].cs = pdata->abus_data[i].cs;
>    390                          aemif_get_hw_params(pdev, i);
>    391                  }
>    392          }
>    393
>    394          for (i = 0; i < aemif->num_cs; i++) {
>    395                  ret = aemif_config_abus(pdev, i);
>    396                  if (ret < 0) {
>    397                          dev_err(dev, "Error configuring chip select %d\n",
>    398                                  aemif->cs_data[i].cs);
>    399                          goto error;
>    400                  }
>    401          }
>    402
>    403          /*
>    404           * Create a child devices explicitly from here to guarantee that the
>    405           * child will be probed after the AEMIF timing parameters are set.
>    406           */
>    407          if (np) {
>    408                  for_each_available_child_of_node(np, child_np) {
>    409                          ret = of_platform_populate(child_np, NULL,
>    410                                                     dev_lookup, dev);
>    411                          if (ret < 0)
>    412                                  goto error;
>    413                  }
>    414          } else {
>    415                  for (i = 0; i < pdata->num_sub_devices; i++) {
>                                         ^^^^^^^^^^^^^^^^^^^^^^
> Not checked.
>
>    416                          pdata->sub_devices[i].dev.parent = dev;
>    417                          ret = platform_device_register(&pdata->sub_devices[i]);
>
> regards,
> dan carpenter

Fix sent to mailing list. Thanks!

Bart
