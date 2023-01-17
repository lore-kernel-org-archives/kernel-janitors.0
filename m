Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8180FC63797
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Jan 2023 14:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjAQOSb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbjAQOS1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Jan 2023 09:18:27 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FE83C28E
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:18:20 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r9so7944443wrw.4
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZGIbLKRjAXOMVt5YjCEaPYRLR39AYYqwXScGqBhFBQ=;
        b=KjqW8+0xZkQe2z/mMTb1Y84cYf9yy4TEU7ZaXS0QJ0Qx2134Xq4+Q7k4UNQDdB7vM9
         TcTAi9iRncskAJFserfJPdYYXMgfXt2zKw4w113sWrZAfEio/4jEJDxGJctz455td50t
         3ugLMEry3yJCM/PtNGywUAtNj+ZDpnXlVIDVGCKM321owosf1g2nfaH2DKTecUs83iFe
         lJZygGLjBQcuH7D5z4vgdeDf6LPnoDbmzHD4Y/u5u5ACiP/A0tHMMxEkTzqCRvDl8hO6
         /HCmm1C692t42ZlGKb4QA8NTjNO9cPoFV5Ym+NGU9bV1thsPDkEqXbdIjjtGNhTet8Pd
         ZgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZGIbLKRjAXOMVt5YjCEaPYRLR39AYYqwXScGqBhFBQ=;
        b=6PCT/jt8o3DAoE2vZn6Bi3VmkiwO+BL3SfR+Jb0lh3/sdh3ywJOUt8ZHzVmsalAsoD
         xE4d9xHjHmYJezf+6veNJQeU6uLSz+CXCpdXgJLzT9ljnfVYWGDWqdOln4QSydrYKqfQ
         W3hks3sY/CPCXGPi79YRHc+iD73k7D633f5/Hj7mrUlCRy2rgfxctz+xKBxRpxzWvc2Q
         LJzhxXrTqrNUcflFVvkvNF+JCicGY+BPR94TYrm5otf/vBlefgSNJOybpslRt26+k/Er
         BaBNDbkyhzsfPUixgjl+ElVaTL4GoQpOgeazyl9kDNFvzkvimgmUp1oZQuBny5eLnHpP
         MWsA==
X-Gm-Message-State: AFqh2kr8jarUP2juDNXQCTcEQB5Ee97BzUxCr4W/glg67CUlGLexXOvy
        O+zCVOJzCn6Ywqw9jYI/Hzurt2zhU6lv1w==
X-Google-Smtp-Source: AMrXdXtbYAp9h/ITV2K0gOtaCDZlHglSgJAHVY5xj2tkVVn8HvTkkNLQFJzQGTHcQ6QGM9+rIWm4jg==
X-Received: by 2002:a05:6000:386:b0:2be:c41:4758 with SMTP id u6-20020a056000038600b002be0c414758mr3809329wrf.38.1673965098764;
        Tue, 17 Jan 2023 06:18:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d5186000000b002bbddb89c71sm25205010wrv.67.2023.01.17.06.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:18:17 -0800 (PST)
Date:   Tue, 17 Jan 2023 17:18:09 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     yanguo.li@corigine.com
Cc:     oss-drivers@corigine.com, kernel-janitors@vger.kernel.org
Subject: [bug report] nfp: flower: tunnel neigh support bond offload
Message-ID: <Y8auIcaVobD/HOTx@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Yanguo Li,

The patch abc210952af7: "nfp: flower: tunnel neigh support bond
offload" from Oct 20, 2022, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/netronome/nfp/flower/tunnel_conf.c:518 nfp_tun_write_neigh()
	warn: sleeping in atomic context

