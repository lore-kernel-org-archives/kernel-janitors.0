From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Oct 2019 14:52:47 +0000
Subject: [bug report] vxlan: add adjacent link to limit depth level
Message-Id: <20191029145247.GA24739@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Taehee Yoo,

This is a semi-automatic email about new static checker warnings.

The patch 0ce1822c2a08: "vxlan: add adjacent link to limit depth
level" from Oct 21, 2019, leads to the following Smatch complaint:

    drivers/net/vxlan.c:4012 vxlan_changelink()
    error: we previously assumed 'lowerdev' could be null (see line 4009)

drivers/net/vxlan.c
  4008		netdev_adjacent_change_commit(dst->remote_dev, lowerdev, dev);
  4009		if (lowerdev && lowerdev != dst->remote_dev)
                    ^^^^^^^^
The patch adds a check for NULL,

  4010			dst->remote_dev = lowerdev;
  4011	
  4012		netdev_update_lockdep_key(lowerdev);
                                          ^^^^^^^^
but it also adds a new unchecked dereference (inside the function).

  4013		vxlan_config_apply(dev, &conf, lowerdev, vxlan->net, true);
  4014		return 0;

regards,
dan carpenter
