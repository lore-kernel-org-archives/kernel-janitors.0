Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E02712E7F
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Jul 2024 02:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721269559; cv=none; b=mrMqupmeLAwpiJ51GCCeZZi14hDD3i7vAAR0AVbCtaZ04jug/31J2E6mPD42RzcfIVl4d18Zsr9jFczwnsOY+c6/u3TcBHd2Ejfg5WbViSKl6GtsGStB/+PDgPqjqRRbLSgAdu9Nx/G9PjjYjXcpeO7SKm7XFH/Y/otW5ahx8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721269559; c=relaxed/simple;
	bh=M6VIKClxCKUTHKil/lftXivMZWewfbeoa7Xddd9eHf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6upFjQBs1xCwwH8vUq4trI6Dl+82iaoNIoPjFxl6XRNNnve/YzL0VzEg0pd5wwaXB50kYr658mfjJDqdgYnvjAyNvVoc2CwLfVBn6LtN4ruXfx4Y+SGZShp2KT6xrS+JvZFKYCFNmswhkY+jNerAYxVUGACHW9GfOZ52n1Q8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPKBNa0j; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPKBNa0j"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25dfb580d1fso172513fac.2
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jul 2024 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721269556; x=1721874356; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gklRP1Mg2lPJDFn6YnROe/wcKMjIXNM5Cvhi4UGcBq0=;
        b=xPKBNa0jmD+kLpOtPIT1JsGpQgplR6ypUfDz/AjTVQUUGLhubdKwFnLmGiVP4MM0FA
         KtiCK6+qNneo90+fSnQ5BFgm0F/OTPKiEMvim3EoT49k6bCMs4lQWelOSF22isfCBOhW
         CesqKLr0Q8ThvHmXeB8q77wGxJn77gA53ddXfucNxKDBXqGMq+MXSYoQAlCw1q0/WVBH
         bBuFtb38CbAcLniP0ICCmzFSZxmaZP2oEsL6b2h2ZHIbVK7wFQCQfMSroEThfVeoweaP
         JWUD3IO+vAiurkQhI/6KhNuqrmQzsjhSFJPXpcXH9y115EFGXO/uThqQDSzRmRi1UEht
         oFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721269556; x=1721874356;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gklRP1Mg2lPJDFn6YnROe/wcKMjIXNM5Cvhi4UGcBq0=;
        b=NROQVqpzjdtwcfCG74X6jbQzhZWFxsdiPlNllnbXMpeJ51hdcztGbMQbJHsEVjrjrV
         wE8PLCzVm/xl3/lUHVkVr/w2dOkGDmZ/x65c6Napdz3X1t/pLDqfzaBzKiyi5jZL3HiK
         Cm3LjZKzY4XfnFsK5xpsOPl28zWY1zzzyjXd625KnO8p9T+ZlxKnpA7E6jdYtOUasdqj
         RO9/Zdv0wBARawJVVb0KZubBp8l/KJXFR4LTc0V9yCs7epYKFt/TDDOYtFacY08yPUgK
         MqMVRGy+Qy0MTN5sjwZsxFDWQRmzt1pgM32tt4o7lndy8U82JshR8rGfuJPtIunvKdpg
         EDmA==
X-Forwarded-Encrypted: i=1; AJvYcCXkeCWEsmMo69MXdPRi81ipjSP1XHaYbSrvAqE0eu56iIfgQkA8CKlantLXX3Kug84SpKLWJ8Tpma0a8qePY24ioA3FtWqXObj/p280YcGk
X-Gm-Message-State: AOJu0YyD2jUGMRu6epzqGztua/DuDZTewJ41FWIT5Rak9xdPC6glN6/I
	kamcpwD/9VMOEqkjgzFjADe50ydqHHY1/rdb6wkfpstQAI/OshpvSz86s4tkfLw=
X-Google-Smtp-Source: AGHT+IHupNh4IdHfYITPiJHzo+24fJypzIvoRScwFusZfpcnc4Pu3dq0o5eCy94zxrmTygwA8vdt/w==
X-Received: by 2002:a05:6870:d206:b0:260:8f6d:f029 with SMTP id 586e51a60fabf-260d9504d8bmr3106193fac.42.1721269556637;
        Wed, 17 Jul 2024 19:25:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eef3:26c0:a400:406b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260ee947f82sm192994fac.50.2024.07.17.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 19:25:56 -0700 (PDT)
Date: Wed, 17 Jul 2024 21:25:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: sophgo: clk-sg2042-pll: Fix uninitialized variable in
 debug output
Message-ID: <baf0a490-d5ba-4528-90ba-80399684692d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If sg2042_get_pll_ctl_setting() fails then "value" isn't initialized and
it is printed in the debug output.  Initialize it to zero.

Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index aa142897aa5e..24b0eab6154b 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -387,7 +387,7 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *hw,
 	struct sg2042_pll_clock *pll = to_sg2042_pll_clk(hw);
 	struct sg2042_pll_ctrl pctrl_table;
 	unsigned long flags;
-	u32 value;
+	u32 value = 0;
 	int ret;
 
 	spin_lock_irqsave(pll->lock, flags);
-- 
2.43.0

