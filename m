Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBDA6D22
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEIfClgS"
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399FDC1;
	Tue, 31 Oct 2023 01:42:45 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40853c639abso41994735e9.0;
        Tue, 31 Oct 2023 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698741763; x=1699346563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AROgZw/JVvq+68xbNYsvRy/4pT+NfjXN2lg6x0CjG8A=;
        b=hEIfClgSZNaP3I6eKSGlPQF6PJqqGnSF1OBnFjaBccKWtQDxZVdULZcUFLG/i81G09
         Ng7FbbE9DcK20cdurESAuvslDp/dzHGJd9MvQCPQBDx0eCXi2O+BhBHzwxSJDT5FcqWX
         K+eT7sv1wEYE8XyelIlGCwf27YEMFOZCpYKzkUA2n1+8UE1QvM2XPH3J+ChJ0X9KSsvV
         XxGN8w03hsYfimJBFltRwFAqDk+NeWnE5tVJpngGFZt9IqKt0EcY2Hc4sahDPS0/VOvZ
         1ikbSYcxMvRQfIf4JKjzO+KOWpKL/IRzLJttcJcwkiYh5P0g0FDnr3eDdObMWt/bToDt
         3XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698741763; x=1699346563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AROgZw/JVvq+68xbNYsvRy/4pT+NfjXN2lg6x0CjG8A=;
        b=F/g+gFX301U+BGTQRMQkQSYQ4jJBczRdR+PWRelFsJ0WswefY/q0U4WQcPZIcvGpfl
         k1DWhv8/eCgXBBc0jFD52zNn0scmDHit36xSaBa2aYnkIz7TrJmqmMG0kLKZ1J3AS/Uj
         KAK/eS/fmvYlcX5oO1YREpuqPBjgTwHDYM0GwrCeGHpfMBIDqqQWSh8mxSnlaiKllxb9
         H8zkpnArjzNfjV4jKFcrXQjHY1FP5jmQKwPH6CciVNdVd6gLqiG/CFsCyhyo6nFz3oWu
         lcl+5rxlQuv6kKzAbFWIDyDPF1KtTlp0f3cXljXloyBcH/zF+Js+dHIIL8ghbgmNNFgV
         uvkg==
X-Gm-Message-State: AOJu0YwTDtYdqpT1YAJk5WTeb2gUT5PcMY+RxnubZkkz+zzltKMgTpMT
	0h/TQ+xyXWL1o/6yGK+vegg=
X-Google-Smtp-Source: AGHT+IHZDRSngvhDQENTdP/LPwLPHEITHKXi7mwWdOtvMYjLB8/qRkJ++HuLwOr0jzkp77KVReCxhA==
X-Received: by 2002:a05:600c:5251:b0:409:247b:b0ae with SMTP id fc17-20020a05600c525100b00409247bb0aemr9418327wmb.36.1698741763356;
        Tue, 31 Oct 2023 01:42:43 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id fl14-20020a05600c0b8e00b00402d34ea099sm1083873wmb.29.2023.10.31.01.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:42:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] hwmon: ltc2991: Fix spelling mistake "contiuous" -> "continuous"
Date: Tue, 31 Oct 2023 08:42:40 +0000
Message-Id: <20231031084240.2148339-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_probe messages. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hwmon/ltc2991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc2991.c b/drivers/hwmon/ltc2991.c
index bd63c61129a9..fc53fdcb2b6c 100644
--- a/drivers/hwmon/ltc2991.c
+++ b/drivers/hwmon/ltc2991.c
@@ -373,7 +373,7 @@ static int ltc2991_init(struct ltc2991_state *st)
 			   LTC2991_REPEAT_ACQ_EN);
 	if (ret)
 		return dev_err_probe(st->dev, ret,
-				     "Error: Failed to set contiuous mode.\n");
+				     "Error: Failed to set continuous mode.\n");
 
 	/* Enable all channels and trigger conversions */
 	return regmap_write(st->regmap, LTC2991_CH_EN_TRIGGER,
-- 
2.39.2

