Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746076FA3
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7FMku3S"
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FDAE7
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 00:52:54 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so952767a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 00:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698911573; x=1699516373; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZB8wKHR2GCoOUIZjsxfdhK1GvR42tznRCv2fWvaKCMI=;
        b=s7FMku3SRaiFt2uPLrc/wPqRhuvk4xrFhQbgg5U1dDWQQvaJryJJ+zukOR1F3EWXZq
         hJhlROVnGQHLyEHjN4wMe5CjP+CLPWsyRf5X5PJ4QFlbm59NqQvkMFuCVtySKmNw0R/k
         XGYMN16+UnLjLPZqJgqHAIGtpSWFZON7+dgmGwmGcR870OiieYV4p35+4G6jXfCIyPk0
         f2CkQd5gkLbnVNrohfusFZqdiI9LaMD8uTf7fzX25mrW4VVzB71Xg6GdB4Vzuk4gGhjo
         F1ktLZYERREgr97PsufsRI1jETbwtFpbTNzJpIAyxKPGpwswZjlO3esidWu9aYvqohBL
         nCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698911573; x=1699516373;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB8wKHR2GCoOUIZjsxfdhK1GvR42tznRCv2fWvaKCMI=;
        b=JdBecLORitt3JrfmT3C6DJ6XaCDMgFmokEA0KKSpvR3VLYtf+idfi83gfF0z53mulD
         TV6MYqsUX3UjvmNNzGzE3lD+8M7DHHa6ylc9SuVAIUR7i2NbWRCXsFLrxFKWIzY47Hne
         rvhxchjUWyFth60p9KZvbj8xdYo9KTLsX1phLg/WtRpG8HA3jdYDQZJe4jxog7U97Fvh
         qNQhxKhvJimh37cSt/NzET2qYQpJodIig3zkHIsux3ZLvWlv+O6h3T39PpkLXo2JIi7E
         cI7RfMsq67KpqwspRm8KhQOV/Lu/txHoEhJJHY3UFJUBChUYY/CTu1CrWv6ZtRWKuIL1
         LTtw==
X-Gm-Message-State: AOJu0Yy2qDJsZ4iM/tR6yDcvVOIBa1zPL7qt5kx8BXxyOILlX2Ps6MUW
	pMg0kAf0drvSCQjfBXE6bCAMRQ==
X-Google-Smtp-Source: AGHT+IFL5Y8/1vTkO9hyu9M8zIUaNLNVn1YUA53tJj4WyrvRnd5DrSPFYwNjnqiwdTG/BzWiHDuelA==
X-Received: by 2002:a17:906:db01:b0:9b2:a96c:9290 with SMTP id xj1-20020a170906db0100b009b2a96c9290mr3168560ejb.33.1698911572940;
        Thu, 02 Nov 2023 00:52:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j8-20020a170906254800b00997d7aa59fasm818443ejb.14.2023.11.02.00.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 00:52:52 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:52:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] coresight: trbe: Fix an IS_ERR() vs NULL check
Message-ID: <ee0d1f92-b0c3-4f4e-8e16-2aabd47a3447@kili.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code was changed from using coresight_get_platform_data() which
returns error pointers to devm_kzalloc() which returns NULL.  Update
the check to match.

Fixes: 4817af577b82 ("coresight: trbe: Add a representative coresight_platform_data for TRBE")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a3954be7b1f3..228ea85cfc74 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1265,7 +1265,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	 * into the device for that purpose.
 	 */
 	desc.pdata = devm_kzalloc(dev, sizeof(*desc.pdata), GFP_KERNEL);
-	if (IS_ERR(desc.pdata))
+	if (!desc.pdata)
 		goto cpu_clear;
 
 	desc.type = CORESIGHT_DEV_TYPE_SINK;
-- 
2.39.2

