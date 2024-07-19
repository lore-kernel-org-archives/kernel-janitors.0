Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DBF148FFF
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Jul 2024 23:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433154; cv=none; b=qsvr7OubTWKnGpIZSWuqpND5R9/wZmD08CzzeGyNzqC6eyl7/6RdS/IuPLgaOor2M6yQI2HLuu3B5Mam7QSSe+AUFMVrwTbTWbT4hM/u/BL+UVA7oEnMeIrgIuhfGKo5+CjL80Mfd6isgKJu3d8ocFzDtlh5nl7f7c+X3PaXwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433154; c=relaxed/simple;
	bh=uIn497WM6TWIlrwGd3cff9N/H/NkBn+wmr39X2HFQ1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQJsa6Y3JwR6og/ECWP87nCbulkxzOiSsc1nsoYcjIKJLV9LoTHupD82Nn+vzrNKpdGsM7mZ5t8cWMswMMb/JcNuqSbak8gbmw+MSZVc8fnbhbg38PpS0yFHDvz1yzLbswsw3asR6uNkRSDAZYrMNnjzQ4hFkh6rgXEEQtRJ49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgE3SHQW; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgE3SHQW"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5d437791affso1325010eaf.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Jul 2024 16:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433151; x=1722037951; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPetzqOdG/g2uURiY3M69bbpOAmaTk1cx+OErPVsqhE=;
        b=MgE3SHQWjMMwGPB7ZBkWIZjRtmvwNQI9k3oS9e/Rfu9lpdFw/n1y14DZ/G6cK1ImGL
         11mdXYpbEf1yWKPhu/AhAr7XNNAl3sZpX/nmdWksuyFjwaIJcCADqHEImG9x3TEK6BvF
         ntghtrlj2DAUhR+nn9fFUz4h+Z9jlsnczCXwKVPGbHhxwwQYSX7TgSAbQi4ZW1cHt4uK
         35EemyUvPduD+XuKjs1nUA62BllSTg5PIeFXw/+/Is7nzqyfdXXfQXxl5ikjVBbnCKem
         QDYhcrNpNTbgGdNQvlbwHJV2UErVPzP86SugpCrp7HZDuhH57fwzZOV0N9MjlNvOd22d
         xB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433151; x=1722037951;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPetzqOdG/g2uURiY3M69bbpOAmaTk1cx+OErPVsqhE=;
        b=aSUsOC5sg+gdjItcB1vLA2rQXPGJiSQgkqhaHQRluYzS/P3S6eNVu1obvnwEi9UIBf
         cwwAI6OvSXnlfBQyx9BK1udV/QKhnug1owLP5BjiBGfD75b4BuZyalraiP0Ap/MXTFHf
         KAfRQcAYRZHTNTCvstcLlpCaxo8/HjyNpZd1d8Kw0JjxVhXT0nuVlNFsi1/Mj4nVVMd5
         01JH5x94w1EQHnIxI65PqDY137awFMvPZFzT0C5Dihga0lB8rQBxq6txyNYkyQIcDo6b
         9b3igZBvsnKqJB5atuF1lOEzPNTJYC3+Ssx+rPjwBBIGe5JH/BY39CSeMtBrkROtJt6T
         tOMg==
X-Gm-Message-State: AOJu0YzfCqIq4o4jG0LVNv5+KkFgKOmgMnpGuQuKWqTO+2O/Q8X/Whuw
	5wg0OMGWKW1RXWsMIJedXZdOgWSLCJz7jp8jkJpT+q2nXh5txsv2G9XBDm4GlhonqEEdrtQCL+6
	k
X-Google-Smtp-Source: AGHT+IGzAb2OvKSzwEl6e9+2VmBL90ZNc5kQrEk5KsJ0WOiKU/RpZ4v/1C7mpy6YqGyP/lZdpmybzg==
X-Received: by 2002:a05:6870:a10f:b0:24c:59f7:e840 with SMTP id 586e51a60fabf-26121393a63mr1324796fac.17.1721433151304;
        Fri, 19 Jul 2024 16:52:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f61913b8sm511136a34.68.2024.07.19.16.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:52:30 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:52:28 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] bnxt_en: Increase the max total outstanding PTP TX
 packets to 4
