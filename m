Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB22580D2
	for <kernel-janitors@vger.kernel.org>; Mon, 19 May 2025 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637768; cv=none; b=MuDDZkK0N0K8jg+CydTKEZq6gFwWNQ7iy0ymCuumYolVDcidLnWeswmID7CpvjcbnTk0YFN4WBFAFm/aSWJWri/Mv1HnITh4wAka4EsLPej7Jvcow3YsfpjdTnPu4U44wmOCiQ6uf0AmC6dDSCbIzRGF1dt6zmE6ZKdPfx5WcUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637768; c=relaxed/simple;
	bh=8NDJ9XwjY+Hw9ef5xraaEJ2PXeEup+WOftekfr63tZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jc7H/TDqrCR0SHB2at4v77R74PSgQsb2Xi94wHO/H84eUkoBz8I8Z3/8te0+B35rx9LJFzZr31U7siOuGQGpq0hnnAQarXLFvzdL4YyGqOfwqQeU/PfvK/1xHWUMp6oQH/+ulExOyRxS7skBE1dOHmFLdE/FR3AWAr8kooNF7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUGKM+Gh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUGKM+Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747637764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uoYFGf22vXFHYoBtKGUddYJzSMczRem5Rut6KCdwPLw=;
	b=XUGKM+GhAtkVQ7Ql5mwGIuUHpQSMJSfrdCOGt2b2/XIWv0kQm5eWzu0p4LPWlIyYANNVSK
	f6fEpFqlup23f14azLeESHUZMfiNUFQ5HH6oE5AA6pImd0LzBW3YYARYW15pZJtptxA6S4
	jaRWQs8713h7qsZcFxvsNOuG2BF8+ek=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-6mSaKA_eNE6gs44nMDJO5A-1; Mon, 19 May 2025 02:56:02 -0400
X-MC-Unique: 6mSaKA_eNE6gs44nMDJO5A-1
X-Mimecast-MFC-AGG-ID: 6mSaKA_eNE6gs44nMDJO5A_1747637762
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad5697c4537so75838966b.0
        for <kernel-janitors@vger.kernel.org>; Sun, 18 May 2025 23:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747637761; x=1748242561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoYFGf22vXFHYoBtKGUddYJzSMczRem5Rut6KCdwPLw=;
        b=LwFWgzyRdex1Efd230tybAdi7LxIBU2Be7jNmFbSxo1VsD/rLawXAzfGq2JWNagh2Z
         7glNJ785bh/ZfuN9+3UgkfZj8dMhPK44zBLkiZNzInu6ovLZuUkKDEgTnAcpyH3Y7KW8
         KRa9ZfcI5jpQVq5mRvnu2xFn0LYK2/jKeBoOia2zpZ4FWtoqDHl6aLIt3k3fnJUti+0E
         f32EzzNNlfcyzIae2aOjCrf9nQCdZWSTpdeLZ27+GK9Fc7zAnwURnSbhW4YzCC1WpaPK
         efPEyxRCcfKIj4PcBPrkqv/lhjko89MIl7R1FzPpOsyjB3aCxhRQVsrxWyIqm6bWnDpz
         u4KA==
X-Gm-Message-State: AOJu0YxU3Ib9+n5PNfej7dJfa6DPzf1/PAMsDnERotj6tZMuPFNBh1YW
	Zr4IBEKm12Pog7tryI8igJ5xsk2IB262jppRfSoAbq6t+HrKk1Bb4Pnb/VhC+/zFiSjlfvwcvGI
	jQGG0Zm9OnfDMSrU66gYTMpkvvuFl6fyHqHBKWngxdveT58dfj2XSWRDcI42WIvXmRbch/Q==
X-Gm-Gg: ASbGnctWAZ19Im6yE34rOSHgrqEz71ODuylSv7f/v2W1uUI0TdC+v6o1veZArLeA7tc
	AHmS4jlmoBUOtOJFgEotsSxKpUh3Z/V2gCN3xBfEdOlrtyCPFd9h8xjhA189QBR1/e609uPfK9r
	L19UM+CUxCi3zq36Jv1AKxo0qf5KhKKcTz0ihKeB8+26vJYhLeJx0o9dBaiw4/4G+B/gOe2Ob/s
	a0ib2RgoiD6qKipAUC+nMxcCWTaJ7Y7dGXzOS+dGJFu0HFf945e4fG8WI3tLc6pTJD5hyFgwkfe
	9q+cayOKZSCTzoT0E8illSOq0mGGeexIdM6EVViDvZSXpr+Ulmo0IHkiK94=
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr875342466b.25.1747637761587;
        Sun, 18 May 2025 23:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6XDR4x7P+w+zNIdbiwaUD7ggLJDGBPXBLLoGw0L3zesxGdykirkJT0v+7+kEm5cfIYzsfNQ==
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr875341366b.25.1747637761232;
        Sun, 18 May 2025 23:56:01 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm549446566b.108.2025.05.18.23.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:56:00 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in GPIO ACPI SUPPORT
Date: Mon, 19 May 2025 08:55:57 +0200
Message-ID: <20250519065557.659674-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
splits drivers/gpio/gpiolib-acpi.c into two files, gpiolib-acpi-core.c and
gpiolib-acpi-quirks.c, but misses to adjust the file entry in GPIO ACPI
SUPPORT.

Adjust the file entry after this splitting into the two files.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..c816f8e0572e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10273,7 +10273,7 @@ L:	linux-acpi@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
-F:	drivers/gpio/gpiolib-acpi.c
+F:	drivers/gpio/gpiolib-acpi-*.c
 F:	drivers/gpio/gpiolib-acpi.h
 
 GPIO AGGREGATOR
-- 
2.49.0

