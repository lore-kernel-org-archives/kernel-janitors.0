Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D3249F6
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ss1gdOaw"
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F186BF
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 06:07:45 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9dd3f4a0f5aso428211266b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Nov 2023 06:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699279664; x=1699884464; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jgVbQBMI5zlzuMwMovjOCtuCkKuAbIOmNERMV3iGn8=;
        b=Ss1gdOawSLk562KDgAPkzMePiz7ZfM3SQfm12CWR06JMI/HqUx2fqdhx26w7HrxpKi
         4/jFGilD6s7FcpJSbIN0YU132NZJeIrm60C9H6ZfgExI29IfMn8QfC3bLfXxqQ9gauU2
         wS55g699atiQPTdgdQsdO7e6e3HiXcBMsb5lRPf+gQIZKK/XAxhbKiIPhmA4Th9fkDRr
         oKCaZzG9Jiv4/5WlEyx8a7GZ1TxwtNYZ2WE8ehO0mCJ1BzWr/BX21sYfQJF4NjixHW/Y
         R7W2TFkMzZ+nB5bnyU7/rruqutm5HleKNNqz8lITtVn/uvO/13LOSdKJhvEi09p/d3Hm
         oCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699279664; x=1699884464;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jgVbQBMI5zlzuMwMovjOCtuCkKuAbIOmNERMV3iGn8=;
        b=ND3/JCPGreCB3kmCsU0b05TYmjBieiJR2ScgRPO7XRQU/x9D8D3ZBUb3X9mEmsk66Q
         wagmUuCD2SE2X5P4mS4zD97SpUX6fXvuUnXf18sIpSb4jTObik3eWEFCXKk+uasn0oqE
         xKHmUvdIInPqVAsrGaE/hwi45dB63GRgY7Co9L2XKgXthaFUCK4NRJZeQyYPXu6YBfpr
         L8Sa9H0fvJy+Mkh5RIIXxTXkrnaxQipsFKRMcpBrd9nkktk6+2eUc04V2mOdyobOJT9G
         imzy7gedaX/BxpcHAis2it9yO5GGVY5g3Xfp3yyHQYctnlEheLVpS0wN5vk8R/iJvPA9
         ZCvA==
X-Gm-Message-State: AOJu0YxbcS1s3x3V8ADmcArvJDxR/w6l7KMm6vwyuFtmHOIpMv5bQjSK
	Tjs5V7FbTPZznLnpRJaKQo3dFg==
X-Google-Smtp-Source: AGHT+IEijAt6Ah4VQuBzxP5KzJ7RXy+VDCSC0/AOkIK58u2UR5ihryIsP11l3ucRzoRTNGBW+qK6/g==
X-Received: by 2002:a17:906:db01:b0:9d5:9ff5:ce with SMTP id xj1-20020a170906db0100b009d59ff500cemr12398157ejb.34.1699279663769;
        Mon, 06 Nov 2023 06:07:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id kj26-20020a170907765a00b00988f168811bsm4164464ejc.135.2023.11.06.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:07:43 -0800 (PST)
Date: Mon, 6 Nov 2023 17:07:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/damon/sysfs: eliminate potential uninitialized variable
 warning
Message-ID: <739e6aaf-a634-4e33-98a8-16546379ec9f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "err" variable is not initialized if damon_target_has_pid(ctx) is
false and sys_target->regions->nr is zero.

Fixes: 0bcd216c4741 ("mm/damon/sysfs: update monitoring target regions for online input commit")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 mm/damon/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index e27846708b5a..1dfa96d4de99 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -1172,7 +1172,7 @@ static int damon_sysfs_update_target(struct damon_target *target,
 		struct damon_ctx *ctx,
 		struct damon_sysfs_target *sys_target)
 {
-	int err;
+	int err = 0;
 
 	if (damon_target_has_pid(ctx)) {
 		err = damon_sysfs_update_target_pid(target, sys_target->pid);
-- 
2.42.0

