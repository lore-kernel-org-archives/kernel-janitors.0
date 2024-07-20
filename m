Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032BBA27
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jul 2024 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721446323; cv=none; b=EfKVQbCJlteCmF8b+CSNlqblpXGkFUXIqhBl+tRSnzzCbUS1sO5KG/RD9qsq32EnHu6dvgjHgeSPzfqmwzUkcsDl3FYpoafxp7N9akLcyX1hiOMkBTdtk/EktZF2Oe2kWTtzzSnr0vRPGlaCmIs2AmGSNdeNuCGDOgaE1TFskK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721446323; c=relaxed/simple;
	bh=bT0tT+pHm5nOIMec2vfGTZJVDr6C11rYEsFTJLTtcdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bneiieds93kIucGFvvlZHBldrUcpqxko6tum3GHQ1CIQv2aHAoh5dYzXxvCZbr3sOWrMtUj0XBJ9ljwrGsBok0xuHwnnFIHntnH6F2rzARLiwTUuWHJytiJNtuwV0v+1897aUlAC7WyK/soTDBpSvZ1QAUYBuzSwh0lK0E+w3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IOKC1gKF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IOKC1gKF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-78cc22902dcso1653249a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Jul 2024 20:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1721446321; x=1722051121; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RyuRMpZ32w9y/i1IIhoNOov7C2k2iQA7TCSV8WbuLyM=;
        b=IOKC1gKFap4y3ApIeGGxAAPA5KPb2J1YuyxomY438RZB5JAdbVyVkavYyVQxRMwGpE
         JBx01bNUhGle1jkpcSMEk0xLn1H7umL9AaITdS2hJ0ov0q+cW4IfGrQmtr03jEwSfr3e
         GPTC9MVsCg5JwodjoDcwqFXIeXX9CbtquUQWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721446321; x=1722051121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyuRMpZ32w9y/i1IIhoNOov7C2k2iQA7TCSV8WbuLyM=;
        b=qRpPGvi5qkvjisud6+tiHpi+clHS6Zrdo4v7n+7bQcCIAWUqVccK280P0Mk9GZK2+D
         IKIJsImtU7MZ2xiRgbNab9AYrqrdpz0VhTzFllhPf9/ESUu+e2hggaSkluAoDPXhJS8B
         RquSIHbSAkRNbVF/i9CgQpcpFA40xN12REahsgLRntdXlcTQhDt0jR8HfFuNGJ8CTsJT
         sVIg7gfLXtnTzZm5HYaVpQ05p1VOGy3DFPSE1IRRZMUM1oNj1Ah9/oC6uVkA9ptZtEmJ
         DOebvtNK9wZAFfxuSHNQXElerGKvF9dBaSIifIqvrc2Xa39Gjv+52JWMneMiFgug9wb7
         VWuA==
X-Gm-Message-State: AOJu0Yy5JME+Rg1L9yOXLngStADK0rquZxza+xhu7N0aDc+JXcX2lUPF
	OldAb7o34IFD6mJCoM+L5TFMcxuhpBrzjFezDoxcIxA8nP3xzySRGS19vpCDqHkhy62FlopZxpO
	F4NOo1hoRptG8XRx8RjxydQ5ge6jNi29kFteC
X-Google-Smtp-Source: AGHT+IG5LYqaevC7WEo9O9i4vFp8puyx4+PQbSOLf4o2VfYGwtq1xcl+MioSn4xlyBr57aQbjJ5nhZZRHDxPCnUgEnI=
X-Received: by 2002:a05:6a20:2443:b0:1c2:8f07:579e with SMTP id
 adf61e73a8af0-1c42860d24cmr372398637.52.1721446320608; Fri, 19 Jul 2024
 20:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cc01a509-ca3d-488c-b158-2ef16cbda5e2@stanley.mountain>
In-Reply-To: <cc01a509-ca3d-488c-b158-2ef16cbda5e2@stanley.mountain>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Sat, 20 Jul 2024 09:01:48 +0530
Message-ID: <CALs4sv3RY6ANULQK7zX3Rpk7EQrq5Nm5q8PMBkLuFmYa2QW=zg@mail.gmail.com>
Subject: Re: [bug report] bnxt_en: Increase the max total outstanding PTP TX
 packets to 4
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Gospodarek <andrew.gospodarek@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000789413061da57482"

--000000000000789413061da57482
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan, thanks for the report. Response is inline.

