Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0FE1E0B91
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325310; cv=none; b=lHDaGj1YZEP6wgGRyNYT6deZ2RY1FA+MvdTuncJREg5jsoG5y9OuDP2RzoEi+akTeUDUrdTc0m8lp2v0gGNZKOP7HXfq1IqXMVq78E9lE6lBKHlT1Lz/v4HQUvfmA3B5Zf6SGvy6k8roHoHB06XDt2RFsujmL9gOh4hzDodeVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325310; c=relaxed/simple;
	bh=kp2Ho/gN90qoPt7EOupJs6drcisxOPFdqCVoJAm4AUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTkIJTRvj4AEqrWvAnbw8cAcFGK3oedorzRUQGGdUXiegvlSSRiDytwjvsNpEYqr9HUefW4JVoOTNnoz7OSndvq3cmQkvdUE1pGVq0fWH9YE48AKgGwZrwZO3kdPcQ7J0Yc03HeStRZfwx3zfq9qKNlgi2JVXqpAi1VuhsOTWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqBvIRK6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqBvIRK6"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so2536828a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325305; x=1748930105; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=oqBvIRK6POmfT6Lpcsd6rtLAadL4/sk/ZvLuE/DlnDsmWoT8GJGKs1AbGOToP/560N
         q+wok/6j9NUxz7tdV/UKvySUjjXgURCOkEx5cGyuQPScB49rvwfi9A1EG2dhZRNw1ANw
         v3OXvegVtDbJ12mJW0exwPsJ0hLnEzjBwKezoN8XOmMQ2Ja6HGfhHUCwiD6OHFvaJ/DA
         iAdv6DwNssGp0yZ/yr+Z0JtY8pQnHDTag20uURulIUtuvRKnIG2K8HT7mexi/jj4SEGk
         bm7Atk3CzfGgQHmKECGcYoBO5ShbMjzHwur97nY2EVw/dCl0VXjEOJ4OF3ujguvlKPd0
         O0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325305; x=1748930105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=nEFNgdG9LbzE5KdeN//hAeN9Q867PAiEBL7pOuiywUbD/qpyu+k03r4j0AUWwbm6dr
         QYj1zMd2jS8lG5qPE2jvA3UtUL26gFJ5vC2Ht9HrIYwXXfOZKmsyKfd4gVYiBciTl53w
         tRu7xUS0XIz2+DUD0RJWYHRxSMgYmMYVqfjo8p83xNvUD1bjQXrC9XKNN/cyacvU8UVk
         ZT2NCr4P34+/ztG4PBuQmOBGJ9wT3XfcKhpKAeV1DbsgSaB19NGua3V7ivc5RxnFSqhC
         8DK5fZP83HVv8VjpbsYXSY/RvHSQFS421BD0xsNFKSgHGsTPFLghKvbYY4dd+NA7XyZ2
         olBw==
X-Forwarded-Encrypted: i=1; AJvYcCUo1goY0eQ5Z+RDo+p5kxYvRAvBr8J5FtNFhntrJRERlqa6GUeAvudVgKtL7sbrUC1YCUDj8fhkaE3k0EXSOFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJimHD0FBu7OqHiU80x5LuCw9TXIztjUTAAdcqQsG6sJSUipp
	tLxTNBgVRCIpqL2p5JAmcnjY2XEnT9VgZfopN/MbDxmc3tR4H8Ccf3uOJvuDuW0Jp8M=
X-Gm-Gg: ASbGncunb1HT6ejA/VYyDyr8/K8WXFmUuB7jGSXfjPSQCPV6WBvFAPgsI0jB68IZqWc
	xr79ux5n35euKIDr90hsrGy8J1oBiVZbHXzsZWDvlmfhixFKHGZzTd9ZRP9T5+phYVrg1Nt3QOS
	QXfJqcUq1Gh7UdnsAIaBxhUrWgdg8wAdQVg/Oae7YisxxMKZJwdE/S85xDbrEEJdhs6MdANur8W
	JygTwcNR9tUrxfZ8JDOTkyWd+9rLCRMkU+tnabgzMFj7WipdUPFsebhzknTpM8Kd/vYuCGh6uof
	wF70uqdulLzSdeL2T9QAm+AaMciNMF6lt8SOZEKzt8UqOSppkRxhinIPrSxRDBcBlAeH5B1IWsA
	=
X-Google-Smtp-Source: AGHT+IEv5s7xDmY7xLIqn57Glb7AygAOacFI1nEFLy11fNwi+mIgMvJcQA8W8aLW+zQYLW7VY4hQDA==
X-Received: by 2002:a05:6402:2713:b0:602:1832:c187 with SMTP id 4fb4d7f45d1cf-602d8f5d5camr8978474a12.4.1748325305573;
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60464875b8csm3393023a12.76.2025.05.26.22.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
Message-ID: <aDVTtQdXVtRhxOrb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If spacemit_sdhci_get_clocks() fails, then propagate the error code.
Don't return success.

Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 6880d3e9ab62..2e5da7c5834c 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-	if (spacemit_sdhci_get_clocks(dev, pltfm_host))
+	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
+	if (ret)
 		goto err_pltfm;
 
 	ret = sdhci_add_host(host);
-- 
2.47.2

