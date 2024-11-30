Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693714B97E
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961250; cv=none; b=jRPdMb6HReH9oz44BtzzicMkYHbeRThoQL/Nyv36ZGCwF47hX2zl1DBOQMOoUUKXScMDsFBdeQJIBqUedDuyvBuhyNM40WjI50lbuBYcN1oPyiRB9mhN+P3VM2XLqBuvcIMPh+R8VGKwzPhfBgB92L1pasBToIRGVK8qxWH+cmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961250; c=relaxed/simple;
	bh=R+Jgx/e6IiVY0ZpZJeWh0nRjB/zOm/DuktMO1fY1cTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QexsnwM4xvWoW7ZCnHDJfrJ0qz8+FN/gOVevvr+dCwpcAeVJ65Z2r5O7yrV8oSALQ6pCHpi1egMe8cpyhC7R3HwqdIP/ue9OtRHdGax7K8GUGEvGhSZXXDbm/ZLIhFRXB0Ejb6V1xHq71GSlLxmTvNs5IzhtuzCg6rmXNyFUSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZcAq/0oX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZcAq/0oX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa52edbcb63so642864266b.1
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961247; x=1733566047; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3IOEa3AQiadqfvRPE7ZHtURn1mAXU3PzuocV6bnPJs=;
        b=ZcAq/0oX7C8KVYG/ZNEWGiq+rODl3cW/stpoSOxufwo+VTslKfcHeFABBy7igwICUN
         YssiZ2pNY6Z/NGNPlWyJbisSS9MBPs91L1rO86BdyyJiTRdfmgB3FXxSQ4yq9EEX2sg/
         OoNlcHOtLd6jfWZn6R3FDyIHQhrBQm9dGFUvQUn58d3f4Hq7WXhIh3TIG614ubAn/zQR
         ez0pe9Td24qrcbTc+r59kUQeeU0ShIzSlnx2dhvMX7vsDRAyuhdTatDdXbJKCyvctgZM
         qKBTe6nRDTbKxEJNl4SAG0eScdO62k1GlI8vpHrIy8Ax58JFBN3korfX+uEewUpC1oyJ
         R5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961247; x=1733566047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3IOEa3AQiadqfvRPE7ZHtURn1mAXU3PzuocV6bnPJs=;
        b=FVEU2JttwZWETlc/4YW08rsdqhe5SFJg6mLKhDVQ3VZq0mBXT+CFh9leLFozKFJnVb
         VbkvGs7feTIQVedW0ogRF0m3EecwCGgRNg9GeI8TdHMXlKeDd/xyhIdyn2CGoFQr9zIz
         KedmsP4+LmRdjb6xChAsk2F3UMNZ8laFWKGuP0ZMmASdiyrenVgFMWwftQoC1ILyXL/s
         aaTHRoIp2T5qrnMUMCD1cogZtKw+w4a8z1Hjn2/rqnWpazsSbQzpCgy/NH+gLjurkiAr
         2aYZBLBvsMSZQbaPHvkpZ+GY+s2fCCBwja0cJeYzegdVT8W7SFHzi6FQekbXMnCL6Hu1
         9G5w==
X-Forwarded-Encrypted: i=1; AJvYcCXcrKGISMM735anS/9Qe+n1ARVLGTeTxrlSFo5nK6Ju12gxukAL8tA5mBA7fY9CDpEmMcX+2UOkoK8CiyxWsQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5pTxZ3pcQK4eZjmjL8RsY8qSXrHB/MIweQhIMPBs/TSic0H7
	uV2QWsq2lnIrEyJfiPqPlyiqhkO2mWijNH3CqMxJRnsz3ZX/UHNWFdY+sPXPOFCu9nXFrFGccnf
	FsS3ePg==
X-Gm-Gg: ASbGncsUilcvU2XGlM7bVC6l2kO7zePTLLC/r+2CCMqZDW2KNdlr1OOMuARs1rNQflx
	OELuFqZQtGWo1cikyXv2Zre9UqbJVmjhQoQuXAl2bRuVUA5Pgfeeaqmruz0hb6JKqs3K48ezg8U
	1d+vFd8031z2wrkCftYQi3HRSfnu3qJeMDP2D7rI4gigsGc5gsuArx13Pr1FIiLMh9goNZIy3sk
	7gikOGXKGHy6C3iDO51OY2zk5of6Ar2BuKmpGl2A+cL4+TIchBM9p5j1vJFt4uLm13VZP7K
X-Google-Smtp-Source: AGHT+IGEehsqRqqchxpEeMpH2p56+C1aMQS6P8kLj4wjLRwyQQPVWBU9FOYoHm9xPFqfOvMYDmrCvQ==
X-Received: by 2002:a17:907:7ba0:b0:a9e:b08f:867e with SMTP id a640c23a62f3a-aa5945dd02fmr1077135366b.16.1732961247420;
        Sat, 30 Nov 2024 02:07:27 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a783sm264103866b.171.2024.11.30.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:07:27 -0800 (PST)
Date: Sat, 30 Nov 2024 13:07:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: mpfs: fix copy and paste bug in probe
Message-ID: <9e760329-80ed-4bf7-8d4f-dbb16a736497@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code accidentally checks ->ctrl_base instead of ->mbox_base so the
error handling can never be triggered.

Fixes: a4123ffab9ec ("mailbox: mpfs: support new, syscon based, devicetree configuration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mailbox/mailbox-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 4df546e3b7ea..d5d9effece97 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -251,7 +251,7 @@ static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform
 		return PTR_ERR(mbox->sysreg_scb);
 
 	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mbox->ctrl_base))
+	if (IS_ERR(mbox->mbox_base))
 		return PTR_ERR(mbox->mbox_base);
 
 	return 0;
-- 
2.45.2

