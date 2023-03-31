Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED27C76196
	for <kernel-janitors@archiver.kernel.org>; Fri, 31 Mar 2023 06:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjCaGzG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 31 Mar 2023 02:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCaGzF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 31 Mar 2023 02:55:05 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138A8171E
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Mar 2023 23:55:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r29so21306870wra.13
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Mar 2023 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680245702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5V6hGk5uGKwYExw23Vh6/fgcB19s/PvV/sRwZjnI/E=;
        b=CXyCvYJf8Cab32Gfwu1kg/pyZKopVtne+0r9+F0WhrK3MxOG+lXslXl0yEFbu8P8B6
         f1BeINmnO8iYzXUZnsgdKs5QPEti0ucIrfQLGYhnS6HPFxUtG61qt7PdiBN9C3C9TfH8
         VNYy/F79Yb4+xmrxL+8B3kWEeIj5dWT/X9w2A0LTecq6vX3flsXISXfAdSvXQEgNkg4I
         5iX0eYV2EszbBUma/Q4y8y8j37mgnNa3j/9SVCaaYAQ2ijJT7Hwb2ysPP3WAXct7VrTu
         ptmTNWbB+BkyW+AAXGlHqXk6MHVyMzWwCa0LGyw3h5rE+Gc2s8ZtYtQ33IBaLd4sPwpL
         etng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680245702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5V6hGk5uGKwYExw23Vh6/fgcB19s/PvV/sRwZjnI/E=;
        b=hFAV/Vd0eL61+69ccJQ+RthCznapwxYtP3oWczbYzUA4y21iTjAIEG7XUoRDmBmH7u
         nTPkxW6HvlmvN4kzlocPn642XExtSKoRMZ5HOaSbrjyan1GBzmru8p9Bz8PPqK0Yt82I
         lLqXRMMiW8YXhOb8jLupKdBBrZC6XtKfHwPNlYb4r+KvzkV/bom2SUwnnVPzjYy42IL0
         4M3AAwIeMqLFG39rE32yKAnazC8d2NJ9KVJJFf2b5GUBtcjncXex5/3DraDKcS7XpJjI
         TyGECsokYi1u+R4h7pbv6cjfAE2VoE/ecMer7rKcPlGL5ZnJA5DNVTWxFXtkZrSub2+3
         oW1w==
X-Gm-Message-State: AAQBX9e9Hocu7K83beu0PcfRaLuPYhNaDTWi+ljT7MRGda8bCWVj/Hhp
        UBaC5S58sBL2zyam2O5hE1MuJnfWi7k=
X-Google-Smtp-Source: AKy350ZYlnL0atkWnaJ9sHEsFYPiNOJKHgeEqkwrC+aCk8VzUETW7XwMrZrHpc8ctG6baRtfav+LrA==
X-Received: by 2002:adf:f703:0:b0:2cf:ea38:ef29 with SMTP id r3-20020adff703000000b002cfea38ef29mr20191292wrp.44.1680245702373;
        Thu, 30 Mar 2023 23:55:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d6910000000b002db1b66ea8fsm1331193wru.57.2023.03.30.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 23:55:01 -0700 (PDT)
Date:   Fri, 31 Mar 2023 09:54:56 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     ecree.xilinx@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] sfc: add functions to insert encap matches into the MAE
Message-ID: <e7b69fbb-370d-4b3d-a2a0-3762700fd175@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Edward Cree,

The patch 2245eb0086d8: "sfc: add functions to insert encap matches
into the MAE" from Mar 27, 2023, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/sfc/mae.c:1002 efx_mae_register_encap_match()
	warn: this cast is a no-op

