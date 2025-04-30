Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC8213236
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000361; cv=none; b=k2v8QOYIwAP5FtiPl4uqe8u/GAue5MOT7gVabhug6gjwkV7dfDcL6y4H/VS1oYicPjodt9W5TwGkiQlt0DrfVf6digdhLILepJTNum2Hs92evxS+niKwcLE8y8WspwoD4TCYg8j8Ip0MeOUVJ4TEjTzCoWlFxXcfam9XfcwV8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000361; c=relaxed/simple;
	bh=DUHxlAwhz09uoCCY/km3TFaTU24WnD8mv0hKD36WSmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GC5vveeC8DhCfRaT7GygtMbaG9SqsAg3DMfbQXNrnX8JqmIT0KNdunTBCUbcvpCwqwSLOayke9iOoWfUG1hNSCTm6LxeJ8SvZIg034I7qWC+eKquQJegUOwxdOSS5YDl4thf9u8CslHZoqQlFjM7tDcptPwJ1BqROszGLkJ4c7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2ADUQi6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2ADUQi6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso5381073f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000358; x=1746605158; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYENxwyZq0Q3qL0QvqAbL/WUtfShupQ9hB5wEZFyU3M=;
        b=N2ADUQi6goI3gno0vTdsktd+qmM83Zti92tW4v1rhLE7Pxvp01Pvx2VUWslsqu0b2t
         kyTrehhvraCsY+oUj/27BfrjWcrtI2wbWatHzY23CWccVzLQNOZkiNmYgRp2wpjwNdfx
         L/+F8yiohNn+i0xQDNSyUiMEziMg6YvFDvOrPefG0cUNQVt4V5+0acXNfDd7HvEnvdms
         YeBJxdmn8b3xZOhphOmx8u1CpoGapuZfBc8iYGriDq7E0UtxnPqUdQai1mUnPa/s8V1S
         24WpBqqcm5qQrcGnyn53+osO6Idn2VMezEwp0j8hq8XJy+2P0P7fNltEgYFigyT4Xc/Y
         61Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000358; x=1746605158;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYENxwyZq0Q3qL0QvqAbL/WUtfShupQ9hB5wEZFyU3M=;
        b=lI3JsWt3sh09GpO6BClcPQ5mq320TxeQ5DTkGnpNjPtgyzsHYilEcgOnEieb1ssAwk
         4Dwd1NDduepeou7V/WpFazOIL5F5XDuYFtAG2OyE59IFYzYvzsHKUkKD/FJSz5FIIsoz
         8m3zbb7pLNHvFeGUZz2txTZ9q/clVp5nYxSwWbGDg7cMRZMmGM0WuDFyLhip8306gmXn
         gPDpCThNr19j1U6kbBXaX0jLxCqh+nvjARpQka2OD7W9cEkkoWt5vFbllmbV4ULD4LN5
         fPHg9j9eauiA5P3uaZlNYtsQCuima+5UsQghbWdBaFUrW46mpQywvTQ05l8OgSfcFiBm
         9VBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHzQSQVVZYe1sxaLUUFY8PZwOOFv6NKPJGDXZ5llSoRra59xhtZDjPrOciAubtbP2OjSjDVu7/j6LYt89XyQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypmrjfqgYtJokF87UmML3bjR1yYABsTI+useeLlCztnQJRjzQA
	0EAX43b2/GunSBsdtNFY/NGSV868zZn65NXOLlBBE1//a15Yf6gZkmNIjWzvX+I=
X-Gm-Gg: ASbGncveilOsC0f8UwALiLFKYjn5Dy438msUW9Z+VX3OPoo3xv6vA33aa28XSUDlx1z
	NKSp9S4Q9HUEXfkLctCIfdoDfwFKmK825ykI826bW/V6HVBhUl6vCDEWMFNY3oY6w4g6/f9Vkuh
	g6K+wxnacQ7Q5Rufr+DsXmS8XPIAAjfcvbe0w3zwrEDiIfWKoMgxFclrtInnqEiFiC3Lw8qD7fc
	cgVT7DsayU54lnk1op/zr9f2DbV4vi+TnTSlj7fQMSj11LMxJhDQItHbd9nyEYbb4j/KUQnN+XG
	0MuonhwM8NSqP7+uu0pmRwfGD+b2qKQyyWnpJ/jogEm1lupfbWaBpijr
X-Google-Smtp-Source: AGHT+IE/vJgkReHfU0yex981z0mRRJKC7iIQUf/5YtQH4VoE02PsQEx8EvbLqs3gYSEqbq0UVxslLw==
X-Received: by 2002:a05:6000:430b:b0:3a0:8429:a2e2 with SMTP id ffacd0b85a97d-3a08f7a2776mr1682112f8f.32.1746000358002;
        Wed, 30 Apr 2025 01:05:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a07a5ed2e0sm13777037f8f.39.2025.04.30.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:57 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satya Tangirala <satyat@google.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Eric Biggers <ebiggers@google.com>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dm: add missing unlock on in dm_keyslot_evict()
Message-ID: <aBHZ4puON8GNK0vw@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to call dm_put_live_table() even if dm_get_live_table() returns
NULL.

Fixes: 9355a9eb21a5 ("dm: support key eviction from keyslot managers of underlying devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/md/dm-table.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 933e01f3fab4..1a7e2623069b 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1177,7 +1177,7 @@ static int dm_keyslot_evict(struct blk_crypto_profile *profile,
 
 	t = dm_get_live_table(md, &srcu_idx);
 	if (!t)
-		return 0;
+		goto put_live_table;
 
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
@@ -1188,6 +1188,7 @@ static int dm_keyslot_evict(struct blk_crypto_profile *profile,
 					  (void *)key);
 	}
 
+put_live_table:
 	dm_put_live_table(md, srcu_idx);
 	return 0;
 }
-- 
2.47.2

