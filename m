From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2020 08:20:20 +0000
Subject: [bug report] octeontx2-pf: Support to enable/disable pause frames via ethtool
Message-Id: <20200305082020.vwfxzxizbfuc5otk@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Geetha sowjanya,

The patch 75f36270990c: "octeontx2-pf: Support to enable/disable
pause frames via ethtool" from Mar 2, 2020, leads to the following
static checker warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:269 otx2_get_pauseparam()
	error: 'rsp' dereferencing possible ERR_PTR()

drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
   256  static void otx2_get_pauseparam(struct net_device *netdev,
   257                                  struct ethtool_pauseparam *pause)
   258  {
   259          struct otx2_nic *pfvf = netdev_priv(netdev);
   260          struct cgx_pause_frm_cfg *req, *rsp;
   261  
   262          req = otx2_mbox_alloc_msg_cgx_cfg_pause_frm(&pfvf->mbox);
   263          if (!req)
   264                  return;
   265  
   266          if (!otx2_sync_mbox_msg(&pfvf->mbox)) {
   267                  rsp = (struct cgx_pause_frm_cfg *)
   268                         otx2_mbox_get_rsp(&pfvf->mbox.mbox, 0, &req->hdr);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Does this require error handling?  It's not totally clear to me.

   269                  pause->rx_pause = rsp->rx_pause;
   270                  pause->tx_pause = rsp->tx_pause;
   271          }
   272  }

regards,
dan carpenter
