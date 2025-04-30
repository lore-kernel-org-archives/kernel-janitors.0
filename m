Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E862320F
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000447; cv=none; b=TmbTXDd+rva/SgpLjJ5NXyMRVj4udn2s5dkv2pOIuQXRn+w/bXvRSJVrZ5U3Zuxns84IlRcynxBHeIQiz5Tu/zf2VYqAa21bLrNpYoFLvPU/+bRANkP8MsGdwI3dZxemy0t3iPxHyGbeGFZFIJS+Wuh2KrnyyIZeGw1Gb8LI7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000447; c=relaxed/simple;
	bh=TwBAWvhA2LMsfzhyPe3YteWvIvV7NRQQgO+b0MIyY2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbKcwOg7djaWmHS3v4m3etD2Xqb/U0ggmJWUK10/1mZc+nVGicRvW2+WqpjPcGaVYtnJL/669pmHch2WrA+3g2TVfvsKuHvridSVZK48mAAEWyFi83ZB+4K1c2Lb3UJwgIYPaDRpyUSGMyEts+dn+/sM1vUMcmddCVYxoqgMQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hU94Xi0V; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hU94Xi0V"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edb40f357so43561395e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000444; x=1746605244; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uc9OCM7ZIzJpNzeChHt6JK3Q3WLBO25WpfMZPcs6ME4=;
        b=hU94Xi0VZ1VYHLijxt+hy0dhmt+OGjjL/bmcMkTMS5IA0+V04UBj6y/JHuDEyBN5Yg
         t3e0x+8LRgy71mJZSwNrdnMwewNasb7SKcCt4XkfMn7Ar5GhYdfh7HlQyyuHpzuLTlbQ
         ikG54sfa13kbbbKbX+C1CgJdWY1SJk+N99uBrmlIRolKabm4Td6iXtNuFdwg4nD9mw99
         4rvsQklhXAikRXcwMokReJ1cjZ2TF12jKGF+Adb4KBUwQN46GFa0ASPL3I+FTDIgMRk4
         Qd93TSZlKWjqlbgdztkyE/S7r39kJZFdMle6/gy1lG2lPA4c3NK2JdDrpSGbPpWx/bV+
         nbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000444; x=1746605244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uc9OCM7ZIzJpNzeChHt6JK3Q3WLBO25WpfMZPcs6ME4=;
        b=VFGxOH/U5WIW3qqqeh11JEZ2U3VG+IopG0OYqwB3q5Sz3Kj95n7g97ypSl33pW0LQe
         acUHdnQi3VvzTodBQi5LVfg5fAaIG51FzdTt2c1YHjCgIZmqIQYLIiTydCsNa6H4neWM
         kk4lTZhrvjEXfpvTtDIRAw4ycCP0hbZBi49oQBy7r8Kt1R560PdZwIhX7vCHPcJuT1YL
         Nrh5ObrVROc7cCOZvlaj008UkeS5dEwsYW6opGiyGr/NSCj28H2BkK3qC0/gjW6LLLB1
         X4VMMHdBPhyB85Kdzvt0v/AKOx1F9vcrUdfNoPQqYh8PEvpTbPEBng2yL0gAzKRKl2Y1
         XRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbC2lmUpt69pZVxgexn2ycW76q3kGDUpm4HM6MUyrzyp1ZzYSoXBRuCsaBm4qvQIJ7gAQzqyXagH2vGSM6jRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNC4Flb9Ubj5QaSbaaJEQOhlzawzSGGLyYNLL9oq83g5V6qMl
	/ZPMSNe4XgvDlWupqSmuqN4CG51F6nrNQzdGWD8txUSB9l+jCL/iaOpEN6+J6hM=
X-Gm-Gg: ASbGnctq/EbOlj2ZWrJblRtZZfXNTX17runIBuUeS/l3XWH1bfnsXGN35fwWdhVjENt
	eHMd38W/Li1+jl+oZX1hDLuWK71uiLPOTWLA+X97bdAG30jPkh83vCIOV/yqIosX83szksV6JS7
	jk+nVKPLR9SHcbYsxQV/TrNqRE9Js9D16wLptAVgydN7Gn20b+8vphohEVt11AmF+rCNdgMGIKs
	dBPti7tpXZLy9070h3KjYn/ytpcjwnko9P7vFS+TCUr0cKSxH/zFq3Fd1ZCIPU+LuH5TEIuehJk
	I4TAZPIaoaw9UV/bBGDKRO6+W1hT8+hvAfNAvsZAqEO+RQ==
X-Google-Smtp-Source: AGHT+IHu/zka1ZNTIDULuYu0Lh1rRpwgaoOIaY8sTkizKLpXGbJF9/FHIhltJWjgeRoIv/Od3HWxDQ==
X-Received: by 2002:a05:600c:4e8f:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-441b1f35811mr16919135e9.11.1746000444147;
        Wed, 30 Apr 2025 01:07:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecc20sm15588745e9.13.2025.04.30.01.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:07:23 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:07:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] OPP: core: Fix loop in dev_pm_opp_sync_regulators()
Message-ID: <aBHaOOE8xHTsMap2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We accidentally deleted the if statement in this loop during a cleanup.
Add it back.

Fixes: 5330d0dab736 ("OPP: Define and use scope-based cleanup helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/opp/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index fc9874946453..f56ddae35ef2 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2889,7 +2889,7 @@ int dev_pm_opp_sync_regulators(struct device *dev)
 {
 	struct opp_table *opp_table __free(put_opp_table);
 	struct regulator *reg;
-	int i;
+	int i, ret;
 
 	/* Device may not have OPP table */
 	opp_table = _find_opp_table(dev);
@@ -2906,7 +2906,9 @@ int dev_pm_opp_sync_regulators(struct device *dev)
 
 	for (i = 0; i < opp_table->regulator_count; i++) {
 		reg = opp_table->regulators[i];
-		return regulator_sync_voltage(reg);
+		ret = regulator_sync_voltage(reg);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.47.2

