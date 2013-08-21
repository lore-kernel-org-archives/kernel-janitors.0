From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:39:22 +0000
Subject: re: USB: Add EHCI support for MX27 and MX31 based boards
Message-Id: <20130821083922.GJ5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ This warning is very old actually ]

Hello Daniel Mack,

This is a semi-automatic email about new static checker warnings.

The patch 7e8d5cd93fac: "USB: Add EHCI support for MX27 and MX31 
based boards" from Oct 28, 2009, leads to the following Smatch 
complaint:

drivers/usb/host/ehci-mxc.c:187 ehci_mxc_drv_remove()
	 error: we previously assumed 'pdata' could be null (see line 184)

drivers/usb/host/ehci-mxc.c
   183	
   184		if (pdata && pdata->exit)
                    ^^^^^
New check.

   185			pdata->exit(pdev);
   186	
   187		if (pdata->otg)
                    ^^^^^^^^^^
New dereference.

   188			usb_phy_shutdown(pdata->otg);
   189	

regards,
dan carpenter
