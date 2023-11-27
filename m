Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sQxvQniC"
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D627B137
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:58:00 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-333030a6537so366647f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 04:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089879; x=1701694679; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jw+nqW/qvzQR0YmWnaSnjwd99Rt7JQhz5XlpXkiz0js=;
        b=sQxvQniCVVTdkhTlQ5fx9dwyK/jq9NNUD114CKuOajiigsCHCKWdWFYw9BuXqR9GSx
         2MpBDa5yvV+X018yCOcPzOkHt+Ro9UhrwqFnEvVnNjwtiEaGxo27L1tkXqRTZKXNbrLa
         gePing2oHRDvSKpXMqirB3Dl5p+iwW/3vWjM8FCJZTS1SiwR1QfLe9i5BnB5u6+O2630
         2Lquro/xU+95p1nV+/kUlm3Wrd8GBeu5gI81k5WN68RCybmMCqieWa0ggayeHa3VBGmh
         UyYw3Gh9enmjzc+NBsTJAc9fnR2t+4cWT2qu7dV71kNoYghlqObfV+X9IdpJysmYLngi
         iS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089879; x=1701694679;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw+nqW/qvzQR0YmWnaSnjwd99Rt7JQhz5XlpXkiz0js=;
        b=PdHOx5h+MgrIJa4RwZXzmnSaUc9IBBj6nAAzMMDOZ9ybc7TwhhAz2r5cHWUxVtAF2S
         gA4X9t3pzQJAf2FRy9/+tFAzVhOftI2A0wgKX06+p8isW+wO76I9/4Y38O5eYCMCH81E
         fcFCwIx+7C7xNzDBj8YpE98+ZLf6h8LFwxNc5aEUSxtucWs3Gyw8WLCTxrS7qA437vA6
         GimyRvyo4crxpVFPqAgGhbiIC8YdNDdFHfhrkOptgQCq99t7aL/S4E7P9LK7qInbbmeo
         CmmrqJo86MGCX9inKWrJbWaxlCXYtHiDvPBLZXqCnH4MOb5qs+CXJk30MxN7T/TW3kky
         9ZNg==
X-Gm-Message-State: AOJu0YwokcI7hoCu7iG8nJVwRyVBCJS1B4uaRtTEiMBVD62xab0BAJZM
	YXQ4bUO0XeQK85yVw1deupG3bzNknorYAHAUXq8=
X-Google-Smtp-Source: AGHT+IHAUIFXo0Q+3U5BvgBDqA09MrLfbCpKKUPXt8McxfE3eh3EdNaruAMFcydi7N7rKbq0QAWjqQ==
X-Received: by 2002:a5d:5390:0:b0:333:8ca:2333 with SMTP id d16-20020a5d5390000000b0033308ca2333mr175704wrv.71.1701089879466;
        Mon, 27 Nov 2023 04:57:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s11-20020adfeccb000000b00332c6c5ce82sm11984406wro.94.2023.11.27.04.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:57:59 -0800 (PST)
Date: Mon, 27 Nov 2023 15:57:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: radhey.shyam.pandey@amd.com
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: axienet: Introduce dmaengine support
Message-ID: <b8b0ba96-9412-413c-b121-58d217d8d7c5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Radhey Shyam Pandey,

The patch 6a91b846af85: "net: axienet: Introduce dmaengine support"
from Nov 16, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1060 axienet_dma_rx_cb()
	error: 'app_metadata' dereferencing possible ERR_PTR()

drivers/net/ethernet/xilinx/xilinx_axienet_main.c
    1045 static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
    1046 {
    1047         struct skbuf_dma_descriptor *skbuf_dma;
    1048         size_t meta_len, meta_max_len, rx_len;
    1049         struct axienet_local *lp = data;
    1050         struct sk_buff *skb;
    1051         u32 *app_metadata;
    1052 
    1053         skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
    1054         skb = skbuf_dma->skb;
    1055         app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
    1056                                                        &meta_max_len);

dmaengine_desc_get_metadata_ptr() can return error pointers

    1057         dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
    1058                          DMA_FROM_DEVICE);
    1059         /* TODO: Derive app word index programmatically */
--> 1060         rx_len = (app_metadata[LEN_APP] & 0xFFFF);
                           ^^^^^^^^^^^^

    1061         skb_put(skb, rx_len);
    1062         skb->protocol = eth_type_trans(skb, lp->ndev);
    1063         skb->ip_summed = CHECKSUM_NONE;
    1064 
    1065         __netif_rx(skb);
    1066         u64_stats_update_begin(&lp->rx_stat_sync);
    1067         u64_stats_add(&lp->rx_packets, 1);
    1068         u64_stats_add(&lp->rx_bytes, rx_len);
    1069         u64_stats_update_end(&lp->rx_stat_sync);
    1070         axienet_rx_submit_desc(lp->ndev);
    1071         dma_async_issue_pending(lp->rx_chan);
    1072 }

regards,
dan carpenter
