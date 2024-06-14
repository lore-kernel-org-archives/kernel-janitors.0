Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757FE25601
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718386252; cv=none; b=gTur8mJ8x42eHRDcbBL+MUPDgEH/cmJ1TJVY9ryOd1GsQ5Ca1y3zqq0GLAlUBZCzKtkCnO8H0pe8hm1aUTExK6YwHMy+teIzJf90iMiHWWDRp0c1R566St37W0WEIpjImf2tUZYY9Wj5AYJVKDP9wYeJjt6v9gcyeU7O3vxSmyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718386252; c=relaxed/simple;
	bh=OuNYhmUKQHj/+toxfhoz0GPPmvE2PFXyg/c0bbZV3GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyR5THp11ISxKSx5346DcQfWkUP6m1yZJskeHQ7mpVglexQ5gJegFKTFvD0S5SC1R5nfUtbET3QbH97Rwr+7/CZYQBQUUEMIF6awxf+lJONCpuJmZXy/7icwL2Vsyi63TPXTpmcCh9jNfMzrVsz2obtliq66zGPNZIEO9QMVVcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InuplvbW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InuplvbW"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c32d934c2so2682216e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718386248; x=1718991048; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhYLyvnes7IrRyooiF6hUo9Wtmgl5c1FE7dQTHZivIs=;
        b=InuplvbW6PFQthqw0ESLFhfq3C+r4+CPGUcZi6n76AearsZErB7T8UJD0IX+dlMIbh
         RIYmwMQfK4mc841Jywfx0lTuEB0JLogPpDjaHkQDwMQIXxAwDckBKmLXu/6KJ3TfoKs6
         LunoM8gOBMt8Ij9EUM3Ze+0lu7w/vqmCX+qfeipndgrsMQ3TKgHN3X7UqjGaVQcc9DVN
         toIjrORkW78vPsMDVgu8QTGR0SifPQ9CGYJAZV51q7au/T0c34fwy0TlSooZ0Sx3XExO
         4zyh4W+/uSNkP3NP4CWgEMukTiHsH73X+oqtJ0zUjEJOi5Nwb0km8MMOf9tAndOxAswj
         mPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718386248; x=1718991048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhYLyvnes7IrRyooiF6hUo9Wtmgl5c1FE7dQTHZivIs=;
        b=PTBpCNcq/qqtx0HvqIhFqc0PCY8vzfRm+V7KanQsJET+0OZdSrLpBs7IWLG3RYyvOp
         hYsoin1ge2wViaMvmX8ZgLdvowp5WhQmuWUnrLs1y8oYjdJWubTU54qcnX4YZ3/v5pdZ
         TNWiwpFkF1ySfeMVyB3VxFNkaLu0F9Nb1adHaqZvadj24jOKDsHdZyuAWo2r3zUYPMSw
         FglHRGD/rad3m9pnh2oUm/pNuUCuB1vDrWCoEKLzRFP/r22XgobE1EiaHtbnNVqGpn3t
         96VZKFpe6ceYU+Yd7pkDhGBBk6E/V44YDEF9UBcG2z4Oh+YkKUsvkeHZ+ky85pDFwFqq
         ddUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpmqrWcYE1bg2cAR5uxYma9PuXxJmlQ8UJt/FVTxkqkGrwUb+iVxx0ZjII0mB6FWUT4/QJ8Cp/85l77j86tG7EAYPY4YCgGs5XKlgha9Fs
X-Gm-Message-State: AOJu0Yw4UWHGBRz9HiGjUk5EpgdVr+Ehqpui78ePuybuQlcNlfD7Y2Vx
	oFw//+XM3SuZPgW4Nm3CeJ/JVRbr9DzKzAbzWk75i+28+648fpz9EnOsuj/iPPg=
X-Google-Smtp-Source: AGHT+IE8HK8BsiSh+6Wu+Mm+URrKAZY78WQcHj2XcIl5gyStXYt1n7LGGfHjo2+cbwsFt3wfVVbDyg==
X-Received: by 2002:a05:6512:114a:b0:52c:a809:62e9 with SMTP id 2adb3069b0e04-52ca80963f5mr2378320e87.0.1718386248378;
        Fri, 14 Jun 2024 10:30:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6127d6dsm69701075e9.26.2024.06.14.10.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:30:48 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:30:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Corey Minyard <minyard@acm.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ipmi: ssif_bmc: prevent integer overflow on 32bit systems
Message-ID: <1431ca2e-4e9c-4520-bfc0-6879313c30e9@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are actually two bugs here.  First, we need to ensure that count
is at least sizeof(u32) or msg.len will be uninitialized data.

The "msg.len" variable is a u32 that comes from the user.  On 32bit
systems the "sizeof_field(struct ipmi_ssif_msg, len) + msg.len"
addition can overflow if "msg.len" is greater than U32_MAX - 4.

Valid lengths for "msg.len" are 1-254.  Add a check for that to
prevent the integer overflow.

Fixes: dd2bc5cc9e25 ("ipmi: ssif_bmc: Add SSIF BMC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/char/ipmi/ssif_bmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
 drivers/char/ipmi/ssif_bmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
index 56346fb32872..ab4e87a99f08 100644
--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -177,13 +177,15 @@ static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t
 	unsigned long flags;
 	ssize_t ret;
 
-	if (count > sizeof(struct ipmi_ssif_msg))
+	if (count < sizeof(msg.len) ||
+	    count > sizeof(struct ipmi_ssif_msg))
 		return -EINVAL;
 
 	if (copy_from_user(&msg, buf, count))
 		return -EFAULT;
 
-	if (!msg.len || count < sizeof_field(struct ipmi_ssif_msg, len) + msg.len)
+	if (!msg.len || msg.len > IPMI_SSIF_PAYLOAD_MAX ||
+	    count < sizeof_field(struct ipmi_ssif_msg, len) + msg.len)
 		return -EINVAL;
 
 	spin_lock_irqsave(&ssif_bmc->lock, flags);
-- 
2.43.0

