Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73D1A23AF
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000563; cv=none; b=HvFUD7MmHrPuRMemjSRe34hKVJQukLvhVmQal0lxmOema43++XlcYmuyyy1t22v9yIwUkALatHZe/4VqWZ6vQtAv/TLet0go0HzOY6qMJPM0emeDAbuSJo1gjw4xH8gBNlE6KUztKwy2r69MWUHzRdYMtIt9higKcSRDp1ncAHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000563; c=relaxed/simple;
	bh=6UtymQyXrF4a+LYasF9PbN/zB10qj6RgpAwI21LybYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZQ8ViFVxV3LQ9RSLEL73ZWaoUSw9cPrEe2jw9ch5VtJid0BhN/B4lUw4BM5UrZzDx2jsReLxMAYN8NENCXAxBjpX0MmJ728WDFbh8UzDwexnffNIdKsgGWK4/NMn+gcWa+b2UQ/d6SvjmMiAuwEEWYpbnOqfA9A+nIHONpZzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vOZeOOz5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vOZeOOz5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-440685d6afcso64184645e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000560; x=1746605360; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpACOCF1MHWzD96uBtOOM0CMYYdJxW2a4szy+v5N/qQ=;
        b=vOZeOOz5yTZMNSVQis6JmcE17LzgrtvDzL95xWFk1ZCNbZG+Jy+cOi09QNxxqodROj
         SMLVCvpuW+l9ZJigj0Ukr4Mv1MyUiPFyHqXEL7rf9dDlpgq0ueNUqevy+/MfpL+3F1gz
         xqt9YI6+znI2EOi2xKnKZ4u5ril5Q/W84b1yHd9mD+AaLhxV9m1bljCz6ftEgnQ0RHiA
         aJthFxsym3cy0Y/65D8Z7n3t1RxVh+5CbmVD4QoCqq+TpFxFv7CxV2Pp54r7+pJuNXpI
         8VpPam1yPFzOwZmXtUaY1OmcE+srUiU+0VA5ewfk1+uDVKiIBQZeeopAmec53mWl9eYo
         b0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000560; x=1746605360;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpACOCF1MHWzD96uBtOOM0CMYYdJxW2a4szy+v5N/qQ=;
        b=XxM9muEo/CkD+pM870QLXPsUV1FIS5jh6YCSTymTZZnkCkkTtNLhSB3KX1YrKxXpWd
         8MqlIdUWIONbtyiqUhUp/rE2FAWD9p7EZ5GwtKcw8SSez5uhbeCmrF9gyqdMiMDE2fA7
         q5cBCOAWicqqPonU5yp+ZIHxp218knzYjo9WbH/nr9a6k2tBtniUyxWkLCXfQQ/lUO1r
         ggxz34Pl6VOqMMStB37KRUJEqZcq7BiadPE33CXuO2nXxQHz3RvH9ayRMqTCgve1DC6h
         SrHKOdSptY7NfSCwHZgbZvM70zD8+1LZAYvm8O4Q5Z4TIG2x3yfAkTaC5qfMxLUIO+Nb
         +Zsg==
X-Forwarded-Encrypted: i=1; AJvYcCVGser40JqsemB5ilStgHlkUfUZyNmuesNWtr6zw44KNOkUzl4vXG/mqTnrxmkPtiSHI6BHckCHVPAi56niWOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVfvU9CNTp0TieyxR3K1+lhFZWzo+lnbT/q9HLIh0kAZ5zpiP
	Zh8HTgkZ0q7VLw8MF0cIyBaN3RhniT5ftjEOF4Mobl1k+6zuRCQMeqEigWZ5Dl8=
X-Gm-Gg: ASbGncstEUERuxfk2+wqAY1Cy/JcsmQE4ug3/fe+ZGaspTb8thE2UlwUujoZbcdQc2D
	pMIqk+pZeSgwptyr7nmVp0gD7sE4WZaLTQmUqqKdAGIQQuYlr6mV8QT5P8Xa+KgRrZQndAW8y47
	EsmZEwZC2o+FkswDB2JdD7yJS0DJ0cse5NgK9EgRxQLfZHJ5uVja5bnOHzVhlyJib+35bI92ry8
	yJAQaO8GodnTU+eBJYM+s6EklIXBCbQ7+f0MJTSZENfPTGFrY58qTtCM8q4ysk7A8BsOq8M3EBx
	fL1oMBufOjfjCN0p/cMQHeFAOsF2KT32IJrBj7CqK3xGww==
X-Google-Smtp-Source: AGHT+IGBq83nOcN4b+oPM0CzEXiI7VyG2IzTaGKGL8JICGk+35Wr6Tatqo6c5pr6+l1Y/IIGhYQN/A==
X-Received: by 2002:a05:600c:35d4:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-441b2635580mr12479415e9.6.1746000560243;
        Wed, 30 Apr 2025 01:09:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bbbe88sm14908225e9.25.2025.04.30.01.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:09:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:09:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yi Zhang <yi.zhang@redhat.com>
Cc: Don Brace <don.brace@microchip.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	storagedev@microchip.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: smartpqi: Delete a stray tab in
 pqi_is_parity_write_stream()
Message-ID: <aBHarJ601XTGsyOX@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We accidentally intended this line an extra tab.  Delete the tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index 93e6c777a01e..1d784ee7671c 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -6004,7 +6004,7 @@ static bool pqi_is_parity_write_stream(struct pqi_ctrl_info *ctrl_info,
 			pqi_stream_data->next_lba = rmd.first_block +
 				rmd.block_cnt;
 			pqi_stream_data->last_accessed = jiffies;
-				per_cpu_ptr(device->raid_io_stats, raw_smp_processor_id())->write_stream_cnt++;
+			per_cpu_ptr(device->raid_io_stats, raw_smp_processor_id())->write_stream_cnt++;
 			return true;
 		}
 
-- 
2.47.2

