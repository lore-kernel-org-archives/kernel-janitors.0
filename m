Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0452D63E3
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765949959; cv=none; b=R0xOe/dUbm/jb5OoliVifAWyDmM4s8i3Tu8pYen2JVlcjNbIxUteK+HTso8oqIRA+Q0kSGipZf1D8X/vUMSIG+Ja7StC9aofORXyIGBPb/j2zDakFUnK+SsQlbp53lUajUw0eBmSpO2vMwV9Y8R8S21A/FQhUznpWCx7AhQw2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765949959; c=relaxed/simple;
	bh=ICVrHzpxTFLnlMS9+yeaLXGfGOfU7AbnEDn1gUGe6k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxyYULWfCAdLMq8mL3ytEzKKBRFifTr3JUIboRTGi5PPsGORD9gsZ3uWeMe61pTmVi5BLzIwi57fU9wlw0Q8VMy91OqyNd8KiH0bg7nqnF/N69QHZBGb8KwHWXXdfb1qOQVQwVUPu+wfxhlp/BJmbd41tFlEius+kRYTW5mLDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0EVMAH3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRHIqEAX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0EVMAH3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRHIqEAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765949956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MfHguFmOKJ8egmSeOGiDVI9siRkTN+9TzeEpJWkbFvc=;
	b=T0EVMAH3NZaL/oK0UdIRmmqRKKcmATmFLyGiGoO8dIMdwHQQ+y8WVisHHqNxcARNgpT0ku
	4lwUmSLSRh3ohB0cIC750JA4PSp4paA2U1IRpOTq9vdQlVG3qBmwAHti8YvFqYEyO7z9Uk
	hzhhCjvTff0Axi3nrKaSI7olQYRz8Hs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-lngMyPlzM8a1_ts7deKJmw-1; Wed, 17 Dec 2025 00:39:14 -0500
X-MC-Unique: lngMyPlzM8a1_ts7deKJmw-1
X-Mimecast-MFC-AGG-ID: lngMyPlzM8a1_ts7deKJmw_1765949953
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477563e531cso36478045e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Dec 2025 21:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765949953; x=1766554753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MfHguFmOKJ8egmSeOGiDVI9siRkTN+9TzeEpJWkbFvc=;
        b=SRHIqEAXXgjSdzHxW5Z3y4aenUQwrOHnBS0vLg6BnrdxLuRthvu3XjTKXyAbUPO6tr
         CBWb3bNVpmxgE2c74yg+8wuwpyQSf9a36Vwyrcp9jPVkNcUxR27RaQOVlJKFapVdQel+
         H130sBaP0oCHwQfZ2pLUDNriIjHOclrO0Elcj2oYbdEyGOVy2J4YrM1u/ZHu8zbaTpJd
         Y925XqJgNVRwwLaQc5xRo9OTpD15eFlQYmrFsgEBRrJWeukn542BHQ5+Nd0wTRjkFpKR
         9eHbsXtX2ArlUm4z5ikBqhxdqsVqpyiBgw4FWTR3gfcCseyMed82JTKa9G9ptjjxfaRH
         qHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765949953; x=1766554753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfHguFmOKJ8egmSeOGiDVI9siRkTN+9TzeEpJWkbFvc=;
        b=Bs8j1I+ekrHLn8DS7aj831RhcXYAcMb8tlNNbARErOTdxXP2CGNQpyvNnsTe1fMd7I
         MowCLgO6gJrpr12Sz3t0HtKzXMtEuQnpbK0aMn1Lyunb2PjRT6JLd5MbpFJQuclS6lK5
         f1WxhsR3noc12K6d34JGkhrNvfTJdsR1GXpDEXiOQy/TVgMe9gMuESyxilrqESbU6maN
         jdPiT/ZyXPNN8FSo0TS4H6v7hOXTyrNEivU9bfG6EATwZ4MgQGoyU6nCrKA7hDwwrMIK
         /2W6ftuLAVKZWYLiihWnLTiAlsLFQHytnW0nusb+S9x6xBVVITTLEG2VhkZKwYy6qHjF
         VjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2w9duDfEKi3Q+epwXd/2mhuxa/2cqOQ92KSFn52SmAc3OH+PDNxbqPDAJa3a+XXOtttivXDXVwyvfOnLrcmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/k4r8Zwy3duQsvS3CD13EFip0zRDOaD9D6lzYDtuHAXDALOpF
	TcYWW7RtHLVr4nRxzFaWjUg2YUJOPd1+AhXfd9NMKAM4fbGROcvBRNCJaSyxvFt4Ij4nvTGhbfx
	UASykh44H12azAGwtY6f15AlI3GaQYxWzmSJvtwGFwv4hI1b3BZSQJUIqy6F67vBJWJbZbQ==
X-Gm-Gg: AY/fxX6tf1b7ZcLilO3/iXotrvka12fH2KtA/7DYGudDhoXmhprqk010BHhAXnZb8UD
	jZFNPPD9qAtXrpn00Unli1rZwXgl3KiJSmKWVWuwO3zrE7YUM1nBIv3VEKu11RSMj9xJYgU2ZDC
	miwQCNVamx3DBZm0xyt50oPtLUkDBMGsubzO1bF8I5zemJ3K80yF2DDV+ueqMFUkat3qgusRPbs
	C7kpxaU1FS/iRuIpzB6xvPVf6IZ/83i8cdr8TDsHtapQHvX/3amO9BjvMFmp9COG8hAElHC4aj0
	x4Z9uSvRYapX/0Z75OnA+umdB+wc3Q7/W0YDAOdFCJeNnMpR99A5a8pbIXXFUjKWt6VvSGQyO3y
	mzy5mXHGQT5pLMfuWXBHvdKFzAtVegoSHDgrGrnQjUn+Sy6mH6ucNxxW+es8=
X-Received: by 2002:a05:600c:4f86:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47a8f9057fdmr170987655e9.24.1765949952982;
        Tue, 16 Dec 2025 21:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEx5fvsD+G3+YOmaMIqHtD1zdB5R9Uc/kbSe5br0XYQYAFsyvp8IO7zRMhmqnAoZ1gBzb6WA==
X-Received: by 2002:a05:600c:4f86:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47a8f9057fdmr170987545e9.24.1765949952587;
        Tue, 16 Dec 2025 21:39:12 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd9936809sm23649465e9.6.2025.12.16.21.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 21:39:12 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ryota Sakamoto <sakamo.ryota@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Gow <davidgow@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in UUID HELPERS
Date: Wed, 17 Dec 2025 06:39:07 +0100
Message-ID: <20251217053907.2778515-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e61d3add3e7f ("lib/tests: convert test_uuid module to KUnit") moves
lib/test_uuid.c to lib/tests/uuid_kunit.c, but misses to adjust the file
entry in the MAINTAINERS section UUID HELPERS.

Adjust the file entry in that section after this file movement.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd2ce39e43a..8db7f553fd2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27264,7 +27264,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	include/linux/uuid.h
-F:	lib/test_uuid.c
+F:	lib/tests/uuid_kunit.c
 F:	lib/uuid.c
 
 UV SYSFS DRIVER
-- 
2.51.1

