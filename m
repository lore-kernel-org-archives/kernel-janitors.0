Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A213BA24F
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Apr 2026 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642918; cv=none; b=sP933SW7Knt6XXIniaCv8eXxcT3xDN7ldhYV6MnFTv58q6eBZ9TTIBf0z8Andzax09wkTeILk8WuS665aMDZ5WCM1fQv4l6rPnBsPta1SNbo+FLDxClGiVSy9FYyeDYjfmDTqy2OukRj1WXd9+VhYDvSlJrCJVAf2opWUltj4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642918; c=relaxed/simple;
	bh=E3/giysvz5CnXAqEhtSOJDq9Jkv2a9jCXNPHxh3BiWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GcaW6mDFVyuyJj8R/n4Jp+iUpmHZkSTDWZ/RFvqk3DcykFIWcQDuUeB/XoeFzn0K8tsH67iXmfiXGZFO3N1HKprMDkKipffnd2aDOu2Rm/QsxIZvLy0vT051L67q9STSvhbV5l6pDp2lZ3JrYDqWgT6nuI2z84gv8mlrkONOY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjQg100S; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pLt13qTA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjQg100S";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pLt13qTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775642908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r5Lp+7Mw/0AHH1tOuKEmXQ29IHEsWc1KXfBemJVlEFc=;
	b=DjQg100S9d0H9Up5vkbWN60/x6GpoOJjjGXRrctOxoqu8YmA2Q76IanZJC2kvsA5teYknA
	7LasPwi4vjxW8ccWQogmOPcbQCcmerXbXwlr9z0nnTrF+LcRK844b8gbPayFu6zMBS/b8a
	67IvQTNrAm51gxcOHDAM9Kj9FJ4ngCc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-NY3Z5kGvMf2_-jG7m7M6Og-1; Wed, 08 Apr 2026 06:08:27 -0400
X-MC-Unique: NY3Z5kGvMf2_-jG7m7M6Og-1
X-Mimecast-MFC-AGG-ID: NY3Z5kGvMf2_-jG7m7M6Og_1775642906
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b8c472f3eso4593066f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Apr 2026 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775642905; x=1776247705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5Lp+7Mw/0AHH1tOuKEmXQ29IHEsWc1KXfBemJVlEFc=;
        b=pLt13qTAVuyJ50QgzP1+6H58xXdKw2NroV/DwQmpCa6AaA8eIg6N7oTBHKpB4jol+e
         D8WOhTxK//4IP7pfL3k1G9pyGZztScLgT6dsIdKAN3qRa7o75JiCD+aJo9Y0+UylWkvP
         CWf4GchInzZKAfWA3dlLtqB8Gi4epftnVCUmQpGrZGoEIDpIebwcmpdN+SJ9oY/bAU0B
         02y7g6mH1UfYqEWRRY3YVnBHfGIEmvAr3B/VHY/0k0fMQKP4Gx2XMSyFMkHlfqBC68q+
         jKmUQDzh4ivtNHguskPkdXKnO5asHZrGsBU72PcmWNTB1067fuqbkt2cHvFQ5wyQ9zxk
         AdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642905; x=1776247705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5Lp+7Mw/0AHH1tOuKEmXQ29IHEsWc1KXfBemJVlEFc=;
        b=eTHHZm1rGMDfP6RAb4scPlS6t0EkkZ+ySAsXTkjJaaF2gdvAK/Y8fvRq/2PS1NsdfQ
         XxuwET1YDKYGlnCgIFnbzPRuc7V0N/HrBhKvxddHLoaZSMFEvHWxqKx/5OI2EhxFVzAR
         /TOH7kMsV2vq7xfku/RLbsfObqlvqV5tlJX++kd764CpI+BwJGMYqjXqD07hajbVpJMK
         RZotdr97Z5QYpmUdaU5Y8c3VZ5VnGG57VSQdI/Gtyw8U0e4GTsMh1HTz4mqepEFmwP5U
         qo3WbszHoaKj70+aQC0lryBYiNLmMOdOcQ5Dmg88leta7/WW0r8nfCetePH58Oaqbb7R
         +74g==
X-Forwarded-Encrypted: i=1; AJvYcCUoCn+4BV2bblzkI5OA01ywY6hgq51YDwaMkBG1/d1+kC0gioZFnoLAzHKxCP690cnIH4DMfG9n1ypmjrqxYSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyP5CLvjlvnLbKQv7AEdFm0/gx17tRa8knZNI7Kxkjv2uZ+r60
	eYGFs92u7sLuNhV0XIsRnliiLqbA9Le1GTWI3g+NIJqQnnEhxSvKBAWy/zH5yqZkGzU1kl5PBUS
	DxCjK+rtUf1pTqGNhVR83cvWVIE/mjTPKMjtOY8RslF/9m2PUTUvR9sZFtLrcEtIt9Ydcfg/6+e
	1x4g==
X-Gm-Gg: AeBDieuq12Z2vJvU/6tEK8GQgClxoFsr/uIrMsCkehwpbmD0gKDdYH1o0qxC2R8nNtn
	V+UJOUC0P9mEwqV/fuf0ZLATEgBdr4CNMSP/Xicpvd5Js5w0t+e8bCb/0O9tfCGUYhmwzDWYU5k
	77g8EWaXgwd5w5twGweDY5PeM1BCw44950faPeryhaGSX8xH3qLmpaA07+hTfbWyQR3uaiLoZk2
	Rbj4BBY5CH27b7yByZE0F/ai8NaWp+5zdiARC2tL7T+eVehu0UwygCUgdpQvZlMSiuO1sddp1+4
	LA66E6oWevKmBfA31dJIHHrib3jLLr4IgJGKqMU50bg9tDvZcxWdhKsp7TgIFPdhwB5cUnvM2xs
	l2SV7mZo603QjWP6A6JPPZ79N3X+0E4lgBlwMoULfaYn0OZzX2+igwVB7qjyzasHtf8dRxmw=
X-Received: by 2002:a05:6000:2388:b0:43d:b99:bdc4 with SMTP id ffacd0b85a97d-43d292d32d9mr29056698f8f.30.1775642905552;
        Wed, 08 Apr 2026 03:08:25 -0700 (PDT)
X-Received: by 2002:a05:6000:2388:b0:43d:b99:bdc4 with SMTP id ffacd0b85a97d-43d292d32d9mr29056639f8f.30.1775642905099;
        Wed, 08 Apr 2026 03:08:25 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm54935557f8f.30.2026.04.08.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:08:24 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: Remove obsolete file entry in DMA BUFFER SHARING FRAMEWORK
Date: Wed,  8 Apr 2026 12:08:19 +0200
Message-ID: <20260408100819.458347-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 25bd73562941 ("dma: contiguous: Turn heap registration logic
around") removes the file include/linux/dma-buf/heaps/cma.h, which is the
only file in include/linux/dma-buf/.

Hence, there is no file matching the file entry include/linux/dma-buf/ in
the MAINTAINERS section DMA BUFFER SHARING FRAMEWORK.

Remove this obsolete file entry in DMA BUFFER SHARING FRAMEWORK.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..77c0fc7ede03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7561,7 +7561,6 @@ F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
 F:	drivers/dma-buf/
 F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
-F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 F:	rust/helpers/dma-resv.c
 K:	\bdma_(?:buf|fence|resv)\b
-- 
2.53.0

