From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 May 2019 11:38:58 +0000
Subject: [bug report] rapidio: add mport char device driver
Message-Id: <20190528113858.GA6670@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alexandre Bounine,

The patch e8de370188d0: "rapidio: add mport char device driver" from
Mar 22, 2016, leads to the following static checker warning:

	drivers/rapidio/devices/rio_mport_cdev.c:1694 rio_mport_add_riodev()
	warn: '__dynamic_pr_debug' unterminated user string 'dev_info.name'

drivers/rapidio/devices/rio_mport_cdev.c
  1676  static int rio_mport_add_riodev(struct mport_cdev_priv *priv,
  1677                                     void __user *arg)
  1678  {
  1679          struct mport_dev *md = priv->md;
  1680          struct rio_rdev_info dev_info;
  1681          struct rio_dev *rdev;
  1682          struct rio_switch *rswitch = NULL;
  1683          struct rio_mport *mport;
  1684          size_t size;
  1685          u32 rval;
  1686          u32 swpinfo = 0;
  1687          u16 destid;
  1688          u8 hopcount;
  1689          int err;
  1690  
  1691          if (copy_from_user(&dev_info, arg, sizeof(dev_info)))
                                    ^^^^^^^^
  1692                  return -EFAULT;
  1693  
  1694          rmcd_debug(RDEV, "name:%s ct:0x%x did:0x%x hc:0x%x", dev_info.name,
                                                                     ^^^^^^^^^^^^^
The user might have forgotten to NUL terminate this string.

  1695                     dev_info.comptag, dev_info.destid, dev_info.hopcount);
  1696  
  1697          if (bus_find_device_by_name(&rio_bus_type, NULL, dev_info.name)) {
  1698                  rmcd_debug(RDEV, "device %s already exists", dev_info.name);
  1699                  return -EEXIST;
  1700          }

regards,
dan carpenter
