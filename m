From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 09:00:50 +0000
Subject: [bug report] net: hns3: Add Ethtool support to HNS3 driver
Message-Id: <20170809072628.5akkozttathdk3up@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Salil,

The patch 496d03e960ae: "net: hns3: Add Ethtool support to HNS3
driver" from Aug 2, 2017, leads to the following static checker
warning:

	drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c:335 hns3_get_link_ksettings()
	error: uninitialized symbol 'media_type'.

drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c
   300  static int hns3_get_link_ksettings(struct net_device *netdev,
   301                                     struct ethtool_link_ksettings *cmd)
   302  {
   303          struct hns3_nic_priv *priv = netdev_priv(netdev);
   304          struct hnae3_handle *h = priv->ae_handle;
   305          u32 supported_caps;
   306          u32 advertised_caps;
   307          u8 media_type;
                   ^^^^^^^^^^
   308          u8 link_stat;
   309          u8 auto_neg;
   310          u8 duplex;
   311          u32 speed;
   312  
   313          if (!h->ae_algo || !h->ae_algo->ops)
   314                  return -EOPNOTSUPP;
   315  
   316          /* 1.auto_neg&speed&duplex from cmd */
   317          if (h->ae_algo->ops->get_ksettings_an_result) {
   318                  h->ae_algo->ops->get_ksettings_an_result(h, &auto_neg,
   319                                                           &speed, &duplex);
   320                  cmd->base.autoneg = auto_neg;
   321                  cmd->base.speed = speed;
   322                  cmd->base.duplex = duplex;
   323  
   324                  link_stat = hns3_get_link(netdev);
   325                  if (!link_stat) {
   326                          cmd->base.speed = (u32)SPEED_UNKNOWN;
   327                          cmd->base.duplex = DUPLEX_UNKNOWN;
   328                  }
   329          }
   330  
   331          /* 2.media_type get from bios parameter block */
   332          if (h->ae_algo->ops->get_media_type)
   333                  h->ae_algo->ops->get_media_type(h, &media_type);
                                                            ^^^^^^^^^^
Probably make this unconditional?

   334  
   335          switch (media_type) {
   336          case HNAE3_MEDIA_TYPE_FIBER:
   337                  cmd->base.port = PORT_FIBRE;
   338                  supported_caps = HNS3_LM_FIBRE_BIT | HNS3_LM_AUTONEG_BIT |
   339                          HNS3_LM_PAUSE_BIT | HNS3_LM_1000BASET_FULL_BIT;
   340  
   341                  advertised_caps = supported_caps;
   342                  break;


regards,
dan carpenter