On Sat, Jul 20, 2024 at 5:22=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Pavan Chebbi,
>
> Commit 8aa2a79e9b95 ("bnxt_en: Increase the max total outstanding PTP
> TX packets to 4") from Jun 28, 2024 (linux-next), leads to the
> following Smatch static checker warning:
>
>         drivers/net/ethernet/broadcom/bnxt/bnxt.c:768 bnxt_start_xmit()
>         error: we previously assumed 'ptp' could be null (see line 513)
>
> drivers/net/ethernet/broadcom/bnxt/bnxt.c
>     449 static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct ne=
t_device *dev)
>     450 {
>     451         struct bnxt *bp =3D netdev_priv(dev);
>     452         struct tx_bd *txbd, *txbd0;
>     453         struct tx_bd_ext *txbd1;
>     454         struct netdev_queue *txq;
>     455         int i;
>     456         dma_addr_t mapping;
>     457         unsigned int length, pad =3D 0;
>     458         u32 len, free_size, vlan_tag_flags, cfa_action, flags;
>     459         struct bnxt_ptp_cfg *ptp =3D bp->ptp_cfg;
>     460         struct pci_dev *pdev =3D bp->pdev;
>     461         u16 prod, last_frag, txts_prod;
>     462         struct bnxt_tx_ring_info *txr;
>     463         struct bnxt_sw_tx_bd *tx_buf;
>     464         __le32 lflags =3D 0;
>     465
>     466         i =3D skb_get_queue_mapping(skb);
>     467         if (unlikely(i >=3D bp->tx_nr_rings)) {
>     468                 dev_kfree_skb_any(skb);
>     469                 dev_core_stats_tx_dropped_inc(dev);
>     470                 return NETDEV_TX_OK;
>     471         }
>     472
>     473         txq =3D netdev_get_tx_queue(dev, i);
>     474         txr =3D &bp->tx_ring[bp->tx_ring_map[i]];
>     475         prod =3D txr->tx_prod;
>     476
>     477         free_size =3D bnxt_tx_avail(bp, txr);
>     478         if (unlikely(free_size < skb_shinfo(skb)->nr_frags + 2)) =
{
>     479                 /* We must have raced with NAPI cleanup */
>     480                 if (net_ratelimit() && txr->kick_pending)
>     481                         netif_warn(bp, tx_err, dev,
>     482                                    "bnxt: ring busy w/ flush pend=
ing!\n");
>     483                 if (!netif_txq_try_stop(txq, bnxt_tx_avail(bp, tx=
r),
>     484                                         bp->tx_wake_thresh))
>     485                         return NETDEV_TX_BUSY;
>     486         }
>     487
>     488         if (unlikely(ipv6_hopopt_jumbo_remove(skb)))
>     489                 goto tx_free;
>     490
>     491         length =3D skb->len;
>     492         len =3D skb_headlen(skb);
>     493         last_frag =3D skb_shinfo(skb)->nr_frags;
>     494
>     495         txbd =3D &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(pro=
d)];
>     496
>     497         tx_buf =3D &txr->tx_buf_ring[RING_TX(bp, prod)];
>     498         tx_buf->skb =3D skb;
>     499         tx_buf->nr_frags =3D last_frag;
>     500
>     501         vlan_tag_flags =3D 0;
>     502         cfa_action =3D bnxt_xmit_get_cfa_action(skb);
>     503         if (skb_vlan_tag_present(skb)) {
>     504                 vlan_tag_flags =3D TX_BD_CFA_META_KEY_VLAN |
>     505                                  skb_vlan_tag_get(skb);
>     506                 /* Currently supports 8021Q, 8021AD vlan offloads
>     507                  * QINQ1, QINQ2, QINQ3 vlan headers are deprecate=
d
>     508                  */
>     509                 if (skb->vlan_proto =3D=3D htons(ETH_P_8021Q))
>     510                         vlan_tag_flags |=3D 1 << TX_BD_CFA_META_T=
PID_SHIFT;
>     511         }
>     512
>     513         if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)=
 && ptp &&
>                                                                          =
    ^^^
> Can ptp really be NULL?

ptp can indeed be null in some conditions like, if we are running on
chips that do not support ptp, or our ptp init has failed for some
reason.

