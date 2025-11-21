Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A3349B1E
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732109; cv=none; b=ZoHQWYoaLAlwT6bTkKuh46JtfME3xxMGi7j0LF/3c0AS7/Krty2ZPE4eJ/bsV5LhVh9n1Mxj7k7hqA0mfnnttj0GcdvWMG+o8TeFvDFdukALSLf4S7HmyamzYbib+8uBHUbklUogoSiK0x3J2NxxvcCLekLm7BEu5omimX4IS3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732109; c=relaxed/simple;
	bh=hktJNp5r4PgkBcqCirMqTHzK016VyP4+D5g6LVifXys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJkI4Pld3mRwv6OnWMUKtY/4Wqw+/Ke8+COzd3QTttjg+Gdf57fDDWiGSY/xaYzca9jmYnKoqfrL/9WxsBhjnk2zWh4NXau/hX/o5fESt+3iECagNIuSupXRthnpr6Y8fIF94NW/370M+31v4vFSiJjpZ3qij5caaFPFFbUqiI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+L1LBMS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+L1LBMS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42bb288c219so1889461f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732106; x=1764336906; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqvrWwIAH98E3GCNn8rbqv0Z1nqQqruLCAExUktrPVc=;
        b=x+L1LBMSKE8b6NZH1KVFUhR+Pknn1Y//kAjS6KkwaBNO+loLZh+VZCSoLQe7MMmXa7
         Exp0tSyzmpWtBfUt485jNDZ5BtgC8K+6Aht1ct5mSXRAKitzCQUw5fmh82FcAgMWgxGP
         UIXFmeM3DA9EoyaornbeNVAIpSM3EjNWqpqGW2fQv8XA7X1IhTXNMnaJuZITPu3lG3RS
         SzEOOlZ3ZTMG7LPP4Bc5JIyO0ub/RQSSZQqJXcFlZTbcjSKbpr68J0U9STMcrvpppKJr
         zzrr5oF9ZzlO5GXJ6wIF+9kQlQO0KNWqmEMFnFaqt4+IaJEppbgpBRAP4efdMt47P7Mf
         Qkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732106; x=1764336906;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqvrWwIAH98E3GCNn8rbqv0Z1nqQqruLCAExUktrPVc=;
        b=jWjELIC0+lqClX2MxHewrfKgmDj5S8Dr7rpYadJjhKBPUz1uLOeREfihvD1iOkUUZM
         IWNYsHBojT3HCbMe5xj+fh3iWD1qUIr1yyVhj/cQPxJcn+4WaietbVBxHBb/1y7NnMG4
         a6xj8y6ZkNWEn1pi7LW9FhubLET5cCmDt5lO43y41l5tkEWeBCJlkUYftdY7le2MT/Ii
         hPlI7KcNh5oNstI8P2wzbx4YvoudmbzbBjpky+TVd9kZGeK4/E2IhIqPzvU/D8gBcfnJ
         GMVa0168gn4MQEeDHpkG3fn0y3hsOuBnp0HTBIcTHF76+9LH9daEgwhlckcEweFAXqyp
         5qWA==
X-Forwarded-Encrypted: i=1; AJvYcCUxKKS4WhijIPSLtD4EpbBHNhJqsatiP4lutEXPXXSorvFgaXixSmhrY+TsEncTqT8JsCkms2QOJdLSgp1nV7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+I2D8IgsQZoyyveqPfciy1hCNdD/oJkp9hmo9H9SbLmTSn3n
	2sdKKf5KuWErdphFppV5jYHGqAgHQcF7r2f3mC7qqWSycI/H3CXq3/caEWjovg4N544=
X-Gm-Gg: ASbGncts/i9PlEjF0kNu8+8NODXha2QPYeLiGY0vBmhrvRgkMlyKrxHlWzyNpeJvAef
	4/ZnDUM3eK9YbphFXiTr/OgJz8C0qgciClBdXDbr6UfO67s0KnKbw+IcjWUTHN2EjXJqjG2pC/C
	tQFv00slryQYMeLRcBkoEGkoSTINi8ukYiF6EZKHExFEFLOPbD24AJl4EjzJGabBn+nFv/qd3Ce
	zXd4wvKf5X3PY6KsTYNM3JXp/4tSJ2WKHBkfwH5iJUy0siH8Lxd4O05MpjdUf88iDEvDl2z5mFM
	yoaLsMcxxkqebQFWKAa7QOC9cEMWOxK9vPj5aOkQwVk+CvAwjuX+w25GmgZTGE1nDGK+koLK5fh
	YH+TCn3jWCL9eBEyAnkMo/sHtXXTlpayJA/S3ZUCrHYkf8wXcBWOJloXmfbfwW065rGsee5BU0T
	UVJh7XVJXifR/QfD4iGDX+barCSzA=
X-Google-Smtp-Source: AGHT+IGAAZuJMb35YVwVd0XVBpgFQcFth74Yu5RjXUkruWgElazXjr2FU56f062qpHqju9zFoGQDCw==
X-Received: by 2002:a5d:64c3:0:b0:42b:3825:2ac8 with SMTP id ffacd0b85a97d-42cc1d23eb5mr2641946f8f.59.1763732105589;
        Fri, 21 Nov 2025 05:35:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f34fe8sm11150653f8f.15.2025.11.21.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:35:05 -0800 (PST)
Date: Fri, 21 Nov 2025 16:35:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: Fix potential uninitialized variable in probe()
Message-ID: <aSBqhdjiywXq2Aso@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the device tree is messed up, then potentially the "protocol" string
could potentially be uninitialized.  Add a check to prevent that.

Fixes: 059f545832be ("spi: add support for microchip "soft" spi controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-microchip-core-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-microchip-core-spi.c b/drivers/spi/spi-microchip-core-spi.c
index b8738190cdcb..e65036cc62f3 100644
--- a/drivers/spi/spi-microchip-core-spi.c
+++ b/drivers/spi/spi-microchip-core-spi.c
@@ -320,6 +320,8 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	 */
 	ret = of_property_read_string(pdev->dev.of_node, "microchip,protocol-configuration",
 				      &protocol);
+	if (ret)
+		return ret;
 	if (strcmp(protocol, "motorola") != 0)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "CoreSPI: protocol '%s' not supported by this driver\n",
-- 
2.51.0

