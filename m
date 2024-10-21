Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC11E2856
	for <kernel-janitors@vger.kernel.org>; Mon, 21 Oct 2024 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502090; cv=none; b=u6bbLc0q8QM4aDZARFsy3paeuukr1mI0FBPkgA+C/hIswuh4ehp7kLCqs+mYWgMNUUBZ0uIZvhcOP6vYM6vG+8R6wd9V962KGuAn9LvlyFKDJX7z8sjGPnJ9UWgVj1kIu+kRDLVV/ScDzMzRpQDs8lgkIeBaVEzrc7GfQqwnYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502090; c=relaxed/simple;
	bh=V5T+KifZpNxuES86cc0P0YZbHqO0QvYd0fJIuXHtqjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deBj3u62FqzLa7KxT8RxYCfTSRJY+qn3BJlJICb9MwQH5i4R2/aQzwXK2oFpHBsjxsg9qqe3ydSAuSWbgdIs3p9TVOexzRmI63IcPaXFinBozK7hagu4GzGRKnK5hS57lcjdczngTRSHvKjuqwDpKwbdPo9loGCljneltU11nh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spCXKJ+p; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spCXKJ+p"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43159c9f617so39629395e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Oct 2024 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729502085; x=1730106885; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viIdKZJdxzmzxa+AMbJaVQG5+tOcBpIZMwetXFmiAfI=;
        b=spCXKJ+pLh4Bcii+XX4iSHw3xQJbhEGmKC5zbtgSDy50JRAQZ+i0ERFJ+T0ZzCwJSu
         JnIyCpNZt/Gckso771wI816hJpuU8FRAl18TPWvEAuawNmnyd2DU/Jqzabi6acF2uvCe
         kJUHJPMHKX7KMN2Md5u087+HuVT1QaxWdbX6hcfNhAIAvqIlQ9ELzOPUri8h8/Wse6FP
         W90osZ2vioMrCF3J90MA6/GFKgp/2xdNdXn9ySMdT430nXRhmYPkM/EAyNXvxRTQ9yEU
         xwCOUtr+uZUjMNAnPtkvsSpox6Zz5IZAZDPD1wh5BS0qNSufJhAVj+BiJoz0M/ziNkJ5
         xtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502085; x=1730106885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viIdKZJdxzmzxa+AMbJaVQG5+tOcBpIZMwetXFmiAfI=;
        b=wiYfbNXoAtXUkRwvLNHz0FrRataITZg6ibcplvxpgX00krm5hkRTLov0z29a3tBjaT
         LFD/ulfOLL94HQV8yAFEOpY7KNVqS24A9TAUpuhPEoSIly7srF47MayMj00dNSMscOD6
         xZYlP/E8GQoXlrOs8QM8rLQrMP3zt61ciCJQjitPQPHGVL5wYO4ATdRL4fIDnRLL3MY0
         w633tkmKsaQ7TF69jEUq2CcRYUIBHGseYMJpVa9DowzW0mkT5hiwcR+8PeFW8fH0+Uez
         CTdNFAdeuXSDWCSyCfduzo745pbmW9Nhcl8jU8qvak6ujSOC0DZmZ1azg0InANs1WQ6a
         AbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzRpetJ7Xu0zh5is8ISNvnUNO8jTAQsE4XdlUc9y/BITI0r7atBIhzUbR29SxQjRHjViRqpCD4XoUFrUxx/TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzZn5nqZDFsYnCxmFbIOXa5QEoyilGQis94dzZUNPZi67dJQ/
	ZPNWh0pXkw+r0kyGSg12T2tS9he6xQU8t3K0a2ukpMK2L0TFqa78jyuhvw/FWQwFB1g50WgudPA
	6
X-Google-Smtp-Source: AGHT+IHRJ3XMQNNFSL+N9qTIsbeBkdqtT90O1Pz3aDqarzu2Bt0GMkFFH7O+TI0+CrOjEzrpheLyBA==
X-Received: by 2002:a05:600c:510f:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-43161631435mr80440425e9.10.1729502085149;
        Mon, 21 Oct 2024 02:14:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cb88csm50401685e9.39.2024.10.21.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 02:14:44 -0700 (PDT)
Date: Mon, 21 Oct 2024 12:14:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: rtw89: unlock on error path in
 rtw89_ops_unassign_vif_chanctx()
Message-ID: <8683a712-ffc2-466b-8382-0b264719f8ef@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to call mutex_unlock() on this error path.

Fixes: aad0394e7a02 ("wifi: rtw89: tweak driver architecture for impending MLO support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/realtek/rtw89/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 1ee63a85308f..565347a6e1e6 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -1373,6 +1373,7 @@ static void rtw89_ops_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	rtwvif_link = rtwvif->links[link_conf->link_id];
 	if (unlikely(!rtwvif_link)) {
+		mutex_unlock(&rtwdev->mutex);
 		rtw89_err(rtwdev,
 			  "%s: rtwvif link (link_id %u) is not active\n",
 			  __func__, link_conf->link_id);
-- 
2.45.2

