From: <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 11:17:59 +0000
Subject: [bug report] cxgb4: add loopback ethtool self-test
Message-Id: <20200727111759.GA389488@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vishal Kulkarni,

The patch 7235ffae3d2c: "cxgb4: add loopback ethtool self-test" from
Jul 23, 2020, leads to the following static checker warning:

	drivers/net/ethernet/chelsio/cxgb4/sge.c:2571 cxgb4_selftest_lb_pkt()
	warn: struct type mismatch 'fw_eth_tx_pkt_wr vs tx_desc'

drivers/net/ethernet/chelsio/cxgb4/sge.c
  2542  int cxgb4_selftest_lb_pkt(struct net_device *netdev)
  2543  {
  2544          struct port_info *pi = netdev_priv(netdev);
  2545          struct adapter *adap = pi->adapter;
  2546          struct cxgb4_ethtool_lb_test *lb;
  2547          int ret, i = 0, pkt_len, credits;
  2548          struct fw_eth_tx_pkt_wr *wr;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^

  2549          struct cpl_tx_pkt_core *cpl;
  2550          u32 ctrl0, ndesc, flits;
  2551          struct sge_eth_txq *q;
  2552          u8 *sgl;
  2553  
  2554          pkt_len = ETH_HLEN + sizeof(CXGB4_SELFTEST_LB_STR);
  2555  
  2556          flits = DIV_ROUND_UP(pkt_len + sizeof(struct cpl_tx_pkt) +
  2557                               sizeof(*wr), sizeof(__be64));
  2558          ndesc = flits_to_desc(flits);
  2559  
  2560          lb = &pi->ethtool_lb;
  2561          lb->loopback = 1;
  2562  
  2563          q = &adap->sge.ethtxq[pi->first_qset];
  2564  
  2565          reclaim_completed_tx(adap, &q->q, -1, true);
  2566          credits = txq_avail(&q->q) - ndesc;
  2567          if (unlikely(credits < 0))
  2568                  return -ENOMEM;
  2569  
  2570          wr = (void *)&q->q.desc[q->q.pidx];
  2571          memset(wr, 0, sizeof(struct tx_desc));
                              ^^^^^^^^^^^^^^^^^^^^^
Is this type correct?

  2572  
  2573          wr->op_immdlen = htonl(FW_WR_OP_V(FW_ETH_TX_PKT_WR) |
  2574                                 FW_WR_IMMDLEN_V(pkt_len +
  2575                                 sizeof(*cpl)));
  2576          wr->equiq_to_len16 = htonl(FW_WR_LEN16_V(DIV_ROUND_UP(flits, 2)));
  2577          wr->r3 = cpu_to_be64(0);
  2578  
  2579          cpl = (void *)(wr + 1);
  2580          sgl = (u8 *)(cpl + 1);
  2581  

regards,
dan carpenter
