Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2EE19AD87
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Sep 2024 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542947; cv=none; b=k88IJw7/lQbkCpLfQtJwwnfAFQh3m0EMQ3uNQ7H6QJTFt1aPaTAmovqIeQyIR9vM2M/u4vv0RCZYxoMUrfoycRPkCeNx42q5g7IEgkEPl2bSljH2PnOBcl+qjKzhouJQTcXD4ZrKeD3UXwtTuWJ/qx49YNvKp9Y+jf/0Sp0rmv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542947; c=relaxed/simple;
	bh=5evTdunuLhVAJcs/+kUduc/E4egJQadthe4kW1wlI3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etjMsvb+idvl0ywyOTTUS8PxTiTgX7/Qf3RqwVxDbVZKeZF1qCis6r3pVbloQ32199Zvn//x2Z/4ejWE+X4usP93HrWeMH181242/rtGTEwsNo3SKzj4wNOP0KQHUkMU08N3kjoXdgMJK9iMhauvNeV6RwAFTxuJI0DY/STeKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEybFqNL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEybFqNL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42c2e50ec6aso4613565e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Sep 2024 06:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725542944; x=1726147744; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mmo44zFx8mrvsxCT8MsK26g0o98DN2eXGHyiYlsG/6k=;
        b=FEybFqNLjPU3DSuy++aT6kG/iP1oegSY5KCdeqqtpy1yBIZqKmg4BBKbqHb5qOifpi
         1bGJq63JCO5uq6BKdnPveSslvcPp7/9ABiu9lFM6+A+dBuzBPY5j+4SoZqPyb0geF4sH
         ODh4ZMDycG+Ui0zyPBAQ92c0VZW2/akNGxnOTCnld/PIFvR+nobySiw22C2ZFtpp1Oj4
         fPsg9eTZTkJBdXmdYHbj+V3K3nYDmCemIUeF4aLKcWMSXCL/C18PDWGmTkpaE9b+iVAh
         0S8iywz3b+aPu4GfrCiqSXbBBo/sgvmrJiCTjaoMAAl452ljdMU4JzJmTbwU4YW2fEWm
         KtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542944; x=1726147744;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmo44zFx8mrvsxCT8MsK26g0o98DN2eXGHyiYlsG/6k=;
        b=LsbmLXdI1Ypx/f0WAV9JJAYcdd0dY1NZ/K7XpeZepIc/KgiMQIGk4Lc8nlHXY7aV5l
         khmINIn0lhZdY9tZYvGEP5L8ySGB41iCMsebMrnvu1NO/1VczwuhkLCQxQvnGTR3nAmE
         z0jOZ95A80/x9nq83dOUSmm3oId6tYc/l038lJhNoTUuRZeQSjkAqCcC1/y4UPWRgxl4
         oC4IIA+g/02nfOX/gUcUofmzRgDDuPZxHPixmU/Ud7zWHZVRkd3Sdx60A1fXknHBrQcm
         DhmnrzcLl5lhrwzSrZ+LLHHDZDsmIoCE/M6HYiqBdBNaoygpp0xHTE58Ml/B1Z0eIBiM
         G76A==
X-Forwarded-Encrypted: i=1; AJvYcCUUijsyxFiiPywYMaAg4PWbDUxLLHoIqWQkzmlA2J0sH06mtH8Md2QmgQRZ+rh78apxJEHlH7sADmPIebCw7FY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87Y5K2WclWYzV9//OUeKYEiwJ/ZHbrrq70m+827olOck4Bl88
	PVH3I8iIBxTl4ADu+NGpQ9/tjHNxqIW3qIcLkVcH4zqpHVzAS74DQwlpdhpoHys=
X-Google-Smtp-Source: AGHT+IFsWenqoAd2RFaGr+OZ74a6/40O2rid0oEltUVZXpv8n2OTkZHPQAC4DFZMtytig8GfX00Tew==
X-Received: by 2002:a05:600c:3ba0:b0:42b:b016:70ce with SMTP id 5b1f17b1804b1-42c95ac1978mr35442465e9.1.1725542944053;
        Thu, 05 Sep 2024 06:29:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b9859486sm16167785f8f.111.2024.09.05.06.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:29:03 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:28:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] power: supply: fix a double free on error in probe()
Message-ID: <9c2f76e7-5679-473b-9b9c-e11b492b96ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In this code, if devm_add_action_or_reset() fails, it will call
max1720x_unregister_ancillary() which in turn calls
i2c_unregister_device().  Thus the call to i2c_unregister_device() on the
following line is not required and is a double unregister.  Delete it.

Fixes: 47271a935619 ("power: supply: max1720x: add read support for nvmem")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From code review, not tested.

 drivers/power/supply/max1720x_battery.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supply/max1720x_battery.c
index 3e84e70340e4..2bc3dce963a3 100644
--- a/drivers/power/supply/max1720x_battery.c
+++ b/drivers/power/supply/max1720x_battery.c
@@ -427,7 +427,6 @@ static int max1720x_probe_nvmem(struct i2c_client *client,
 
 	ret = devm_add_action_or_reset(dev, max1720x_unregister_ancillary, info);
 	if (ret) {
-		i2c_unregister_device(info->ancillary);
 		dev_err(dev, "Failed to add unregister callback\n");
 		return ret;
 	}
-- 
2.45.2

