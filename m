Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BF42367BF
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582380; cv=none; b=FOQAGNbAJrJazfe/l2arl1X4weUWM7Bto36+0fVk0HmtUVXfyQxaWfURmQ/g6taiAYLmCBQSlkDg/1aGIpmDMfpmeiEQfsF0tx1hqRbSyI4Gks6hhq2cxIcrK8dGMxJx1rug1T12h+VFv9jSxMeamBCl94Fv1RlHcxInYsaRLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582380; c=relaxed/simple;
	bh=nWUX0UyCwqRhGr5Hn+kYWfr/sn4vqu9CdsNn/v8zOwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jH48f72D3dvqRal436nynoZuxYnSeDpPLDqZ1Xt0xEPCsuTlXUC95unFAu3LVcn/ChbeHqoFQGh+Fy4Irke5kdt6AkZF4aYrFNYKJyk+mZHGEd1P3PT4iuCppDc7bdcbbDbSrZeOdpg0Ow4+bWaiIzIyDjagTr2O3YKLGljOliQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MmuNwCkS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmuNwCkS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-459e72abdd2so7143615e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582377; x=1755187177; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a39QTXCsD28ECNRFaPvfyJpymvOnczjpcOMvhmntcwY=;
        b=MmuNwCkS16qcIaggIoGL1LS5dcVJ5Rwok0SPSYxFaj/Luuo/6wzd8oGUCaz2svHK4N
         uqHD4sxnINV2Q4pFEBC/0c37e+9qLsiVxT3nKlSloN904l22OGAGxyGlhrvLu64q+NCG
         KVEH6dF+iBftJQmc/WfPTXCqVQCOmBmgUsB54gX+I0GRvnRXV1z/4fDeIwTVI38VJD5Y
         BbC9NytvBk8wGvdmCe88tX/xVPGtllonhTG58+vCgv7xYlnBaZt9L1aqSxxHJtZDCG4F
         0i7yvSu9j/r02oWZPSOnmQHRbeDrDUVLVNzO1v0Xt4fQETdEqYi8f6nAsJv4Vw1TR7GM
         /m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582377; x=1755187177;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a39QTXCsD28ECNRFaPvfyJpymvOnczjpcOMvhmntcwY=;
        b=AKdAbr81wB0n3C50jf1P1u6KqjjVKss856UReEL4m8jC+DkmAYdci2qHqw3gf7CCSv
         f8Pw9Y3UjJ4WHJUGC48SB7L+7ZNH+KoyH5njLKvK+awAQ5T8nGjheuTaCj21+O2Wzd8U
         O7Cq4atXkSZmyLhZ4ZEQcLmkg/qRpxicY+IoJE7ZjelmqUX0t2plljHfFBQ0NoZDNmNC
         P0O6NYylJwYO52uuan6GxLo1itL0DbJ6Vs1gUr9inUbAjB4dGFIQenl7ZcQecUOiUVTg
         QzXJVveR82Brcr7vJFcpD0mbiGFBB4sGW8HZ8cGSh5bxn/u9O5cu3ojBZzqbWNCG/sHB
         RxYQ==
X-Gm-Message-State: AOJu0YzFL+PfDBfqzaI39i6tD8K538Nom1KoQWeQk/cQaDzDHzPUU7do
	Hllost01ZJNy2wZFgjkaXNNnAFmpkd7lXO1QuzahoECg4jEenA3lgmeXBMNwJXAN7yljajrf8CP
	GTpCy
X-Gm-Gg: ASbGncsNb3vZ1tkunFpbB/0drenGn2r7fMq5jYVC4rq53FmipGuCoe+7vmqi0tkYq1c
	pYplG9OsjMm78GvOC9BYmpq4Rx5ProMgDwemoi49SeBcKX7Xx/0OsSfK2Trpiy0n68imuhZkknH
	kfvC2hmGkqNBmD/uHTFooKsMPWq+iBeLs5GDjIb7Ivx2SFNZ1SV71MJ3JuOU86XU+Fc8GGIxTvw
	NsAiRJshOhpfdLapgx0rfEX9iKBQWeP1oSQ5yolo0dhisinyyjuHvWUa5/x5MyGBo8j/2HyF2pT
	6KmxcZUOzMbgP8kN+VX4xhdB1xkn2U4TcBzOHxipoJU1ctF/NxHj40z9/LAfzu7VjSjwdvqmJBH
	1dkc1mjAlQUZ3zthD6kr4Sft1fOY=
X-Google-Smtp-Source: AGHT+IGELoJvaT98UE80m6oyQH5wUutVpeAN53zbkSRuetevqiiGrmRr+KkvzVCx0Mk1T9o5Z4V2MA==
X-Received: by 2002:a05:600c:6610:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-459f43a7b47mr1939255e9.16.1754582377109;
        Thu, 07 Aug 2025 08:59:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458953eb7acsm338727045e9.28.2025.08.07.08.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:59:36 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:59:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: axienet: Introduce dmaengine support
Message-ID: <aJTNZQBAuY83TN2h@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Radhey Shyam Pandey,

Commit 6a91b846af85 ("net: axienet: Introduce dmaengine support")
from Nov 16, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1171 axienet_dma_rx_cb()
	error: 'app_metadata' dereferencing possible ERR_PTR()

drivers/net/ethernet/xilinx/xilinx_axienet_main.c
    1156 static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
    1157 {
    1158         struct skbuf_dma_descriptor *skbuf_dma;
    1159         size_t meta_len, meta_max_len, rx_len;
    1160         struct axienet_local *lp = data;
    1161         struct sk_buff *skb;
    1162         u32 *app_metadata;
    1163 
    1164         skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
    1165         skb = skbuf_dma->skb;
    1166         app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
No error checking.

    1167                                                        &meta_max_len);
    1168         dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
    1169                          DMA_FROM_DEVICE);
    1170         /* TODO: Derive app word index programmatically */
--> 1171         rx_len = (app_metadata[LEN_APP] & 0xFFFF);
                           ^^^^^^^^^^^^
Dereference.

    1172         skb_put(skb, rx_len);
    1173         skb->protocol = eth_type_trans(skb, lp->ndev);
    1174         skb->ip_summed = CHECKSUM_NONE;
    1175 
    1176         __netif_rx(skb);
    1177         u64_stats_update_begin(&lp->rx_stat_sync);
    1178         u64_stats_add(&lp->rx_packets, 1);
    1179         u64_stats_add(&lp->rx_bytes, rx_len);
    1180         u64_stats_update_end(&lp->rx_stat_sync);
    1181         axienet_rx_submit_desc(lp->ndev);
    1182         dma_async_issue_pending(lp->rx_chan);
    1183 }

regards,
dan carpenter
