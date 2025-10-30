Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CA61A9FAB
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832006; cv=none; b=RJw+5ojEGNTN9etmMmL1lwtmCbpzVxuLxrqL653HKcL56s2bcSUrlrxkUaNithZ6ICgwbH+t1G5ze+4oqqWlx5BsTMrMmBuj9149YIUMPCp3aPpwh1wR8yVNeXLoAE+fyFa1txm9Rp0jlgljcN4mlRt4fpT9RVti190eeGEpXng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832006; c=relaxed/simple;
	bh=m/qQ+Ye47boxFRojPi93NDRLf547F5zOAg1Vvu5tBSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+UGkGBaqf80EjSGlbxr0LvkPuJSZFsqxgo1iuE0aNe8TB4HsXO4UADXe7OD3Rxo3p+cWScYWr7PTUH3LI33Fcl4pbFCsyBV29GZtE9s2QC4kE3FCsnbxKBO7yZ4MGzIRWKX7zHOSfhucpdvSIpDA21IQRVpwjoccqc0y5Qjnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LG69tbqm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LG69tbqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761832004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qXVeC5x4UjvdpdxBQtQYDv2PCBr6tJQZhEasSYJVqpM=;
	b=LG69tbqmsarS0cLiVVpoSmkrdr4Mfij6gcKGsrrRmkDxqBmMvnl55TSvDTTp2U6GzI3OHv
	r39v27r/kM6nWlhQFPlmwhnnalkiVojDql6jnXiNRTuY4H/dsTBUKBmgd0MUFBhipRjJdH
	rrrHaEH4YykmbcOyWibFPf7Sviw3RpQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-XyK1QKO4Mhiq1NPON1i8Ow-1; Thu, 30 Oct 2025 09:46:42 -0400
X-MC-Unique: XyK1QKO4Mhiq1NPON1i8Ow-1
X-Mimecast-MFC-AGG-ID: XyK1QKO4Mhiq1NPON1i8Ow_1761832001
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-428566218c6so534784f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832001; x=1762436801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXVeC5x4UjvdpdxBQtQYDv2PCBr6tJQZhEasSYJVqpM=;
        b=JGVNrSHQj7VK3t+yRZfeqZFX/dF6dKD/x/s0p+6eUMnC7mBMFAbN26hQ4c4zdtX82B
         PZI/yboqmAz4B+ZwihJiGBIZlTNYG8NYIdiP7cFOSRFL9aXF5wcZlbQAP+SvF81vhf3H
         u9YRfGoXa9MKGN1SzDRdItm8JeBC39/2w4SvdbeGQ/wOEYYpMKZttjJzO+9gI54rwixV
         GwCJ0EckRPoGnGUBaXs//BpUjWoM7dWRx6L5uyHdcbGxaRgcdv2jCfmiM+YUTzGigcuU
         cO0icBhJHW1KvhjynXsSM8yVfYtiGP2DP3dz8SsCVnfM1AlMZuz+tzdpPqgvnmLNszqA
         Db3g==
X-Gm-Message-State: AOJu0YxoQGyQ0JS47J+AGfOSS2HV1XcWc+r5QaEKCPslLpDSCXMTEe23
	1K3HAvfLtcMYWy39P2A5Hpiq8C2Bk/wdgNChz7IN4SnEqf636ntgMscvZ+Q44jmSnJJ9zq2PRgD
	YPBsuiW9KYEfVmS9M+Y2kgyoxZZsdjElkN+GZf+7AChcKwI9LK5jixY08Kh01aEVjDc7uTg==
X-Gm-Gg: ASbGnctESb7GfnB7qEl4f98+R3flOT6U3DlUH4ATt4HVPrDxIoswa9zZMfAfAyEBKnN
	sVFXMEUtEoQi8EPM8rKcNO7H1BCOUacFIO0BV0AYRavewJ+MNDdALqrzRjpHY7j2uAFI4V3mQmu
	pZG0bV8tjMaf9AN2YOlNGopkB0ZpoEqhDCaCMzHROHXAnAQ8ddr9wgMJjU5jX7E6xun7DMTUqqD
	W1H8KhnXX0m082DpyHj3o0aY1zAUMETXzL61rYJyJUiV07nWc+93m8DpOo+ZtwwJLDFwwJR5oqh
	EkOJSyUV4OZV15AbV8oLXcocmurs5B0BjXcjR8SQeU5t78HyoEPl6EAGxOUw5xlLb2TlMz9Ldj8
	aY3LszlYLwSsMXgdjWg9JRlfQdm6S1sHPJeMhWymSOgmA+mhF
X-Received: by 2002:a05:6000:1786:b0:427:6c7:66f8 with SMTP id ffacd0b85a97d-429aefbdf05mr6876982f8f.52.1761832001307;
        Thu, 30 Oct 2025 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/4DJxIB6GKcBndXz26LErjJv4VyAkibid3kK/z0tZJxHwuSAecj/C6Y3Ult2UaXNcOJzYMg==
X-Received: by 2002:a05:6000:1786:b0:427:6c7:66f8 with SMTP id ffacd0b85a97d-429aefbdf05mr6876945f8f.52.1761832000863;
        Thu, 30 Oct 2025 06:46:40 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm32483487f8f.8.2025.10.30.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:46:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Tim Harvey <tharvey@gateworks.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TDA1997x MEDIA DRIVER
Date: Thu, 30 Oct 2025 14:46:37 +0100
Message-ID: <20251030134637.134024-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c423487bf667 ("dt-bindings: media: convert nxp,tda1997x.txt to yaml
format") renames nxp,tda1997x.txt to nxp,tda19971.yaml as part of this
dt-binding conversion, but misses to adjust the file entry in TDA1997x
MEDIA DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f7aa6a8a9a1..4d739e18aab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25233,7 +25233,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
-F:	Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
+F:	Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
 F:	drivers/media/i2c/tda1997x.*
 
 TDA827x MEDIA DRIVER
-- 
2.51.0

