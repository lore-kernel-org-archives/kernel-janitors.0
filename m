From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 13:20:08 +0000
Subject: [bug report] dpaa2-eth: use bulk enqueue in .ndo_xdp_xmit
Message-Id: <20200428132008.GA696615@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch 8665d9780e6e: "dpaa2-eth: use bulk enqueue in
.ndo_xdp_xmit" from Apr 22, 2020, leads to the following static
checker warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:1972 dpaa2_eth_xdp_xmit()
	error: uninitialized symbol 'enqueued'.

drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
  1932  static int dpaa2_eth_xdp_xmit(struct net_device *net_dev, int n,
  1933                                struct xdp_frame **frames, u32 flags)
  1934  {
  1935          struct dpaa2_eth_priv *priv = netdev_priv(net_dev);
  1936          int total_enqueued = 0, retries = 0, enqueued;
  1937          struct dpaa2_eth_drv_stats *percpu_extras;
  1938          struct rtnl_link_stats64 *percpu_stats;
  1939          int num_fds, i, err, max_retries;
  1940          struct dpaa2_eth_fq *fq;
  1941          struct dpaa2_fd *fds;
  1942  
  1943          if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
  1944                  return -EINVAL;
  1945  
  1946          if (!netif_running(net_dev))
  1947                  return -ENETDOWN;
  1948  
  1949          fq = &priv->fq[smp_processor_id()];
  1950          fds = fq->xdp_fds;
  1951  
  1952          percpu_stats = this_cpu_ptr(priv->percpu_stats);
  1953          percpu_extras = this_cpu_ptr(priv->percpu_extras);
  1954  
  1955          /* create a FD for each xdp_frame in the list received */
  1956          for (i = 0; i < n; i++) {
  1957                  err = dpaa2_eth_xdp_create_fd(net_dev, frames[i], &fds[i]);
  1958                  if (err)
  1959                          break;
  1960          }
  1961          num_fds = i;
  1962  
  1963          /* try to enqueue all the FDs until the max number of retries is hit */
  1964          max_retries = num_fds * DPAA2_ETH_ENQUEUE_RETRIES;
  1965          while (total_enqueued < num_fds && retries < max_retries) {
  1966                  err = priv->enqueue(priv, fq, &fds[total_enqueued],
  1967                                      0, num_fds - total_enqueued, &enqueued);
  1968                  if (err = -EBUSY) {
                            ^^^^^^^^^^^^^
Smatch is complaining here because some -enqueue() implementations
return other error codes as well as -EBUSY.  The
dpaa2_io_service_enqueue_multiple_desc_fq() function returns -ENODEV
for example.

  1969                          percpu_extras->tx_portal_busy += ++retries;
  1970                          continue;
  1971                  }
  1972                  total_enqueued += enqueued;
  1973          }
  1974  
  1975          /* update statistics */
  1976          percpu_stats->tx_packets += total_enqueued;
  1977          for (i = 0; i < total_enqueued; i++)

regards,
dan carpenter
