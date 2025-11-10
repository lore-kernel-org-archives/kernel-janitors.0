Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA102E8B8A
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Nov 2025 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762760155; cv=none; b=nraGqnqPDaQ7KOkUYsIB1GwLSquLwMm9GVgh7PHsaXz4bJx66LWPHS1SgiYRVyJWcUHd/KDqlcGXncDEABxaLZBhAv3NjsUj8CH/ey8TRM/85p6iCa+4qczfS6mgTpN8vtPIV8fuTkumvK/xKTqnsuoc+HifaA9P/zSlHDqLGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762760155; c=relaxed/simple;
	bh=21nICoZNv0xtRro07vJ8g1b48UZfbTR27eO1M/t7uCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kok5T4Izb5QMtzUA1utoz1OcdXgvpO5Y32Wp0WkEfsrE2/mqZUbcKoXO1WJ+SCdXx+VwgPih1A4OhCUMpSM+BbotPQ6Q+ApHNqji2buaqRmuPm4GvcUTkUcago/EX7pg20E/rd/M1QeddfT3KsT5olK0h3PHA/KCTkm3K7FDvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jI6FNHaT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DxjPZz83; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jI6FNHaT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DxjPZz83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762760152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
	b=jI6FNHaT8FdLn9EEbbYfHnA7s3RgWCKHDmXuYBs4QFpvJeURCneaoSfks/64LTrqibtQJU
	oBYD891iThDQVQl2qS5VKC1x4AW6Arq/7dg08pwMXZYpzaxd/VhXuKmFEgdTZivyIekexG
	9Hx22wtTAHXo0W7sJGmxhqWjtywAYV8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-DwR4U7XDNIKiPX2ww-XAwg-1; Mon, 10 Nov 2025 02:35:50 -0500
X-MC-Unique: DwR4U7XDNIKiPX2ww-XAwg-1
X-Mimecast-MFC-AGG-ID: DwR4U7XDNIKiPX2ww-XAwg_1762760150
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b6d4f19c13cso276116666b.3
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Nov 2025 23:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762760149; x=1763364949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
        b=DxjPZz83Y3y2m2Myjsmq3Zq9WHz6rG4wpHGdCSeebiEDN8IV7g7vnTKh6QFUL3iCQF
         B83R3hkXPlXUStGVK0am1vUxO9KrHwXpD93eQAbnMME99uigDm8G4/B4FmQFyTCsfgs+
         7wcuZjB6UStO2CbtQ5NUUsBIEAVJk+2aLrPI01bSOUqCO+IeOHohwDZgb50QUq2S/ZtS
         ezAKRngh57zoIJEzw0COwBWj6QoZ0bUUTDAtp17cCeDf7zHnKjbh7fyX9u9KRbgsJiyS
         gvU3UGDTgjyBVAKTXD14+ZoNmOTsW4PJsVpSdrHdR8dnHMs+6SaDKC0AkHv7vpOcvw3n
         +1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762760150; x=1763364950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
        b=Md/eF7AE72Io40KHuB+V+xYcf0hEa3Yy0FPD23KMNiv2nXY/uvkbLtssQhlxIuTbF2
         JZOJn9Wbe08WRU8ZIC+nxQj8mmqx5tX4AIacvDaiZmO2mSSUccwSmM7c+L0zwxOtgR57
         YMjwB/0kYGAHlmrrTejwF8MfZcbdZcoETptxL377YQ3xI3ou+Mybhatv/7/kXWDNKbKi
         c+Dlgifr8yh6ub39nNSMRHMovaj/WqsTVFG4BYOhfwEaGdvetILXD4tlPxbHfv5Jd3fN
         qt+YaTiL2DiCXlzu2ym7IoSM+L0tAgL+YOa/0EtGPk2Lmig5vpoqE0IotHsfuCSEkVuJ
         g6gg==
X-Forwarded-Encrypted: i=1; AJvYcCVMqkNCOS/qp/X5vw+HieGkCr6lfHWk+OEVny+Bj69LnmLm9CTRO8kxIpliUjv6GhKd2AGdDdX7AEZWnB8O/8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMOuV9Np+ZfN/i+2JBSQKJSRFDkZq0HfB6dr8n1tptschTvyL
	PuI4T2yTyGvUBdNZJnXQEhym0DOyDmVkiHlZ3DnrkVjoS/VoQR+hSVJfqF/uEWT1HAZqiZYaXjt
	pjlqsBxe7hza7kOVJ+JuvnHvJY9Fl9zn8zIa6L/bsAmENGBPYI/ZkBs6pTQ9IAwHT6J4+SA==
X-Gm-Gg: ASbGncvPY1DQBJcsCgAm6CGXLQ8iIXfhG0CVjNWDICADl8bbu87HW5a/O6rE9GT1Rjd
	pZqU3+GFYowImj7j2l4nXnJ0eFTCTC8SAGJ3eXZpFl6XOFnEsqBqOsLcqjV3iHgxUJEQ6aKoLiG
	AVf1A9YrCGFoEocbRRhpegYuHceYJnS9s2iMFjg3MxzqnDgt/6iEF+5eXo2rYcWeXLSlrRDpIQD
	Oh2IKpHx0gWJnM48SUvr76j+O3bG5eccUgj/DjOiopGWzyerp8lEdAY1OvicmsMMNFZESq9im5i
	UvEqm0sbg6n5UTXD/JWjp0LbyF5nbKWeRUUBksZUJwB07/9kbKr0rvv9SRhlOLAvsx6IppNXppL
	1cXKNgPTZcinR2lLbpDS24F9G6vZLXDOZaoGQMtfJaUgZrZSU
X-Received: by 2002:a17:906:cac7:b0:b73:845:4171 with SMTP id a640c23a62f3a-b7308454190mr178620966b.64.1762760149648;
        Sun, 09 Nov 2025 23:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiLhLSDBHf+cnguxwEfwJFhitfhGonUvcR76zFD9RWMeGVCjQJ2GOJyu6W6FkcShrY0ZWgcg==
X-Received: by 2002:a17:906:cac7:b0:b73:845:4171 with SMTP id a640c23a62f3a-b7308454190mr178619366b.64.1762760149287;
        Sun, 09 Nov 2025 23:35:49 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc874sm1039395666b.54.2025.11.09.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:35:48 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shubhi Garg <shgarg@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC DRIVER
Date: Mon, 10 Nov 2025 08:35:44 +0100
Message-ID: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
non-existing file include/linux/rtc/rtc-nvidia-vrs10.h

Note, with the changes of v6 to v7 of the patch series adding the driver,
the content of this include file was moved into the driver file, and the
include file was dropped from that patch. It was simply missed to adjust
the section in MAINTAINERS that was newly added with that patch.

Drop the file entry to this non-existing file accordingly now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a881629003c..b2b55947efef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18586,7 +18586,6 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
 F:	drivers/rtc/rtc-nvidia-vrs10.c
-F:	include/linux/rtc/rtc-nvidia-vrs10.h
 
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
-- 
2.51.1

