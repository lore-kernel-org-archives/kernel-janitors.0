Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4916C85F
	for <kernel-janitors@vger.kernel.org>; Tue,  7 May 2024 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091300; cv=none; b=XBR9C6fdLSbnWZdHeI5WRoMSgKRAM55Y/AbkamQvsFaWgH9YAW9j763H8Or6IcyLx/e3wdIiz5D5COtDqYpcMQZU+XOClbwSJgn/D9i2F06Tbr0QVMoumX8XUpPKUM9vTxRNO8XNTsBncmqiPfJDTRduhaGfEzz9lRVm7/uURtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091300; c=relaxed/simple;
	bh=tYFhuNKK572ei44KClvdIFHmT5dQxptc6wlidmEeIbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bm7qGWie2Kz+WmcQ6OxTkRPkvPtzj6n8cCG9xHvUpKj0rjxSx4bLq6/doKihRohUYiJvfKxGpMXWCNrGenVJZ4eA/Y5eaPGgJY3U4WY4cvMDEtXbgPPKO6dkY7twScRyJISdseYUxnsY2gxtm0LZi5M7tP7VDzp+fX26EocUJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GAaDRJn8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GAaDRJn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715091297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X1TemjxCew8gfx5TJGpneLG70M3weE+hrm8/BhqnHVY=;
	b=GAaDRJn8ulP9j+LywlpsZogPDbcgpO9XwGgwBIgYwBF6eQSoO+b343MtmebtF18aOIoB67
	1aopzb7sXGRe+PiP0b+yvyqDR4wBcMQGTyA8xfY02UXioFiApBAA1rXtb8PZUaanmkHVEP
	htlYxBUVtu3I1c2y9YI3cdk/pYhE29s=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-jBtv3oiJPFyZ9qir-QTYuA-1; Tue, 07 May 2024 10:14:56 -0400
X-MC-Unique: jBtv3oiJPFyZ9qir-QTYuA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51b0eed7614so2618973e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 07 May 2024 07:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091294; x=1715696094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1TemjxCew8gfx5TJGpneLG70M3weE+hrm8/BhqnHVY=;
        b=Vdhsxeb1jIz2RF3fd9GrNA+kNqN5YIZMAe7jIGqnoZJx5d+uFkztyVFBlTIkrgeWR1
         tPsvFhHguxLfYWj2NsDoRQwoF2fH5NnPDNFL35SfribPxwihNKJ9jyNn4jIx5pOxZHU2
         HyNaLPvvwMFPuvwr/4I31NCah0sNAIr3vzIIiwaOO508SbZ38TzWog/htDbZOsNKnOif
         BONz4tdbboil7PUZEKK9d05ReObh7fr5Ior+qTIjKspgJUkfNjYm9t3fvd6VctioWq7A
         q+Lv2UXKrgTJkug0DopJo/Ntk8tNSx5l1qhwNDWN5AkZRXUcVzemXUHDspsMwEbl3xBJ
         XsFw==
X-Gm-Message-State: AOJu0YzbQuxESNrxyAU+oCipK6WVbyBwFFVg7jU1D992La3NqwG+Tit3
	szNPq05NDqrvBVOOAHnRLaxdR5ljfUG32YtBFCWyurXl2Wq1Q/R5mSmlftyjyoc0DdCJAHqFuRe
	NFOQ5CykFklz8xHvWQmzJmDsjQlhP1+w3atsc1u6fw3OoH6o5KO7YwF8Ix1ZpZo8EMA==
X-Received: by 2002:a05:6512:78d:b0:51d:1c56:b0f1 with SMTP id x13-20020a056512078d00b0051d1c56b0f1mr9151814lfr.17.1715091293929;
        Tue, 07 May 2024 07:14:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL6gtJQR2L/AKZnQJ9Vjdq0OBoXAmgXMJxKgRmEQ2ocaAFqN0lJ69a1Qg3oAiWGUjW/dsk3Q==
X-Received: by 2002:a05:6512:78d:b0:51d:1c56:b0f1 with SMTP id x13-20020a056512078d00b0051d1c56b0f1mr9151789lfr.17.1715091293449;
        Tue, 07 May 2024 07:14:53 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id s26-20020a170906169a00b00a59a09e34adsm4681491ejd.195.2024.05.07.07.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:14:52 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in AIROHA SPI SNFI DRIVER
Date: Tue,  7 May 2024 16:14:49 +0200
Message-ID: <20240507141449.177538-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a403997c1201 ("spi: airoha: add SPI-NAND Flash controller driver")
adds a new section AIROHA SPI SNFI DRIVER referring to the file
spi-airoha.c. The commit however adds the file spi-airoha-snfi.c.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file entry in the AIROHA SPI SNFI DRIVER section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca79616a4836..2fe4506f9fe8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -689,7 +689,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-spi@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
-F:	drivers/spi/spi-airoha.c
+F:	drivers/spi/spi-airoha-snfi.c
 
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
-- 
2.44.0

