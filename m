Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363782066C6
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733489557; cv=none; b=qtHcHt2cVh74ERT9xD6J3WgNTN/OjnqLqrd89t90K3A04D/Vln9COTVfvvlTHg0ZPaN1eOLDhmqDzF9xSZfYj3ZonIzpR7OWJ1Qo4yOr9nYUqqDePmZpElKJGpcnJkZpA0Te1pIrc6cs2ejWOpfp18ou1lSMfVqVKw6ImVVSpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733489557; c=relaxed/simple;
	bh=f+27fzhEEViDzKM3BdD9NsjlQj3nr6zdqL/DbQ0dhcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWpbTc86KikwzoWhC4KUKn29XNl6TG9pce5fgMFgMKRzUvfcRfn/HWVX9I+1QaGcnS9qIOIpgefEnh99Lk7WdDd56MAskj1e+mQnVBv+4/NWUhshOJOPcBk8wsTnwUDVB8EBiE6bc0In6ME2+KV2dHmMnnJ80k8Ilm4B2viWk9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uB+CD3kU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB+CD3kU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so328759f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Dec 2024 04:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733489553; x=1734094353; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrDABpUIa8XNiUd2yRie5JLoWvXscChzPwT5Xcajj3I=;
        b=uB+CD3kULrEBu9yaY++G1hkEM/iCyLHs4FFa+5H7UgK7p3Oh0iYfpLu1YpJ955ezoU
         yhP+J7czsqhRrvVeQXCTWqGcIkDAwsLxlxRbO9aG78n1+3aZrpSaLwF3wcOQ40pDsgSi
         MokuefxG8BIhh40ot0xnpySjf/wcJnGX3s/CF/3RwYuPMccOsTUe5UpOSMpkRt7hIYD3
         fB5cd+zsQEo3qsUKw71QAviVZHTonFQWhLhnKnFKP1nTX9sB7hjrjFEzsJ2q1Rny/SKw
         PdXuU3LGRIasKCb8czjez4dzitkJvpdRR7Qk1DED92MwSvMvS8jK1YNcFn0nbMkLktuR
         XyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733489553; x=1734094353;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrDABpUIa8XNiUd2yRie5JLoWvXscChzPwT5Xcajj3I=;
        b=voLsOZ+cjSwLk1pxAHV0fekXJ/ljVFTkbwK7d8/7DZd9X8mNovMTG7j/lUY58G1oIG
         cVlEbAizbm7gNtQlNn5BbkBTi+lgcKmAUeUz61MXKXFTiBbR8OLu1++119p+k14VX75a
         Iq1fkBATVr4O0ed30ASUsczlMLFNBrXBt5llKT94wyno/5hl8qzdSH3vDhwUi2DVGDff
         evNiABJ76aew4v04/Qzz5Gi8v5SZCwlSS+Hmf+bKXASjbU1N/iqn7nhLmpbSiBQs2BK+
         CBYk6T7Q2BKkMzYqJ5YiIz/FJYkg1LraQDrEGlf04AOw8Z/9TfVJvCFCDuIrJzCDi7px
         4zeA==
X-Forwarded-Encrypted: i=1; AJvYcCUNfX21AzaKaD6GFWsrKBIULMKr518LO9Vvh0B/ODkUSg2XMYaSBuB7kexpRJgn81u9kWZxTf6M/xGATcIFe2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xDKzpJ7K9yF0W1IhuqCXazZauydLqwwQ0BoYBE61VsyK+N2L
	yvIxk2XIPsWSauPc3XbtayLZZvypnn1SN2gzazluROyWe6JdUH6Eyy/0oq+aAAQ=
X-Gm-Gg: ASbGncvyI4CCFgTWKaQcqoIllwPuBdr6RT2f0xKTbNB5uiOsRegDYdfU4wQcy9d4JuB
	mk9GOj2939J3Aha70IK5DcrRHUE/p0LVL+i5PjoGLITc3XqMbibK/5hS3vflFwPQw1KMGQiw9/2
	OT09AywCsAdgkfXhefRNEXDgrTyNb6Qf87yIIw+GoqtnrOlF65wkmRyhaw5UR+aUVm+5itj9CnL
	9h0/2CIKsbzDBhDGGrVHodZiriK9bwJTKZuKgeTF3gR8hbImZovumE=
X-Google-Smtp-Source: AGHT+IHm8JzdfN+FTAHMT8Z6wMEGsSN1pUfe5dL+iyuyKffu7U5Grq3ElPDgSbj9GKe3ItmO5v0RPw==
X-Received: by 2002:a5d:588a:0:b0:385:f9ed:1637 with SMTP id ffacd0b85a97d-3861bf98719mr4466825f8f.28.1733489553444;
        Fri, 06 Dec 2024 04:52:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da1134b9sm55104575e9.33.2024.12.06.04.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:52:32 -0800 (PST)
Date: Fri, 6 Dec 2024 15:52:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: Off by one in
 ath12k_wmi_process_csa_switch_count_event()
Message-ID: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ahvif->vif->link_conf[] array has IEEE80211_MLD_MAX_NUM_LINKS elements
so this should be >= instead of > to avoid an out of bounds access.

Fixes: 3952657848c0 ("wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 402ae477da61..46c5027e4f1c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6873,7 +6873,7 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 		}
 		ahvif = arvif->ahvif;
 
-		if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (arvif->link_id >= IEEE80211_MLD_MAX_NUM_LINKS) {
 			ath12k_warn(ab, "Invalid CSA switch count even link id: %d\n",
 				    arvif->link_id);
 			continue;
-- 
2.45.2

