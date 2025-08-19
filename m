Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1C3115AE
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596409; cv=none; b=X/nrqyCCVmFf7GmO/n1c9k15UvJIQedIPVwif0w84rRFAR+Ti/HU9ekh7eD8Rrxpsr2NVk+HR3O95FgX4utWsPt6a5Cqww4K4F64ycd6TQTGaMoNqQtQgrUzkpCoyxO7fcdkv71350n6Z9cl72mIH6P1CoZD+rFZh2SNCVpqZR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596409; c=relaxed/simple;
	bh=lFXMKJkD77TVv3skoL2tVIgQ3axtVWHXSpWd/kR21MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqroB4QXQn7h3jKGNB6oUoMswR0Rmg+SFa/93ty9bYiPArGY7Feyb4rK1bvbCj9AtlmcnHZXywUY5x0jfZGzd/I/8PclKZNLjSamNXldsBlFelkIaEzj6bHezvaeduyf+Vm+H4rvvspaKO4lXpHJt3MLvIjnqyU4n2x6VBtOSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tEvL1X2E; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tEvL1X2E"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b916fda762so2863504f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596405; x=1756201205; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiTftMOuutV4vYFy4eckN5Ll0Y2Ut9a5Qvq41E2l5PQ=;
        b=tEvL1X2E7O2/t2xOFEtaaVsUrGPktLAJ8T5HmXB0lbBdKob4n1S0oP6L2DxA3/+K8R
         3C5YF5XPZfyUcwgEw4UAnUJbgURm+sEeV+e8bXJoS+LItRN/q396vfXUh4ovS5khC1sN
         LsxbS2Nv/rlqCypVZkR7TWuRcBLwgA5UjKg1QDgpsxDNhSsajttcnX4HkGeqAOZHXNba
         NPlpF5oTyCrEVWTTCffyVNX/0SQbtWu6yvKrETwkEYF1xnBV+Y1Y1P45cMEjrlEYthVK
         5cc4j7wW3kznVXREJlk8tAXFQ2/bnQgw+TleCT3FqCqmNazp7srCL5izCpAKySY0nAvU
         fB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596405; x=1756201205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiTftMOuutV4vYFy4eckN5Ll0Y2Ut9a5Qvq41E2l5PQ=;
        b=l1PwFrmVJfPpcUkNNCIgMvXg/Wc50p9SqL+nbfkx2SPI7dBuR/hjlIYYGGOg5NvLId
         +WpilKl72kmUsenn1KYwnCSYsvJxXi1dIGgEMOzvQdEsIvZpSD3MdmLj25SJcehpACOQ
         H8kvVpsbv6cpVVdGbA3AbYHAWMgu8bpq2KCCqHl/0jYsMyw4E21n4Xk6XE4QJyfqUbdz
         KgqBpTqYN76LScj0Anc8aaNaxlEMVLzAINLLysXi0M7pH1isUYqjW4vNhdttN2ILwPR1
         Kk03xO/qYZ+ISdpSovUUum2VifsCF2W+Le7LWwo7aAM9R85H8vH8OIo8lqw+N4COH7OK
         xBCg==
X-Forwarded-Encrypted: i=1; AJvYcCVWh28UaTQfy7VZ7agGtXVoZ3lcYxXW/qD02THDOZ0oHC0LR2hcANyotrYDG+5gIpOaNN8vfO65WLY+QuMdiN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzU2wDoH4uqtMAPnqo6F7VE14pD6Pd5cuPxBpuGdQGOikwqYqx
	sB2QUwkshDewTeNGVCuodINr6ADkLLq1UsVwLLlQEnSkh3dOyBQ1PiGcr8qi3MP4zUw=
X-Gm-Gg: ASbGncs5sGaDb3SbQnMAGbP/skfrMcOyCGwiFdxRBYdKk+OHOH3dmGG5MWOEruMLNj3
	Yv18TbAonTx084u7/Tt+cOZZxSyMQ8De6DJoFoquTaxKzXaDhvDm3P9Wr8ehf0Rf1pmtkx9x9EZ
	4eSrayUk0SmGLXiNqb69f4VZhyg9BxZ23WMFInISeYv0DeuabKIIIqF6iq/BMQyxz/rjwVTCkyL
	z2fV9ny8yIhUxAOe3nPljXphwr+XZKpfa9vGG0ho0nfML92kh6Af+I/EE1sCemiEecbuS62JcYv
	7ubN9bNbsLBtymsaXOIRoy0m0/HWuWEkv4H9rlwv3I2PG/vTG/2yNoazMkor/o2odU23DPTTRyb
	xWyz8JxX3K1jj/gAbO61BTqNNclc=
X-Google-Smtp-Source: AGHT+IEmA2rIqWh10N25HpFTkyRTLf33hBwL7CA8l3kzmU1d9YQ8FcSm/BSFS4F04By6ZWvUc9Balg==
X-Received: by 2002:a05:6000:2310:b0:3b7:6e64:bed8 with SMTP id ffacd0b85a97d-3c133d63836mr1403055f8f.28.1755596405461;
        Tue, 19 Aug 2025 02:40:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6c324fsm201628175e9.1.2025.08.19.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:40:05 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:40:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Elad Nachman <enachman@marvell.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] irqchip/mvebu-gicp: Fix an IS_ERR() vs NULL check in probe()
Message-ID: <aKRGcgMeaXm2TMIC@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ioremap() function never returns error pointers, it returns NULL
on error.  Fix the checking to match.

Fixes: 3c3d7dbab2c7 ("irqchip/mvebu-gicp: Clear pending interrupts on init")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-mvebu-gicp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 54833717f8a7..667bde3c651f 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -238,7 +238,7 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 	}
 
 	base = ioremap(gicp->res->start, resource_size(gicp->res));
-	if (IS_ERR(base)) {
+	if (!base) {
 		dev_err(&pdev->dev, "ioremap() failed. Unable to clear pending interrupts.\n");
 	} else {
 		for (i = 0; i < 64; i++)
-- 
2.47.2

