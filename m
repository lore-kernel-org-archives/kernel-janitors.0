Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500492;
	b=kbZWtZWpIxCAWk67LCyTP8wwS3WZ7jX2CjB0u6A/meWtPR57oMm+BRiXZbgqXL1/c0BS
	 66WvH3KK5lPQldDB+sc8qQDLcgiC+2Dc/mxX6FE/sfpI2kLQnr+AIhxRwDCVBQYglB7Dr
	 LWAo/bpAYgko0JPi3AtYdN9UrJLeGDj271eSoqCggXiDkeDLdnmjbT8lwZYY9J3ggJCZ9
	 8HJBQOnLsT4qMVDRbJOsy6XBGPY7lbh4EE5RCxmRwxdMfCzK0AqgNSvFtcjRAobq8bjrP
	 oblonSOIf7/XBWSe6hWLpRyiuE+4Kf6NJmM7JtRPBGPFaESAWgkploXANjAyicTFhoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+tpnmaCejDTdKprdiXgHKHQFYAbbd0rQZxDc9JTWdcM=;
	b=pHvYQyzIR4yTM36Up7rRS6PUzRH51HagN/emLJJ6UmiIw8QsbFU6AOJdGJlkT8QFQid5
	 BZwykEmOQL70s5So7iFg7lGsnu1l4tAZVXzZBwzvz4CXgQgYqR6Aa/uknlQpzZ6s2EiB/
	 EaAWn3+T6bLx9Cc20SppFFVNct5Q5wu6hS7ANRFNmSI7KwnSQLLzIxsXE0Jlzbu/MaQC0
	 rX5x3mu+0/xgX9i4B0vnNLd9b9tAtcaz2Y+jY7/pg+EQYzbes4BfcgaBaP/xCSam6+AZt
	 KS6JxBzcLxKW1eWAJ/xgXjWR0PlaO1AJISr+Ac4AS8Fx3zV5FF6xefSJjsv4rhaHf8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUaEIJii;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F8606A321
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Nov 2026 16:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUaEIJii
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so44125485e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Nov 2026 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500490; x=1795105290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tpnmaCejDTdKprdiXgHKHQFYAbbd0rQZxDc9JTWdcM=;
        b=fUaEIJiiAGmcdBn9M/kKtwCuasEsy0nWg6aZVSLNqsB7WuQGhzpIJdAdS45l7ftUzD
         WbK5mgH5y0uoZxWjthqUTVOvAGej498I8EHUdncorOahv8YR36loJHbTenULqmB9GEXc
         MlYVkzDWvQhbvPDymGsn1bRSOj9oE17NUuRYZLioxDU6VNKblOXu3hVXAAbgLRsoeAYH
         gO9xGf6h2iF+Xww5RO++JhUPpVGHcnUsdOLacut4A8knHXMNkO8UKhVG0c8JuZsf4ctd
         9bTjI4jiwkLpBbcCQX0IPYTkdWuWmOBU8v67D3nbVklhOLCRa2fPQ6QD9Oe9P6rfdPdI
         eh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500490; x=1795105290;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+tpnmaCejDTdKprdiXgHKHQFYAbbd0rQZxDc9JTWdcM=;
        b=j2oo6LVvc87lid+P0gWrC9DdG/cbi5cF2s2iQbg+4T93xz9iJragjPIrQ80ER/kMwR
         eFqE9oi1+00Vg2boQh+vVW2Xnjbud5cbToimxSJYR3w4wcWwNUk7QKhjIZErATnaa69h
         QnicLxjBP0T0GcmyrrOsHqTur7WLxMrlQRhxl9BLhykTWA2OHIOTyZyphMnt/beuccoJ
         PZ3/5umI2yUTQukg3EGw/fKnzKrzesvTPNsDyjBGQaoA/mHdZkGnzzMBylmaMDuec28v
         UQftFSZo2IUKV/YCunyjM3EdNfUm3HE7uU2tsK4gpgnmAGzkq4M6dNZAsZLGAG1hjcoG
         lSZA==
X-Gm-Message-State: APuU4Z9jAFbYhSzX5CrAvlxOFof4P2bo2eha+X19BR+T7kLrqtZdzoGi
	+od2K3ztzfJRg08A3Rf0Rf3a/TGCdSh0yXFxfWF0Ox8zd7GePUAQ7RZl
X-Gm-Gg: AYBFou2FuyB2OwZ2lC4xAfs7j9VF+27rev+GJ90eQJ8eLFvLplu6XGOrkViZ4RZR5Wz
	n6xqJJEvcYCeobQaLr9oAttotjhmW6zuUEGZMlUo8j+vjfR2hIxn6rh7BOu+y8DwoGMrGKohqR1
	iXnh6YlBHtOJs/f1gBuZjHpq5An2IHbJvPT+ZpGbPUo/PgsegX1X/XPiXAU8Uwvcer4aqFeJy0C
	ULuGjHS/u6dqts03nQ5CtLZ3WzGWXPbpUyK+LneGwZzUbfDpDl5n4c7/XiPN+hYK4F3+KfoMGO/
	HStrabSzUo1szf8VlORzR5BuWhksusqPvGazQB/4tcQJO/LHY66MWLEwcxBGcJ+BaEOl8pN8O+5
	o76KXktdEkME1mbfdTvfG5P8AHLtsi/24pE4S0R1TdZf087zra3ASff54NZObVg//nfRWrp1f5m
	o0Mj/8IIIID2f0AbieHzxcSw85PHUKEFBFVoONP5Rk0A53t6tGHqO3S4FVunjEMhrl9UziLbseK
	Ber5C2mBUsLZ3trmpLcdFzVCtA/YLsyLLQPxm/5LTI6XcWrP2XGXF4Z5/w1ph0eON/ncT8UYjhZ
	0w6XqiTiB38WH5IY22FTFoY2z/U=
X-Received: by 2002:a05:600c:8b21:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba093b9e0emr115495835e9.22.1794500490185;
        Thu, 12 Nov 2026 08:21:30 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951f237sm97155965e9.4.2026.11.12.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:21:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/bridge: tc358767:  make read-only array ext_div static const
Date: Thu, 12 Nov 2026 16:21:27 +0000
Message-ID: <20261112162127.1592210-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array ext_div on the stack
at run time, instead make it static const

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f61c619fb305..3735e8db9e82 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -593,12 +593,12 @@ static int tc_pllupdate(struct tc_data *tc, unsigned int pllctrl)
 static int tc_pxl_pll_calc(struct tc_data *tc, u32 refclk, u32 pixelclock,
 			   int *out_best_pixelclock, u32 *out_pxl_pllparam)
 {
+	static const int ext_div[] = { 1, 2, 3, 5, 7 };
 	int i_pre, best_pre = 1;
 	int i_post, best_post = 1;
 	int div, best_div = 1;
 	int mul, best_mul = 1;
 	int delta, best_delta;
-	int ext_div[] = {1, 2, 3, 5, 7};
 	int clk_min, clk_max;
 	int best_pixelclock = 0;
 	int vco_hi = 0;
-- 
2.55.0

