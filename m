Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7E2FD1BF
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902264; cv=none; b=HrAh/D0pkxVf7ZxXc9nxvk4az2L2DOT+fLpvAd9XxvHiaf6IC/48zqMlyS0uGBzhrgzp7xnPNwJ2nUZZNjqppuiiiT1eXPq8OXU6fKM9C1EXsZUbLSjC3IEtLdq+fslxLdYff+IQFnOsdTuelNCkbeEMCrFdTlYsLIyJxn0ZD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902264; c=relaxed/simple;
	bh=SEPQdKAnhPs5qLuQcj39VfnCDYxTiNdPEOtqU1zoQRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gcgh/g5YIWvhSkvIb+NzQc1B38uG2sdbB6flT9I6GkKoybyshEY5UF4owFfmozg/VMTDA/kzpWldbC0XZ/vWRkRIfV8lkt2AZlguzdGgrMtZW8jaSa7cU+/GEhjkA2Ll4Yrqhu4R3kbGZDn3YfMy8E9/lDv1nA/kGlVLmB1NMwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVv4ewMK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVv4ewMK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1918149f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902261; x=1768507061; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gDf4kLAuf0qf8dByGwvVIAAHMwWtxHLpFy5fp7Ykwc=;
        b=SVv4ewMKDYFLaBBR0a7aI6A9JomvmAP3+HlvrbqDfrnMXzj/L5Kpo6MmH9SwYXud8z
         WaZPcwdFdwdSg67Ck7cUktr8fOXoRz1lCElZU/B6+MYiy+urk2IsxO0YI55HIrfCEzgf
         p/8F/W5emq1umeMCW/ZdvS2N5LaP/E4UhAdJPmYwhJAq71sjRPtbHp+pL6jNdzsbGKRZ
         Je/Bn7rmEs0eJI0PWcwwTeXjB2m36PEH/ypgAKMR2eiw5ZeR0fBnccYZKLehII5yliKx
         To8c0sN+RHPRzT+RoajfioHBwIArOrmCoJjy7G20qZWHxkal3MxLxFegGzO0nanHowRr
         jXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902261; x=1768507061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gDf4kLAuf0qf8dByGwvVIAAHMwWtxHLpFy5fp7Ykwc=;
        b=xJ+0Z/63CF5aff3qm49sFILwM2WDL+ZMwKx/+TRrpoe+IJVtmJXbs98r9yaTTFYiZr
         aSjTxPhzspd2uBLVNpEA9C5Gllb3WElWPLqbYfgtJNkDx6UImqqrk2i89p6iewB5I2hg
         8clhA8JaW2BBlm+GSthVLmmE5Q4Xi1b3YThJjQVGmbim44wDAxhLnZIqKZ7vIEVkVu/U
         ENQxno1wC+SPKS644cYasy+3/QpSd0woDngeE2niRPMmj3jgv8RMV8bxk5leUqeBx3Ah
         zWQbQkb52pJUvKBex9A9Qn11l3ZgxsRZEYv4KIciCtl0CCaJm3vE2JEWINgD3VDrrfoR
         TUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU6+PtF1dNmL9OsZDlzb2xAd1znK0awM8T4rKt+2voJJLl+l14y/FFF7fYuCTNSvu7aXedVbzbVNXgsK/NTfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwRGYizMKx2JIVtMckBmsPU/kTWZIJXmX8JxPQLEsLWE9U304
	x+Q4V94g5XO3i75Sn0bfb95UDZ/mfRRD3Lm0a0D+wYUJwe5lWZslOuyauve32xC+AG8=
X-Gm-Gg: AY/fxX4/CWHASUxSs3vzDbDdxK4iBRMtpFA2CmNMwluOv4FjMdo1ODLG9UmAfmUtL+6
	tcxjl4HaSAAAoGvKwyw6yYNMsZZuZaQRUsAAtOhuuTZU+4LXV3VvKtWIFiS2Zym/jx263Jr2Nxj
	BfISElZCiDa+Bw2BWo6lIyFziDBZ/F+kX3XLrgls6vcRt1etdoGw6Hq99X7eSTklUKuivqXEv0H
	qZ/whjhFuY2MH8+3ZxzF709fEUllp46JbMMOr1IZ8XqJlvaCSiZFCSOozHWwOt5TaTMT3fwnAKI
	maPJuHnntQIzEc6jnZ0zUb5ggKmo+SlVC+MXLpDyz1RCaVabRZj9zBVbJhQnalfoUpXZ36z31nh
	FkWWxGMkS0TEU3Jb37I3EvJo/eaSnFxqRwgZ+omry6OXRb7KqVsJ9+bcGKPObvak6Z7HkzoDwTx
	A+cHTCNdY0sQLNefEh
X-Google-Smtp-Source: AGHT+IHZFBCYQJFhqky8VClr8SnHFwzl/K8CfsbIy37jcUuYeB36t9vSgMB3jS7bjLFN1WcoCrT2gA==
X-Received: by 2002:a5d:5d13:0:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-432c362817bmr8072719f8f.7.1767902261307;
        Thu, 08 Jan 2026 11:57:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm17943736f8f.28.2026.01.08.11.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:57:40 -0800 (PST)
Date: Thu, 8 Jan 2026 22:57:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amitkumar Karwar <akarwar@marvell.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Kalle Valo <kvalo@kernel.org>, Cathy Luo <cluo@marvell.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mwifiex: Fix use after free in
 mwifiex_11n_dispatch_amsdu_pkt()
Message-ID: <aWAMMdynZDz1uWAi@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ieee80211_amsdu_to_8023s() function generally frees the skb, so save
the skb->len first before it's freed.

Fixes: 776f742040ca ("mwifiex: fix AMPDU not setup on TDLS link problem")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
index 354c5ce66045..90831a1350f5 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
@@ -25,6 +25,7 @@ static int mwifiex_11n_dispatch_amsdu_pkt(struct mwifiex_private *priv,
 
 	if (le16_to_cpu(local_rx_pd->rx_pkt_type) == PKT_TYPE_AMSDU) {
 		struct sk_buff_head list;
+		int skb_len = skb->len;
 		struct sk_buff *rx_skb;
 
 		__skb_queue_head_init(&list);
@@ -44,7 +45,7 @@ static int mwifiex_11n_dispatch_amsdu_pkt(struct mwifiex_private *priv,
 			    ntohs(rx_hdr->eth803_hdr.h_proto) == ETH_P_TDLS) {
 				mwifiex_process_tdls_action_frame(priv,
 								  (u8 *)rx_hdr,
-								  skb->len);
+								  skb_len);
 			}
 
 			if (priv->bss_role == MWIFIEX_BSS_ROLE_UAP)
-- 
2.51.0

