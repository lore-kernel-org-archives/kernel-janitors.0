From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Apr 2018 11:16:45 +0000
Subject: [bug report] net: thunderx: add ndo_set_rx_mode callback implementation for VF
Message-Id: <20180404111645.GA26736@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vadim Lomovtsev,

The patch 37c3347eb247: "net: thunderx: add ndo_set_rx_mode callback
implementation for VF" from Mar 30, 2018, leads to the following
static checker warning:

	drivers/net/ethernet/cavium/thunder/nicvf_main.c:2006 nicvf_set_rx_mode()
	error: potential null dereference 'xaddr'.  (kmalloc returns null)

drivers/net/ethernet/cavium/thunder/nicvf_main.c
  1980  static void nicvf_set_rx_mode(struct net_device *netdev)
  1981  {
  1982          struct nicvf *nic = netdev_priv(netdev);
  1983          struct netdev_hw_addr *ha;
  1984          struct xcast_addr_list *mc_list = NULL;
  1985          u8 mode = 0;
  1986  
  1987          if (netdev->flags & IFF_PROMISC) {
  1988                  mode = BGX_XCAST_BCAST_ACCEPT | BGX_XCAST_MCAST_ACCEPT;
  1989          } else {
  1990                  if (netdev->flags & IFF_BROADCAST)
  1991                          mode |= BGX_XCAST_BCAST_ACCEPT;
  1992  
  1993                  if (netdev->flags & IFF_ALLMULTI) {
  1994                          mode |= BGX_XCAST_MCAST_ACCEPT;
  1995                  } else if (netdev->flags & IFF_MULTICAST) {
  1996                          mode |= BGX_XCAST_MCAST_FILTER;
  1997                          /* here we need to copy mc addrs */
  1998                          if (netdev_mc_count(netdev)) {
  1999                                  struct xcast_addr *xaddr;
  2000  
  2001                                  mc_list = kmalloc(sizeof(*mc_list), GFP_ATOMIC);
                                        ^^^^^^^^^^^^^^^^^
Not checked.

  2002                                  INIT_LIST_HEAD(&mc_list->list);
  2003                                  netdev_hw_addr_list_for_each(ha, &netdev->mc) {
  2004                                          xaddr = kmalloc(sizeof(*xaddr),
                                                ^^^^^^^^^^^^^^^
Also not checked.

  2005                                                          GFP_ATOMIC);
  2006                                          xaddr->addr   2007                                                  ether_addr_to_u64(ha->addr);
  2008                                          list_add_tail(&xaddr->list,
  2009                                                        &mc_list->list);
  2010                                          mc_list->count++;
  2011                                  }
  2012                          }
  2013                  }
  2014          }
  2015          nic->rx_mode_work.mc = mc_list;
  2016          nic->rx_mode_work.mode = mode;
  2017          queue_delayed_work(nicvf_rx_mode_wq, &nic->rx_mode_work.work, 2 * HZ);
  2018  }

regards,
dan carpenter
