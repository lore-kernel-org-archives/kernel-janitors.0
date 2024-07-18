Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398D1B86FD
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Jul 2024 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721327429; cv=none; b=BcaM/+bxp0csxX7l2rnDjOyWDB2TxDA0MYU07bq7HkphU79dlDc5n943i4T1KDEzvZjZQqnRvBg5mp62h3BWDAXXq/Z0zTxu3xJlHg5hnmcLjg72iCpFFIpZINw2O6Ih207atPoBeCPdASzjkGJ+qOyw++AuNnY2S+G6LxuCnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721327429; c=relaxed/simple;
	bh=TD1+61nPDe9jB/4IMkUiQtOBgJX2zOKDPnI9xvRyrmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqsGjB2w2y6uG2lbCduhQPcUOPDgDj6VZQ3WWMbKSRhK+S6+waMzkioMyAkIIhIgIHg7YDpQJXt3+rM3AX7+QvDP9fszcDtZBX91inKJ3M9Mur26eNqgbcRffQJcV+CMiAgbFBdweNXcZERvD0XRrCv6dN2z9sI7Umx5QVg6qRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zpUxQU4T; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zpUxQU4T"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ce74defe42so668479eaf.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Jul 2024 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721327426; x=1721932226; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu3L66gXFcN3QKFM4M2IyGwT//LPj6mk9IKjJSFoji8=;
        b=zpUxQU4TO26i8UraVGq12dc8lXpwW8VwUIi4sOTAqDqlwtCHCCPyP5k8Mzsc2tGMJF
         tZV9N/b/sSC4e7Yq419EflIuF9L5UXaZsUKlHHYRI7KBN1BniT/jdliDTCgzGiRtxl1S
         SxtH+22VzYboTs05bcyUqD+tE0DUm5uMDAbsnwX65JLaFGHjJU9BludFXmvpbsS9NmLY
         IUcwW++7fHhbKLXBPE95lZzAk92NPmt6BZO9SM9B+Tm/MzIa2wlhkdL1BZUSfx6XkSil
         4ciukqcl92liPcdipKH5oYnHhufyHUey2MnWfRjUPA0uxL/QsSLt2Sl7sFg0lA4ipAqq
         W4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721327426; x=1721932226;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu3L66gXFcN3QKFM4M2IyGwT//LPj6mk9IKjJSFoji8=;
        b=TfJzVFzTsQRcC3ZvENJxxuoK0BlmdI9MyC8dkLXVflv27Bu57ac5ERzuSfzufP1jgo
         NVx9NQ3hQcyKh9IiH4ALdfc5dzuXesMJy5OH0/nIRNDr6SEd5l8CwUgNF0nyoKjw6c/u
         RZrqPz8i9oJHFXPoPrg2/w/nG6cUzt0jd9MsF+pB2NeMNDdeY4t1Y4cOZyMtX0F/A555
         /GQ2A/sqe5uB0+d6sjCw1R6rrCqRZtipkIEQxtSHUjmaJL8SWBM05v6FOjNdGSfqzYH9
         LDKfjtIpL+1b4jybJYsqZFtT/BegLdlNAMWelFFB6ADMLMXfzBXsaVzy1yvgED9/XC+1
         rBQA==
X-Forwarded-Encrypted: i=1; AJvYcCV8/yHQ5CNfdEBkKsck81wUp+Z/+Pjsb1vsEjeyMabvXUkNpNtrGKZXgtjP9EKwfI5mPx1ImVijzE9iyZL9xBFPuM6w25ysZ3t2qmTU7TJ2
X-Gm-Message-State: AOJu0YzVrrlmo11aZ1HYJE53P0JS1y68d3sLhtQWvcjp2j4mctp05BFo
	HMlN48GxTnt4NFeSGBlxg1HWOFJL/gGW+vVVPQbNqHBzjb+scCg+koCfl3ANaXg=
X-Google-Smtp-Source: AGHT+IHfVnIuNs7e/rNBEuwsyQLUJ7M7eNZl5L5eDW+zD/V5s9h31Hxelwx+b54/gMeTAXhX7pudZQ==
X-Received: by 2002:a05:6820:2788:b0:5c6:61b9:20ba with SMTP id 006d021491bc7-5d41a4c1e69mr6849785eaf.1.1721327425729;
        Thu, 18 Jul 2024 11:30:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8d5a:14eb:55d7:f0ba])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d3ca788101sm641622eaf.16.2024.07.18.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:30:25 -0700 (PDT)
Date: Thu, 18 Jul 2024 13:30:22 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] i3c: master: svc: Fix error code in
 svc_i3c_master_do_daa_locked()
Message-ID: <e017edfc-da64-496b-8516-958bec27cd9a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code has a typo so it returns positive EIO instead of negative -EIO.  Fix
it!

Fixes: a7809cb368b9 ("i3c: master: svc: Improve DAA STOP handle code logic")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e80c002991f7..0a68fd1b81d4 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -874,7 +874,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 				 * address this time.
 				 */
 				if (prov_id[dev_nb] == nacking_prov_id) {
-					ret = EIO;
+					ret = -EIO;
 					break;
 				}
 
-- 
2.43.0

