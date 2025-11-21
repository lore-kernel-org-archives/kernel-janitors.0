Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564EA34BA2E
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732073; cv=none; b=N+RAKighG86BUs0Gnoej8878lmhHW8D4Nb7SFqSHmKsITmSbOSmMJenAzNo1qS4VSgYGuoyv/PwPs462s7ckgzJzASdB81bm/si5EzjTU2PDOH25XoP5TQasjv6OxZbpRRdhs+LSRA9x/EhHeKvBuiUzxlZuomch4sehAdOQyVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732073; c=relaxed/simple;
	bh=Oos7HIGTn/bwgg3Teeti/x3pmf7pNso68OPu4n64u/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vvc0Uck+ub3yOLJPnYJpFyybJJt0T04mkyTCqjWp+ThCMXEgktF1W50MMUA3vh90g7v9L3C7j3hbNcKKY9WEgKTUH6T8cjt8LTRKQ835mIdtVRonQS/W7zSmLCiCcqB0xuWXawNEPJkbM5T6qkwASP1HnMYVCCt3tYndwc0AaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0uRsbVc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0uRsbVc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so18956635e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732066; x=1764336866; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3CEpaA/qJ+oGSKReLG4S4q01srEKS4qUk5M4KQAAlM=;
        b=A0uRsbVcFLccWUhBfOJDPkZ8+jMKxjWuUAVm0oi5beAfOHaClvo0+0a+ivn/6MWCzP
         glKIojLaiKe6w6FRs5wHNX+BJHxrxmcQOiD6wZKjqSfP0bc/VGAj9/J3m1zWbQ+0ig0W
         dhEQndWFDMe1Zs/rQPfh5z+PHKRNJQsGEe6pcgA8cJWk5i98LtVey9conFFicpYXRSeo
         E5zP+WFlijU1nAJhPjFgvjoVx+HWmSu9zKIBJGv4ErN4iafPuLMNDpaxY+cAQevsR1FS
         Q7KUVESbk6wwhRJclPbXH1RwAgBgsN+trYMwwL7YRWS7T2/ztMeu7mNfKFnIrfs+/iF4
         COQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732066; x=1764336866;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3CEpaA/qJ+oGSKReLG4S4q01srEKS4qUk5M4KQAAlM=;
        b=AGHuOriKPNLkyrK+uX2GoMfg/XykhJQvlxi1qaXQ4lTMwNahIzRrMH65dHASIE6vko
         madlDQRcFBT3AAXD0/SX6qyn1N2/kIkQxKFcAsGjL1Llu/P3JTAXNRH6CoaRYK7QrRot
         cIuXppPCLqUGn9dD9ThRRm4pFsSCNt0EOdisC56sMyzVVjHt6BSi+1LotB1/Z2iswUXk
         CdXBfJPZFYb3S2IHtGt4Esl3rvJhykHqZAx0vQ5PKyjTaAnt+hcwgHXd6cpeXo+1GVhj
         joUYlyg9LrlaIOxWNU90u69Esa//9jqOdotHVXUjU5Un4850T4/W/7eNI1XkP5zCiJMp
         FarA==
X-Forwarded-Encrypted: i=1; AJvYcCUM2mTwZBJmTci6VJ6idUi3zP5UwYfYWsDUqgZ+UG0NcD8M+R0zTozs35fcNSMfBTFniqaNkaPDeLoylBaKqbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxulk0FadPhMzmSIvg60Sm/bHmNV/PQIOKbNLekccBYLv5DdgEy
	JKM5Up9/IKvRIMKw9Dol5m204QcP712wTXfwXxKKSArepOgxdkMA/cmbg+4jXOxbhl8=
X-Gm-Gg: ASbGnculC3RyoIn2trbt0USrDd/5bQHOcBqIsdD/8ZtI4D/gSF5VcvSs5ZxzypvVYWC
	c/2QLI1GUl7Bet2Dnjgg4wRr89mZVcBtD16tQvSRZbee4bUbU/6em6br07rSglZoTKIUT0wuKBa
	gRJHGaZPst4GIV8SGhNvl9T2CPYUNLUWq+IL4pazhT+snR8aRfvMYe41S/IPrN90YuZIQyoBkfE
	Do25Yhx4LgyCeLtJuLJOBjk2PFQ+jzXFtetnle33Psf0ZX5JAo1DcG0lm1XykT4+nlry0x9BKhU
	j1DArZgRg2C7TIc21AZJ5ghojVvh78jlpY75WA5o3NNb9D6WjLD2ggOHU/MSOT2MtrNGVgQRavb
	9w7KrIW7GlW5uVs1OH9gaNeQIZTjH81abmztRJpmTxmGWHigPALiSNaYttaULIyPvDuBFMAIyiG
	oHtf3xvVm8G463ki+o
X-Google-Smtp-Source: AGHT+IFEY2c4x6XIWLbZF3xrWJhBqpdxwAsK0LObkYinXP4JTX+8TruP5faN5XWGNC0J5oEbJFCbWw==
X-Received: by 2002:a05:600c:1f0f:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-477c016bc96mr26169455e9.1.1763732065926;
        Fri, 21 Nov 2025 05:34:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9e051d8sm87690635e9.5.2025.11.21.05.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:25 -0800 (PST)
Date: Fri, 21 Nov 2025 16:34:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: intel: punit_ipc: fix memory corruption
Message-ID: <aSBqXtt8hJb7WYIc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This passes a stack address to the IRQ handler, "&punit_ipcdev" vs
"punit_ipcdev" without the ampersand.  This means that the:

	complete(&ipcdev->cmd_complete);

in intel_punit_ioc() will corrupt the wrong memory.

Fixes: fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/intel/punit_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index bafac8aa2baf..14513010daad 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -250,7 +250,7 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 	} else {
 		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
 				       IRQF_NO_SUSPEND, "intel_punit_ipc",
-				       &punit_ipcdev);
+				       punit_ipcdev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
 			return ret;
-- 
2.51.0

