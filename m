Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4ED1F791C
	for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205726; cv=none; b=emyu25VNV+YoF4RoOCR1+CVHLNUs+ODeRjHVUCwYSTMcyFE6x2PxNLA4INtZYVNV9p5Sw8I2tdWVXCG6pifcRIcL+LGFfa/dczk2jKCWeWQO3hk9wlAhH+iDKHL+uXknmm6pweN6Gu0trPqyyiMkMXLAYgH+7tVtZ2ctFeg0JP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205726; c=relaxed/simple;
	bh=0ljOpkyfjZqanSaEy5/y8FMJStiCHYKcp1rDILKb3hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaQWvoL//tByNMB0wc4ug9rQCG7H3U+iy5yTPnWTcM+P5AvQI383o9Seo3w2ewXUug6C0vvhlnjx3tR1LggmA1G26Fh1I0X3sOdFe48EE5SL7I+Bo7GuMCoPx7NVxqJ1lSt4ioTA5qV5+Xz+XnzuH5OnrkRCgBJmg891WNt5pDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnjSJ9xn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnjSJ9xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747205723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HYzBb5SJ78VUZP41t3KTybXYvlm+RxzbkoO9o+em8bU=;
	b=SnjSJ9xnEJ9vqdupqM2fBI+AupDUESdWO251z2fzYdUjgMzPjGEc7mD9L6fWGd2yGXswJ7
	hBgESNxJitgHP0AQMDRM4owXtHb+PVeAbE81u8qvc6z9InAEFXok2zvsBW/kI16Tc7hc1/
	YENGoiC+YWQ+QvxtOMN4qL15tzc3N+E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-8EXKzoPBN16yakKrmB-llQ-1; Wed, 14 May 2025 02:55:22 -0400
X-MC-Unique: 8EXKzoPBN16yakKrmB-llQ-1
X-Mimecast-MFC-AGG-ID: 8EXKzoPBN16yakKrmB-llQ_1747205721
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so30951965e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 13 May 2025 23:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205720; x=1747810520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYzBb5SJ78VUZP41t3KTybXYvlm+RxzbkoO9o+em8bU=;
        b=kw5JmNn40qbATB3iWle69oNEmfPyH//hqfpZSgluRzS7XdCLMoRbW/nSNutRqL8Mfm
         hIygj2RuC0Xky/SlOlJsqpRgF4PB1Ud8qphugqwRmgFiCFgUGy2Fsw+xJ6qe9bZxks/i
         QFUIMiui8So4LiSFzn9GmDFzpO7X8uevYZ8NTsSJ9UlqDIowUd3LHedPDm8SB3QG+pKd
         O7Pz2MPqBbn9iPUhhVO/Up0HUZCQ+hqGJQpPCcmNOUd5IMIFb0u3loWf0X8ypr4xPJQM
         0befG60h0LU4wg8zapl3ZCr7Uoh9KHBrQmxRoGpnLzDHcOOncRLDcPqHQc+ZpQyUtnuS
         l4dQ==
X-Gm-Message-State: AOJu0YyugFRKTphnFoKSKt4OhIV15d6u0Du4x0khbPoFoQ3eVD+iRnZ0
	9p9gvlotAunchYZv/rrfai+DwLKS1vmeeh8OzotbCPZnGJQ2LjqfX+2B0MLbR3J084PF+a10L4p
	PGfWcHuyRigZjEP0DZrcIZAfhdL4WAdc86BuXxu8pKQdJXaK4szQkmciAbcyunqRqtw==
X-Gm-Gg: ASbGncutws8bSGCShEoANbv+4uI+qVkjuyHb05erKIoF+SW0LkXpVeDJfCvHMjyCWTY
	VIHPQE80anglO14AjGZF2XSigY0hcZc7kgg6KMgCxtV0LX8UFd4mFqwErXB0mK57rRIrNWNuGnf
	4xfnfL22bi635rKbNLWzaH6SufkllTEJp05KSi5t/MOtdaL3ZRME9PetC2/KMLsyAW7Vz0/HwD3
	uf2F9KGAritVEMYvW/mUb8Av5LN3n6aCDgKF3cqBsMTSuRWskxc23BnlBZkR96jVwpVMK+7Hud2
	1cGxPKJPDLyRfjsK/Q+6V6iktfJnTzCtbFxUHYUdYLEy6oTt24Prm48APA==
X-Received: by 2002:a05:600c:474a:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442f2177839mr14481325e9.28.1747205720111;
        Tue, 13 May 2025 23:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFwOplruz65UjRaahKOum0fhAp3drpaJMqfFD47FxF0twZaXDmYs20HOpHSKREcFKpD0U5mQ==
X-Received: by 2002:a05:600c:474a:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442f2177839mr14481185e9.28.1747205719752;
        Tue, 13 May 2025 23:55:19 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395060esm16218525e9.17.2025.05.13.23.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:55:18 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Wagner <wagi@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Hannes Reinecke <hare@suse.de>,
	Ming Lei <ming.lei@redhat.com>,
	John Garry <john.g.garry@oracle.com>,
	linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] block: Remove obsolete configs BLK_MQ_{PCI,VIRTIO}
Date: Wed, 14 May 2025 08:55:13 +0200
Message-ID: <20250514065513.463941-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9bc1e897a821 ("blk-mq: remove unused queue mapping helpers") makes
the two config options, BLK_MQ_PCI and BLK_MQ_VIRTIO, have no remaining
effect.

Remove the two obsolete config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 block/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/block/Kconfig b/block/Kconfig
index df8973bc0539..15027963472d 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -211,14 +211,6 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 
 source "block/partitions/Kconfig"
 
-config BLK_MQ_PCI
-	def_bool PCI
-
-config BLK_MQ_VIRTIO
-	bool
-	depends on VIRTIO
-	default y
-
 config BLK_PM
 	def_bool PM
 
-- 
2.49.0

