Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6817925A320
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078927; cv=none; b=pKRIO8UEaQlkCLV1V58BDdo6Zne7v2ADimYO0V/ox4AL55OoC7wKdm8Y+wU1ryyyzMSseREtmDgTF43F/DYP9tpr5l9U1tyXbb1sYRz5AUZcZ6gSkNW97bV7kl88BqRV3GbmIEeLqpujC6Jfp4eaF5yIGFisZtEdL6ZY1TCDDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078927; c=relaxed/simple;
	bh=ojcJW/WkscbkfFpX31lO1PLLIJu+wCGNE6fCS14Bl30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTCtkTmHbcbgyA8blydQJcUMNx0FgoGTjCMgNMzZCnqEvOQDuieSv/YyiHDTRo0ufgshaonmg8jy8lXmOmW9RwQb42r1WvPYkfMwvP5LpKwMisKJUCr6MtqVo8AozlZ3ab2sTTmtHT17XTxqzAskPEfd9Jdcf3OEI7dK0cLaomk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kVebjkyX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVebjkyX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so32035205e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 05:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078923; x=1764683723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZUPcDyU6xr3mdB7gZ6zkmVa9aLNEQrMFyb5L16xk/E=;
        b=kVebjkyX4X3ANANzh8BG44q33exDDMtE5VqdkXX8sW/iERvT+e5nV8oJV0iulaiViV
         IzcEIOQM13d5F/YP8/gy4wFaK/KEp56aAhOcIsBX47HgDvwK9przbRcvr849J8qpOocq
         4Kfn6XI8Sb1aBaAZzbjhSO/tljveTP5i9d20scez80eG8jsILsaHZ7vNpvDdoN7kzjcC
         M1KJDtFDlPcKr8o9Thmp6t+4pO9BFvJ8jOfRO4x9y4yiUdJ2gY2psxvcb2q36iKs4bvE
         H4n2WUbQ3ODtChdBfn74zVWo9hQL7UTcW3HUBkDI6CRvXv6mTUCOKX9XeyDXY0EYE2CB
         zo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078923; x=1764683723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZUPcDyU6xr3mdB7gZ6zkmVa9aLNEQrMFyb5L16xk/E=;
        b=koAei+aIY351c7b77VCOD7Grt4BDwKmSfyc6Dd6d1R+rrvDEKKXxKV1SRsRLOT0BGV
         upG4Icahc7GsZTnJWA78Vh2CAn+lJb++7lPqbwSKRZwGIN+iX9xLY5hVJsd2Ahj8S5Rf
         /S6YB556Qks7pxYyruDPpa6OjJrZ7Tmte9+PYWLsVpCKcx8IXchUljW6CKuht7NQSGdi
         Uy/ZiBWivJgVk54Mqd+GTibz+m5SUAz5++Wlk/owuSANRlphIWZob60T4lheNMsmOymi
         Kwq2mKcMMxKeUh+EulbWg4zTy3y2MpTySzI36TU6LU6OU0CMwcWaNZLVElDLzcq5u0AK
         Z4CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT6sUTtjBeuqn0OcjgQLg7LRSXpXxHWSeZRdl+YrmyElK4Mhx1Z2TzyZlG5e9Yk9ZPuExaRTZ7ez8dXv1KwEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzupcLcTVA3qBrJ1QkPyXZm54O+t+OpsptCztOX5wsW32g+lO8A
	NfdN2xLi2MC67BgpMH/1oPfGm2R+HWcYrGSlKHTM4Qm38olsrQuIRnPGkZHQqIFmtPQ=
X-Gm-Gg: ASbGncvbnkgI938iOAGB/3osoRR4nsbUXugUjcrRZRzkoiMJevmZrEE/2ESNjfaJFz6
	ZfQAMEQVYq7HXsmf/I77BFNavfLli0nDzZdqZ9SodpNwGKmR6FtORP1Z/8rH11BhmJznjM903kq
	2DJHzTajl25QI1jjgXXEH5FA2ZxvbDCvDedpoEhU83P9LDYq5aAFd/vMzFtMxbwxES3eakt2YX5
	BL7BlMDWkmiY70bioHITo6AwmmYgzoZtl2ueTF1TFo6dut8JaJRLpB758iwCbarXUBP3nTW2Pmm
	SqU+adgY2JuVp6wFf85fWuPEz7ax6pneeBya8PqaqJRLpdncguiL7XDkY02Y8In7qHEBqIufpgN
	Q+Nt1I6QJb/7Sp6vGArbSqO5/l66riTs1tKTBpXuU+olDARuwKp5qEhgwweNzdCvp4YRgNltc0t
	wsOlwgPVIGQij/GFeM
X-Google-Smtp-Source: AGHT+IGOdvw3USM3p9Dabw1EjvJTknTEGkReBA7/KiqIqk8VtB6dVoTn1QMFTGxLgVyawmDqGUyuzg==
X-Received: by 2002:a05:600c:3107:b0:477:7b9a:bb07 with SMTP id 5b1f17b1804b1-47904b2bc7emr28643045e9.35.1764078923506;
        Tue, 25 Nov 2025 05:55:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479052c9621sm17162665e9.5.2025.11.25.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:55:23 -0800 (PST)
Date: Tue, 25 Nov 2025 16:55:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Malaya Kumar Rout <mrout@redhat.com>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] timekeeping: Fix error code in tk_aux_sysfs_init()
Message-ID: <aSW1R8q5zoY_DgQE@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If kobject_create_and_add() fails on the first iteration, then the
error code is set to -ENOMEM and that's good.  But if it fails on the
later iterations then "ret" is zero, which means success, but it should
be -ENOMEM.  Set the error code to -ENOMEM correctly.

Fixes: 7b5ab04f035f ("timekeeping: Fix resource leak in tk_aux_sysfs_init() error paths")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/time/timekeeping.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 0c8b77ee4a3a..3ec3daa4acab 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -3087,8 +3087,10 @@ static int __init tk_aux_sysfs_init(void)
 		char id[2] = { [0] = '0' + i, };
 		struct kobject *clk = kobject_create_and_add(id, auxo);
 
-		if (!clk)
+		if (!clk) {
+			ret = -ENOMEM;
 			goto err_clean;
+		}
 
 		ret = sysfs_create_group(clk, &aux_clock_enable_attr_group);
 		if (ret)
-- 
2.51.0

