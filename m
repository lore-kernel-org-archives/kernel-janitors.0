From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Apr 2016 11:34:08 +0000
Subject: re: device property: fix for a case of use-after-free
Message-Id: <20160425113408.GA6175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Heikki Krogerus,

The patch 0d67e0fa1664: "device property: fix for a case of
use-after-free" from Mar 10, 2016, has an issue.

Assume "fwnode" is an ERR_PTR>

drivers/base/property.c
   204  static bool __fwnode_property_present(struct fwnode_handle *fwnode,
   205                                        const char *propname)
   206  {
   207          if (is_of_node(fwnode))
                               ^^^^^^
We dereference it here.

   208                  return of_property_read_bool(to_of_node(fwnode), propname);
   209          else if (is_acpi_node(fwnode))
   210                  return !acpi_node_prop_get(fwnode, propname, NULL);
   211          else if (is_pset_node(fwnode))
   212                  return !!pset_prop_get(to_pset_node(fwnode), propname);
   213          return false;

Some of these depend on the .config but I don't see a path through this
function where fwnode can be an ERR_PTR and we don't oops.

   214  }
   215  
   216  /**
   217   * fwnode_property_present - check if a property of a firmware node is present
   218   * @fwnode: Firmware node whose property to check
   219   * @propname: Name of the property
   220   */
   221  bool fwnode_property_present(struct fwnode_handle *fwnode, const char *propname)
   222  {
   223          bool ret;
   224  
   225          ret = __fwnode_property_present(fwnode, propname);
                                                ^^^^^^^
We oops here.

   226          if (ret = false && !IS_ERR_OR_NULL(fwnode) &&
                                     ^^^^^^^^^^^^^^^^^^^^^^
This check for IS_ERR is too late because we already oopsed on the line
before.

   227              !IS_ERR_OR_NULL(fwnode->secondary))
   228                  ret = __fwnode_property_present(fwnode->secondary, propname);
   229          return ret;
   230  }

regards,
dan carpenter
