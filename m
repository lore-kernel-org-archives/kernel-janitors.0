Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A691F1506
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Apr 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623093; cv=none; b=GfTdrhY2ZpEkZ9R/d3OFVJSpeRlyXZfX9NqSRJ0YxXxnhdDPRhNajI6YLp+GMyUa9bvyg/Jnqm3seOQ9GT2e9z4sF2ZmfLsLP/Wo+0m2rRNg9uzb7gzpFw1qy8x7MuuokwCK2hHv5wzztRor/2C5CiSRvmtHNIcGOzFMWh7VkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623093; c=relaxed/simple;
	bh=WEfGh8/JZ50VI42QY/UzDVj5QGsc8xf1TZieBe4ZvGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrdVFFAGD196xev88lam40l5AvvWSxMXtHsPzwCx7frCtDWJQkDqXY+ADr8APx5kwbm6KPZFkahYEybiEEuBCiHMe5mFGB/3rinFZTM+L8U48y5IhaXqc/+tauNJ7fsrFKniGh1SGdg3hEITHY4UCeneofO+mtb7wboi02HqJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4w4J0fh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4w4J0fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744623090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DcJtOZqqmGG/GNqQfI/h8Deen7z+Z9B2I6ayBe0ZS9Y=;
	b=I4w4J0fheEb+HP0y4eGTI+SmOI7vVmTGUrdOiacerSQFKZCgXDMyKZtTZV2N3CdoLuwF3P
	nEpGxmLaz/KXrseemqnsJ8ZWLwlssLkj91tQSXlgv5blumfR1dI07+s2LmACPqwzpMbNbH
	Q67R3ZExJ+udw2+tJ0z61fsejOa5h+k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-mGUCUDyzOZWxaJqFHB4Ydw-1; Mon, 14 Apr 2025 05:31:29 -0400
X-MC-Unique: mGUCUDyzOZWxaJqFHB4Ydw-1
X-Mimecast-MFC-AGG-ID: mGUCUDyzOZWxaJqFHB4Ydw_1744623088
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912fe32a30so1657234f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Apr 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623088; x=1745227888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcJtOZqqmGG/GNqQfI/h8Deen7z+Z9B2I6ayBe0ZS9Y=;
        b=gioHecGVl4Fvpdkyta8IpvR3FBi6zfhLWCCmShlxhtw/z4RaJIlpTQoRvSj3RdA2u2
         wXOcQb0j1L2YSDI/47dc2Xgqm4dhFjlp/L9Uto4ZrHqLt24ZLjgtIgpqTM1pHz0Wr11L
         BYfbWuJ5DEeJV392BZbNyCeldKh+8DE+4O79xkwmS65bAfo6bZQ/zD1CzupeeAXas/0M
         J2g9F6M6UvKJ5fhOlRDRxns61Wn/Yka6qY0QRpBZ1I+WGHehEeVcpUtTTQlsrkYlB9If
         IAazomNYvCml67GSyVPxSuu/r80ebz13WDp4sGrd3nZxg1LYuodx5y+UQ+blOpSq/tUC
         n34w==
X-Gm-Message-State: AOJu0Yz3wkvkJd+ikitfDkF0dNVKVh5gkJQ6XqQp3JPE58QzC3Vu0aWG
	5dUSB3BetvqsgJyW+vw0qLPR5QJ/k+t37lwii0NazDpF0WzRGAlh6mvP6bFwhoF+4OdGle4slBh
	I0u/bCxZHHjVxvNZoL2M52x1RkV7vF1NfSdncNhroEIYBsmEdqkqqvCJTVXZyIx/84w==
X-Gm-Gg: ASbGncum/Qoe0BtYKCCMnykY2yMZpHLaxcshCxPRudbJeYksOkFRXcgd0xiGYybYdmJ
	feCAYpJ3RjKE3l7Sy1qosI3NE3BMyXLmffXrKNtM92JbTc0zp2G5zwkb35bnv+fQeUCbCo9/AgC
	8k4L0VDmTJqyKhszZhAVrhW12mt8TYirBk7AWxBnU4xZW319EA6Kst01kTvkbwlepYjqUr7lTPz
	U7S0bxVaVvwNQ1XWMbZL9rcJ+mQASEOoyd/6xPt9vc9ZhAKEbXsLx43uMl18u1yKHlDi37f3ZAq
	WeUIXmwBnWoR+aipHVvIs3IOm/p7SoodozhDvNNcGF6N2iyp+IcwmkUD6Q==
X-Received: by 2002:a5d:6d8f:0:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39eaaecd89amr8181811f8f.42.1744623088002;
        Mon, 14 Apr 2025 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIf80qJHQp64UqJH+NY2wPEKUU4CFrtiWzV4xC6O7YO6zvGgMGZVZiou6pYI9qUGO0MpoZFw==
X-Received: by 2002:a5d:6d8f:0:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39eaaecd89amr8181783f8f.42.1744623087487;
        Mon, 14 Apr 2025 02:31:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2a13sm169193675e9.10.2025.04.14.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:31:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrick Havelange <patrick.havelange@essensium.com>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in FLEXTIMER FTM-QUADDEC DRIVER
Date: Mon, 14 Apr 2025 11:31:24 +0200
Message-ID: <20250414093124.19683-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit b7549ed5edc6 ("dt-bindings: counter: Convert ftm-quaddec.txt to yaml
format") renames ftm-quaddec.txt to fsl,ftm-quaddec.yaml in
Documentation/devicetree/bindings/counter as part of this dt-binding
conversion, but misses to adjust the file entry in FLEXTIMER FTM-QUADDEC
DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af3537005de3..661419d7c71b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9216,7 +9216,7 @@ FLEXTIMER FTM-QUADDEC DRIVER
 M:	Patrick Havelange <patrick.havelange@essensium.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/counter/ftm-quaddec.txt
+F:	Documentation/devicetree/bindings/counter/fsl,ftm-quaddec.yaml
 F:	drivers/counter/ftm-quaddec.c
 
 FLOPPY DRIVER
-- 
2.49.0

