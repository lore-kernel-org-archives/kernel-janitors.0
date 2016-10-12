From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:15:29 +0000
Subject: [bug report] net: thunderx: Add RGMII interface type support
Message-Id: <20161012061529.GN12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sunil Goutham,

This is a semi-automatic email about new static checker warnings.

The patch 6465859aba1e: "net: thunderx: Add RGMII interface type 
support" from Aug 12, 2016, leads to the following Smatch complaint:

drivers/net/ethernet/cavium/thunder/thunder_xcv.c:119 xcv_setup_link()
	 error: we previously assumed 'xcv' could be null (see line 118)

drivers/net/ethernet/cavium/thunder/thunder_xcv.c
   117	
   118		if (!xcv) {
                     ^^^
check.

   119			dev_err(&xcv->pdev->dev,
                                 ^^^^^^^^^^^^^^
dereference.

   120				"XCV init not done, probe may have failed\n");
   121			return;

regards,
dan carpenter
