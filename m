From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 17:45:15 +0000
Subject: [bug report] dpaa2-mac: add PCS support through the Lynx module
Message-Id: <20200928174515.GB446603@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch 94ae899b2096: "dpaa2-mac: add PCS support through the Lynx
module" from Sep 23, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:296 dpaa2_pcs_destroy()
	warn: variable dereferenced before check 'pcs' (see line 294)

drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
   291  static void dpaa2_pcs_destroy(struct dpaa2_mac *mac)
   292  {
   293          struct lynx_pcs *pcs = mac->pcs;
   294          struct device *dev = &pcs->mdio->dev;
                                      ^^^^^^^^^
Dereference

   295  
   296          if (pcs) {
                    ^^^
Checked too late.  It looks like "pcs" can be NULL because I get a
warning in the caller as well.

  drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:389 dpaa2_mac_connect()
  error: we previously assumed 'mac->pcs' could be null (see line 373)

   297                  lynx_pcs_destroy(pcs);
   298                  put_device(dev);
   299                  mac->pcs = NULL;
   300          }
   301  }

regards,
dan carpenter
