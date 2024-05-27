Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468A7D405
	for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815614; cv=none; b=OAmj4F21mfNrt8nSZmaHYA+vhTl13O1dDnXEJLXtwp8Qe8WlAc88DdVrQuWIJoEpZGoTGwfAhnu+1IXeMuNPxohmCWk08cIQdHpCxwnlv2dG7ZeslUBV1nPW/mHr+a9XsRH70P6YBDNsq4acUepVRCV7Su1gk5kJ0ULn+H6kueQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815614; c=relaxed/simple;
	bh=3DuU6HAXXUEpFj1/CbH0w2NMI18Jg5p4m14poKJ7EVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q9PTR4eAsFMFgxwT8TdI0H26E2NZIMaHKUNYCHXFzKvO54XCRbfgBipLCuG1p7IDXBbyUjgW2i/oNAJBC4NP1BwxNGJP7eQ28641SSZ+2bBh0579W5Iw99CDqqz0eFSgze16V5X0k8c+CsLE4828Bza5ScQOxQRYpbbA8MSK+Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RsRhc4wD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RsRhc4wD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716815612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ug/+QrBJ1fn4jt7nmsB6WVOTnZkvl361r4prquvMN4U=;
	b=RsRhc4wD7+tWkCFUkoy4RNrpl3j1VRZGHChIEJGnCRU3X8uDm5+YzoRbTWGv7n+Vs+uBLF
	CmaGk5H/zoOGx+IoWtH9dgar2CinlChsi/WS4RusZx/Yk51UJiqC2SSpzXd2GPPGnBUtes
	SAMTP+Iwrplds5pWqJ67OlxOKDNJhbY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-E5uRFGihNvi1UQxNWsvyfA-1; Mon, 27 May 2024 09:13:29 -0400
X-MC-Unique: E5uRFGihNvi1UQxNWsvyfA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ab9e01225eso59400256d6.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 06:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716815608; x=1717420408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ug/+QrBJ1fn4jt7nmsB6WVOTnZkvl361r4prquvMN4U=;
        b=gJSFwmYvUbfwttM81VXzfFedF2DKCb+JPScwHH80Z+tvHIJEWnd+4bgFD1OfQSnAz8
         BZq4yJmLKOHjZ27OoB+OkNtWZ9xDAzISBTuJ1QCyQeIY+CdAGMX09aBh/xhE5euf2ZoF
         Jjp0u6qfv05MpV7lD86irSD6Fs3BGgGzfuG+BvhyH8ZAHsBkLU0HkGzMfKDZ4o0ZmJo/
         6wdpRZhyO5oIX7JFYkkMvnDpUU7fdBhYnJ/T1rp1gNAPg+iD+NI3S/agwQR5mtn3xG8z
         kuqlEtEkXL7ephml63WfDTQ399yPuc1lpC/KAmxJTIL+JsMvjXxfY6k3oa1qE2u593sM
         WAjg==
X-Forwarded-Encrypted: i=1; AJvYcCVIfltkjxNaXXOojdRpU0MUAUtc5BTrwW5sTil4UoUKec58/QKkZuBghlmEBvntdvB6AA8yzihE6ztVphbKuvJrOn2Ita3EV7qfJdotqzxb
X-Gm-Message-State: AOJu0YwNGlYxaRnPX8P+wdjDKfHfAX3IKWZrYxQ6LdbN0j/wOJTViZo4
	gOrfMZbsp28MEd6LOnS9mWymWJYXE//YyHf43g04FzuYKrJDSjr7V6M4H01FouHjtJUln1peXIb
	QhdQr3vSNLyUNNnxwZPc6XdwVLnzXuEdYa+bWLMIQMebhycs4suLPYK99L+cD0rVoFw==
X-Received: by 2002:a05:6214:76b:b0:6ab:7ab4:f309 with SMTP id 6a1803df08f44-6ab8f327f9fmr190114716d6.1.1716815608547;
        Mon, 27 May 2024 06:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFvp62B55LpZG06oDjDs9C9JeEguHSawvpfFEUQJhPnKmdJaNhFrrUX9ZGDUsNJSeBscO1kA==
X-Received: by 2002:a05:6214:76b:b0:6ab:7ab4:f309 with SMTP id 6a1803df08f44-6ab8f327f9fmr190114306d6.1.1716815608133;
        Mon, 27 May 2024 06:13:28 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad742b3663sm19273786d6.60.2024.05.27.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 06:13:27 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Petr Tesarik <petr@tesarici.cz>,
	Michael Kelley <mhklinux@outlook.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Documentation/core-api: correct reference to SWIOTLB_DYNAMIC
Date: Mon, 27 May 2024 15:13:14 +0200
Message-ID: <20240527131314.22794-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c93f261dfc39 ("Documentation/core-api: add swiotlb documentation")
accidentally refers to CONFIG_DYNAMIC_SWIOTLB in one place, while the
config is actually called CONFIG_SWIOTLB_DYNAMIC.

Correct the reference to the intended config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 Documentation/core-api/swiotlb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core-api/swiotlb.rst
index 5ad2c9ca85bc..cf06bae44ff8 100644
--- a/Documentation/core-api/swiotlb.rst
+++ b/Documentation/core-api/swiotlb.rst
@@ -192,7 +192,7 @@ alignment larger than PAGE_SIZE.
 
 Dynamic swiotlb
 ---------------
-When CONFIG_DYNAMIC_SWIOTLB is enabled, swiotlb can do on-demand expansion of
+When CONFIG_SWIOTLB_DYNAMIC is enabled, swiotlb can do on-demand expansion of
 the amount of memory available for allocation as bounce buffers. If a bounce
 buffer request fails due to lack of available space, an asynchronous background
 task is kicked off to allocate memory from general system memory and turn it
-- 
2.45.1

