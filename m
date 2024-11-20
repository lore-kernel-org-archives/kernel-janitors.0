Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864D1AB539
	for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123152; cv=none; b=g6cHrsr+ejUNufbUmdDziMD7zVHj21kzMsSnXEhkM63zzLcva44pPUD6+G/CEwQWVSk3zXzuGJjDW3ur10+PHXHZ4nluKA9IdcZ8WbhiI8zU/x5ka/gBhoWj/gLW4bXOlcq508Mgmrct2QjX7RxNT3G6be3ySZOwtMacxPyKpU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123152; c=relaxed/simple;
	bh=aMlj912aJwM7LIeO5svmmFwooxRnaRCe+Yl+8o1KcuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KoB8y58VBiTKCH7otzjAu2Tz+zWXIHrnwk50mbBt038AufAOBK1Ule9cmCJqtdYkKQyIz4x+7uSuZhksvILI1OZnlw2mnqsdwpuvZdONXcDOyyiATkZePSkz4WUJY4JQ3CxTLCQ2KURZMgwqeLtFbeG5ToOwouyDsy8Emz4hLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSRTU90A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSRTU90A"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-432d86a3085so42941145e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732123149; x=1732727949; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyiP0MxQdAmx7H0LainU7jczTRUd4MKDrKPjA66RP3I=;
        b=SSRTU90AB/FImv+Oov9FKEre//n4Zjo2YM3ajRDib0FrfNHea2nQSIa831/VtMnZ24
         oyMWbYFWfoOSb0k5S72KEjC6NtkolS9TVwXr5ouqboocuSl4ReqHMnvLxTWM83SnRNKg
         wM4Gfub9gxxedKd7ZatbYAvvqurwNHCMlf/ouiVvMyxhjaqVMEjA8+OQfB4dtSYcxDfm
         ilkE+H5hbCK3LruVQvSvH9YMfYWCckp9hjWH+vGfaf+vl9M/Nn/0VmXNbh+uzbmhGndK
         zfNRO2ukBXMSSzLO+HIjRXJFeip2NbvJRqfzhZe3zuIQeFZm0lpNzrBr37WXYZTDA8dQ
         Cyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123149; x=1732727949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyiP0MxQdAmx7H0LainU7jczTRUd4MKDrKPjA66RP3I=;
        b=pZpB7a9c1+CC6j7Wfroo7kVmiq6oKN3wapy6M7ijXjqG1D53phJ3JYMaQc56YjT+bf
         7oVQ8nnMJDjEDPxjT2Nr9Vj8qtQITPeS3xBy9GWqaKYE2OeysXqU5teV3IpZTH3R9jIJ
         12H/iKNqTtAXMVx/LluMj4Ff3kiE8nzUKjaGomsFMKhs33TXqUn8+mlzM0qHItDMwAW+
         cJFRMdvhlpCc0ru0MtiuY66HDzUys+ygE2YTFld6kTd9eChZTLc7GkwJzp32UevA9uia
         pKTEU3I+0Wu6+Ai4Z0R38tMz3roHJbdRBd7Iz/VF3mnMHcye2L0x4vYa6TlTqUw60+QT
         +dDw==
X-Forwarded-Encrypted: i=1; AJvYcCWD7mi9Q4aV64bQp4q8gcAeQHVECS36dkdjRf6aT23Ml5+yWMa1Uzcb0MmtrgdQMv+MvR7mUo+NqG9o+3Dnwc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwEAd73img7gAIUaEspwv4ys4SzRR4y+O/SA4afSaD2abG0xyb
	jHbp0XwsPJP41xXD7YSXv2rE/0IuIbJ4HVNV+dJdk7LL9oixgj6l66z5LpW+GEQ=
X-Google-Smtp-Source: AGHT+IG5JIx0KMSnLhIOx6fmV+jjW0KaoHFqxB+0+tP9hY+E93urgyzJG12FpUEVyW5mCoKbBXDttg==
X-Received: by 2002:a05:600c:1c16:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-433489ca97fmr35463405e9.16.1732123149443;
        Wed, 20 Nov 2024 09:19:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463b0d1sm25375975e9.42.2024.11.20.09.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:19:09 -0800 (PST)
Date: Wed, 20 Nov 2024 20:18:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908-apbcp: Fix a NULL vs IS_ERR() bug in
 probe
Message-ID: <6155067d-aed5-4799-9e14-6dff7be1cb3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function doesn't return error pointers, it returns
NULL on error.  Update the check to match.

Fixes: a89233dbd4df ("clk: mmp: Add Marvell PXA1908 APBCP driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
index 08f3845cbb1b..f638d7e89b47 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbcp.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -48,8 +48,8 @@ static int pxa1908_apbcp_probe(struct platform_device *pdev)
 	struct pxa1908_clk_unit *pxa_unit;
 
 	pxa_unit = devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERNEL);
-	if (IS_ERR(pxa_unit))
-		return PTR_ERR(pxa_unit);
+	if (!pxa_unit)
+		return -ENOMEM;
 
 	pxa_unit->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pxa_unit->base))
-- 
2.45.2