>
>     514             ptp->tx_tstamp_en) {
>     515                 if (bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP) {
>     516                         lflags |=3D cpu_to_le32(TX_BD_FLAGS_STAMP=
);
>     517                         tx_buf->is_ts_pkt =3D 1;
>     518                         skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_P=
ROGRESS;
>     519                 } else if (!skb_is_gso(skb)) {
>     520                         u16 seq_id, hdr_off;
>     521
>     522                         if (!bnxt_ptp_parse(skb, &seq_id, &hdr_of=
f) &&
>     523                             !bnxt_ptp_get_txts_prod(ptp, &txts_pr=
od)) {
>     524                                 if (vlan_tag_flags)
>     525                                         hdr_off +=3D VLAN_HLEN;
>     526                                 lflags |=3D cpu_to_le32(TX_BD_FLA=
GS_STAMP);
>     527                                 tx_buf->is_ts_pkt =3D 1;
>     528                                 skb_shinfo(skb)->tx_flags |=3D SK=
BTX_IN_PROGRESS;
>     529
>     530                                 ptp->txts_req[txts_prod].tx_seqid=
 =3D seq_id;
>     531                                 ptp->txts_req[txts_prod].tx_hdr_o=
ff =3D hdr_off;
>     532                                 tx_buf->txts_prod =3D txts_prod;
>     533                         }
>     534                 }
>     535         }
>     536         if (unlikely(skb->no_fcs))
>     537                 lflags |=3D cpu_to_le32(TX_BD_FLAGS_NO_CRC);
>     538
>     539         if (free_size =3D=3D bp->tx_ring_size && length <=3D bp->=
tx_push_thresh &&
>     540             !lflags) {
>     541                 struct tx_push_buffer *tx_push_buf =3D txr->tx_pu=
sh;
>     542                 struct tx_push_bd *tx_push =3D &tx_push_buf->push=
_bd;
>     543                 struct tx_bd_ext *tx_push1 =3D &tx_push->txbd2;
>     544                 void __iomem *db =3D txr->tx_db.doorbell;
>     545                 void *pdata =3D tx_push_buf->data;
>     546                 u64 *end;
>     547                 int j, push_len;
>     548
>     549                 /* Set COAL_NOW to be ready quickly for the next =
push */
>     550                 tx_push->tx_bd_len_flags_type =3D
>     551                         cpu_to_le32((length << TX_BD_LEN_SHIFT) |
>     552                                         TX_BD_TYPE_LONG_TX_BD |
>     553                                         TX_BD_FLAGS_LHINT_512_AND=
_SMALLER |
>     554                                         TX_BD_FLAGS_COAL_NOW |
>     555                                         TX_BD_FLAGS_PACKET_END |
>     556                                         (2 << TX_BD_FLAGS_BD_CNT_=
SHIFT));
>     557
>     558                 if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL)
>     559                         tx_push1->tx_bd_hsize_lflags =3D
>     560                                         cpu_to_le32(TX_BD_FLAGS_T=
CP_UDP_CHKSUM);
>     561                 else
>     562                         tx_push1->tx_bd_hsize_lflags =3D 0;
>     563
>     564                 tx_push1->tx_bd_cfa_meta =3D cpu_to_le32(vlan_tag=
_flags);
>     565                 tx_push1->tx_bd_cfa_action =3D
>     566                         cpu_to_le32(cfa_action << TX_BD_CFA_ACTIO=
N_SHIFT);
>     567
>     568                 end =3D pdata + length;
>     569                 end =3D PTR_ALIGN(end, 8) - 1;
>     570                 *end =3D 0;
>     571
>     572                 skb_copy_from_linear_data(skb, pdata, len);
>     573                 pdata +=3D len;
>     574                 for (j =3D 0; j < last_frag; j++) {
>     575                         skb_frag_t *frag =3D &skb_shinfo(skb)->fr=
ags[j];
>     576                         void *fptr;
>     577
>     578                         fptr =3D skb_frag_address_safe(frag);
>     579                         if (!fptr)
>     580                                 goto normal_tx;
>     581
>     582                         memcpy(pdata, fptr, skb_frag_size(frag));
>     583                         pdata +=3D skb_frag_size(frag);
>     584                 }
>     585
>     586                 txbd->tx_bd_len_flags_type =3D tx_push->tx_bd_len=
_flags_type;
>     587                 txbd->tx_bd_haddr =3D txr->data_mapping;
>     588                 txbd->tx_bd_opaque =3D SET_TX_OPAQUE(bp, txr, pro=
d, 2);
>     589                 prod =3D NEXT_TX(prod);
>     590                 tx_push->tx_bd_opaque =3D txbd->tx_bd_opaque;
>     591                 txbd =3D &txr->tx_desc_ring[TX_RING(bp, prod)][TX=
_IDX(prod)];
>     592                 memcpy(txbd, tx_push1, sizeof(*txbd));
>     593                 prod =3D NEXT_TX(prod);
>     594                 tx_push->doorbell =3D
>     595                         cpu_to_le32(DB_KEY_TX_PUSH | DB_LONG_TX_P=
USH |
>     596                                     DB_RING_IDX(&txr->tx_db, prod=
));
>     597                 WRITE_ONCE(txr->tx_prod, prod);
>     598
>     599                 tx_buf->is_push =3D 1;
>     600                 netdev_tx_sent_queue(txq, skb->len);
>     601                 wmb();        /* Sync is_push and byte queue befo=
re pushing data */
>     602
>     603                 push_len =3D (length + sizeof(*tx_push) + 7) / 8;
>     604                 if (push_len > 16) {
>     605                         __iowrite64_copy(db, tx_push_buf, 16);
>     606                         __iowrite32_copy(db + 4, tx_push_buf + 1,
>     607                                          (push_len - 16) << 1);
>     608                 } else {
>     609                         __iowrite64_copy(db, tx_push_buf, push_le=
n);
>     610                 }
>     611
>     612                 goto tx_done;
>     613         }
>     614
>     615 normal_tx:
>     616         if (length < BNXT_MIN_PKT_SIZE) {
>     617                 pad =3D BNXT_MIN_PKT_SIZE - length;
>     618                 if (skb_pad(skb, pad))
>     619                         /* SKB already freed. */
>     620                         goto tx_kick_pending;
>     621                 length =3D BNXT_MIN_PKT_SIZE;
>     622         }
>     623
>     624         mapping =3D dma_map_single(&pdev->dev, skb->data, len, DM=
A_TO_DEVICE);
>     625
>     626         if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
>     627                 goto tx_free;
>     628
>     629         dma_unmap_addr_set(tx_buf, mapping, mapping);
>     630         flags =3D (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_B=
D |
>     631                 ((last_frag + 2) << TX_BD_FLAGS_BD_CNT_SHIFT);
>     632
>     633         txbd->tx_bd_haddr =3D cpu_to_le64(mapping);
>     634         txbd->tx_bd_opaque =3D SET_TX_OPAQUE(bp, txr, prod, 2 + l=
ast_frag);
>     635
>     636         prod =3D NEXT_TX(prod);
>     637         txbd1 =3D (struct tx_bd_ext *)
>     638                 &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod=
)];
>     639
>     640         txbd1->tx_bd_hsize_lflags =3D lflags;
>     641         if (skb_is_gso(skb)) {
>     642                 bool udp_gso =3D !!(skb_shinfo(skb)->gso_type & S=
KB_GSO_UDP_L4);
>     643                 u32 hdr_len;
>     644
>     645                 if (skb->encapsulation) {
>     646                         if (udp_gso)
>     647                                 hdr_len =3D skb_inner_transport_o=
ffset(skb) +
>     648                                           sizeof(struct udphdr);
>     649                         else
>     650                                 hdr_len =3D skb_inner_tcp_all_hea=
ders(skb);
>     651                 } else if (udp_gso) {
>     652                         hdr_len =3D skb_transport_offset(skb) +
>     653                                   sizeof(struct udphdr);
>     654                 } else {
>     655                         hdr_len =3D skb_tcp_all_headers(skb);
>     656                 }
>     657
>     658                 txbd1->tx_bd_hsize_lflags |=3D cpu_to_le32(TX_BD_=
FLAGS_LSO |
>     659                                         TX_BD_FLAGS_T_IPID |
>     660                                         (hdr_len << (TX_BD_HSIZE_=
SHIFT - 1)));
>     661                 length =3D skb_shinfo(skb)->gso_size;
>     662                 txbd1->tx_bd_mss =3D cpu_to_le32(length);
>     663                 length +=3D hdr_len;
>     664         } else if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {
>     665                 txbd1->tx_bd_hsize_lflags |=3D
>     666                         cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
>     667                 txbd1->tx_bd_mss =3D 0;
>     668         }
>     669
>     670         length >>=3D 9;
>     671         if (unlikely(length >=3D ARRAY_SIZE(bnxt_lhint_arr))) {
>     672                 dev_warn_ratelimited(&pdev->dev, "Dropped oversiz=
e %d bytes TX packet.\n",
>     673                                      skb->len);
>     674                 i =3D 0;
>     675                 goto tx_dma_error;
>     676         }
>     677         flags |=3D bnxt_lhint_arr[length];
>     678         txbd->tx_bd_len_flags_type =3D cpu_to_le32(flags);
>     679
>     680         txbd1->tx_bd_cfa_meta =3D cpu_to_le32(vlan_tag_flags);
>     681         txbd1->tx_bd_cfa_action =3D
>     682                         cpu_to_le32(cfa_action << TX_BD_CFA_ACTIO=
N_SHIFT);
>     683         txbd0 =3D txbd;
>     684         for (i =3D 0; i < last_frag; i++) {
>     685                 skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
>     686
>     687                 prod =3D NEXT_TX(prod);
>     688                 txbd =3D &txr->tx_desc_ring[TX_RING(bp, prod)][TX=
_IDX(prod)];
>     689
>     690                 len =3D skb_frag_size(frag);
>     691                 mapping =3D skb_frag_dma_map(&pdev->dev, frag, 0,=
 len,
>     692                                            DMA_TO_DEVICE);
>     693
>     694                 if (unlikely(dma_mapping_error(&pdev->dev, mappin=
g)))
>     695                         goto tx_dma_error;
>     696
>     697                 tx_buf =3D &txr->tx_buf_ring[RING_TX(bp, prod)];
>     698                 dma_unmap_addr_set(tx_buf, mapping, mapping);
>     699
>     700                 txbd->tx_bd_haddr =3D cpu_to_le64(mapping);
>     701
>     702                 flags =3D len << TX_BD_LEN_SHIFT;
>     703                 txbd->tx_bd_len_flags_type =3D cpu_to_le32(flags)=
;
>     704         }
>     705
>     706         flags &=3D ~TX_BD_LEN;
>     707         txbd->tx_bd_len_flags_type =3D
>     708                 cpu_to_le32(((len + pad) << TX_BD_LEN_SHIFT) | fl=
ags |
>     709                             TX_BD_FLAGS_PACKET_END);
>     710
>     711         netdev_tx_sent_queue(txq, skb->len);
>     712
>     713         skb_tx_timestamp(skb);
>     714
>     715         prod =3D NEXT_TX(prod);
>     716         WRITE_ONCE(txr->tx_prod, prod);
>     717
>     718         if (!netdev_xmit_more() || netif_xmit_stopped(txq)) {
>     719                 bnxt_txr_db_kick(bp, txr, prod);
>     720         } else {
>     721                 if (free_size >=3D bp->tx_wake_thresh)
>     722                         txbd0->tx_bd_len_flags_type |=3D
>     723                                 cpu_to_le32(TX_BD_FLAGS_NO_CMPL);
>     724                 txr->kick_pending =3D 1;
>     725         }
>     726
>     727 tx_done:
>     728
>     729         if (unlikely(bnxt_tx_avail(bp, txr) <=3D MAX_SKB_FRAGS + =
1)) {
>     730                 if (netdev_xmit_more() && !tx_buf->is_push) {
>     731                         txbd0->tx_bd_len_flags_type &=3D
>     732                                 cpu_to_le32(~TX_BD_FLAGS_NO_CMPL)=
;
>     733                         bnxt_txr_db_kick(bp, txr, prod);
>     734                 }
>     735
>     736                 netif_txq_try_stop(txq, bnxt_tx_avail(bp, txr),
>     737                                    bp->tx_wake_thresh);
>     738         }
>     739         return NETDEV_TX_OK;
>     740
>     741 tx_dma_error:
>     742         last_frag =3D i;
>     743
>     744         /* start back at beginning and unmap skb */
>     745         prod =3D txr->tx_prod;
>     746         tx_buf =3D &txr->tx_buf_ring[RING_TX(bp, prod)];
>     747         dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mappi=
ng),
>     748                          skb_headlen(skb), DMA_TO_DEVICE);
>     749         prod =3D NEXT_TX(prod);
>     750
>     751         /* unmap remaining mapped pages */
>     752         for (i =3D 0; i < last_frag; i++) {
>     753                 prod =3D NEXT_TX(prod);
>     754                 tx_buf =3D &txr->tx_buf_ring[RING_TX(bp, prod)];
>     755                 dma_unmap_page(&pdev->dev, dma_unmap_addr(tx_buf,=
 mapping),
>     756                                skb_frag_size(&skb_shinfo(skb)->fr=
ags[i]),
>     757                                DMA_TO_DEVICE);
>     758         }
>     759
>     760 tx_free:
>     761         dev_kfree_skb_any(skb);
>     762 tx_kick_pending:
>     763         if (BNXT_TX_PTP_IS_SET(lflags)) {
>     764                 txr->tx_buf_ring[txr->tx_prod].is_ts_pkt =3D 0;
>     765                 atomic64_inc(&bp->ptp_cfg->stats.ts_err);
>     766                 if (!(bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP))
>     767                         /* set SKB to err so PTP worker will clea=
n up */
> --> 768                         ptp->txts_req[txts_prod].tx_skb =3D ERR_P=
TR(-EIO);
>                                 ^^^^^^^^^^^^^
> The patch adds an unchecked dereference

If ptp is null at 513, we will never set the lflags with TX_BD_FLAGS_STAMP.
Hence I think this Smatch error be ignored because under no condition
we will reach here where we find BNXT_TX_PTP_IS_SET(lflags) =3D true and
we don't have a valid ptp (bp->ptp_cfg)
Thanks

>
>     769         }
>     770         if (txr->kick_pending)
>     771                 bnxt_txr_db_kick(bp, txr, txr->tx_prod);
>     772         txr->tx_buf_ring[txr->tx_prod].skb =3D NULL;
>     773         dev_core_stats_tx_dropped_inc(dev);
>     774         return NETDEV_TX_OK;
>     775 }
>
> regards,
> dan carpenter

