Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974CF189F20
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717082; cv=none; b=C8sgNyH4ZobXYCJDOhffBKn0HVnh5K2/EKgtmPTDqcZTGNPn4q3k+buib8s9N9CfPDzK0umzm2mQWgNKASDaOnIKTkFtJ/oq5kzX7RTPX31xB4JSm2pzjFUMb1Kx4fPP+1yfMHb0ueabvX82ks2sv/7anMNHp1HkPZj2ZD21E6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717082; c=relaxed/simple;
	bh=21MzbEOZZxXcBp8tJHgBWsUDFReLMA5Fun7i72mkmC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac8dQSCetKydR67f6Jn1r0c12Ce15ql7ICMBEuNCEznE0Jgv6fPzYwXy4w6hkiHrEnSoA2MawOHVsf09dleY5thrlddry3KqomloaTr0OiCYSJQ3UoEWr5vM5YjDctAYR9efrLNWXkcNyQtuQfMrz74TrOS5OXBDommANEW5llU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7zQ7cSB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7zQ7cSB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso1461952f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760717079; x=1761321879; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
        b=D7zQ7cSB9vFPaq/b/m0EfXvPBlSWRXcAguuwC3wCW4e3eDIEjtJSSIT/JesCfDWvLE
         0y3LE96XMeyHVZevh08q03BV4CVKHvitEK8Y9hYA1JeXV86n/k2ZjMXNvlwAZWJqvoEN
         P8rLTY1T4EK3wHVoMPirhx4G0kZvV+5yXbRgWziGDKmo+oRiXOroyftaEsxoYlD4W0kM
         0HsnjZ3dc16xWTtKwSbhEQgILlh4HBYJ6csRoO3WUoyNe3r1EJPLaXMcZu7DeziR2nWG
         g1BuF5Z0LxKTWSujw1yAc9qxSZ2lBHDoYDTdvamiPWh8zsFzcs/ICeiKrkW1quBnRwFG
         jKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717079; x=1761321879;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=950Q3osvXfNrhNZDR0R7N+wo2IA1yL5cHorDQTcIxKM=;
        b=UF4WXHt4xB/RIXqzBw7/HiRlKScOy4f/cyYe63IjHHaqAKJLBzwBYMx5R3TX5VIxb3
         Gh2xtnpS66B8TSyNtTi/9GaqU9PBc2WfhhkqTnQZVCyX75YRkNcYUhDReEo9lRhnaUzs
         /ESPIYuaRXJ9b4XJkgVkHJerqmHfvHzku35ATpyaEXE8fukQvUykSr4voBiz0W0L28uf
         cGP1F1YPj+7mLLqXrudgvG2lohYsPb+8yQwOYEx1qoIJlTbYb7HxVbF1Yd2uWxjSsBge
         5MYAyHuSvdEp+Gk9R3V8II3I3flEesWC9KC0UKxJeOrWY/cFN0447CypvqZRZ4egOZ1A
         M6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2IdVG1euHHdIbHPj8hU2H+hZpVwo1fj+ZO+Mf42FaTE7CEjoCPsTGaIxOj9fWj6A8/Ec3w9gc0ZWSL2gB38w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqQEpGaeaMiv2QyXU6YPnpkoGKzMTCkZJub7R39vovQk4qr9uz
	LQpTEGiCl2zOCLYf6HgbB3PKvYW2CfwduwXkmc/if9PmG1VXVH5YBOYiEyc8yuJt4k4=
X-Gm-Gg: ASbGncsjxk/nuTUHBr21Ad9qAyWUzlkJ7pfZad/14/QOj88zr+xvRcaYOf7hHiAlYAn
	usutgbP7bbLg0l1lLzkT/qrV6mQfGtoZPS/RTjUSaRthRLV1M+lvq52EUlPCrwWHFe+UgEvRu7Z
	6A8jes8kQWZHZWmz7mZoATLYL1Q0HjczuPHOkHKZtZOxaWAL30oHYAc279n5KesZQL0FukKqMCr
	rMdrUDVj/Y+DwFen/vK5I6PIVb0ccgBfHonedNfEwmZWVksFOj1Au4V5S67AL5Kr1KjUwuHnMEI
	Yz7Wu69LXE75o6UGyij2xIKN+ucLzy+BWmQ0xP5eL2nYsdasyCpUA+I4nwIJjZGhPdtbyWvx1g8
	4JGmC3oUX2FMuhDrKrFaM0sA6TYX3lHpwYBTaoIHMsjo/GeWOGy6UQzWsYBrvTNnFSCIMfYwxdW
	y1cHus+w==
X-Google-Smtp-Source: AGHT+IEqaf8aEdQodsl+JMqmg15To8fNumQ1pcFMtGOlWgs5DrBRbhx4c+4oaiAKATvKgQ4yjwGtCA==
X-Received: by 2002:a05:6000:26c5:b0:426:d72e:9924 with SMTP id ffacd0b85a97d-42704dd6cf9mr3110630f8f.51.1760717078511;
        Fri, 17 Oct 2025 09:04:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a1056sm544f8f.2.2025.10.17.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:04:38 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:04:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: aspeed: Fix an IS_ERR() vs NULL bug in probe()
Message-ID: <aPJpEnfK31pHz8_w@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The platform_get_resource() function doesn't return error pointers, it
returns NULL on error.  Update the error checking to match.

Fixes: 64d87ccfae33 ("spi: aspeed: Only map necessary address window region")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 0c3de371fd39..822df89cb787 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -865,9 +865,9 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		return PTR_ERR(aspi->regs);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (IS_ERR(res)) {
+	if (!res) {
 		dev_err(dev, "missing AHB memory\n");
-		return PTR_ERR(res);
+		return -EINVAL;
 	}
 
 	aspi->ahb_window_size = resource_size(res);
-- 
2.51.0

