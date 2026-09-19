Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A14734EF
	for <kernel-janitors@vger.kernel.org>; Sat, 19 Sep 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815129; cv=none; b=OywqjtzilfNcAVZkcx8YPisV6xGCIZPLoYCGE+BDDoJ0WBbBEKRg7VULzzm+oygbNkSKJeovIij7uXUrztDVgICk2OdDm3Tt6k5wIuUl5+89TzED8YghUgjVF08L+UsU+PAws+OB0jORTqCXk6LMhvnk3VEhao2wu6vGlMcywuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815129; c=relaxed/simple;
	bh=LIw84W8I9k+LuqPfSmXrRVw8sCdAF6oA5St7rGy1o+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EiBRKRXk1wQQ/gE7eTbkMy3de4gRZhzB4dek2DgRBe3JSCpSz3r5RiIut1x8NcuhNHx8IGvHBo5OJQsX4YTkiyR/i0iSoBJfCfLVOuhknMwO2H6GejJDNxG92nfhct55MnitRMd6R2RZvRlA9NC2pjbud5u1eSxEbzd5dcEWJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLsWhU4H; arc=none smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLsWhU4H"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1085153f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Sep 2026 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815125; x=1790419925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBLQW4VRriwtf+wFPBRMNLBW9l69Xiae7tic+lQ/H3g=;
        b=ZLsWhU4HWRk+4Yzs0yAZvn4brNGHz5Uzaovx5peaD1+COeIXG7PFiCDpjaHJ3cAEKb
         TzHr8LF47ChslBJpm0g9By5K8FgJfi5uCNvXSNpSW8S7eJCSRdDPK5m00LJkmjWzYsim
         QPn4uEfEe8aW48Yc/EkCP25nAtfza5y7VUt8MHtxF2naw4iKsguhWWs9S9cnvubBnJJ/
         rpjT30ldmdNLRzFT3oF1UbvVWJTmJkxj4mN0j8LqcLNc07TOFdX+l+C87yaWVvyVwQ2I
         tZ6Jjbp3xT0x5vV5Okqg3OYc4F7gc1wNOHqrN4FMSzU9ncwDNQqApytmuJHbk8Vlwufr
         J+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815125; x=1790419925;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yBLQW4VRriwtf+wFPBRMNLBW9l69Xiae7tic+lQ/H3g=;
        b=UMbMgM2vGDPZofR6LcmjHVM8Z8FmcN/yCx/LCd3P8v4nw9ASWUloXBr/VLL2hlXxRc
         w09hk4YVyJHTdYqkSwlDwS0wIVfLbMTVvqIzah61Bc3gsNPfrgvc1HQp3fqanJ8xIL5s
         E1PxbrZNeixc/3ZvzpFDUqfP0O007BOcRFexINJVwT6KDy13P3LI0Nua482Z+FcKqHK+
         reKq1QgmA3y6p0lsZ2SG8638ApgLs27IYwkAMvO91VES85GiEoozmMncyWzJmnv6vlxY
         kMpb/CEoEO/ZM1oFHvHQa5eGaK6AfeUyDifi9iq2BoylhYHDv6C/1Ny22pK2tF4JT82M
         t+Sg==
X-Gm-Message-State: AFuF++kMiVT/aw/ZsRwyBHK/VfkdpuMg8Tn7qACUy6yR1tuVs7ySY+JT
	2zlD58AXqMpT3ZP1HHb0aj226dio35GCQoc805cj1Jlf+06APJyAgQvC
X-Gm-Gg: AYBFou3wpzNtzfXj2tU658O7oTuXYXOhzjaULr6tVqNC5XonHx8/ir95O2XtKuMeI1p
	RMzFtDjSWJ1fFvgquyOk3CFN7BhRTyLiZP7Tlx+XtB9O4XlN2rXyLRTmY6AczR8zY5QyqFoid0b
	mePSfOaVmbHBHLpF3MaXYlgfSBo7RF4FYlAiz7OhXDljHgBwOUId+5DA/VPwquWqqEKmjBnQH2+
	tz78862Q63knBYOpKhMILQv4McB8BZj9KIQuU2xJtgtLbrHQpGE9uBCTjupigoNBr6WMQkQ5OiI
	K0vBYbPRrReJVC6ixgSam/zNn9tdpqxYZMIURPbFnGeCCjIu0ek5rG+OjnoNbWZSE6Y3MoNhZWY
	JFc41McvJ2eSlTCfQp55kClgjXJlpIFqx2CgKLeHvO0dx8bpnsGrSBQqyGeZm14Cxyj1UPW417J
	Z/eh/O28ep5QSAfJZJmWGBovQjgAWvvuu4J6lVn57pk6Zce1u/cqfN9hgqGVVM4cOBlnExag==
X-Received: by 2002:a05:6000:26c7:b0:487:f37:7ec4 with SMTP id ffacd0b85a97d-4871e25e47emr7454274f8f.24.1789815125076;
        Sat, 19 Sep 2026 03:52:05 -0700 (PDT)
Received: from localhost ([5.83.201.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724595289sm6399768f8f.29.2026.09.19.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:52:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: os02g10: Fix spelling mistake "foramt" -> "format"
Date: Sat, 19 Sep 2026 11:50:00 +0100
Message-ID: <20260919105000.1875554-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/os02g10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
index 141b7cb11fc5..7d3cbf3d6650 100644
--- a/drivers/media/i2c/os02g10.c
+++ b/drivers/media/i2c/os02g10.c
@@ -488,7 +488,7 @@ static int os02g10_enable_streams(struct v4l2_subdev *sd,
 
 	ret = os02g10_set_framefmt(os02g10, state);
 	if (ret) {
-		dev_err(os02g10->dev, "failed to set frame foramt\n");
+		dev_err(os02g10->dev, "failed to set frame format\n");
 		goto err_rpm_put;
 	}
 
-- 
2.55.0

