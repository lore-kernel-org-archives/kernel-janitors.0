Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D8303A05
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Nov 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338524; cv=none; b=IS0gwGCBYQ0UPO5OROA5G4xJ/YmVHYZGt/NFMSQaRAfcbtiE2smfAlcvvvUQP1p8Gbz5TciQH7X4uKIl/ZLd1LsByIuYTXBeHnwhBOdVIvh83KPNXRiW0WPMdC4elVvyxoD7wJQCEd/eBI+agjUZYTiUOEXx70KZuDHUXCCXcpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338524; c=relaxed/simple;
	bh=2g3Wq4c97gj933lxG9X1AENf5UzQvkiM4ATmI5KeWkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnoxUd016u1HQIauygvdXxVGLk8oiRhSz/RCKylx4aEQdbbCrqCu9E5R6RgB30MWqYK3IaQsZE77Kz2DMQLtBym+/yAMsT3Rt1C/f0MVryoX39xTUwsptrNaz/rnl+HamvgJAprVDqRk2uUFk6esNh6BMDykCXumPpiLcscfr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Phzl4W+d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ib856Rdn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Phzl4W+d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ib856Rdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762338521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/VUtH1lMTAvDzvRlcMfC41+492vEghGBhl70lNg8bcE=;
	b=Phzl4W+dmNme7ZX87twtTfhTenp0Kpgk7TmgFOXQaBAXrcCJSgqGo5mMwEPtZaMJwtsudV
	bswbLIKGy2a3V9TdblCj1dCFZfz1MpJquQEtySVdAJLLY36BvVf0B/FoBz5sqdkcHl3G4F
	8WpRMN5yOtTLHu8SIVrooWl74q3/GEM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-FPQU4W0wOEa0np_x06TtzA-1; Wed, 05 Nov 2025 05:28:39 -0500
X-MC-Unique: FPQU4W0wOEa0np_x06TtzA-1
X-Mimecast-MFC-AGG-ID: FPQU4W0wOEa0np_x06TtzA_1762338518
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47111dc7c5dso4165235e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Nov 2025 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762338518; x=1762943318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VUtH1lMTAvDzvRlcMfC41+492vEghGBhl70lNg8bcE=;
        b=Ib856Rdn+mHKalC27oXtAHEgjdSjrTwV3KziHRXmq7BCIySIM57MWEvmyIN71TbZVP
         Xj54jR2v42yW+jJTVARMh6DCPf+kye9bJ7KQ5hb1jz9Ct4+T/d6hKys19h0XfCI5vdkv
         HuMVQKNw70F8e2cEA4NBFam6xIYha2fAhru4MfZ6JCpwbxxybG0jFb7SwYy5fS60g4cP
         f8NM7sMq5K6WkHjXQzR+USlqSXxjKbVIAdRwiYw41lNZ/xhrV+YxqewOcjAcAe2rRb+x
         wRLY9a+V6MuAMDQ4xZIbwGWtcMF+R1Be9D8rgg1A5I6GP8jA2wSLEoaIHUHf4Cq6jdyR
         dAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338518; x=1762943318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VUtH1lMTAvDzvRlcMfC41+492vEghGBhl70lNg8bcE=;
        b=Wn73NRuXv6Pb2silJNYonfISYALHqHcur5QEmHzFfqekYT8sH7P92NezWi5FOArrlq
         MnZGTb2bG+vHlCKnkUUTJVbTAMAccC+Py2Pv5I4wqNCNDzXLxjigo+GxYWVATQlo69XP
         wQ4w1vFZktz4mZejStdMZ+sJz4KldxjFx0Yd119e3gnvJept3M5w4JyS7w2h94VSIcAp
         TIMbAtgqXkspUO3B22NkU1GwME3+e+NBMRQ+3RRi1pTKAAcod+QuM5khgxgbmRO9ke/l
         ldhFZIiY9BRr3TgFozNaxOfkfr1fo/TO/3VAbYRT/u05wxE/ozlpTW7HswKtlfAhmm79
         m19w==
X-Gm-Message-State: AOJu0YzTPjai846XJANzt8Xd6nzUkQnsUpXZRLXo9Qh+cwfzOVoMtN5T
	EBp5XulCIRG+s+WCL+9rnCHG/Qo96BYU98Am5Fue7Yisz7tUiDHiGRFmQE7+GW5it7HLD3L6NzM
	BEyzCw7ID2wuF4Y+kjnIXHhYHWOgeBu/VrYzjoft2RYs5juxFRiPS3aEA9ilzSaYelBlg8A==
X-Gm-Gg: ASbGncvMbmS6CZztMhINXnAHfce52qGSX6L9uaMVa9cgMeRGDESzZizjvhB1INbcUBh
	Y1tlNB6iz72UvVdvDnFut6nuGE1FP/mWEZ6jbfKfVasuPm9Ck/IU6VPaiDrvwvS22cOhuXWwq7V
	1KIgqzOAtlsc6MYLDflt6QqhtsMDYWkkMbBwGyjdgoXN6JVDvizMGF5K/6TFgUy7e4RzJ3U04Cd
	qaJZQQLbpQn0ZvKn1K9Oqnggopk7O/1HB816HIZ8py9Pvu/Lz2RxkNeDHRmLolfVLHNZb5wtcCL
	b1ixosaV8syoX+vdjDusTJvAFpLmXiYxbcN40QYB/uJ+943rYLFWSyOqLQZ2Xb9I6d8VhmABTzV
	oStGwbDZ0BuuRnBXRk5w9uTeUoAVc1/Y7d+SXOqiwIcus2p8U
X-Received: by 2002:a05:600c:468f:b0:476:8ce0:a737 with SMTP id 5b1f17b1804b1-4775c8a174amr22510485e9.14.1762338518088;
        Wed, 05 Nov 2025 02:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxircFOf0rNRre+DrFhO4ILR1mp/CcibmKKLMg9H2yNUp6Yh1vehKqZ63e3ywj4w2w9Bp4jA==
X-Received: by 2002:a05:600c:468f:b0:476:8ce0:a737 with SMTP id 5b1f17b1804b1-4775c8a174amr22510345e9.14.1762338517729;
        Wed, 05 Nov 2025 02:28:37 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755922591sm38354495e9.10.2025.11.05.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 02:28:36 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: add printk core-api doc file to PRINTK
Date: Wed,  5 Nov 2025 11:28:32 +0100
Message-ID: <20251105102832.155823-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The files in Documentation/core-api/ are by virtue of their top-level
directory part of the Documentation section in MAINTAINERS. Each file in
Documentation/core-api/ should however also have a further section in
MAINTAINERS it belongs to, which fits to the technical area of the
documented API in that file.

The printk.rst provides some explanation to the printk API defined in
include/linux/printk.h, which itself is part of the PRINTK section.

Add this core-api document to PRINTK.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 297358d26bbb..2b5f86dcf898 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20689,6 +20689,7 @@ R:	John Ogness <john.ogness@linutronix.de>
 R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
+F:	Documentation/core-api/printk-basics.rst
 F:	include/linux/printk.h
 F:	kernel/printk/
 
-- 
2.51.1

