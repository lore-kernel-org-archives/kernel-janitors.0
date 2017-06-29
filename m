From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Jun 2017 13:00:56 +0000
Subject: [bug report] device property: Move FW type specific functionality to FW specific files
Message-Id: <20170629130056.xtcf35gxw76ib6gs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sakari Ailus,

The patch 3708184afc77: "device property: Move FW type specific
functionality to FW specific files" from Jun 6, 2017, leads to the
following static checker warning:

	drivers/base/property.c:256 fwnode_property_present()
	warn: assigning (-6) to unsigned variable 'ret'

drivers/base/property.c
   247  /**
   248   * fwnode_property_present - check if a property of a firmware node is present
   249   * @fwnode: Firmware node whose property to check
   250   * @propname: Name of the property
   251   */
   252  bool fwnode_property_present(struct fwnode_handle *fwnode, const char *propname)
   253  {
   254          bool ret;
   255  
   256          ret = fwnode_call_int_op(fwnode, property_present, propname);
                      ^^^^^^^^^^^^^^^^^^
This macro can return negative error codes, which is treated as true and
I presume true means success.

   257          if (ret = false && !IS_ERR_OR_NULL(fwnode) &&
   258              !IS_ERR_OR_NULL(fwnode->secondary))
   259                  ret = fwnode_call_int_op(fwnode->secondary, property_present,
   260                                           propname);
   261          return ret;
   262  }
   263  EXPORT_SYMBOL_GPL(fwnode_property_present);

regards,
dan carpenter