Message-ID: <cc01a509-ca3d-488c-b158-2ef16cbda5e2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pavan Chebbi,

Commit 8aa2a79e9b95 ("bnxt_en: Increase the max total outstanding PTP
TX packets to 4") from Jun 28, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/ethernet/broadcom/bnxt/bnxt.c:768 bnxt_start_xmit()
	error: we previously assumed 'ptp' could be null (see line 513)

drivers/net/ethernet/broadcom/bnxt/bnxt.c
    449 static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
    450 {
    451         struct bnxt *bp = netdev_priv(dev);
    452         struct tx_bd *txbd, *txbd0;
    453         struct tx_bd_ext *txbd1;
    454         struct netdev_queue *txq;
    455         int i;
    456         dma_addr_t mapping;
    457         unsigned int length, pad = 0;
    458         u32 len, free_size, vlan_tag_flags, cfa_action, flags;
    459         struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
    460         struct pci_dev *pdev = bp->pdev;
    461         u16 prod, last_frag, txts_prod;
    462         struct bnxt_tx_ring_info *txr;
    463         struct bnxt_sw_tx_bd *tx_buf;
    464         __le32 lflags = 0;
    465 
    466         i = skb_get_queue_mapping(skb);
    467         if (unlikely(i >= bp->tx_nr_rings)) {
    468                 dev_kfree_skb_any(skb);
    469                 dev_core_stats_tx_dropped_inc(dev);
    470                 return NETDEV_TX_OK;
    471         }
    472 
    473         txq = netdev_get_tx_queue(dev, i);
    474         txr = &bp->tx_ring[bp->tx_ring_map[i]];
    475         prod = txr->tx_prod;
    476 
    477         free_size = bnxt_tx_avail(bp, txr);
    478         if (unlikely(free_size < skb_shinfo(skb)->nr_frags + 2)) {
    479                 /* We must have raced with NAPI cleanup */
    480                 if (net_ratelimit() && txr->kick_pending)
    481                         netif_warn(bp, tx_err, dev,
    482                                    "bnxt: ring busy w/ flush pending!\n");
    483                 if (!netif_txq_try_stop(txq, bnxt_tx_avail(bp, txr),
    484                                         bp->tx_wake_thresh))
    485                         return NETDEV_TX_BUSY;
    486         }
    487 
    488         if (unlikely(ipv6_hopopt_jumbo_remove(skb)))
    489                 goto tx_free;
    490 
    491         length = skb->len;
    492         len = skb_headlen(skb);
    493         last_frag = skb_shinfo(skb)->nr_frags;
    494 
    495         txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
    496 
    497         tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
    498         tx_buf->skb = skb;
    499         tx_buf->nr_frags = last_frag;
    500 
    501         vlan_tag_flags = 0;
    502         cfa_action = bnxt_xmit_get_cfa_action(skb);
    503         if (skb_vlan_tag_present(skb)) {
    504                 vlan_tag_flags = TX_BD_CFA_META_KEY_VLAN |
    505                                  skb_vlan_tag_get(skb);
    506                 /* Currently supports 8021Q, 8021AD vlan offloads
    507                  * QINQ1, QINQ2, QINQ3 vlan headers are deprecated
    508                  */
    509                 if (skb->vlan_proto == htons(ETH_P_8021Q))
    510                         vlan_tag_flags |= 1 << TX_BD_CFA_META_TPID_SHIFT;
    511         }
    512 
    513         if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && ptp &&
                                                                             ^^^
Can ptp really be NULL?

    514             ptp->tx_tstamp_en) {
    515                 if (bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP) {
    516                         lflags |= cpu_to_le32(TX_BD_FLAGS_STAMP);
    517                         tx_buf->is_ts_pkt = 1;
    518                         skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
    519                 } else if (!skb_is_gso(skb)) {
    520                         u16 seq_id, hdr_off;
    521 
    522                         if (!bnxt_ptp_parse(skb, &seq_id, &hdr_off) &&
    523                             !bnxt_ptp_get_txts_prod(ptp, &txts_prod)) {
    524                                 if (vlan_tag_flags)
    525                                         hdr_off += VLAN_HLEN;
    526                                 lflags |= cpu_to_le32(TX_BD_FLAGS_STAMP);
    527                                 tx_buf->is_ts_pkt = 1;
    528                                 skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
    529 
    530                                 ptp->txts_req[txts_prod].tx_seqid = seq_id;
    531                                 ptp->txts_req[txts_prod].tx_hdr_off = hdr_off;
    532                                 tx_buf->txts_prod = txts_prod;
    533                         }
    534                 }
    535         }
    536         if (unlikely(skb->no_fcs))
    537                 lflags |= cpu_to_le32(TX_BD_FLAGS_NO_CRC);
    538 
    539         if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
    540             !lflags) {
    541                 struct tx_push_buffer *tx_push_buf = txr->tx_push;
    542                 struct tx_push_bd *tx_push = &tx_push_buf->push_bd;
    543                 struct tx_bd_ext *tx_push1 = &tx_push->txbd2;
    544                 void __iomem *db = txr->tx_db.doorbell;
    545                 void *pdata = tx_push_buf->data;
    546                 u64 *end;
    547                 int j, push_len;
    548 
    549                 /* Set COAL_NOW to be ready quickly for the next push */
    550                 tx_push->tx_bd_len_flags_type =
    551                         cpu_to_le32((length << TX_BD_LEN_SHIFT) |
    552                                         TX_BD_TYPE_LONG_TX_BD |
    553                                         TX_BD_FLAGS_LHINT_512_AND_SMALLER |
    554                                         TX_BD_FLAGS_COAL_NOW |
    555                                         TX_BD_FLAGS_PACKET_END |
    556                                         (2 << TX_BD_FLAGS_BD_CNT_SHIFT));
    557 
    558                 if (skb->ip_summed == CHECKSUM_PARTIAL)
    559                         tx_push1->tx_bd_hsize_lflags =
    560                                         cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
    561                 else
    562                         tx_push1->tx_bd_hsize_lflags = 0;
    563 
    564                 tx_push1->tx_bd_cfa_meta = cpu_to_le32(vlan_tag_flags);
    565                 tx_push1->tx_bd_cfa_action =
    566                         cpu_to_le32(cfa_action << TX_BD_CFA_ACTION_SHIFT);
    567 
    568                 end = pdata + length;
    569                 end = PTR_ALIGN(end, 8) - 1;
    570                 *end = 0;
    571 
    572                 skb_copy_from_linear_data(skb, pdata, len);
    573                 pdata += len;
    574                 for (j = 0; j < last_frag; j++) {
    575                         skb_frag_t *frag = &skb_shinfo(skb)->frags[j];
    576                         void *fptr;
    577 
    578                         fptr = skb_frag_address_safe(frag);
    579                         if (!fptr)
    580                                 goto normal_tx;
    581 
    582                         memcpy(pdata, fptr, skb_frag_size(frag));
    583                         pdata += skb_frag_size(frag);
    584                 }
    585 
    586                 txbd->tx_bd_len_flags_type = tx_push->tx_bd_len_flags_type;
    587                 txbd->tx_bd_haddr = txr->data_mapping;
    588                 txbd->tx_bd_opaque = SET_TX_OPAQUE(bp, txr, prod, 2);
    589                 prod = NEXT_TX(prod);
    590                 tx_push->tx_bd_opaque = txbd->tx_bd_opaque;
    591                 txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
    592                 memcpy(txbd, tx_push1, sizeof(*txbd));
    593                 prod = NEXT_TX(prod);
    594                 tx_push->doorbell =
    595                         cpu_to_le32(DB_KEY_TX_PUSH | DB_LONG_TX_PUSH |
    596                                     DB_RING_IDX(&txr->tx_db, prod));
    597                 WRITE_ONCE(txr->tx_prod, prod);
    598 
    599                 tx_buf->is_push = 1;
    600                 netdev_tx_sent_queue(txq, skb->len);
    601                 wmb();        /* Sync is_push and byte queue before pushing data */
    602 
    603                 push_len = (length + sizeof(*tx_push) + 7) / 8;
    604                 if (push_len > 16) {
    605                         __iowrite64_copy(db, tx_push_buf, 16);
    606                         __iowrite32_copy(db + 4, tx_push_buf + 1,
    607                                          (push_len - 16) << 1);
    608                 } else {
    609                         __iowrite64_copy(db, tx_push_buf, push_len);
    610                 }
    611 
    612                 goto tx_done;
    613         }
    614 
    615 normal_tx:
    616         if (length < BNXT_MIN_PKT_SIZE) {
    617                 pad = BNXT_MIN_PKT_SIZE - length;
    618                 if (skb_pad(skb, pad))
    619                         /* SKB already freed. */
    620                         goto tx_kick_pending;
    621                 length = BNXT_MIN_PKT_SIZE;
    622         }
    623 
    624         mapping = dma_map_single(&pdev->dev, skb->data, len, DMA_TO_DEVICE);
    625 
    626         if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
    627                 goto tx_free;
    628 
    629         dma_unmap_addr_set(tx_buf, mapping, mapping);
    630         flags = (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_BD |
    631                 ((last_frag + 2) << TX_BD_FLAGS_BD_CNT_SHIFT);
    632 
    633         txbd->tx_bd_haddr = cpu_to_le64(mapping);
    634         txbd->tx_bd_opaque = SET_TX_OPAQUE(bp, txr, prod, 2 + last_frag);
    635 
    636         prod = NEXT_TX(prod);
    637         txbd1 = (struct tx_bd_ext *)
    638                 &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
    639 
    640         txbd1->tx_bd_hsize_lflags = lflags;
    641         if (skb_is_gso(skb)) {
    642                 bool udp_gso = !!(skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4);
    643                 u32 hdr_len;
    644 
    645                 if (skb->encapsulation) {
    646                         if (udp_gso)
    647                                 hdr_len = skb_inner_transport_offset(skb) +
    648                                           sizeof(struct udphdr);
    649                         else
    650                                 hdr_len = skb_inner_tcp_all_headers(skb);
    651                 } else if (udp_gso) {
    652                         hdr_len = skb_transport_offset(skb) +
    653                                   sizeof(struct udphdr);
    654                 } else {
    655                         hdr_len = skb_tcp_all_headers(skb);
    656                 }
    657 
    658                 txbd1->tx_bd_hsize_lflags |= cpu_to_le32(TX_BD_FLAGS_LSO |
    659                                         TX_BD_FLAGS_T_IPID |
    660                                         (hdr_len << (TX_BD_HSIZE_SHIFT - 1)));
    661                 length = skb_shinfo(skb)->gso_size;
    662                 txbd1->tx_bd_mss = cpu_to_le32(length);
    663                 length += hdr_len;
    664         } else if (skb->ip_summed == CHECKSUM_PARTIAL) {
    665                 txbd1->tx_bd_hsize_lflags |=
    666                         cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
    667                 txbd1->tx_bd_mss = 0;
    668         }
    669 
    670         length >>= 9;
    671         if (unlikely(length >= ARRAY_SIZE(bnxt_lhint_arr))) {
    672                 dev_warn_ratelimited(&pdev->dev, "Dropped oversize %d bytes TX packet.\n",
    673                                      skb->len);
    674                 i = 0;
    675                 goto tx_dma_error;
    676         }
    677         flags |= bnxt_lhint_arr[length];
    678         txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
    679 
    680         txbd1->tx_bd_cfa_meta = cpu_to_le32(vlan_tag_flags);
    681         txbd1->tx_bd_cfa_action =
    682                         cpu_to_le32(cfa_action << TX_BD_CFA_ACTION_SHIFT);
    683         txbd0 = txbd;
    684         for (i = 0; i < last_frag; i++) {
    685                 skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
    686 
    687                 prod = NEXT_TX(prod);
    688                 txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
    689 
    690                 len = skb_frag_size(frag);
    691                 mapping = skb_frag_dma_map(&pdev->dev, frag, 0, len,
    692                                            DMA_TO_DEVICE);
    693 
    694                 if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
    695                         goto tx_dma_error;
    696 
    697                 tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
    698                 dma_unmap_addr_set(tx_buf, mapping, mapping);
    699 
    700                 txbd->tx_bd_haddr = cpu_to_le64(mapping);
    701 
    702                 flags = len << TX_BD_LEN_SHIFT;
    703                 txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
    704         }
    705 
    706         flags &= ~TX_BD_LEN;
    707         txbd->tx_bd_len_flags_type =
    708                 cpu_to_le32(((len + pad) << TX_BD_LEN_SHIFT) | flags |
    709                             TX_BD_FLAGS_PACKET_END);
    710 
    711         netdev_tx_sent_queue(txq, skb->len);
    712 
    713         skb_tx_timestamp(skb);
    714 
    715         prod = NEXT_TX(prod);
    716         WRITE_ONCE(txr->tx_prod, prod);
    717 
    718         if (!netdev_xmit_more() || netif_xmit_stopped(txq)) {
    719                 bnxt_txr_db_kick(bp, txr, prod);
    720         } else {
    721                 if (free_size >= bp->tx_wake_thresh)
    722                         txbd0->tx_bd_len_flags_type |=
    723                                 cpu_to_le32(TX_BD_FLAGS_NO_CMPL);
    724                 txr->kick_pending = 1;
    725         }
    726 
    727 tx_done:
    728 
    729         if (unlikely(bnxt_tx_avail(bp, txr) <= MAX_SKB_FRAGS + 1)) {
    730                 if (netdev_xmit_more() && !tx_buf->is_push) {
    731                         txbd0->tx_bd_len_flags_type &=
    732                                 cpu_to_le32(~TX_BD_FLAGS_NO_CMPL);
    733                         bnxt_txr_db_kick(bp, txr, prod);
    734                 }
    735 
    736                 netif_txq_try_stop(txq, bnxt_tx_avail(bp, txr),
    737                                    bp->tx_wake_thresh);
    738         }
    739         return NETDEV_TX_OK;
    740 
    741 tx_dma_error:
    742         last_frag = i;
    743 
    744         /* start back at beginning and unmap skb */
    745         prod = txr->tx_prod;
    746         tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
    747         dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
    748                          skb_headlen(skb), DMA_TO_DEVICE);
    749         prod = NEXT_TX(prod);
    750 
    751         /* unmap remaining mapped pages */
    752         for (i = 0; i < last_frag; i++) {
    753                 prod = NEXT_TX(prod);
    754                 tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
    755                 dma_unmap_page(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
    756                                skb_frag_size(&skb_shinfo(skb)->frags[i]),
    757                                DMA_TO_DEVICE);
    758         }
    759 
    760 tx_free:
    761         dev_kfree_skb_any(skb);
    762 tx_kick_pending:
    763         if (BNXT_TX_PTP_IS_SET(lflags)) {
    764                 txr->tx_buf_ring[txr->tx_prod].is_ts_pkt = 0;
    765                 atomic64_inc(&bp->ptp_cfg->stats.ts_err);
    766                 if (!(bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP))
    767                         /* set SKB to err so PTP worker will clean up */
--> 768                         ptp->txts_req[txts_prod].tx_skb = ERR_PTR(-EIO);
                                ^^^^^^^^^^^^^
The patch adds an unchecked dereference

    769         }
    770         if (txr->kick_pending)
    771                 bnxt_txr_db_kick(bp, txr, txr->tx_prod);
    772         txr->tx_buf_ring[txr->tx_prod].skb = NULL;
    773         dev_core_stats_tx_dropped_inc(dev);
    774         return NETDEV_TX_OK;
    775 }

regards,
dan carpenter
