From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jun 2015 09:27:50 +0000
Subject: re: Add support of Cavium Liquidio ethernet adapters
Message-Id: <20150625092750.GA13888@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150623142408.GA10121@mwanda>
In-Reply-To: <20150623142408.GA10121@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Raghu Vatsavayi,

The patch f21fb3ed364b: "Add support of Cavium Liquidio ethernet
adapters" from Jun 9, 2015, leads to the following static checker
warning:

	drivers/net/ethernet/cavium/liquidio/lio_main.c:2267 liquidio_set_mcast_list()
	warn: buffer overflow 'nctrl.udd' 32 <= 32

drivers/net/ethernet/cavium/liquidio/lio_main.c
  2236  static void liquidio_set_mcast_list(struct net_device *netdev)
  2237  {
  2238          struct lio *lio = GET_LIO(netdev);
  2239          struct octeon_device *oct = lio->oct_dev;
  2240          struct octnic_ctrl_pkt nctrl;
  2241          struct octnic_ctrl_params nparams;
  2242          struct netdev_hw_addr *ha;
  2243          u64 *mc;
  2244          int ret, i;
  2245          int mc_count = min(netdev_mc_count(netdev), MAX_OCTEON_MULTICAST_ADDR);
  2246  
  2247          memset(&nctrl, 0, sizeof(struct octnic_ctrl_pkt));
  2248  
  2249          /* Create a ctrl pkt command to be sent to core app. */
  2250          nctrl.ncmd.u64 = 0;
  2251          nctrl.ncmd.s.cmd = OCTNET_CMD_SET_MULTI_LIST;
  2252          nctrl.ncmd.s.param1 = lio->linfo.ifidx;
  2253          nctrl.ncmd.s.param2 = get_new_flags(netdev);
  2254          nctrl.ncmd.s.param3 = mc_count;
  2255          nctrl.ncmd.s.more = mc_count;
  2256          nctrl.netpndev = (u64)netdev;
  2257          nctrl.cb_fn = liquidio_link_ctrl_cmd_completion;
  2258  
  2259          /* copy all the addresses into the udd */
  2260          i = 0;
  2261          mc = &nctrl.udd[0];
  2262          netdev_for_each_mc_addr(ha, netdev) {
  2263                  *mc = 0;
  2264                  memcpy(((u8 *)mc) + 2, ha->addr, ETH_ALEN);
  2265                  /* no need to swap bytes */
  2266  
  2267                  if (++mc > &nctrl.udd[mc_count])

The static checker will still complain, but I think the ">" should be
">=".  The address "&nctrl.udd[mc_count]" is one space beyond the end of
the array.

  2268                          break;
  2269          }

regards,
dan carpenter
