From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jul 2016 23:49:19 +0000
Subject: [bug report] drivers/net: support hdlc function for QE-UCC
Message-Id: <20160712234919.GA23061@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Zhao Qiang,

The patch c19b6d246a35: "drivers/net: support hdlc function for
QE-UCC" from Jun 6, 2016, leads to the following static checker
warning:

	drivers/net/wan/fsl_ucc_hdlc.c:1131 ucc_hdlc_probe()
	error: dereferencing freed memory 'uhdlc_priv'

The error handling has quite a few problems.  There is an easy way to
write error handling.  Let me demonstrate.

drivers/net/wan/fsl_ucc_hdlc.c
  1062          ret = of_address_to_resource(np, 0, &res);
  1063          if (ret)
  1064                  return -EINVAL;
  1065  
  1066          ut_info->uf_info.regs = res.start;
  1067          ut_info->uf_info.irq = irq_of_parse_and_map(np, 0);
  1068  
  1069          uhdlc_priv = kzalloc(sizeof(*uhdlc_priv), GFP_KERNEL);
  1070          if (!uhdlc_priv) {
  1071                  ret = -ENOMEM;
  1072                  dev_err(&pdev->dev, "No mem to alloc hdlc private data\n");

No need for this printk().  kzalloc() already prints a warning.

  1073                  goto err_alloc_priv;

This is a do-nothing goto.  Change it to "return -ENOMEM;".

		uhdlc_priv = kzalloc(sizeof(*uhdlc_priv), GFP_KERNEL);
		if (!uhdlc_priv)
			return -ENOMEM;


  1074          }
  1075  
  1076          dev_set_drvdata(&pdev->dev, uhdlc_priv);
  1077          uhdlc_priv->dev = &pdev->dev;
  1078          uhdlc_priv->ut_info = ut_info;
  1079  
  1080          if (of_get_property(np, "fsl,tdm-interface", NULL))
  1081                  uhdlc_priv->tsa = 1;
  1082  
  1083          if (of_get_property(np, "fsl,ucc-internal-loopback", NULL))
  1084                  uhdlc_priv->loopback = 1;
  1085  
  1086          if (uhdlc_priv->tsa = 1) {
  1087                  utdm = kzalloc(sizeof(*utdm), GFP_KERNEL);
  1088                  if (!utdm) {
  1089                          ret = -ENOMEM;
  1090                          dev_err(&pdev->dev, "No mem to alloc ucc tdm data\n");

No need again.

  1091                          goto err_alloc_utdm;

The goto name should say what the goto does.  We need to free uhdlc_priv
so "goto free_uhdlc;" is a good name.

  1092                  }
  1093                  uhdlc_priv->utdm = utdm;
  1094                  ret = ucc_of_parse_tdm(np, utdm, ut_info);
  1095                  if (ret)
  1096                          goto err_miss_tsa_property;

Here we need to free utdm so "goto free_utdm;".

  1097          }
  1098  
  1099          ret = uhdlc_init(uhdlc_priv);
  1100          if (ret) {
  1101                  dev_err(&pdev->dev, "Failed to init uhdlc\n");
  1102                  goto err_hdlc_init;

We're still freeing utdm;   So goto free_utdm;

  1103          }
  1104  
  1105          dev = alloc_hdlcdev(uhdlc_priv);
  1106          if (!dev) {
  1107                  ret = -ENOMEM;
  1108                  pr_err("ucc_hdlc: unable to allocate memory\n");
  1109                  goto err_hdlc_init;

Hm...  Here we need to undo what uhdlc_init() did.  I'm not sure the
function to do that.  Currently we leak resources.

			goto undo_uhdlc_init;

  1110          }
  1111  
  1112          uhdlc_priv->ndev = dev;
  1113          hdlc = dev_to_hdlc(dev);
  1114          dev->tx_queue_len = 16;
  1115          dev->netdev_ops = &uhdlc_ops;
  1116          hdlc->attach = ucc_hdlc_attach;
  1117          hdlc->xmit = ucc_hdlc_tx;
  1118          netif_napi_add(dev, &uhdlc_priv->napi, ucc_hdlc_poll, 32);
  1119          if (register_hdlc_device(dev)) {
  1120                  ret = -ENOBUFS;

Why are we not preserving the error code?

		ret = register_hdlc_device(dev);
		if (ret) {

  1121                  pr_err("ucc_hdlc: unable to register hdlc device\n");

No need for this printk.

  1122                  free_netdev(dev);
  1123                  goto err_hdlc_init;

Instead of freeing and then a goto just do "goto free_dev;".

  1124          }
  1125  
  1126          return 0;
  1127  
  1128  err_hdlc_init:
  1129  err_miss_tsa_property:
  1130          kfree(uhdlc_priv);
  1131          if (uhdlc_priv->tsa)
  1132                  kfree(utdm);
  1133  err_alloc_utdm:
  1134          kfree(uhdlc_priv);
  1135  err_alloc_priv:
  1136          return ret;
  1137  }

You can see the problems.  We free uhdlc_priv then we dereference it,
then we free it a second time.  There is stuff that is missing.  The
labels are bad.  Here is the new version:

free_dev:
	free_netdev(dev);
undo_uhdlc_init:
	/* FIXME: impliment this code */
free_utdm:
	if (uhdlc_priv->tsa)
		kfree(utdm);
free_uhdlc:
	kfree(uhdlc);

	return ret;

Just follow the steps and then error handling is easy to understand.

regards,
dan carpenter
