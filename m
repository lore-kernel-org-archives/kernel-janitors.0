From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2015 15:04:44 +0000
Subject: re: net: Adding support for Cavium ThunderX network controller
Message-Id: <20150529150444.GD10313@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sunil Goutham,

The patch 4863dea3fab0: "net: Adding support for Cavium ThunderX
network controller" from May 26, 2015, leads to the following static
checker warning:

	drivers/net/ethernet/cavium/thunder/thunder_bgx.c:485 bgx_xaui_check_link()
	warn: we tested 'lmac_type = 3' before and it was 'false'

drivers/net/ethernet/cavium/thunder/thunder_bgx.c
   484  
   485          if ((lmac_type = BGX_MODE_10G_KR) || (lmac_type = BGX_MODE_XFI) ||
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^      ^^^^^^^^^^^^^^^^^^^^^^^^^
These are the both 3.  That seems like it could lead to bugs down the
line.

   486              (lmac_type = BGX_MODE_40G_KR) || (lmac_type = BGX_MODE_XLAUI)) {
                                  ^^^^^^^^^^^^^^^                   ^^^^^^^^^^^^^^
These are both 4.

   487                  if (bgx_poll_reg(bgx, lmacid, BGX_SPUX_BR_STATUS1,
   488                                   SPU_BR_STATUS_BLK_LOCK, false)) {
   489                          dev_err(&bgx->pdev->dev,
   490                                  "SPU_BR_STATUS_BLK_LOCK not completed\n");
   491                          return -1;
   492                  }
   493          } else {

regards,
dan carpenter
