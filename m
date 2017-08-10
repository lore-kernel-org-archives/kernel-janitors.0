From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 12:12:52 +0000
Subject: [bug report] rocker: Add support for learning FDB through notification
Message-Id: <20170809084715.2do2st52nbok56du@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Arkadi Sharshevsky,

The patch 726fd42fc1e3: "rocker: Add support for learning FDB through
notification" from Jun 8, 2017, leads to the following static checker
warning:

	drivers/net/ethernet/rocker/rocker_main.c:2789 rocker_switchdev_event()
	error: potential null dereference 'switchdev_work->fdb_info.addr'.  (kzalloc returns null)

drivers/net/ethernet/rocker/rocker_main.c
  2779          INIT_WORK(&switchdev_work->work, rocker_switchdev_event_work);
  2780          switchdev_work->rocker_port = rocker_port;
  2781          switchdev_work->event = event;
  2782  
  2783          switch (event) {
  2784          case SWITCHDEV_FDB_ADD_TO_DEVICE: /* fall through */
  2785          case SWITCHDEV_FDB_DEL_TO_DEVICE:
  2786                  memcpy(&switchdev_work->fdb_info, ptr,
  2787                         sizeof(switchdev_work->fdb_info));
  2788                  switchdev_work->fdb_info.addr = kzalloc(ETH_ALEN, GFP_ATOMIC);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Alloc

  2789                  ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

  2790                                  fdb_info->addr);
  2791                  /* Take a reference on the rocker device */
  2792                  dev_hold(dev);
  2793                  break;
  2794          default:
  2795                  kfree(switchdev_work);
  2796                  return NOTIFY_DONE;
  2797          }
  2798  
  2799          queue_work(rocker_port->rocker->rocker_owq,
  2800                     &switchdev_work->work);
  2801          return NOTIFY_DONE;
  2802  }

regards,
dan carpenter
