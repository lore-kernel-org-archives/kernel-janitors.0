Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB63D97A
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727355318; cv=none; b=qcx7MikOD5MEXyTZesTIuGnL91wBYxQPpP+dl81AMWJEBQNF8fuhLKCtd+DDCeKyGvMdKD3cDXW8imsSTbIZcW/q+zag+104cGim5TwJ3Vnkv0RE26UVCABaR7+dizsBH4rbqyco4XHMnqLwUVDGgzMowEKXLugeDMViOWkt2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727355318; c=relaxed/simple;
	bh=DQpzIFRv2X+ZRDlASS8Vf6j+iX6bv1wZx21j0KMV81c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XOJ7vsOi1jWYBbSgvwTec2f5gslMbkqnjzpyHtCs3NkvNWkzqnhb+UGBfVOIIB0bBOEUQLkEdsnejh5ogtgj/+0Ft+GI6GiH93QFmu+RgGHojpI6U7nKW3hMZ0H9UjbsMS1+ow5A4BpeB8qOSPZ2z+IYhVQV9cUMo9dQkJ6Ou0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eY9QPDlL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eY9QPDlL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727355315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pLZMSHP2cc3IT88lpSxgsA3n5ydL69p15Njb5n67I/A=;
	b=eY9QPDlLWylvqS6EsWGYKM+wzr1woGiFn6OtGWTMf5cQoh7NrPN7MYHaXrawNZ9s1894tH
	E08jpErNIqWVOMx9Djfb0iuTa2u97qJiNiAj3KgTscLxqdvqpsC70hEgjopGwV8S06VkwB
	6PRjfr5Dvce5n61Ygt/6Av7/FGwRBBg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-WqmGBD61Nzius6D0GsfCrg-1; Thu, 26 Sep 2024 08:55:14 -0400
X-MC-Unique: WqmGBD61Nzius6D0GsfCrg-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e03b3f48c65so1314079276.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 05:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355314; x=1727960114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLZMSHP2cc3IT88lpSxgsA3n5ydL69p15Njb5n67I/A=;
        b=MnPA9NIVqPQxyVycF41lQKPZW1fOJ02WeGVMQKq8WhqESmLbCFRiD03amG/BqkHK3s
         AtuzokENUSs9tymBNFDqXMS35UBsVnoQ4r4ekCTKHzsiPFRkV5xVOYFa5qahGy7EVeao
         swanFwv+VaIerMREvdLyS++FK9PnNNP6VOWNcBunU4D6MX36lp6yS953WzeBmTvFFpm6
         0xepr9ez8oMtvWlIXD9LF2be7rWiG8+C2rjbbNqdGLhaTeShP9GCC15JuqRs1Gm/Ibby
         dKWIcKgf4husZITtj2asNy4f+W11+Mg/bdGXx1QxJ59WoUHhGo7wHA22kwvBol+25pb9
         IAcg==
X-Gm-Message-State: AOJu0Yw6F2rtOK/3trXfSD/LWGPFDeO/96L3yQ2JEQsDmgNhXRxvsHvZ
	HF6ky8mW/D/4gGp7T1mchdntq2M7wbvp50fjwMdCRz+chvKB3IZhHfR6INLfJ62OmAsFMB5PBPj
	VPtlaBQra2kB4oWgZbhy2qII4TlZ5zCvCm5nF6LDBVDEPwQTNJD8aGCb8hOdqan9GfA==
X-Received: by 2002:a05:6902:1b8d:b0:e25:c961:8bce with SMTP id 3f1490d57ef6-e25c9618d57mr2467503276.30.1727355313962;
        Thu, 26 Sep 2024 05:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG5ELDaKDmWytABuul86IvEV6NZ0mV6LTYIjO2keZp9W38l4fv8LRN273INdoNj35LCV73dw==
X-Received: by 2002:a05:6902:1b8d:b0:e25:c961:8bce with SMTP id 3f1490d57ef6-e25c9618d57mr2467479276.30.1727355313616;
        Thu, 26 Sep 2024 05:55:13 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b526a0bf6sm25561021cf.88.2024.09.26.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:55:13 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] irqchip: Remove obsolete config ARM_GIC_V3_ITS_PCI
Date: Thu, 26 Sep 2024 14:55:02 +0200
Message-ID: <20240926125502.363364-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit b5712bf89b4b ("irqchip/gic-v3-its: Provide MSI parent for
PCI/MSI[-X]") moves the functionality of irq-gic-v3-its-pci-msi.c into
irq-gic-v3-its-msi-parent.c, and drops the former file.

With that, the config option ARM_GIC_V3_ITS_PCI is obsolete, but the
definition of that config is not removed in the commit above.

Remove this obsolete config ARM_GIC_V3_ITS_PCI.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/irqchip/Kconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 341cd9ca5a05..d82bcab233a1 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -45,13 +45,6 @@ config ARM_GIC_V3_ITS
 	select IRQ_MSI_LIB
 	default ARM_GIC_V3
 
-config ARM_GIC_V3_ITS_PCI
-	bool
-	depends on ARM_GIC_V3_ITS
-	depends on PCI
-	depends on PCI_MSI
-	default ARM_GIC_V3_ITS
-
 config ARM_GIC_V3_ITS_FSL_MC
 	bool
 	depends on ARM_GIC_V3_ITS
-- 
2.46.1

