From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Aug 2018 08:22:55 +0000
Subject: [bug report] cxgb4: print ULD queue information managed by LLD
Message-Id: <20180807082255.pm3ao5tv7f4xc4lg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rahul Lakkireddy,

This is a semi-automatic email about new static checker warnings.

The patch 27defe9d8f6a: "cxgb4: print ULD queue information managed 
by LLD" from Jul 27, 2018, leads to the following Smatch complaint:

    drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2616 sge_qinfo_show()
     error: we previously assumed 's->uld_txq_info' could be null (see line 2525)

drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
  2524		mutex_lock(&uld_mutex);
  2525		if (s->uld_txq_info)
                    ^^^^^^^^^^^^^^^
Patch adds new check

  2526			for (i = 0; i < ARRAY_SIZE(uld_txq_entries); i++)
  2527				uld_txq_entries[i] = sge_qinfo_uld_txq_entries(adap, i);
  2528	
  2529		if (s->uld_rxq_info) {
  2530			for (i = 0; i < ARRAY_SIZE(uld_rxq_entries); i++) {
  2531				uld_rxq_entries[i] = sge_qinfo_uld_rxq_entries(adap, i);
  2532				uld_ciq_entries[i] = sge_qinfo_uld_ciq_entries(adap, i);
  2533			}
  2534		}
  2535	
  2536		if (r)
  2537			seq_putc(seq, '\n');
  2538	
  2539	#define S3(fmt_spec, s, v) \
  2540	do { \
  2541		seq_printf(seq, "%-12s", s); \
  2542		for (i = 0; i < n; ++i) \
  2543			seq_printf(seq, " %16" fmt_spec, v); \
  2544			seq_putc(seq, '\n'); \
  2545	} while (0)
  2546	#define S(s, v) S3("s", s, v)
  2547	#define T3(fmt_spec, s, v) S3(fmt_spec, s, tx[i].v)
  2548	#define T(s, v) S3("u", s, tx[i].v)
  2549	#define TL(s, v) T3("lu", s, v)
  2550	#define R3(fmt_spec, s, v) S3(fmt_spec, s, rx[i].v)
  2551	#define R(s, v) S3("u", s, rx[i].v)
  2552	#define RL(s, v) R3("lu", s, v)
  2553	
  2554		if (r < eth_entries) {
  2555			int base_qset = r * 4;
  2556			const struct sge_eth_rxq *rx = &s->ethrxq[base_qset];
  2557			const struct sge_eth_txq *tx = &s->ethtxq[base_qset];
  2558	
  2559			n = min(4, s->ethqsets - 4 * r);
  2560	
  2561			S("QType:", "Ethernet");
  2562			S("Interface:",
  2563			  rx[i].rspq.netdev ? rx[i].rspq.netdev->name : "N/A");
  2564			T("TxQ ID:", q.cntxt_id);
  2565			T("TxQ size:", q.size);
  2566			T("TxQ inuse:", q.in_use);
  2567			T("TxQ CIDX:", q.cidx);
  2568			T("TxQ PIDX:", q.pidx);
  2569	#ifdef CONFIG_CHELSIO_T4_DCB
  2570			T("DCB Prio:", dcb_prio);
  2571			S3("u", "DCB PGID:",
  2572			   (ethqset2pinfo(adap, base_qset + i)->dcb.pgid >>
  2573			    4*(7-tx[i].dcb_prio)) & 0xf);
  2574			S3("u", "DCB PFC:",
  2575			   (ethqset2pinfo(adap, base_qset + i)->dcb.pfcen >>
  2576			    1*(7-tx[i].dcb_prio)) & 0x1);
  2577	#endif
  2578			R("RspQ ID:", rspq.abs_id);
  2579			R("RspQ size:", rspq.size);
  2580			R("RspQE size:", rspq.iqe_len);
  2581			R("RspQ CIDX:", rspq.cidx);
  2582			R("RspQ Gen:", rspq.gen);
  2583			S3("u", "Intr delay:", qtimer_val(adap, &rx[i].rspq));
  2584			S3("u", "Intr pktcnt:", s->counter_val[rx[i].rspq.pktcnt_idx]);
  2585			R("FL ID:", fl.cntxt_id);
  2586			R("FL size:", fl.size - 8);
  2587			R("FL pend:", fl.pend_cred);
  2588			R("FL avail:", fl.avail);
  2589			R("FL PIDX:", fl.pidx);
  2590			R("FL CIDX:", fl.cidx);
  2591			RL("RxPackets:", stats.pkts);
  2592			RL("RxCSO:", stats.rx_cso);
  2593			RL("VLANxtract:", stats.vlan_ex);
  2594			RL("LROmerged:", stats.lro_merged);
  2595			RL("LROpackets:", stats.lro_pkts);
  2596			RL("RxDrops:", stats.rx_drops);
  2597			TL("TSO:", tso);
  2598			TL("TxCSO:", tx_cso);
  2599			TL("VLANins:", vlan_ins);
  2600			TL("TxQFull:", q.stops);
  2601			TL("TxQRestarts:", q.restarts);
  2602			TL("TxMapErr:", mapping_err);
  2603			RL("FLAllocErr:", fl.alloc_failed);
  2604			RL("FLLrgAlcErr:", fl.large_alloc_failed);
  2605			RL("FLMapErr:", fl.mapping_err);
  2606			RL("FLLow:", fl.low);
  2607			RL("FLStarving:", fl.starving);
  2608	
  2609			goto unlock;
  2610		}
  2611	
  2612		r -= eth_entries;
  2613		if (r < uld_txq_entries[CXGB4_TX_OFLD]) {
  2614			const struct sge_uld_txq *tx;
  2615	
  2616			utxq_info = s->uld_txq_info[CXGB4_TX_OFLD];
                                    ^^^^^^^^^^^^^^^^
Patch adds a new unchecked dereference

  2617			tx = &utxq_info->uldtxq[r * 4];
  2618			n = min(4, utxq_info->ntxq - 4 * r);

regards,
dan carpenter
