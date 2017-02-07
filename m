From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 10:50:00 +0000
Subject: [bug report] net: phy: Fix lack of reference count on PHY driver
Message-Id: <20170207105000.GA30406@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mao Wenan,

This is a semi-automatic email about new static checker warnings.

The patch cafe8df8b9bc: "net: phy: Fix lack of reference count on PHY 
driver" from Jan 31, 2017, leads to the following Smatch complaint:

drivers/net/phy/phy_device.c:933 phy_attach_direct()
	 warn: variable dereferenced before check 'd->driver' (see line 923)

drivers/net/phy/phy_device.c
   922	
   923		if (!try_module_get(d->driver->owner)) {
                                    ^^^^^^^^^^^
Patch introduces a new dereference.

   924			dev_err(&dev->dev, "failed to get the device driver module\n");
   925			return -EIO;
   926		}
   927	
   928		get_device(d);
   929	
   930		/* Assume that if there is no driver, that it doesn't
   931		 * exist, and we should use the genphy driver.
   932		 */
   933		if (!d->driver) {
                     ^^^^^^^^^
Existing code assumed d->driver could be NULL.

   934			if (phydev->is_c45)
   935				d->driver 
regards,
dan carpenter
