Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780271EE013
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257847; cv=none; b=sr6s8Ryu7lJjsGDcvZpEtGWlaZYNzwYCJ1tqeI9yLb0fPYn/Bti9uFbRTooDwl/Gckt4swZvhkP0fCei00Yj6Gwv5GEgvNucb0yg6QCYjA+hRfcac1cuxtGXZZd3EC3yjqlg368bnkITsawkGcEm2sjdK6+SWtDLFEi1+UNeh74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257847; c=relaxed/simple;
	bh=25YVvJwi2Xjlkzv9WtWyYjLUmIh+R6dUhQ8sSYCiVuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYuuLA/7lF1c20t3Go08kL3RSNV7sdbw7mueqSRcCzqKmIOzXSbLXrUTtBDUEDVOIGdv4XJLu6po8OzKvIiwXCeppVrQUsmWrhjBvf0x4h7l3Zdrm5BS9m0tQgb0eZoB+Mas8fql8Oc4ga+kcnw74JFwzodC9tacUBW6cQyoA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hp3i2wXB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hp3i2wXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736257843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JEU5DIrN0YF2UNspXPf/7Xs7dl1aHNEC4BRgGEqAXYI=;
	b=Hp3i2wXBj6xfn03hxobR0fqkfI8ZUmyzCrL3QMVbMrx1aizAd1sfsYjNOIhOhXY08JqQR5
	nhzGO1CLfQ+vePMevQxKQL5EDoqxzaV95UriO0aAHaz+kn/g9K0abrjB+csm57xQtO3x93
	DSB4zdqbtbTPSPSXDe8WVRwcWTxE1O0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-OyUInjVtPKu-QqZ8Uxjjlg-1; Tue, 07 Jan 2025 08:50:42 -0500
X-MC-Unique: OyUInjVtPKu-QqZ8Uxjjlg-1
X-Mimecast-MFC-AGG-ID: OyUInjVtPKu-QqZ8Uxjjlg
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6faab8334so2410318585a.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2025 05:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257841; x=1736862641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEU5DIrN0YF2UNspXPf/7Xs7dl1aHNEC4BRgGEqAXYI=;
        b=tOIdfgxFAuvmej5/1sK/A+24aLWxvq3pr+dkAbmCYrosQTwt1Tq8eMEL9jW39XNe4K
         5MjCQfzRGU9zZ7Z+2rnMMtmaDG9+kg7EXkHygjZ+xFQRNoYs0irDOFZxnCWGrjAb60ce
         fck2PdQaz7M2S6j3rnSs9UMcoEjfAQjmbEhWcA10NSIv9s0DkyLPtAWT2aLAgf83VWC4
         LDUMFVZwwiQJfB7kIg3qnjrxHg5l3X/yqqSRKJDfYwZmSmD9exv49u0QJGp49BKIovK4
         wAY4YqU3jBaGWPj9fN3VBi90ls8JCG4DSBbcZMAltXszdBn/4Fj2WlWUby2oghuZwM7U
         3lDg==
X-Gm-Message-State: AOJu0Yw/9aOhFkRSlCI7aSs48cyfFsmvKdAma291airDLX97i/FuyNu5
	vkIsfEvUlCTRnC0Fn9EIw8iN2/MxhWnDdWvClsMsbf2dWjmXB45wJ907foOhTNGdPntYocjv22q
	uDjPcxjKD4oKFJ34GvKkgt9AFvV/tOfoznRDeFeQUMkxlONSbQ0I8e7palKZwjwxUMw==
X-Gm-Gg: ASbGncuqoHV0tXbdOZZyevJ03AsamKoZVnBwz/QgBfSdYWKf/pCzl9GwZZndxRjped3
	DgxI/iMpKDO4tj31ETYounLp6ZRVZqBWXAKx04CmCeu61RUnX52UAGXi3UaF5uLZJaxtiF4wiip
	pqSuRgqRzJ6JhrKWjHzLL0k2gZmhQuAAx8GxmpKxtSjengdAKQjTqh9A8IkhQG8ZXLn4lWuZvmL
	jv3WDCf++9tq0qTATEAh9GJNtRlO1FTeGvLUsUAiZe/S8v8BsoVUX37PB6uAr1iZrXWhKnZVdSP
	x9fEvH923R0/NpXvP69jgm416PmI
X-Received: by 2002:a05:620a:1998:b0:7b6:f024:3ca with SMTP id af79cd13be357-7b9ba8358a6mr8715776485a.58.1736257841700;
        Tue, 07 Jan 2025 05:50:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFANf+z1z3KdYW+6x6UlHOT4pYepUgwCvqnrxCM2s9PlJ10sXv+tzuVFh//bx7jVUURvptS+w==
X-Received: by 2002:a05:620a:1998:b0:7b6:f024:3ca with SMTP id af79cd13be357-7b9ba8358a6mr8715774085a.58.1736257841400;
        Tue, 07 Jan 2025 05:50:41 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac480936sm1591427385a.72.2025.01.07.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:50:40 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] staging: gpib: refer to correct config symbol in tnt4882 Makefile
Date: Tue,  7 Jan 2025 14:50:32 +0100
Message-ID: <20250107135032.34424-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 79d2e1919a27 ("staging: gpib: fix Makefiles") uses the corresponding
config symbols to let Makefiles include the driver sources appropriately in
the kernel build.

Unfortunately, the Makefile in the tnt4882 directory refers to the
non-existing config GPIB_TNT4882. The actual config name for this driver is
GPIB_NI_PCI_ISA, as can be observed in the gpib Makefile.

Probably, this is caused by the subtle differences between the config
names, directory names and file names in ./drivers/staging/gpib/, where
often config names and directory names are identical or at least close in
naming, but in this case, it is not.

Change the reference in the tnt4882 Makefile from the non-existing config
GPIB_TNT4882 to the existing config GPIB_NI_PCI_ISA.

Fixes: 79d2e1919a27 ("staging: gpib: fix Makefiles")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/staging/gpib/tnt4882/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/tnt4882/Makefile b/drivers/staging/gpib/tnt4882/Makefile
index 04a4520ed3b7..a3c3fb96d5ed 100644
--- a/drivers/staging/gpib/tnt4882/Makefile
+++ b/drivers/staging/gpib/tnt4882/Makefile
@@ -1,5 +1,5 @@
 ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
-obj-$(CONFIG_GPIB_TNT4882) += tnt4882.o
+obj-$(CONFIG_GPIB_NI_PCI_ISA) += tnt4882.o
 
 tnt4882-objs := tnt4882_gpib.o mite.o
 
-- 
2.47.1

