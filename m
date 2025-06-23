Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E31E0DD8
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666371; cv=none; b=JNxwQeCa5/NqB/Ub+2Z0psXXdVzMKstmc8LobhQRDEJzm1ACMOA0dQNNHol/V/xnwRAOypMbHJ7HM9/EFoZzNtSDbQY1Rm+I2x5Sv2kBYQ+AYfC++QWy/cYrXsGU45Dovx2r2ikQOOd4M7ZQkTB3fphZTrsnAz64658IBA19zGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666371; c=relaxed/simple;
	bh=gPbrjKfb3/t9+bJ97l2JcUsCeLq8NB/AHeQm+JnD8Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kY2CsEo6Elnbz+cN4rYZch4qxfjIE/bn50QiBXTRF4CdhnSO8t5AnLF8PKEJ/MrWQySWQkyAXYypdne4xG0V1svPvsvREK7AE+J3toWfjN2d6nTOt0vneTLE6LoCrAaCRKjeRj4wKVFySYqQn2V79UOEZx0WUKZdFstae/8vrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGlCjPcb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGlCjPcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ely3LYIH5ApPb1uTkKRY78N4Y4FDOftaWbIcVrfOOjk=;
	b=SGlCjPcbPLKG3IAuKS6FFl8T2XpArNqzwnp5cOau+jDwwHYzVQBFQ2nW4zxjVcvalTXg7c
	EaI0ipAEe62eXL5cI7i8D5kF+OLM9vVA7vgVqL6H2bKuvJg9Sl1RmwWfnkgSdj/4AgIbh7
	2Gn63Pbk4pxBnl/pohHYVdbx6uxwYZg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-XJ_CokFYPMK6ypCzoWqQcQ-1; Mon, 23 Jun 2025 04:12:46 -0400
X-MC-Unique: XJ_CokFYPMK6ypCzoWqQcQ-1
X-Mimecast-MFC-AGG-ID: XJ_CokFYPMK6ypCzoWqQcQ_1750666365
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-606ee65164fso3460512a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 01:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666365; x=1751271165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ely3LYIH5ApPb1uTkKRY78N4Y4FDOftaWbIcVrfOOjk=;
        b=UFTqubD2+AIAtAwNWzFVafW1ALRhoAw5w9NoRBPJRvmyCFNXTgYhuoNlN4M6A0Jg2H
         oFJJy/RBguHIRarGMwfHqSc7nvoCW69ghLz2+DPX2OYhf4iOALxYQsYwAeLdq6tSizig
         fIxej8hj5Q+SXUhT4YavQyVIVMtdZg554LMbnaEE+0iS/l4wwON/ZAuMNrxWmSHgo3jk
         Dan1Z3YK67zzMkvCQS2Xs/QFF6akB7CysqqiYUUWHjsJJMAn81Ox6lJGp5hkrKhi4hl9
         bO8TwvHzL3SsodTSo7JZFs1TKLYbJEnuiDHirdcxIF/846GAVzNYWgGG6L1k1RFD/zgI
         UFeA==
X-Gm-Message-State: AOJu0YzL/IeU+1BWS0G0VxECFGwXelPKHR3EvnW/dqmzb0pct5KFLp+i
	XL0BqK/L1+la56EspFpwUqPIdm2Wr2hy66q2ewdtKknvF5kPCDz1A/wZKKd2EXBTku8wZxhDsVd
	bukPGjhIaGmIuta79U2vrdURdaG9ke4iV5dmPtfH2inVIUDEGtfGdzT4cuDyUGA8eu+0eQg==
X-Gm-Gg: ASbGnct9L3EI3taMrvfTHrj8Pb6gdU7bmwYqJUPC4PEXlRZJkbvUwgWZSfQ2X+B02sJ
	o3l/h6EJJKV/304R2h69dF5DEPuF2bK/CstgOCESIqsPJOb6+NPskz8AkPDV74UQlinFiSpsiTg
	Z9PG/qN01PcyCTjjVExjufi8wdeEXivK92Wp8boCKVygqjGDdfZYHX5/iuN6s5SrkEKB1ojDRRi
	1nxnCHCPT3q6rYJ4A2743BoUaAm/XLLl+0Qk+qnOdAGLYVOFjA8KReuTyGwmbpM9R2As7rCXeYZ
	W9/yOFsmhmWaPi5x6I1iP3Y6tA9ijF9Tiq+7TuqULBR7c6gDwckMW2eqRMeWKK/KQg0F
X-Received: by 2002:a05:6402:2744:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-60a1cd1d0e8mr9228992a12.21.1750666365439;
        Mon, 23 Jun 2025 01:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmSn5SEBbkY2WzQ8Wstprge0mliWZNTw4CyeFgF4x1e2Q598sLsTkhN06aRTXMr6PAByyRyg==
X-Received: by 2002:a05:6402:2744:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-60a1cd1d0e8mr9228976a12.21.1750666365083;
        Mon, 23 Jun 2025 01:12:45 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c9769fsm5838013a12.40.2025.06.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:12:44 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in QUALCOMM SMB CHARGER DRIVER
Date: Mon, 23 Jun 2025 10:12:40 +0200
Message-ID: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 4deeea4b0741  ("MAINTAINERS: add myself as smbx charger driver
maintainer") adds the section QUALCOMM SMB CHARGER DRIVER in MAINTAINERS,
including a file entry pointing to qcom_smbx_charger.c. Within the same
patch series, the commit 5ec53bcc7fce ("power: supply: pmi8998_charger:
rename to qcom_smbx") renames qcom_pmi8998_charger.c to qcom_smbx.c and not
to qcom_smbx_charger.c, though. Note that the commit message clearly
indicates the intentional removal of the "_charger" suffix.

Refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41f13ccef4c8..c76ea415c56f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20612,7 +20612,7 @@ M:	Casey Connolly <casey.connolly@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
-F:	drivers/power/supply/qcom_smbx_charger.c
+F:	drivers/power/supply/qcom_smbx.c
 
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
-- 
2.49.0

