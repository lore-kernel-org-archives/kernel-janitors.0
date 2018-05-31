From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 12:23:19 +0000
Subject: [bug report] net: Introduce generic failover module
Message-Id: <20180531122319.rnvjpdnf4xrujbsw@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sridhar Samudrala,

This is a semi-automatic email about new static checker warnings.

The patch 30c8bd5aa8b2: "net: Introduce generic failover module" from 
May 24, 2018, leads to the following Smatch complaint:

    net/core/failover.c:66 failover_slave_register()
     error: we previously assumed 'fops' could be null (see line 62)

net/core/failover.c
    20  static struct net_device *failover_get_bymac(u8 *mac, struct failover_ops **ops)
    21  {
    22          struct net_device *failover_dev;
    23          struct failover *failover;
    24  
    25          spin_lock(&failover_lock);
    26          list_for_each_entry(failover, &failover_list, list) {
    27                  failover_dev = rtnl_dereference(failover->failover_dev);
    28                  if (ether_addr_equal(failover_dev->perm_addr, mac)) {
    29                          *ops = rtnl_dereference(failover->ops);
                                                        ^^^^^^^^^^^^^
Can this really be NULL?

    30                          spin_unlock(&failover_lock);
    31                          return failover_dev;
    32                  }
    33          }
    34          spin_unlock(&failover_lock);
    35          return NULL;
    36  }
    37  
    38  /**
    39   * failover_slave_register - Register a slave netdev
    40   *
    41   * @slave_dev: slave netdev that is being registered
    42   *
    43   * Registers a slave device to a failover instance. Only ethernet devices
    44   * are supported.
    45   */
    46  static int failover_slave_register(struct net_device *slave_dev)
    47  {
    48          struct netdev_lag_upper_info lag_upper_info;
    49          struct net_device *failover_dev;
    50          struct failover_ops *fops;
    51          int err;
    52  
    53          if (slave_dev->type != ARPHRD_ETHER)
    54                  goto done;
    55  
    56          ASSERT_RTNL();
    57  
    58          failover_dev = failover_get_bymac(slave_dev->perm_addr, &fops);
    59          if (!failover_dev)
    60                  goto done;
    61	
    62		if (fops && fops->slave_pre_register &&
                    ^^^^
Can this be removed?

    63		    fops->slave_pre_register(slave_dev, failover_dev))
    64			goto done;
    65	
    66		err = netdev_rx_handler_register(slave_dev, fops->slave_handle_frame,
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

    67						 failover_dev);
    68		if (err) {

regards,
dan carpenter
