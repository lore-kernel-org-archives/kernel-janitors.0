Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59117BA3
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850132; cv=none; b=t2yGi3N8nyfcDLMmmOXkmMAAPREhkVzd42koh57KbmxZkE46ifWAhx7eiHDCO9GqAtdXwr0xM86PltWZslTOloOTkQg0Vrs12kETU2uDS+sTLifkajZVtj+ya7yklvo+8Zzl3frRVjXujns2GACLlXVJ2L5DzwCE78d8SeoZ8ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850132; c=relaxed/simple;
	bh=gcyyJ3A5+OKGc6ZQvYcrHgZc5PnnJU7+8btR3+9SeDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKS4WUYX7i8GQH7uuN7U9lA26a5USQ5m8/zjIf2VToFDK2BAjZfGAa3h+fXy3toFwYg2MkHmrv1HhGS8rx/JFoji6ZsPSqdu7G62jXscbxjbknUTM2HQ3IfQEz78g14XgFsYdUwzx2dJtvQ8Sb7z1xUZ9Ezs147eIDHWFLGz+40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aNksuNWB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNksuNWB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so13677555e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 01:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850129; x=1756454929; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNEBpGgZdG/2jJwkaxvAijY+ORi32/fy01Nt/XLeMz4=;
        b=aNksuNWBZ4gPWFE3BOx95zh9f8QtMwqMY2ZiY90uWqq0ZmA0TsdBZx94V62m85ukIT
         kPv4TklQgWLPQNWMiX60q2fenqBu212tdQbHrrJ9YDeerIHyAYGC7VIsoyVaso/KpZDC
         mENG9bPS8Oi/JIqQoWINePz0hrodaJhhDibhGx5e/nMMO9qgzFoKGP0PRLdavONsvUY9
         k9BwxUEIfjppiJ6NTGOBNmQ2oZ8VpLny2QNxp1POG95AGLVjyUY8RHzJcKmeO+tGWY4+
         5Kn681SFjV2emvXt1SFtZs7tfK+f89IxHsr+xT/ZPY1zrwv7WAoTpDY26jWza5DdRnFL
         6dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850129; x=1756454929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNEBpGgZdG/2jJwkaxvAijY+ORi32/fy01Nt/XLeMz4=;
        b=NZlmmEqFrh2NJsMX32AFkP4Ps9dDCKfVaMwEGx8b38qhxHftsD62xPtRQA129Q/YNL
         +820fHkEDpEcaB3EqAffogijy7PYfB0ibqQzuMESn9hha341NNfckvF7vwM8ZBo49rGn
         JEZM6sm7A15SLUNCc3ePY9p/bBlCmJ/dLRQG3XE2RlAqrTYF67mnMZZhYHNfhCNrnQCj
         JwDpZDDrHPpZcEeHdOZNc4XpgGK7RNL88fQTeByMw1wmDmIUrMbUE9HcE+aVJrMLI17+
         Rivm9BUZMm4mWsX8g6LIoB4foEK64tOn0SmtNSvUlLf5brK9iym6a0Cm6vx7UDl1PeHJ
         1rsw==
X-Forwarded-Encrypted: i=1; AJvYcCVHZXc1rhTzkDpXROBOc4p/kZfziWIlfPU27SXQNoQBnwde0ynEmz7YpgEdUEIEPH5SoYN/9yXlyWXSgbQ275k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KtyYA4L0s128KURQ1oD+x+rBTMTGRoYP7WQeCdZHfd6GWl7G
	LcvJiJV0wE3DbndCFuNrpQ5QiS0PBg1ulVA8zgFFcYWh9bXx4tbH/V3KjywxJJ/htaI=
X-Gm-Gg: ASbGncs3Qfr17mY+bCiTN0SvkxFl2R4E6/QkISr3rU4zCWztFyeW11RyJzNF5xCSLZy
	f+vEA3YbpcE4AiAKJOB4aeNsMhXSwHh0b889ew8dv9iGzRHpcUSW692JG2mDUYPd8N/9YplV+HX
	2wPHappwU9qlXMswyW2RfdbD2NRcTDg1+2w3cT7Av1q2pcP1UKbOncBH7Mj13e/wsLF87XCz5Qc
	v6jNikExOE9xoFupVsEadmNUNrDIa53/9e3EN6qOqGDfdg9YSntiNhC5x54Rei3poX47UgnbHU5
	xBQFQ8uUXHO0Xby50b/AC5BYreKGH6n8ABVTj/vZrF2rda0Y7mAA8/bHb7j5rOpRLM3pocoYh/d
	0GxWSsUWE4pZyH6t5bmaEd45yLc0=
X-Google-Smtp-Source: AGHT+IEsxW6o/F7dQT5UHqvxMpkKhAVZlHmWm8Xnxd3OnhbNdincCBQd5nTWNUKg/zsTGxuq9w18LQ==
X-Received: by 2002:a05:600c:1c1d:b0:459:dc92:b95f with SMTP id 5b1f17b1804b1-45b5179ce00mr17667625e9.5.1755850129318;
        Fri, 22 Aug 2025 01:08:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50de8a94sm28905885e9.12.2025.08.22.01.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 01:08:49 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:08:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] of: dynamic: Fix use after free in
 of_changeset_add_prop_helper()
Message-ID: <aKgljjhnpa4lVpdx@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the of_changeset_add_property() function call fails, then this code
frees "new_pp" and then dereference it on the next line.  Return the
error code directly instead.

Fixes: c81f6ce16785 ("of: dynamic: Fix memleak when of_pci_add_properties() failed")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/of/dynamic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index dd30b7d8b5e4..2eaaddcb0ec4 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -935,13 +935,15 @@ static int of_changeset_add_prop_helper(struct of_changeset *ocs,
 		return -ENOMEM;
 
 	ret = of_changeset_add_property(ocs, np, new_pp);
-	if (ret)
+	if (ret) {
 		__of_prop_free(new_pp);
+		return ret;
+	}
 
 	new_pp->next = np->deadprops;
 	np->deadprops = new_pp;
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.47.2