drivers/net/ethernet/netronome/nfp/flower/tunnel_conf.c
    453 static void
    454 nfp_tun_write_neigh(struct net_device *netdev, struct nfp_app *app,
    455                     void *flow, struct neighbour *neigh, bool is_ipv6,
    456                     bool override)
    457 {
    458         bool neigh_invalid = !(neigh->nud_state & NUD_VALID) || neigh->dead;
    459         size_t neigh_size = is_ipv6 ? sizeof(struct nfp_tun_neigh_v6) :
    460                             sizeof(struct nfp_tun_neigh_v4);
    461         unsigned long cookie = (unsigned long)neigh;
    462         struct nfp_flower_priv *priv = app->priv;
    463         struct nfp_neigh_entry *nn_entry;
    464         u32 port_id;
    465         u8 mtype;
    466 
    467         port_id = nfp_flower_get_port_id_from_netdev(app, netdev);
    468         if (!port_id)
    469                 return;
    470 
    471         spin_lock_bh(&priv->predt_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Holding a spin lock.

    472         nn_entry = rhashtable_lookup_fast(&priv->neigh_table, &cookie,
    473                                           neigh_table_params);
    474         if (!nn_entry && !neigh_invalid) {
    475                 struct nfp_tun_neigh_ext *ext;
    476                 struct nfp_tun_neigh_lag *lag;
    477                 struct nfp_tun_neigh *common;
    478 
    479                 nn_entry = kzalloc(sizeof(*nn_entry) + neigh_size,
    480                                    GFP_ATOMIC);
    481                 if (!nn_entry)
    482                         goto err;
    483 
    484                 nn_entry->payload = (char *)&nn_entry[1];
    485                 nn_entry->neigh_cookie = cookie;
    486                 nn_entry->is_ipv6 = is_ipv6;
    487                 nn_entry->flow = NULL;
    488                 if (is_ipv6) {
    489                         struct flowi6 *flowi6 = (struct flowi6 *)flow;
    490                         struct nfp_tun_neigh_v6 *payload;
    491 
    492                         payload = (struct nfp_tun_neigh_v6 *)nn_entry->payload;
    493                         payload->src_ipv6 = flowi6->saddr;
    494                         payload->dst_ipv6 = flowi6->daddr;
    495                         common = &payload->common;
    496                         ext = &payload->ext;
    497                         lag = &payload->lag;
    498                         mtype = NFP_FLOWER_CMSG_TYPE_TUN_NEIGH_V6;
    499                 } else {
    500                         struct flowi4 *flowi4 = (struct flowi4 *)flow;
    501                         struct nfp_tun_neigh_v4 *payload;
    502 
    503                         payload = (struct nfp_tun_neigh_v4 *)nn_entry->payload;
    504                         payload->src_ipv4 = flowi4->saddr;
    505                         payload->dst_ipv4 = flowi4->daddr;
    506                         common = &payload->common;
    507                         ext = &payload->ext;
    508                         lag = &payload->lag;
    509                         mtype = NFP_FLOWER_CMSG_TYPE_TUN_NEIGH;
    510                 }
    511                 ext->host_ctx = cpu_to_be32(U32_MAX);
    512                 ext->vlan_tpid = cpu_to_be16(U16_MAX);
    513                 ext->vlan_tci = cpu_to_be16(U16_MAX);
    514                 ether_addr_copy(common->src_addr, netdev->dev_addr);
    515                 neigh_ha_snapshot(common->dst_addr, neigh, netdev);
    516 
    517                 if ((port_id & NFP_FL_LAG_OUT) == NFP_FL_LAG_OUT)
--> 518                         nfp_flower_lag_get_info_from_netdev(app, netdev, lag);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Calling a sleeping function.  (Takes a mutext).

    519                 common->port_id = cpu_to_be32(port_id);
    520 
    521                 if (rhashtable_insert_fast(&priv->neigh_table,
    522                                            &nn_entry->ht_node,
    523                                            neigh_table_params))
    524                         goto err;
    525 
    526                 nfp_tun_link_predt_entries(app, nn_entry);
    527                 nfp_flower_xmit_tun_conf(app, mtype, neigh_size,
    528                                          nn_entry->payload,
    529                                          GFP_ATOMIC);
    530         } else if (nn_entry && neigh_invalid) {
    531                 if (is_ipv6) {
    532                         struct flowi6 *flowi6 = (struct flowi6 *)flow;
    533                         struct nfp_tun_neigh_v6 *payload;
    534 
    535                         payload = (struct nfp_tun_neigh_v6 *)nn_entry->payload;
    536                         memset(payload, 0, sizeof(struct nfp_tun_neigh_v6));
    537                         payload->dst_ipv6 = flowi6->daddr;
    538                         mtype = NFP_FLOWER_CMSG_TYPE_TUN_NEIGH_V6;
    539                 } else {
    540                         struct flowi4 *flowi4 = (struct flowi4 *)flow;
    541                         struct nfp_tun_neigh_v4 *payload;
    542 
    543                         payload = (struct nfp_tun_neigh_v4 *)nn_entry->payload;
    544                         memset(payload, 0, sizeof(struct nfp_tun_neigh_v4));
    545                         payload->dst_ipv4 = flowi4->daddr;
    546                         mtype = NFP_FLOWER_CMSG_TYPE_TUN_NEIGH;
    547                 }
    548                 /* Trigger ARP to verify invalid neighbour state. */
    549                 neigh_event_send(neigh, NULL);
    550                 rhashtable_remove_fast(&priv->neigh_table,
    551                                        &nn_entry->ht_node,
    552                                        neigh_table_params);
    553 
    554                 nfp_flower_xmit_tun_conf(app, mtype, neigh_size,
    555                                          nn_entry->payload,
    556                                          GFP_ATOMIC);
    557 
    558                 if (nn_entry->flow)
    559                         list_del(&nn_entry->list_head);
    560                 kfree(nn_entry);
    561         } else if (nn_entry && !neigh_invalid) {
    562                 struct nfp_tun_neigh *common;
    563                 u8 dst_addr[ETH_ALEN];
    564                 bool is_mac_change;
    565 
    566                 if (is_ipv6) {
    567                         struct nfp_tun_neigh_v6 *payload;
    568 
    569                         payload = (struct nfp_tun_neigh_v6 *)nn_entry->payload;
    570                         common = &payload->common;
    571                         mtype = NFP_FLOWER_CMSG_TYPE_TUN_NEIGH_V6;
    572                 } else {
    573                         struct nfp_tun_neigh_v4 *payload;
    574 
    575                         payload = (struct nfp_tun_neigh_v4 *)nn_entry->payload;
    576                         common = &payload->common;
    577                         mtype = NFP_FLOWER_CMSG_TYPE_TUN_NEIGH;
    578                 }
    579 
    580                 ether_addr_copy(dst_addr, common->dst_addr);
    581                 neigh_ha_snapshot(common->dst_addr, neigh, netdev);
    582                 is_mac_change = !ether_addr_equal(dst_addr, common->dst_addr);
    583                 if (override || is_mac_change) {
    584                         if (is_mac_change && nn_entry->flow) {
    585                                 list_del(&nn_entry->list_head);
    586                                 nn_entry->flow = NULL;
    587                         }
    588                         nfp_tun_link_predt_entries(app, nn_entry);
    589                         nfp_flower_xmit_tun_conf(app, mtype, neigh_size,
    590                                                  nn_entry->payload,
    591                                                  GFP_ATOMIC);
    592                 }
    593         }
    594 
    595         spin_unlock_bh(&priv->predt_lock);
    596         return;
    597 
    598 err:
    599         kfree(nn_entry);
    600         spin_unlock_bh(&priv->predt_lock);
    601         nfp_flower_cmsg_warn(app, "Neighbour configuration failed.\n");
    602 }

regards,
dan carpenter
