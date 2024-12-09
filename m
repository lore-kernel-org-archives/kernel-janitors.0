Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6AD1BC4E
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Dec 2024 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734887; cv=none; b=R2pxnb+Sn3FrjMZQZ0xvO4j311LV1+LntmGYqU3V+KTHtygRDN87qJ6C36mafPfqvkFQs3q+ok3bbrSzKUfyK/Ks/DpX4oChPDSXu8TYM2YQUq2HweY3i+FG5lVonXnZJpXdgUtFs488m4gZVIytb5z8BOYYUrk+gtHvbqhEaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734887; c=relaxed/simple;
	bh=WpDibjcHfnA3hlnUvjLGwyhWaTaamib5k/eDBpn4uPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGS3BHETrbKwN6m59YDwxfv79hkRsNP1XVNNNTOsIHEbbY3xzFlMdpoo1AhjPoNDHnkmmVENJtHKnJv2FQJlAks+Fu7I+/3gmiVUobChkHJ94zBIFjvE1N3rykdMZ2QgUtm1Nl8W/kKYEGzEdaV1IlGGTQ44wSBoamW6FNCj0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yC2aSGl3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yC2aSGl3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so45668315e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Dec 2024 01:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733734881; x=1734339681; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfmkzNoJxgWiG5Z0g0jcQ4NV+0tXwsBrqoBTR0SIamg=;
        b=yC2aSGl3FCWAYmdwMFszZmWyV8j+Vmm5Tf6AeoolwMCgTywARxZZlOobdvynrsD8tA
         hdrnOAII9ukVgF0CnnRZxyz0ciY63w96loGG7Y1HzZRcT1ZAINOtoczEHpgwQkGmqQ7G
         xky8yhRvCa4JWRKbKRYhkWZGpy4Jn9k0+ClgRCR9iZeGhJkez7SjwNrRrMUFIaU8Dcbb
         d6IJz3GAMWhTNC1JoWSzvx2hUzKQxLIatgTWXLNc3wAQvF4Ga3P+LBsJ/CAJY1appRu2
         rPpqyeDMM4t5EGEO7fkL1KpNIHoMfFknXLvj1HKkAV3kFQxoDIXY40kF3s7MPw9Hcftd
         Hl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734881; x=1734339681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfmkzNoJxgWiG5Z0g0jcQ4NV+0tXwsBrqoBTR0SIamg=;
        b=cu/DIQWIU6LyaAmeJ2DkFClom61hzNS2GE3YsYL4qgFrmoKR5SLyntTeNKonuOg1H9
         AkByv6u1/8YkO7tRgfQB07M9rpvCao0fk+8t836SUdmoaE36mZxgWkAtPrPC8yXHo90p
         doepH02xJjAvFKPHe3MDtX27ydmQ0Mw9w5Rj33MZb+VhDPt2o3ifoxqfUPm+N/qSzi0Q
         44uOxvbaGbG+OC0UKZoZeUozoseDh26dZXSO8t6v7ytWPVfsra0+cdKdR0o2pJd5THrT
         EwcBJiLMFxn6H1/BRibLKGLCJmaK36Bik0vdd+38Fgg4+/ZwMr4A1evObyu5DaTVqMlw
         3Vbg==
X-Forwarded-Encrypted: i=1; AJvYcCVhMeEQ1oEZEOqjhqYpJKIIt4H6BHeqDpHbvT0Ch59qGHeL2HNgm04UY/uainRaoMYafkxRJIA+GbE4BnNgrTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZG3lCATXQMf9sIGNnk3kIz7PkQJkpkSgfol9A6markDIc7mNh
	H+p5B9m+3hSIUtgeTywxDf9vzl4NPotrAft5eq+flwZPogSTGoc4EiDAzCbmHuQ=
X-Gm-Gg: ASbGncu/RRX034Bb5z1IjmIRTBM4Pk9Y1wW33mVfjrHqkOFtZn6y8ZKeQJJ1+uXKEtv
	51DT+rVSBgAMVnnahaGDYRMmGyQKS7Ssx7KT1LznZ/y5RKSttx+SrbVNvWIhfL+pcWiDI7AZlvT
	spb2WQxua1POXgABTvmJWSOeiKr//hr7S7ebxrJE16YAjWY031M4htxE5F2tizTbEz8Qvi5FUVt
	DniyL61OSkUwTBzyJfOKQcd/owJmdU+b3jcjMhH160symouHXdJATg=
X-Google-Smtp-Source: AGHT+IFmp+9Cbk91wy/S26/TnevCyDFcz+T27bFU4Ss//r84rMuo+tniIyTuEqKycjEZM1O5HWZh/A==
X-Received: by 2002:a05:600c:3144:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-434dded67cdmr83625685e9.22.1733734880111;
        Mon, 09 Dec 2024 01:01:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da119abbsm151793365e9.43.2024.12.09.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:01:19 -0800 (PST)
Date: Mon, 9 Dec 2024 12:01:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <Z1ax3K3-zSJExPNV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The "req.start" and "req.len" variables are u64 values that come from the
user at the start of the function.  We mask away the high 32 bits of
"req.len" so that's capped at U32_MAX but the "req.start" variable can go
up to U64_MAX.

Use check_add_overflow() to fix this bug.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: fix the tags.

 drivers/mtd/mtdchar.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8dc4f5c493fc..335c702633ff 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -599,6 +599,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 	uint8_t *datbuf = NULL, *oobbuf = NULL;
 	size_t datbuf_len, oobbuf_len;
 	int ret = 0;
+	u64 end;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -618,7 +619,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 	req.len &= 0xffffffff;
 	req.ooblen &= 0xffffffff;
 
-	if (req.start + req.len > mtd->size)
+	if (check_add_overflow(req.start, req.len, &end) || end > mtd->size)
 		return -EINVAL;
 
 	datbuf_len = min_t(size_t, req.len, mtd->erasesize);
@@ -698,6 +699,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	size_t datbuf_len, oobbuf_len;
 	size_t orig_len, orig_ooblen;
 	int ret = 0;
+	u64 end;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -724,7 +726,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	req.len &= 0xffffffff;
 	req.ooblen &= 0xffffffff;
 
-	if (req.start + req.len > mtd->size) {
+	if (check_add_overflow(req.start, req.len, &end) || end > mtd->size) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.45.2

