Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07075158DB9
	for <kernel-janitors@vger.kernel.org>; Mon, 16 Sep 2024 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495654; cv=none; b=hd/dE4QS+dgdcmDDqk7i1DdDfQ4zhTvgjZ0rYm/g2JSmBURT82utkLjVDldJG88US1G4jLByMHY7ptKM0YJrodgbO/oyu3Rq7jxvKYXTh98H0YzNtblocedpBLD8OL65ZqgJCS8go6AeNv+ctctau2LrrXEpjDc+3vTDO7I1S+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495654; c=relaxed/simple;
	bh=KIlSGzxo/MDPptr+t1NTnK2Jn3oq4bUlBAf09fCWur4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RlZ1Hr7CuX1JELsyBoSJu1adyTSpYb7cDfpEsCG3RLpG/iU73KKdA/DyoZcDOq2FA2q9sQKFpMr0r/zs5xDHtE6PX2ZxHAhchrTd1NhZ7yenX5s8Eg4AqP3VBdiIW95rzCohnhvS9h0o6VBitQ4Il5Y7afApHolq9p9lg72ubVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd30ag32; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd30ag32"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso661077566b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Sep 2024 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726495651; x=1727100451; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbOarrswP9OaxV39MLEZPRWfgc+dC3wF/hGfHBmAnRk=;
        b=Sd30ag32T/XfPW3uclgvryqiS2Akcb/QN4u7N/lKBVvQjSF9mJKXS+gWMFyfL9RS64
         BsrhUwfyYIzduiVbqn7h94JVGHAIsWdFUuaO2JxLfKcnkqFleyG6gy4QXhUvcpsithNW
         vSZIx0CP1JwsZX23NpF4xelKuuTOSWYRtU1TIVHFXQkpkf884S535hKVRmOpi62Dd6KF
         IZU+DaGpBQTYXf7G57Z8x4bqugyEPf5YcgSEK5MGZxuohgKjAVsapEwl5aLTfQfddhdF
         XA/DBumo/x0MBNDCRDfDjGXw//iwdHVi/52np0ZXsCyiMpAu/3mcufkHahP5LbVoedly
         9pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726495651; x=1727100451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbOarrswP9OaxV39MLEZPRWfgc+dC3wF/hGfHBmAnRk=;
        b=fsC/LhuXJFh6RYGKFFe8P6vJ5WredP0lIOWedj6SwvQN/8XlEaMdJRFaFGJjr6FaHi
         Yy6wgt5xWFkojy6T4ReNxXp43cmHQEIKeLth8rxWp1DFGGVNqfzry0pEeZOn2J8grVgt
         rB496clxvly10nmV6wyKeMe4rdCBxYw4qPF0jisVSw+nsfYDjhRV4JYrcE3/XyCix8R4
         psx+ndmJXAZMVwlEZx7AEZ88+uHSPbgJMf8CNTWd4waC4jrxVuflsOnb2ksGyKXp3LWY
         MrPF3SsH4yLbWd0FdbdFlC28xp2gDx+zgV5rG/NBkM4YYd4aBMg14HTtTWjQbsM3K52Y
         Tzew==
X-Forwarded-Encrypted: i=1; AJvYcCUtpxokWEG37PHxXvp4twncuNLsbOHFd79RvMtikJSIHEGBoEz1xi9/bwrIj+YmqekwcgFF5KPhFnaMDyozCG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVe5vAyO3eY1c+0SpCd7bz9j+AZ7eq+o4EUAmRwvmAjrk4A32
	5fJIKvphG2R2ZLWakP03Ryou1FZiba7coxywac9dlmZrCbcsthbx+UAnEGV4KnM=
X-Google-Smtp-Source: AGHT+IFcPlAdhQmjMCR5iuakIdbXymFOOW4AFUZ6EEjquW4nK7DnOUFjYh41Bg7ivA6HeFQGNfx8Mg==
X-Received: by 2002:a17:906:fd8b:b0:a75:7a8:d70c with SMTP id a640c23a62f3a-a902a3d186bmr1706169566b.4.1726495651386;
        Mon, 16 Sep 2024 07:07:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3eb6sm322666766b.105.2024.09.16.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 07:07:30 -0700 (PDT)
Date: Mon, 16 Sep 2024 17:07:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] OPP: fix error code in dev_pm_opp_set_config()
Message-ID: <3f3660af-4ea0-4a89-b3b7-58de7b16d7a5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is an error path so set the error code.  Smatch complains about the
current code:

    drivers/opp/core.c:2660 dev_pm_opp_set_config()
    error: uninitialized symbol 'ret'.

Fixes: e37440e7e2c2 ("OPP: Call dev_pm_opp_set_opp() for required OPPs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/opp/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 494f8860220d..3aa18737470f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2630,8 +2630,10 @@ int dev_pm_opp_set_config(struct device *dev, struct dev_pm_opp_config *config)
 
 	/* Attach genpds */
 	if (config->genpd_names) {
-		if (config->required_devs)
+		if (config->required_devs) {
+			ret = -EINVAL;
 			goto err;
+		}
 
 		ret = _opp_attach_genpd(opp_table, dev, config->genpd_names,
 					config->virt_devs);
-- 
2.45.2

