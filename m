Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E4158DD1
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905003; cv=none; b=iDpgoolXR0tNQUjOOl5zB94inWYfguztHjWFtseZ0JrhsAeTuizIf9dFYWsimPGjLulilcoCgc3OHW5YGCjbv3dSQGUFcbv65U1x1uX+AMdymGgS4j0iCcfpwSo+wQxZ/BKqlL0AkSHuGhhSnlEbJJmd5sw7++vfhxNJOINrMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905003; c=relaxed/simple;
	bh=qmw7Kp/2IBfLuxerY4OFp+OgfHAiforacLyjjTSxUUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/F2bxWPeooBs70hizSdQHOScegFkqfT88uqMkaIIDUdQAfUYRlJ7fYhad9ptZbdDCWQqqDGNQZ2AGdkeMiMiSqQSWNdg7Z1XnJIJJuUCpNgk0XpkFyG6JjsU+vmyYwjJXaYC0Bp7Rxldqda8pow06df4gvOozdu/gJ9FaKcdhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pkc8VXzT; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pkc8VXzT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9952ea05c5so643576666b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728905000; x=1729509800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1va6T1JHzEpiYiu5IzRjbfWdPupV65G3wmppmMY0GA=;
        b=Pkc8VXzT/v2O9IeHhhNIen7w0j7pxpAcFzmScc5i6iLuSVv/BEDqovIAdCLWw5hUIx
         DdJL8JR5EcXPxMFYo2DaCjtE/FuX+TZQY2S4Q1RQdM5W1LMCT4IsjN+FO6rtIm8yGFem
         EQntVwemCMAYrcbJNDu1/qPXD/nqhPrrepaTpjreMmzx2r58ACNc+nSlL4aVL6A6gonh
         Hw+PyNRfFY4bGbgOQ6Ca3JrfzobT2TQyxb+TSDUeo2moBM3jm4jZI3nBRwWxgtqHOLwz
         83Mxm3hu6Bv0gA3tPM0fJpLm1aKZ7xonaIy2L5dfCow2GjpBCXDnZmKTCANumGYpnQlh
         FRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905000; x=1729509800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1va6T1JHzEpiYiu5IzRjbfWdPupV65G3wmppmMY0GA=;
        b=KIbYOEudUw34eIBTB2PQMgXALSriX8qYlmqC44O03DV2H0eR/PXa+ZAnEKjbec9yat
         T1F1I1YsPdrnHjjpqbT8Bg2nFDpkd0v5veR7DVq79Ecx1qb1c3O+rzBs7+LG5aNPtQGL
         qJso2N42wbYm87RkSyIOzhgdIfgYdsxbD5dkBVGGMW00DqgfFG7jSidMpQgMOi4O5v/k
         ET8dRRYR4LyQhd+PJasBljymnMwdMTijFmLAMWb9iA1EVN/fKzyELg3IHPyQhAX22OAF
         rQMuw5LhU12IjqbEi6wrk0dc12DuQtRIBaRWiXr5XJK7flaxjrIb0yaKgBEhbEFBNuwF
         KdEQ==
X-Gm-Message-State: AOJu0Yy10gIBghB0p2ZYw1CgAUeekAjugicrhXWE2sNgrrz+eli9EGRD
	seK9FVK9q/08EZsGg+BWWZorwi5ZtEGzg7OCAHAunvwPZ8DYSkVIRj8ECA==
X-Google-Smtp-Source: AGHT+IEdkp+tTM3HggZgPj5j0n9n+po33FC1ZrSymWTXV5PSVG1zAH1qmumXTR9c/MJZxyXUZueDcQ==
X-Received: by 2002:a17:907:8004:b0:a9a:1160:993 with SMTP id a640c23a62f3a-a9a11600a76mr137664766b.8.1728905000102;
        Mon, 14 Oct 2024 04:23:20 -0700 (PDT)
Received: from andrew-mbugua-server1.. ([41.60.238.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a15d76949sm81596966b.222.2024.10.14.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:23:19 -0700 (PDT)
From: Andrew Mbugua <andrewmbugua388@gmail.com>
To: kernel-janitors@vger.kernel.org
Cc: Andrew Mbugua <andrewmbugua388@gmail.com>
Subject: [PATCH] Removal of unnecessary cast
Date: Mon, 14 Oct 2024 14:22:07 +0300
Message-ID: <20241014112207.688877-1-andrewmbugua388@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/net/xen-netback/netback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 5836995d6774..35801828c78b 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1294,7 +1294,7 @@ static void xenvif_zerocopy_callback(struct sk_buff *skb,
 	spin_lock_irqsave(&queue->callback_lock, flags);
 	do {
 		u16 pending_idx = ubuf->desc;
-		ubuf = (struct ubuf_info_msgzc *) ubuf->ctx;
+		ubuf = ubuf->ctx;
 		BUG_ON(queue->dealloc_prod - queue->dealloc_cons >=
 			MAX_PENDING_REQS);
 		index = pending_index(queue->dealloc_prod);
-- 
2.43.0

