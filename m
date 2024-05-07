Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBACA15FCF0
	for <kernel-janitors@vger.kernel.org>; Tue,  7 May 2024 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092607; cv=none; b=kWC87dsfFSF7FWRT0U24GTkH0VD8Edc2c7cN5XV2aIR4YvzaFColENP2Za+N5wP6IIv5yMF9wJBhKOMiFWkoECPxgM3ZR48cLnTtfJbTTjFcW1qCXbCxTOTWMLgmd4FCerppIs7s7pg8m3RMKejZhDztdevXpoOnq42i1y7NILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092607; c=relaxed/simple;
	bh=1nLbM1ptcwD7xsCexw9/9id1x6y7D7jbqpEOYd4k+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooZvYVmExKc6ouiOj/+eTdPiLhBvjpP+DW5Utik5aALY4WLuqlkt8v1pKTf+fYTrnHtOoDosqsI9jzuJyRvblxAZLFqhAzzMvmlz2JFvFrsmnUBd2Z6dVhwLidUSjSvMGs5NV5EYfGnYkfui5rgpKvyljOqo+Y0f3gkswlJ9Qrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvRAzHAZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvRAzHAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715092604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q7HVnwjvSt8iPkONjlCrJffpYCEpxZC33LnAmwF0ZIs=;
	b=dvRAzHAZMml7noaIBr8UfuWmANDQASA9SHO2f23x9RbplpWuG42uRpT6Q2pZL4SZyPtfZC
	y7eA2XEHkLz62fBJctr549Vn5b1p2wM9kc9nTha80i1V7dX733uNZVB2jxkFMia2AmMuz8
	uOPG1UfjVBFAsjIdIVgOvKelKvrrp94=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-IyE3zgy9OSS4cZWmFCT1Hg-1; Tue, 07 May 2024 10:36:43 -0400
X-MC-Unique: IyE3zgy9OSS4cZWmFCT1Hg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-572b0a23d55so1660741a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 07 May 2024 07:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092602; x=1715697402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7HVnwjvSt8iPkONjlCrJffpYCEpxZC33LnAmwF0ZIs=;
        b=OUapjbjDMZj9UHto70Fmqq8FsDxh+QTtSc6Yz0kpGzvlzRdkAt0eG3rQ547ut2bfNU
         lPjlPqTbRZRWPdBFSVh45e0ngqSxQS0Koh/a12dDogaAe8yyzdX8oDmBt1IsfCWL32iP
         /uCf2LsGXcbZof5HO003cczAonry0tXatvM3/6g3TY4ObPfqHvXlOBp6FMRyZaihhoD4
         KRN/2yZ6VfcX8ngYCO7Q7h+A3KQAdVkpL/7+NQVLTJy10rmqisdx5EJ03nQP6dSeoblO
         udnAyFEej2QRhamBdj2YkQZUMrR5xF4FtdI2n9rugPKhOfPUjyqU8PTCjt9JegDEWOdW
         uhoA==
X-Gm-Message-State: AOJu0YyVvx0FfDygPCu3plFTmJTOh2xMnxhXmDIFIu9JYPVR73oMcf1O
	pp5XZBR1ZA3ECvrqYu3oSII7xfCtN84s+eR3Y+M0PAxF4/NRvOe2no23INTOwi40BOoZt4lcwlY
	DCK/e1A/G/h7wblzADy6+I5kyZm5cf5z5yKvQxLcyDW5pUyRSxSj/GJdS/I7L+zvwXQ==
X-Received: by 2002:a50:cd5d:0:b0:56c:1696:58a8 with SMTP id d29-20020a50cd5d000000b0056c169658a8mr12098639edj.0.1715092602083;
        Tue, 07 May 2024 07:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY7d0zX5iF23LmZa2kdYMHYLArbIB3lGdBmgCb7Vbc8ZFRfJsz9dwxj/ZSVy7TQT4rRhoceQ==
X-Received: by 2002:a50:cd5d:0:b0:56c:1696:58a8 with SMTP id d29-20020a50cd5d000000b0056c169658a8mr12098622edj.0.1715092601795;
        Tue, 07 May 2024 07:36:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id u1-20020aa7d541000000b00572eebbfc61sm3485364edr.35.2024.05.07.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:36:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in BROADCOM BCM2835 CAMERA DRIVERS
Date: Tue,  7 May 2024 16:36:37 +0200
Message-ID: <20240507143637.179101-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2
camera interface") adds the new file entry drivers/media/platform/bcm2835/.
The commit however adds the driver in drivers/media/platform/broadcom/.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file entry in the BROADCOM BCM2835 CAMERA DRIVERS section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fe4506f9fe8..fe6d37745106 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4176,7 +4176,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
-F:	drivers/media/platform/bcm2835/
+F:	drivers/media/platform/broadcom/
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
-- 
2.44.0

