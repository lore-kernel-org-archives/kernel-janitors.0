Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA333208
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2025 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884544; cv=none; b=qOQjMxXYz4+p2mTQXOOkN04sql1Dy7DB/lINSFM8NZtoT+nvGkxmhZwxpzxjmG40nX/K3KmGGSlQTHeFuQX/toPzeE7Vd55v15O1Zb+8ZoEY7qGR8L+GtN865qej6BYJMyDLd+Zo0U/cS3zOFAV0gJmFk9R9BQr9IRZqHGDwlDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884544; c=relaxed/simple;
	bh=T2JYe+LQSB/nygVTjyMcCXLEryVG9kuvcUDlAdCDWu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJpUG/CXFYcfpBJfiz5bHQVcu3mi3aFn8FbXGD4tRU+pciWFDg8ixa+rFqKeRVXAPz7VG2blkYE/ZH4/bDWKVUXoqs1W4SOEZmI4f6DeyKRZXtOS9aYJFbftdIQqXI5YurNSQqQyuGZ7EeCY7UTkn9488ApM1TU2xCtgHkOmxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sbe68vC1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sbe68vC1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbc38adeb1so70324366b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2025 05:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739884541; x=1740489341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=seJOt702BxciOrZQGfbCE9NbiygJD+aaFMVx5CIWE5E=;
        b=Sbe68vC1CVmagAPRSL6NVbBprvMJPfh+v7MQiT+1pd6Q+8PdI+eODgVmFkgGZ5N0Qc
         HQazzI4xgzYr0FEDHQVM2NcSiSaZP2M9z2IhEIHU5+4zcKm60JLXvOhn54Wjh3/XQwZo
         LBLCUsF11fvM6b6qgetEIblMK6nnCKjhRf5Yv7gq/93Kk3gdJWVpuydfAOD0d3pHzJ3W
         AiVQhxTWDde9esDFPXmy0fBT5YeTzJ73Q9RX27OrlyifmlytMpK0QHmldP0ms+OETyae
         9kSUSXfubiSyd7HmLzwEIxtxc1CKB8mAw+W96za3Qsjuxn7KZExK/dHH4cKNFEtdaT3U
         FycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884541; x=1740489341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seJOt702BxciOrZQGfbCE9NbiygJD+aaFMVx5CIWE5E=;
        b=spbvQrhf8vc/eoMostaZdAqYRsUS4vHR3+Qdj4PfFtbUUqFsieVElbZoN47kajKrmd
         uWoV84Itq5O1Ct0rj8JK6fSeXUotOX0hronOQY62rHP8Xf2bvRcXyNwFS5dtlPVYcZ5B
         YVduTccSx+QEiDP4Fw/QKIx+wZBkkZQKzYx5xBRyyHru/Qr4Dw52wLq08CYTfWJKuyhh
         9Nn8T9ZPU6gfghMzCb+AwpDIhfyaLFwDs2QN2UveUMM/vZBRyfPkRNtRRmOf1OFM/OHZ
         t4ktrQ0Dikrf7CSTrGFW3HeBs2m9Zd227vZefUKUOuHXiJxcn1x4xsKzB57jpZ0skmdh
         WCoA==
X-Forwarded-Encrypted: i=1; AJvYcCUw0Lg6fBMV9LGqhqxK1TxdeD+Ax3dkVbHZ4u8naMjrJTZAna82f27VXEyqrh3wo0hk/bnt5RK+y0l6m76OLt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8qkqoUP5Zv+JLHH49MEqU++KP6mSbnH0faa+nS2RxhLOGdoi
	D9FNh2u44UhQgUXf1JIqrw9Tx6kcVOtJKSHe1icvC8wJtAILBabj4dNFMaEJUng=
X-Gm-Gg: ASbGnctHswnoGSUNJBdmKwWvqeThrrSm0A0jCWW2+9y+vEKgksZcXBjb2cZ32yp17cA
	l67xkm/9Zr/TWNqFE7jhYWO91lngUdkYpIJbADkJrOgrNCMwQFbuMzF6k4t/YYjgDfyISebW4La
	OCp7vZuVcQBCdh5b3x29A7C6zGf93LrIjcCfMphFTlCC6SRb4LroBHkuDVmnRQgjIiEmIW7U/tG
	RKBgXTHJMEwCILV0DYQ/Vz8BZNHST+vMobDkUVrft1TxhFWaAGPTzXj8fPjaixInOmo/yQPtOR/
	uwHszsHstz88XcEGwYEC
X-Google-Smtp-Source: AGHT+IHnl+jBmdJsRUXRwBR/mH52YC23EuGVS0vmhx7dq14tgwuSG89//4yrt5azsXLFxS0+HMeVxw==
X-Received: by 2002:a17:906:e0c5:b0:abb:ac56:fcf8 with SMTP id a640c23a62f3a-abbac570080mr510173266b.57.1739884540816;
        Tue, 18 Feb 2025 05:15:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece288e38sm8604786a12.79.2025.02.18.05.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:15:40 -0800 (PST)
Date: Tue, 18 Feb 2025 16:15:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: mt76: mt7925: fix error checking in
 mt7925_mcu_uni_rx/tx_ba()
Message-ID: <5e7bc52b-332d-475e-94ca-571864cb1a6a@stanley.mountain>
References: <063aafdf-3234-42ac-a4ea-3ff98e2835b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063aafdf-3234-42ac-a4ea-3ff98e2835b6@stanley.mountain>

Ping.

regards,
dan carpenter

On Mon, Jan 20, 2025 at 12:46:58PM +0300, Dan Carpenter wrote:
> The "ret" variable in mt7925_mcu_uni_[rx/tx]_ba() needs to be signed for
> the if (ret < 0) condition to be true.
> 
> Also the mt7925_mcu_sta_ba() function returns positive values on success.
> The code currently returns whatever non-negative value was returned on
> the last iteration.  It would be better to return zero on success.  This
> function is called from mt7925_ampdu_action() which does not check the
> return value so the return value doesn't affect runtime.  However, it
> still makes sense to return zero even though nothing is affected in the
> current code.
> 
> Fixes: eb2a9a12c609 ("wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> index 15815ad84713..b3a00964e802 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -617,7 +617,8 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
>  	struct mt792x_bss_conf *mconf;
>  	unsigned long usable_links = ieee80211_vif_usable_links(vif);
>  	struct mt76_wcid *wcid;
> -	u8 link_id, ret;
> +	u8 link_id;
> +	int ret;
>  
>  	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
>  		mconf = mt792x_vif_to_link(mvif, link_id);
> @@ -630,10 +631,10 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
>  		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
>  					enable, true);
>  		if (ret < 0)
> -			break;
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
> @@ -647,7 +648,8 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
>  	struct mt792x_bss_conf *mconf;
>  	unsigned long usable_links = ieee80211_vif_usable_links(vif);
>  	struct mt76_wcid *wcid;
> -	u8 link_id, ret;
> +	u8 link_id;
> +	int ret;
>  
>  	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
>  		mconf = mt792x_vif_to_link(mvif, link_id);
> @@ -657,10 +659,10 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
>  		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
>  					enable, false);
>  		if (ret < 0)
> -			break;
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
> -- 
> 2.45.2
> 
