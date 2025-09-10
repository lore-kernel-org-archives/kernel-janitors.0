Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED63112DA
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Sep 2025 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494607; cv=none; b=tUaQUwqtBjGQrPd8su3D/z7OnXrP+feWmMoQs4pMHzE80nC1QQXo3HNDsRTeHmRzj8ILGQggtTyXSps+XEHxA64+cbjECjW+pVauEmGi68WlCLe2r8kcktUNR0NNtGsDxcQSAvKzWO2fr4PPQhZZyknG+v3csjXQZDy94B93JB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494607; c=relaxed/simple;
	bh=oIER+SSaWj5q2B/7maqY6YrRAc8TAtXtsVduNhMEM+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQ4WNflCYMAjxwXWFUaUqDJMWqV3f3UPXUB0M8XHwfgaJ8KdciQFMNSVsmudfcTf4d592//jABVNSKE8k0LsdhEu8qZla0bFVhXZjUpORHhj09VxlTgDdpdRiNVgzz0d+ajqHD7cNhDAeK5WuDeX8Lgm1/G9qg+KepFq9w8+LQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RoUbO+2F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RoUbO+2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757494604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fytt+SdLHUb8ufJubForkl+i4Nu4NalKZH6lY20wByI=;
	b=RoUbO+2F1bQJRifqweBHAlCYDfh0MmlJEEMOcRpwWb80bQ3Wqy+zu81JbbaO07ubvR4mdu
	5x24nFr/gxVNAuHu6asJVhaYeZ1Yb+l6mMuOTrJtKrXkw9RbfSis7dIvjjrVab1EB/LJU7
	xGsKQhGy6jnt60bR4YDxAcDeX/qDlig=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-9woH9rRiNtecyJGLQ37Mkg-1; Wed, 10 Sep 2025 04:56:43 -0400
X-MC-Unique: 9woH9rRiNtecyJGLQ37Mkg-1
X-Mimecast-MFC-AGG-ID: 9woH9rRiNtecyJGLQ37Mkg_1757494602
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b032d67e4f6so653391966b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Sep 2025 01:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757494602; x=1758099402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fytt+SdLHUb8ufJubForkl+i4Nu4NalKZH6lY20wByI=;
        b=GFCGAiZ5O8o6uZ2hKDDMXt59jkAy059NCvwW36LMHwh5u6HeL1gQ6fbOGsJpkPtrSK
         yvWUrysloKndve0lIdoiBE7ILLkognWag2VeywqjCc1wRrYw1i4IyL0xnfUYCx2k5QsM
         Sg3RHphR8voUQwlYlfzDgkweDxBtGLjn6D594y2yU7tA/HvOuO1lmqnBWZOhgD6jrhIM
         SCevSknGQK+V0o7wayTO8UoskZoaEN+A1uOCnROScN9sHqKw28hAtJHN/IK/+hE/O05h
         QX6jzsKeQ5D5BNjmcsKmFwQA3WkFUn5Z+rlJblOyBcp3zOSJ1XIdMPaK96Pfu7YDHOu6
         Pq4g==
X-Gm-Message-State: AOJu0YymMOeIOr3YymS0c2zINhaQ4W+wjkr57TBpBukPHbcxO5AobrQm
	IXb9KxiJVGM4R0TSL3mH8gYyGHZ4zwzuht6x7+iIgw5jBRS863i6VxyDClpNAZRCwQE28NpSzYt
	dOobyckMLhmXEJDXFkNLNGC8QGllhrWFEIYl4NogOsCI+OcxR+0F/VzJ0R/sMaNvjxKL3EQ==
X-Gm-Gg: ASbGncv22cG4JIcQUyH5Sd273DfQQkB4F3V112rKoLz/Pb0LvllsMM/a/JxaEqi0uNR
	znfLranFuq/5rtJglUtSx4Mz9+E5R08pC5xSNnfPQ6Jg2pvkRTZeu6LiA0N84CB9uQRAfj+oUv1
	UMCl0CFUdSax78nyh2kPvsau0Him4XZIAhi8zpH+rAb0hBlO31SeXBs+zO5xNGwo1do+86DQ1xZ
	Olfld3zcI5yo4aypZ4jU1weQmL6yhZrW6TgQI9xXos/3+XhJEpNYLq5D1PLwPJmyTePuiNWcXl/
	uH1QMGCVFoB4wQBRHFAdfzIgoCFeGh2XnyF3D8IQBVrA8UmBliLrqt0ArePHl2BptbpGG4lJhuc
	aLVZrSBJspLcscw==
X-Received: by 2002:a17:907:7e9f:b0:b04:6bb6:c91d with SMTP id a640c23a62f3a-b04b13c174amr1250437366b.1.1757494602177;
        Wed, 10 Sep 2025 01:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9IF0gMjbTyuyEkGfSe2kM30YiqJRhQOmvcAmj1Ufv8t2CRUzDLcv7hw2HV0ZOafNwmGqrIQ==
X-Received: by 2002:a17:907:7e9f:b0:b04:6bb6:c91d with SMTP id a640c23a62f3a-b04b13c174amr1250435366b.1.1757494601803;
        Wed, 10 Sep 2025 01:56:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0783046d34sm134309366b.6.2025.09.10.01.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:56:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: Add doc files on real-time support to Real-time Linux
Date: Wed, 10 Sep 2025 10:56:35 +0200
Message-ID: <20250910085635.47724-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit f51fe3b7e48c ("Documentation: Add real-time to core-api") adds new
documentation on real-time support, i.e., PREEMPT_RT. So, add a file entry
for that directory to the corresponding section in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7175c38c6d1..e2782810d0e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21403,6 +21403,7 @@ M:	Clark Williams <clrkwllms@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 L:	linux-rt-devel@lists.linux.dev
 S:	Supported
+F:	Documentation/core-api/real-time/
 K:	PREEMPT_RT
 
 REALTEK AUDIO CODECS
-- 
2.51.0

