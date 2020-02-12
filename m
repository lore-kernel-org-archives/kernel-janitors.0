From: Dmitry Bogdanov <dbogdanov@marvell.com>
Date: Wed, 12 Feb 2020 08:13:02 +0000
Subject: RE: [EXT] [bug report] net: aquantia: add support of rx-vlan-filter offload
Message-Id: <BYAPR18MB2357232C87FC858DB55AD3E2A41B0@BYAPR18MB2357.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for bug report. Yes, there is a missing of masking by VLAN_VID_MASK:

-166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci),
+166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci) & VLAN_VID_MASK,

I will prepare  the patch.

BR,
 Dmitry

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com> 
Sent: Wednesday, February 12, 2020 10:30 AM
To: dmitry.bogdanov@aquantia.com
Cc: 
Subject: [EXT] [bug report] net: aquantia: add support of rx-vlan-filter offload

External Email

----------------------------------------------------------------------
Hello Dmitry Bogdanov,

The patch 7975d2aff5af: "net: aquantia: add support of rx-vlan-filter offload" from Nov 12, 2018, leads to the following static checker
warning:

	drivers/net/ethernet/aquantia/atlantic/aq_filters.c:166 aq_check_approve_fvlan()
	error: passing untrusted data to 'test_bit()'

drivers/net/ethernet/aquantia/atlantic/aq_filters.c
   151  static int __must_check
   152  aq_check_approve_fvlan(struct aq_nic_s *aq_nic,
   153                         struct aq_hw_rx_fltrs_s *rx_fltrs,
   154                         struct ethtool_rx_flow_spec *fsp)
   155  {
   156          if (fsp->location < AQ_RX_FIRST_LOC_FVLANID ||
   157              fsp->location > AQ_RX_LAST_LOC_FVLANID) {
   158                  netdev_err(aq_nic->ndev,
   159                             "ethtool: location must be in range [%d, %d]",
   160                             AQ_RX_FIRST_LOC_FVLANID,
   161                             AQ_RX_LAST_LOC_FVLANID);
   162                  return -EINVAL;
   163          }
   164  
   165          if ((aq_nic->ndev->features & NETIF_F_HW_VLAN_CTAG_FILTER) &&
   166              (!test_bit(be16_to_cpu(fsp->h_ext.vlan_tci),
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ If this is more than 4096 then it is a buffer overflow.

   167                         aq_nic->active_vlans))) {
   168                  netdev_err(aq_nic->ndev,
   169                             "ethtool: unknown vlan-id specified");
   170                  return -EINVAL;
   171          }
   172  
   173          if (fsp->ring_cookie > aq_nic->aq_nic_cfg.num_rss_queues) {
   174                  netdev_err(aq_nic->ndev,
   175                             "ethtool: queue number must be in range [0, %d]",
   176                             aq_nic->aq_nic_cfg.num_rss_queues - 1);
   177                  return -EINVAL;
   178          }
   179          return 0;
   180  }

regards,
dan carpenter
