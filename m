Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F242E7394
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Jul 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712060; cv=none; b=taNE29KYDvrOEPwrXH+HBIPQws92C4fb8chZtvXQF+stsC8YsxXkXGbtlCjS2ydMOyEhs6ydI9yo6ykBRs8kI695sOhCvySLY/n/xLgODPluc2FrENJc1Wn01kYvd5g7vZX0XW/xUVKigl0nIVNUFmHgL0tY+xs92vk1J15AY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712060; c=relaxed/simple;
	bh=qHpuXgwyDt7gd+u5X5Fkon+TXwHaSS4B0GanO68bKIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n92tJjr3Amih5naEHSP0De2XPqYvpP+KktovSYfFlFB/g1/QaUVxN/5M993h0JNDbwNjFOP8l2d4qo+5AIN+ma/WvH0UHW3rTLJk/+f1ZwQPqYl1kKD/3CS0jXLJQKiDYE+lsJMtfYgPMh725ex81dR/5N1iHR40tXJ+Nu8yL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp7BUVRC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp7BUVRC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df6a2c809so287107f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jul 2026 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783712057; x=1784316857; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfcK5+z71wUpvsd64BXWRq+fNxeTLDfjOVwwJT3IZWQ=;
        b=mp7BUVRCV6sBSk3Cyl0MmDhzS0DpU1e+WtFIJKshfm5vJ+Wmr/hE9ygy2/w/EpMwxY
         5freLJnLgcWP9u5secg2uhg6fUdXf8Q6H57dzAnXJlGGj+zl6s6xMGOv9Ybanw6ZTH+y
         ySWOdxo/AHjFgIOBYPN0C26uTmIjtixY5UpwVrImj9js3CwxZ6ySpwVplWAaZ/icVVMz
         14CNLvxuTWWGVGzmIjbaIk+HzLrOXhhT2OQtI41UmOCDvfZ3UM40lI/ce8Z0nDs45prq
         cN3sekgLqWtMox7PjY6zLsmX7Pmhy5y3kLZ7mVER2wj+hMNANw432iXKOMjaYxZpoLpU
         JH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712057; x=1784316857;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfcK5+z71wUpvsd64BXWRq+fNxeTLDfjOVwwJT3IZWQ=;
        b=YrMDEBq+3H5xwuUpF1CL9SR5sTItdzXWoN+D1VBfZ0Slt9Yr1K3yFOizfer/SI6U6W
         rVO2zU7HX6qgDtfjKCA0q467uBnlBwF6Bgo7rRg60aPzTYprzDmaJvdx7H7QLkgX9q2u
         HLW/VH2D9rl2hnictKo78L3p/YeT95N6HA8HoRNeH9tW0VSRfd08NmjWHrzMMNzecOQn
         U3a38baId2cBYnqQ4hGpOhVimRq1x4SxILwALXTXxMDJLrr+ZkabQwvB4fUL6hH6VtRr
         uTSYjs+BCkp+cTkCE2WhA0BR56BpqYXTq/ulYDjBRyAjacdk5/qQ2YcFfHmJzShM3bnL
         By9w==
X-Forwarded-Encrypted: i=1; AHgh+RpnMpJpbsh8NxnByT7Ar6w5OoirxmjVIn0mayF+Knzb5DFPIOg3TgKj4VFosYOKajEyIYi+ymqII5fO7pqcgN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdisYx8wZNRdDMTdM0YfK0VNx4ZJQy98TbRLiN8tl/vRVMINaP
	v/c3ORJ9i97CySTxxlayX5vU/LFgy40p4VCEQnviK5gKOVJpkQigT3Zt
X-Gm-Gg: AfdE7cmwago7v/IsFBcYS6tciefbnYZ3dT6y1q/wRyvGyjh1k3WxBuOZLFV1KUGhgYw
	HCLEVuY9UeW7W9AYNYWRKEF6roxD98HLMSuxNGfiAAnIm/pY52W4NBKBcfPSleldUkxXpjPcq/Z
	R6pOcp4CMsT9q/mRD+HmRyMlE9ZGfmtrI1msyOw3oh3CFYooS6TpL6T8J6GeNSkMA1SjdRlzVaH
	B1c3Fejiw4UbO9IDc5zr8QaDNvIHLU5zbemZkgJEFVsJhmzPzRKAkx12+1o/qi24PyJuERwFWrg
	DsKuHW5G4zY6ZChlvp5kZkQlcr23Au+ZVKqfhLbOgt+OMtUGBIW6P1XQqjIXiOxuFkOoJAwX1v0
	FG7z2S4d72PCaws4aKjdG9iOxL8L3DSTMsVQu++ohyGYZxljEuHp/IyUZK9lR/rAQrowsy+wgtM
	JDyqFwXaKP
X-Received: by 2002:a5d:5c84:0:b0:478:65a8:6305 with SMTP id ffacd0b85a97d-47f2dcebd30mr143287f8f.49.1783712057358;
        Fri, 10 Jul 2026 12:34:17 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm61104797f8f.33.2026.07.10.12.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:34:16 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:34:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak Sikri <deepak.sikri@st.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cpufreq: Fix an IS_ERR() vs NULL bug in
 spear1340_set_cpu_rate()
Message-ID: <alFJNUllC3JOKv6z@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The clk_get_parent() function doesn't return error pointers, it returns
NULL on error.  Update the error checking to match.

Fixes: 420993221175 ("cpufreq: SPEAr: Add CPUFreq driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/cpufreq/spear-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 81a0780b2ebf..ffe5eda82f0b 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -79,9 +79,9 @@ static int spear1340_set_cpu_rate(struct clk *sys_pclk, unsigned long newfreq)
 	int ret = 0;
 
 	sys_clk = clk_get_parent(spear_cpufreq.clk);
-	if (IS_ERR(sys_clk)) {
+	if (!sys_clk) {
 		pr_err("failed to get cpu's parent (sys) clock\n");
-		return PTR_ERR(sys_clk);
+		return -EINVAL;
 	}
 
 	/* Set the rate of the source clock before changing the parent */
-- 
2.53.0