--000000000000789413061da57482
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQbQYJKoZIhvcNAQcCoIIQXjCCEFoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3EMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBUwwggQ0oAMCAQICDBX9eQgKNWxyfhI1kzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODE3NDZaFw0yNTA5MTAwODE3NDZaMIGO
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFTATBgNVBAMTDFBhdmFuIENoZWJiaTEoMCYGCSqGSIb3DQEJ
ARYZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAK3X+BRR67FR5+Spki/E25HnHoYhm/cC6VA6qHwC3QqBNhCT13zsi1FLLERdKXPRrtVBM6d0
mfg/0rQJJ8Ez4C3CcKiO1XHcmESeW6lBKxOo83ZwWhVhyhNbGSwcrytDCKUVYBwwxR3PAyXtIlWn
kDqifgqn3R9r2vJM7ckge8dtVPS0j9t3CNfDBjGw1DhK91fnoH1s7tLdj3vx9ZnKTmSl7F1psK2P
OltyqaGBuzv+bJTUL+bmV7E4QBLIqGt4jVr1R9hJdH6KxXwJdyfHZ9C6qXmoe2NQhiFUyBOJ0wgk
dB9Z1IU7nCwvNKYg2JMoJs93tIgbhPJg/D7pqW8gabkCAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUEV6y/89alKPoFbKUaJXsvWu5
fdowDQYJKoZIhvcNAQELBQADggEBAEHSIB6g652wVb+r2YCmfHW47Jo+5TuCBD99Hla8PYhaWGkd
9HIyD3NPhb6Vb6vtMWJW4MFGQF42xYRrAS4LZj072DuMotr79rI09pbOiWg0FlRRFt6R9vgUgebu
pWSH7kmwVXcPtY94XSMMak4b7RSKig2mKbHDpD4bC7eGlwl5RxzYkgrHtMNRmHmQor5Nvqe52cFJ
25Azqtwvjt5nbrEd81iBmboNTEnLaKuxbbCtLaMEP8xKeDjAKnNOqHUMps0AsQT8c0EGq39YHpjp
Wn1l67VU0rMShbEFsiUf9WYgE677oinpdm0t2mdCjxr35tryxptoTZXKHDxr/Yy6l6ExggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwV/XkICjVscn4SNZMw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIFaJu7qxQgX6u/icHLL3ebuSuERjYDin
292/vmlmB5EIMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDcy
MDAzMzIwMVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQBjipSWraptgYROql6ChDhlAfiT7E+5SFWjOLkoOCsLJckZAUbZ
Jnp+mLGHPA3mHROzxfjpGKLsX2KipZyZ2R4xDZ+zzwo2Uv71jl6ojP47Vxj7IntKiqPT1xNCA3ez
qpmvUnfRbknUXlfdXAJjvtesvTad6ObIgmsHd5AGX5Viecb6U+suNC8PzcUgq9SmLk6sGr3XyYRb
i33/I+JUQ6lVJ44WqagAyIqinempXl8+PuAbo8gkwEPfT1OBMLSeeruqpGI5VvorZ2O/EgXx+Iw6
R+xkk9g2aU/UbvxU31A8vCCYJYd7OXLySxUK2eKDu9xiatj34Tr0y6Ry5acCuQm4
--000000000000789413061da57482--
