Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583691714C7
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721375; cv=none; b=ghxsyWQ5qyaUB87ZREBUeSuJmqOhQahWqn5DSx8E+ca2ix6ZOtz/VkHBZX1fSUKet0nKFKxB1BcFSkdLtA0S9U8yVsJ4JBzdxT7MoNaVclG+qRbYj0qTCirMuUCaKi8ukR1Bvj2Ub4wyH/CaLYQ8WJl1DQpGPNKEhL3jkC5Yb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721375; c=relaxed/simple;
	bh=sr7j5UxC4QXw2ypOBkx4S07fGjjwP6NxkB/0YC95P0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/MLr4BzrBfcIVC20eafjdgQD9HnC2AZJqO74qnKtNRO1UKi1BCF2BazpbzV90M7r65CvZFoY/lche6AHsOI70JjPMTUOOU2VVwPwbQHtNjaIWQXwsom5uTVGZ4KTZj5YlBoubnbwPXkZKt8uAdMcNtJoQZZhVuUi1EYr0koJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuDeUI+P; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuDeUI+P"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so1057032a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723721371; x=1724326171; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTAEGW3OQZ1pLkxp14RqDDaQpOm9zbUm4HJdeRXWAT0=;
        b=GuDeUI+PD6t2GHTXyS9clkXdr5c+3iuodVEPzDFGaNMIQdJaAH7SSLCdokYM0mHziE
         f3xmzmjqbbHnbbz8j17h/+xSxLFWVn1wyieDUbEXydIKsg8Lq6jeSQfZbHupzRHfpJ+a
         cyvqAetO1Yz3psYN9MaRJg3vuduXx2+ybclb1jwo5gy4WkQ2Hxt/slrWBeXTnjZJ1Tq7
         Q3vMmV2c1rhESMyQClBAU+RpS0ZqFAhcijQiTams4dTPAy5zl+gHgREr4/jZgm8JyASy
         SNMzEJ+Ey5Q5vi2/q/DXg0/ktaNck4x/wmhFIYMEICgWDqSb6UXaWX0HlbsEaGYIL9Yd
         MohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723721371; x=1724326171;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTAEGW3OQZ1pLkxp14RqDDaQpOm9zbUm4HJdeRXWAT0=;
        b=Ba06DuBUgSpjB0Wrzp1gKzozzFps5l1mASRIxIaVYPIuK3908frE2hcWPgWeg6LbBk
         2OZvcxIi5LLgquEE3KQy+jahsCsczE9oLG9dmjCMQ4vKt6DbjT4oqo89+bTtNm7uuPgS
         JZWJW4joEBfg7MWU2ZcKx375vjrfExAHQdDPE0GR9AtJTzHfaQ8XgDHpUhq2fmrURW/w
         Th0x1wtgvNkVC/pecfi0REcaQUIw4azxp+eq1nZXBtdKMX18kOjpQirN0Z+cxtQf7L3J
         WjUJQAS0BHi0cG9eDZKtPqYRegRMzrYrO3wR2uRcPdDvRYwxurYbpRgLxZ+BM1zw9V+5
         z8+g==
X-Forwarded-Encrypted: i=1; AJvYcCXdkZx/laRUJRjpu1Nh6P6g+gtlj06KiMAXVqTntoCjnWbIMdiHnj13AjcFPXBvfSa+epuA7sNLskCOd9MPOhWK3VaCyoMh8/L+svNMvUX7
X-Gm-Message-State: AOJu0Yw7j9x7AeMVZPC1ENmyjxdIk0PdjtCt1XYVjTgwiw4T/rQEOQ0u
	opCNmGF/vqShMMdRMgYlbE8VziS9BVuU/w9qGFRzv/27Yz6VpmCVStwOrTBIu/E=
X-Google-Smtp-Source: AGHT+IH9/KXxc6zq/fnEB4afFMropsvLrpcMCVRcWcQLh3uIT597PZfVNI/aJoEfYCz472UFpsw6NQ==
X-Received: by 2002:a17:907:e9e:b0:a77:c330:ad9d with SMTP id a640c23a62f3a-a836709548emr424568866b.61.1723721371552;
        Thu, 15 Aug 2024 04:29:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839356e2sm87568266b.105.2024.08.15.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:29:31 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:29:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Lin <yu-hao.lin@nxp.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Kalle Valo <kvalo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rafael Beims <rafael.beims@toradex.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mwifiex: Fix uninitialized variable in
 mwifiex_cfg80211_authenticate()
Message-ID: <d7d043b2-95d5-4e1d-b340-5d7330053ac6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that:

    drivers/net/wireless/marvell/mwifiex/cfg80211.c:4408 mwifiex_cfg80211_authenticate()
    error: uninitialized symbol 'varptr'.

It's a check for NULL, but "varptr" is either non-NULL or uninitialized.
Initialize it to NULL.

Fixes: 36995892c271 ("wifi: mwifiex: add host mlme for client mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 722ead51e912..7505de304052 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4284,7 +4284,7 @@ mwifiex_cfg80211_authenticate(struct wiphy *wiphy,
 	struct mwifiex_txinfo *tx_info;
 	u32 tx_control = 0, pkt_type = PKT_TYPE_MGMT;
 	u8 trans = 1, status_code = 0;
-	u8 *varptr;
+	u8 *varptr = NULL;
 
 	if (GET_BSS_ROLE(priv) == MWIFIEX_BSS_ROLE_UAP) {
 		mwifiex_dbg(priv->adapter, ERROR, "Interface role is AP\n");
-- 
2.43.0

