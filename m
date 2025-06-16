Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593501DB92A
	for <kernel-janitors@vger.kernel.org>; Mon, 16 Jun 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065607; cv=none; b=G4imhQjMgDH4FIQOkO9PNm7QIp0pwSmDSYH1PggVvHPhwIG4VuLCJIB3PanJaPrt4aTnP4Ct4K1AY0L9db+C7VRiUXeYlT1AfgfG+DVfL0RPR1nAjAxP0YJP6U/xXEGqHl9P8OykHZ1lBG0ODyyB7SGU2AuamZ/+qLAr35jJZGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065607; c=relaxed/simple;
	bh=SNag/bOAXJOjhxBCZjBV9Gk10G61ThtijECgTvWYBlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmms1f4Av4MZADKGC2mhSaYvej7RJqyA594GgKI6LL+YIc85xLsg4SyixqP8pCvNKGjowPJymQnO420mKjKM4yuGmve+PpkeCuFxdfTvED97IMD/Hn2Rbk53PpP1ZQIZCRrWJ6VT3+GZlU+iUnSL7zG3S3Be38/FIWOCZkwXzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7cLhWnR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7cLhWnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750065604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2aN38x2eQAv5g2zQkakGSr4DbNCLimCT3gIZvjNzrH4=;
	b=D7cLhWnRBch5ZTobOTwZJEJBFCe8VqMIwv3BXJ5OHc/IU5vrSdObOC5NkjLQSHj0gK+WfW
	1b+iSmtfk9kRyHYefglvu5SoAACg1yaLwZRIUfxQl0Hlx6WbeLQyo9fCUrkT6GxHl9ap6q
	nR6bA1txtlVkPpgTmYalwLsJlSnnR5k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-8aDaSmI0PiWa29g751BWaw-1; Mon, 16 Jun 2025 05:20:02 -0400
X-MC-Unique: 8aDaSmI0PiWa29g751BWaw-1
X-Mimecast-MFC-AGG-ID: 8aDaSmI0PiWa29g751BWaw_1750065602
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb61452b27so426534666b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jun 2025 02:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065602; x=1750670402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aN38x2eQAv5g2zQkakGSr4DbNCLimCT3gIZvjNzrH4=;
        b=EKWNEoK0PJp7RYymEM0/0ORbB8Kuu0jVQfNlMQeOgdqqdzDZML/KQTA2nZGoH0AQ26
         RN6upGn3FxnGURdUc4YOdmCD2KzL02O2mmfD+uClyUTOXu+SHNStxWyjAG75Pu6kncFv
         p2TWsP2D7Yop6xZToe6KLIKEuyzmqPfUENKXkINT5G3QBdwyGcnt2scPtfzoriTcBQlx
         UjNzonnMkdA8joaEQYPbl3wPWc8S418ZzoZhrDgAJc1U3qXBkMvGRaDVaO3Fa3Ayzp2X
         tToKT5/3VBLlx+ebyx0yxX/IzzTvhTxzMSe4c0R7SEEAZf8P2m2JumVqxPyfbcR/cRY7
         Iiow==
X-Gm-Message-State: AOJu0YyLZ3hf9a9z0sHi7VjtkbW0LxtQ9scTQktNWFIXfF2aD7HYv3ne
	Pq9PlPMa77MlZ37NiFGZAM586/17O48rfNVIstu2NeXdy2Zc4vvMaNA3Tl5d+v8kArzLyhCPfzZ
	qUsYlW2fcQs5mBLxj+f1VImWThgvnw/W2DyF+uBqiQhijhIWf/IFGnFNsJlc02uXDSdxbtA==
X-Gm-Gg: ASbGnctznqpxm9zpIu41neUhAP+b3VTphUwjgpjjrslZjd0DVdX9TvHcII8W55f7lm9
	GpRpcRE+tuhrWGOVmIaA6SmcnGuJqL9Eqgs+Qgu7M9z7T1q1Y5cZUaK9uYFVn/qprUvnLwRw6Cf
	iD30QWdcs2O1ARy9AhOT6PaELr6jpJIoWVIJpr4OpxjXgtn1bj8dt6AleqlUAdEARGHGyGvLryn
	Ivtk+rHX4reZb8AFepvY0XjvyJsn5Le0tE2yl3ML1yAoyg0pwRMBIuUnZJT5D+WZl3rOJE0D8Dz
	psBF884AAQHKY+JlUda1A/eFwc6gyhQP3uYieZ70ygjicFHV9r8itMiIE9ud0rspqoDs
X-Received: by 2002:a17:907:1ca4:b0:ade:399c:7a9 with SMTP id a640c23a62f3a-adfad5447bamr709041866b.37.1750065601668;
        Mon, 16 Jun 2025 02:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJKuhj5xyfGL3uzgbw9CuILR/QbgjEmvD0ydX72pNcFuNUu1+mxkyNoYCSx3RhwBrzPxddVQ==
X-Received: by 2002:a17:907:1ca4:b0:ade:399c:7a9 with SMTP id a640c23a62f3a-adfad5447bamr709039066b.37.1750065601216;
        Mon, 16 Jun 2025 02:20:01 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c5c3bsm626948866b.61.2025.06.16.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:20:00 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Mark Brown <broonie@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ciprian Marian Costea <ciprianmarian.costea@nxp.com>,
	Larisa Grigore <Larisa.Grigore@nxp.com>,
	Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] spi: spi-fsl-dspi: Revert unintended dependency change in config SPI_FSL_DSPI
Date: Mon, 16 Jun 2025 11:19:55 +0200
Message-ID: <20250616091955.20547-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9a30e332c36c ("spi: spi-fsl-dspi: Enable support for S32G
platforms") reworks the dependencies of config SPI_FSL_DSPI, but introduces
a typo changing the dependency to M5441x to a dependency on a non-existing
config M54541x.

Revert the unintended change to depend on the config M5441x.

Fixes: 9a30e332c36c ("spi: spi-fsl-dspi: Enable support for S32G platforms")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 60eb65c927b1..f2d2295a5501 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -647,7 +647,7 @@ config SPI_FSL_SPI
 config SPI_FSL_DSPI
 	tristate "Freescale DSPI controller"
 	select REGMAP_MMIO
-	depends on ARCH_MXC || ARCH_NXP || M54541x || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_NXP || M5441x || COMPILE_TEST
 	help
 	  This enables support for the Freescale DSPI controller in master
 	  mode. S32, VF610, LS1021A and ColdFire platforms uses the controller.
-- 
2.49.0