drivers/net/ethernet/sfc/mae.c
    953 int efx_mae_register_encap_match(struct efx_nic *efx,
    954                                  struct efx_tc_encap_match *encap)
    955 {
    956         MCDI_DECLARE_BUF(inbuf, MC_CMD_MAE_OUTER_RULE_INSERT_IN_LEN(MAE_ENC_FIELD_PAIRS_LEN));
    957         MCDI_DECLARE_BUF(outbuf, MC_CMD_MAE_OUTER_RULE_INSERT_OUT_LEN);
    958         MCDI_DECLARE_STRUCT_PTR(match_crit);
    959         size_t outlen;
    960         int rc;
    961 
    962         rc = efx_mae_encap_type_to_mae_type(encap->tun_type);
    963         if (rc < 0)
    964                 return rc;
    965         match_crit = _MCDI_DWORD(inbuf, MAE_OUTER_RULE_INSERT_IN_FIELD_MATCH_CRITERIA);
    966         /* The struct contains IP src and dst, and udp dport.
    967          * So we actually need to filter on IP src and dst, L4 dport, and
    968          * ipproto == udp.
    969          */
    970         MCDI_SET_DWORD(inbuf, MAE_OUTER_RULE_INSERT_IN_ENCAP_TYPE, rc);
    971 #ifdef CONFIG_IPV6
    972         if (encap->src_ip | encap->dst_ip) {
    973 #endif
    974                 MCDI_STRUCT_SET_DWORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_SRC_IP4_BE,
    975                                          encap->src_ip);
    976                 MCDI_STRUCT_SET_DWORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_SRC_IP4_BE_MASK,
    977                                          ~(__be32)0);
    978                 MCDI_STRUCT_SET_DWORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_DST_IP4_BE,
    979                                          encap->dst_ip);
    980                 MCDI_STRUCT_SET_DWORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_DST_IP4_BE_MASK,
    981                                          ~(__be32)0);
                                                 ^^^^^^^^^^

The __be32 is unsigned so the result is 0xffffffff and it's never sign
extented to 64 bits.

    982                 MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_ETHER_TYPE_BE,
    983                                         htons(ETH_P_IP));
    984 #ifdef CONFIG_IPV6
    985         } else {
    986                 memcpy(MCDI_STRUCT_PTR(match_crit, MAE_ENC_FIELD_PAIRS_ENC_SRC_IP6_BE),
    987                        &encap->src_ip6, sizeof(encap->src_ip6));
    988                 memset(MCDI_STRUCT_PTR(match_crit, MAE_ENC_FIELD_PAIRS_ENC_SRC_IP6_BE_MASK),
    989                        0xff, sizeof(encap->src_ip6));
    990                 memcpy(MCDI_STRUCT_PTR(match_crit, MAE_ENC_FIELD_PAIRS_ENC_DST_IP6_BE),
    991                        &encap->dst_ip6, sizeof(encap->dst_ip6));
    992                 memset(MCDI_STRUCT_PTR(match_crit, MAE_ENC_FIELD_PAIRS_ENC_DST_IP6_BE_MASK),
    993                        0xff, sizeof(encap->dst_ip6));
    994                 MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_ETHER_TYPE_BE,
    995                                         htons(ETH_P_IPV6));
    996         }
    997 #endif
    998         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_ETHER_TYPE_BE_MASK,
    999                                 ~(__be16)0);

But for these ones the u16 is type promoted to int and so ~0 is negative
one and will be sign extended.  The cast does nothing.

    1000         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_L4_DPORT_BE,
    1001                                 encap->udp_dport);
--> 1002         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_L4_DPORT_BE_MASK,
    1003                                 ~(__be16)0);

Same.

    1004         MCDI_STRUCT_SET_BYTE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_IP_PROTO, IPPROTO_UDP);
    1005         MCDI_STRUCT_SET_BYTE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_IP_PROTO_MASK, ~0);
    1006         rc = efx_mcdi_rpc(efx, MC_CMD_MAE_OUTER_RULE_INSERT, inbuf,
    1007                           sizeof(inbuf), outbuf, sizeof(outbuf), &outlen);
    1008         if (rc)
    1009                 return rc;
    1010         if (outlen < sizeof(outbuf))
    1011                 return -EIO;
    1012         encap->fw_id = MCDI_DWORD(outbuf, MAE_OUTER_RULE_INSERT_OUT_OR_ID);
    1013         return 0;
    1014 }

regards,
dan carpenter
