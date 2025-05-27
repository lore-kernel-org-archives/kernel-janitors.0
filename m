Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE6D530
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324729; cv=none; b=R7zZrvlc/OJ95FLbdOJ48U/0PE+bFjAMt6GHHdaCmHxoHW6stdlCBXE0o2HmsxX8igZK1Y63H9j6BZua5Yb8MUqRaC5iaocihswK8h6PGzQjYefDsHLVIUKNcMFJVECcXx/H/g9kI8N5vZ5KDmj1hfgE+9DG8XcrQTiHh/FnNYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324729; c=relaxed/simple;
	bh=0h4MToyMZi6FE1TFu8zlRTj8kxMLKoCJQR+vUO1Zo+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fF26qP8Sm0kFjO6TvFKPhddXCVLGdQiAbcYuFcilRJs4lK3rcfTbTuoEvbuC9zILIxzC3qKtit3DoJE44qvlQGEQgbwdUxNrqlHqydXpUrSSs49pxVK1pGrScKys0RP9wi9IUhCM/XNA23RBWofqg7iLmusJZtJGR5Fw8XIlpqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YegUEXrC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YegUEXrC"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-604e2a2f200so2036039a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324726; x=1748929526; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=;
        b=YegUEXrCGIQjh0su9Hdvd5RsGyUAXucYqGSPwXRD9n9ujN8hiLfJphiBHbb+8WFRVE
         1IG6HvCx4PonRVtnT4RBV+NbgCA8MRD22bAGex9ez6uwPFkftVJZ/M2O0KRWw4T1ME6f
         yWQzDlapqSiAxFgT6jNqwE6RYyam0BOUQ4E2OYPN/+vDL+ZD4ickH4dMp2eBfl+VH/t1
         F2EXV6Mw60czk5hkjRuYz7sx1B2Nno0+YQYp0ZXeyl7GHSka1CF4omxV4dwOJEftXHoe
         NCLo5p2bARV/Ve2wVZObgVDARVMqSqJbsamIDZWvN4KDa8yIB3Zs92lPpfuOcnvwAA4U
         V7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324726; x=1748929526;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=;
        b=swGDioXk1+pdpJe1r4AdvUtLhSWBjv4b5L3uiJ9kX+rzuJ128gMGQb+Vpz3IriJa+h
         cznB5mXDiLS+/aPJKu6QP7CTxb3bkd3FFLZwbKZ979OCPHqg/bjGaB/bchzRDt25GUox
         lpePkNqtmNGYf7kjSi1FMQh7OgEt6UrgLLxklNy7QCp/ReYcAXxderGrCFgt5j4j0iOC
         UjTMSJwD7Nqoen46vPe8X6wgDIZw59/lfWVTdz2ReOVbbg4IuGLfLj0x3OaGS2dR1Nx2
         fiYo5spfwepns4+rQnpcBi8Id+nK0GmRT4zInqL7BfJkIfnczJfo4XWPA9YgRb587dbX
         sqYw==
X-Forwarded-Encrypted: i=1; AJvYcCV+sF95u1JWR5sWtZHgEc861mBw4XPLF0fh0rirU3zjXnYz0QXyXj9gvV7ZTsNcohxXqz9r5315HD8/S8JksWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGOasY7Ib9/0LgptCV7GWta3hdIahMMEs5/jmehiHBXoxhNLe
	F+fHIn3+k/S6B4S50Gtf7g6LItmJlQC005dOSfLc8IkiZS32NPcBxliL44TJcj97+VM=
X-Gm-Gg: ASbGncuBuGWWqdowHoY9Rzj3RExi31omLMRKX7alHvzWsM98nDjqSBN22GAsbm6Gjb/
	206TnaLDUinXShXW0QWECvt/8MlbhRvzZNijCbDnzr4vdvVMw76wNMcLN8CP6Ypb7jzlAYa8GJB
	MBZBgn5+tAsTc+xmmPMUsb70WdHpgHd0iDgXNm4dhlJ7A5PgYzo9XDW69T+/tkamXRkoBx/VzdI
	3lSvrp8QA9haRilWkYeJhnSZQNR5ZoCI9JNgjGzPQsO/7FyKGg9Vk44CUUlaoXeHWz2VVyF60LM
	Fpl3asiOz3tb9hJ3bT66Un7L44Vq3YntSiKrIZGF7uYOW5r+c5y9xlusi68IypIZANZSGr7ko0U
	=
X-Google-Smtp-Source: AGHT+IFjfjGDL9+pR2wI6u63W8YFLk9uDG95aJV/jaoLvZt0KxL00PabZAJ4WGFqwimBN1PB88AkOg==
X-Received: by 2002:a17:906:f58b:b0:ad2:499d:dfdb with SMTP id a640c23a62f3a-ad85b1bd259mr1048071866b.26.1748324725279;
        Mon, 26 May 2025 22:45:25 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d047749sm1788284566b.8.2025.05.26.22.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:45:24 -0700 (PDT)
Date: Tue, 27 May 2025 08:45:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] cpuidle: psci: Fix uninitialized variable in
 dt_idle_state_present()
Message-ID: <aDVRcfU8O8sez1x7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the first cpu_node = of_cpu_device_node_get() fails then the cleanup.h
code will try to free "state_node" but it hasn't been initialized yet.
Declare the device_nodes where they are initialized to fix this.

Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT idle states are present")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 3c2756a539c4..4e1ba35deda9 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -456,14 +456,13 @@ static struct faux_device_ops psci_cpuidle_ops = {
 
 static bool __init dt_idle_state_present(void)
 {
-	struct device_node *cpu_node __free(device_node);
-	struct device_node *state_node __free(device_node);
-
-	cpu_node = of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
+	struct device_node *cpu_node __free(device_node) =
+			of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
 	if (!cpu_node)
 		return false;
 
-	state_node = of_get_cpu_state_node(cpu_node, 0);
+	struct device_node *state_node __free(device_node) =
+			of_get_cpu_state_node(cpu_node, 0);
 	if (!state_node)
 		return false;
 
-- 
2.47.2

