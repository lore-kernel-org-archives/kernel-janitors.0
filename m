From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Jul 2014 12:52:35 +0000
Subject: re: cxgb4 : Add DCBx support codebase and dcbnl_ops
Message-Id: <20140708125235.GA9963@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Anish Bhatt,

The patch 76bcb31efc06: "cxgb4 : Add DCBx support codebase and
dcbnl_ops" from Jun 19, 2014, leads to the following static checker
warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c:679 cxgb4_setapp()
	warn: signedness bug returning '(-22)'

drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c
   669  static u8 cxgb4_setapp(struct net_device *dev, u8 app_idtype, u16 app_id,
   670                         u8 app_prio)
   671  {
   672          struct fw_port_cmd pcmd;
   673          struct port_info *pi = netdev2pinfo(dev);
   674          struct adapter *adap = pi->adapter;
   675          int i, err;
   676  
   677  
   678          if (pi->dcb.state != CXGB4_DCB_STATE_FW_ALLSYNCED)
   679                  return -EINVAL;
                        ^^^^^^^^^^^^^^

See also:

drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c:683 cxgb4_setapp() warn: signedness bug returning '(-67)'
drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c:687 cxgb4_setapp() warn: signedness bug returning '(-22)'
drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c:713 cxgb4_setapp() warn: signedness bug returning '(-16)'

regards,
dan carpenter
