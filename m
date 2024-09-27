Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5A188CBE
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727434759; cv=none; b=NxlRXY/1GV8PSMAsRVHNai87sy+qZfGBk4H4k6I9AVQXIblgKhGzvQ4IxEic5NXrce7er2Isitwy72Eg2SISsIWn5BzdWcDz2GcQwS8Zd2WKcXxcoJAzllcM6/g5mQFy6nOllLnDibZDnw0g0O0kZBQtSJOjA4tQatd+fy54Me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727434759; c=relaxed/simple;
	bh=K+n6eQ2cPWYy/Q7xBym5coeLQ4dzkxS9PZcW+gm5rL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNkBdXhovEsReyvcnAOyogGKMq9i6rGiY9c8DcxpTXyDWn3HjjT7UzM3zb/17iqE2JH9xSi+jmblJ2z1omISZsM7IvH/7Tje5xMXQfcC+Foq4BUv7Jp3JTxxglkH3PzoO4mKel8wkDQk2ehmsG0fU0QHh0JunZ4blUPSmzswVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qv2F5Ryc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qv2F5Ryc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so18127535e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727434755; x=1728039555; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOcCuvst5c9aq1+1+H/oqsCFu72PdUTTrjxJNpE5Onw=;
        b=qv2F5RyckjRqVpbqJIPQ8/jP/gmP+3Q6dj63pUQZ8dbBMN4k0+H6ipeJbPmPV1XaUV
         0xzbE8e1k6lUbB49zUKAGPAnDZt6E/gKG/ywzR7Cf+Uk/N9gv62zgipykLSfMKO++C/2
         sxu4kpBen01Lpyizy5FtJvXBCS1wtVakdIf4AkqqHMQMyOUs3SeD8XFqRhDSmcQISHiT
         V38DIk9oTLZIjKyqIIhx8fAyVZGt72jeg4asnMMaPkEd9a34W4wwwdle9M8hZY6jlYOr
         ftAc7KdGwEd2ZW1ZQ3wyFc67BbxJSgVPS8edjAUPoXAwUpzm+j+MOhq/T1LhJOzaiS2L
         VcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727434755; x=1728039555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOcCuvst5c9aq1+1+H/oqsCFu72PdUTTrjxJNpE5Onw=;
        b=ZI5zQG+EPvNmNdrJThZHtE8x1Hk8B6tv6BcRKsRBiiQ+93vwqzRxuTEsR7WQ1RHE+w
         Dws5H8qpuwRFF6hCRuNxHG1s+o2eTo4q1yn2d8PCabBwQkLxpzEXhkY9qeoIMzkyKTgP
         xwhTr4MHxVRqgcZDHQDCsITXMsqWxCKqhUnpKhujRJ2/svv6+kg20d2XUzZOarlP2TGg
         iIt1stNSHfG29T9+HFHVulrSS9SgCcyrlTfruOpbSBK3ohjX1RqgzwCK4UCBSRoz4H++
         x3uo3fW8L3QQJU69ahOIu7zWeF7S/CZYMOtrIDW8YrkGqazStje1km0ZdIrfa3vm8Him
         kVQg==
X-Forwarded-Encrypted: i=1; AJvYcCXvVhvR91D9OzPoa7NPmrYG4U4AWn3Iul05vz9/T4km4G7r0fnOfihoq1GrtCuHDDOaqsszcyJ84DOtb+IV2t4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUdpPK0o2WzvBGjE6Lim1EZoE5YDu+aLpUvbgR5XwVznDp/pK
	JDjWBvMTbuwBhpV8bVHoTgy0tyvsYxJl9PKyg44lY3rInbMcV6AUlmSEMo689XA=
X-Google-Smtp-Source: AGHT+IHi/PHDsl62KtWlOzp+Dcam2NyjyJD0k5ABYyerS+WOMWUgAw79d/BmDfY9Wq76LyxaPHp8MA==
X-Received: by 2002:a05:600c:5251:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-42f58491029mr18750485e9.32.1727434755137;
        Fri, 27 Sep 2024 03:59:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e433sm2172388f8f.36.2024.09.27.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:59:14 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien Massot <julien.massot@collabora.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: i2c: max96717: clean up on error in
 max96717_subdev_init()
Message-ID: <ZvaP_pm7gucwK8Vz@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Call v4l2_ctrl_handler_free() to clean up from v4l2_ctrl_handler_init().

Fixes: 19b5e5511ca4 ("media: i2c: max96717: add test pattern ctrl")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
v2: Use correct Fixes tag

 drivers/media/i2c/max96717.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 4e85b8eb1e77..9259d58ba734 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -697,8 +697,10 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 	priv->pads[MAX96717_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init pads\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to init pads\n");
+		goto err_free_ctrl;
+	}
 
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret) {
-- 
2.45.2
