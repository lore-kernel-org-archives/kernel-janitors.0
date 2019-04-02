From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Apr 2019 07:01:08 +0000
Subject: [bug report] cxgb4: Add support for ndo_get_vf_config
Message-Id: <20190402070108.GA15171@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Hariprasad Shenai,

The patch 661dbeb9d6e6: "cxgb4: Add support for ndo_get_vf_config"
from Sep 2, 2016, leads to the following static checker warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:2723 cxgb4_mgmt_set_vf_mac()
	warn: uncapped user index 'adap->vfinfo[vf]'

drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
    2705 static int cxgb4_mgmt_set_vf_mac(struct net_device *dev, int vf, u8 *mac)
                                                                  ^^^^^^
"vf" comes from skb->data so it's marked as untrusted in do_setvfinfo().

    2706 {
    2707 	struct port_info *pi = netdev_priv(dev);
    2708 	struct adapter *adap = pi->adapter;
    2709 	int ret;
    2710 
    2711 	/* verify MAC addr is valid */
    2712 	if (!is_valid_ether_addr(mac)) {
    2713 		dev_err(pi->adapter->pdev_dev,
    2714 			"Invalid Ethernet address %pM for VF %d\n",
    2715 			mac, vf);
    2716 		return -EINVAL;
    2717 	}
    2718 
    2719 	dev_info(pi->adapter->pdev_dev,
    2720 		 "Setting MAC %pM on VF %d\n", mac, vf);
    2721 	ret = t4_set_vf_mac_acl(adap, vf + 1, 1, mac);
                                              ^^^^^^
It looks to me like an invalid "vf" can still return success...

    2722 	if (!ret)
--> 2723 		ether_addr_copy(adap->vfinfo[vf].vf_mac_addr, mac);
                                        ^^^^^^^^^^^^^^^^
->vfinfo is allocated in cxgb4_iov_configure().

    2724 	return ret;
    2725 }

There are a bunch of these bugs in different drivers.  Some drivers do
check "vf" and some don't.  I'm not posisitive on the rules here.

regards,
dan carpenter
