Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A520B7EC
	for <kernel-janitors@vger.kernel.org>; Thu, 29 May 2025 03:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748489993; cv=none; b=cRASVc3C5KzHsKCjFWQ8yTEwo0WsNq+H3pvCm/aKU15Bj48K6AqT2C0u78+dncNSZNIM6r+yHM0VydgsscyPJLexKOETkb51eAESen9kMg014Eshi5q4oW1lNOkHyE8Pmb5I3OjcpP9bjWqdPp3w9EPyW1jxJNaN++J9E3oScZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748489993; c=relaxed/simple;
	bh=aW0RTWdvtM1w6UkkBNYoSa1kspYBY6nDibe+OrzxZuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvFEGkGHLlZbB/ORXIet8asI04kP9hcnPEqP7eGSmO34k8fKUeyDj5Hdje4tV93W1CMVpBBJaxH7/qAKcMJP/p5DtPaBtl47FafTd8TrmULBiWmLFr4XYSrYYfNFn7axpTvPSjtXceVtm9yhSmcuBJQHAKaFta5WZtVI3mmFqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X8xKvSrg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X8xKvSrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748489987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w1X44SCuPTfj5D1IbAzKgKS5OuFXYEFBS/1q8JBmFyc=;
	b=X8xKvSrgY0XeFzzFtBwXbExKKOs2rQmXFzyBOUqZHPzmUJOtQHTbzE2brKZei5trTXCkVK
	durVu+sMXCwEUS/4bNPqYPgXB0asRzRbKqo4XM0s/SqA7OkeCWPsuIuxWeESJzvQCuKnKD
	q2xJzbg+d8NofTYf1vPXpRoX3nWyC8s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-8FKA2qi3P-K3v0xunuvslw-1; Wed, 28 May 2025 23:39:44 -0400
X-MC-Unique: 8FKA2qi3P-K3v0xunuvslw-1
X-Mimecast-MFC-AGG-ID: 8FKA2qi3P-K3v0xunuvslw_1748489983
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ace942ab877so37170566b.1
        for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 20:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748489983; x=1749094783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1X44SCuPTfj5D1IbAzKgKS5OuFXYEFBS/1q8JBmFyc=;
        b=IscNN64d60ISoid9WawuOeCAnE+D8yzHnW5T4k3T2XSN+v6oyzUESPMEr0zuY4JoPY
         +9xPe1LhEE77+634GwfhcwH7jwR6PN8yNz6R7V+uZCg8VfY/uj6CwIit529UgxPKklGs
         Y9VlcKcHjMEg+VNXKL3lPoU8oDPfVcTEIFt8NYJVUBexa0i1rJYiCjz8xrQo+lvHE6A3
         yp0AK08zn2riRGL8kkRuAuAhNR//BnW8XPEurJf761ZCemsoXpg7T0VzQq+6hZvt7enK
         iA8rY60WuWRneYwznc32nRiPiHgG2dfEuqg9a7aBzsHYzEsj2yfxIGlbGofmUen/e3D1
         FCAw==
X-Forwarded-Encrypted: i=1; AJvYcCVM5nsaz9Sr6o05zh0pcta2/HRjYwrq0htREgUOg8HXkwhHvFyUFerQKTSyX18Oi1i2NFtqYogXsaHoLjilGTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4v3nEy7mUNeziy1eWPa+UbPxWU+wiR3QVEbZoC0p0dihpOaZf
	ioHRC39bMzWaW99ebWQuOzHsAJcFTTB1LznkdVFmZrqfhE9++R+9GSLiYeGnd39BOnuhwVFFWRn
	2iQs5ciIbMYoJi7ZCmy/zzrQwwPS3qXSw1bgEnURaEgHhc3UpjAumQkGWR8j0CljUtai3HUfx+A
	Urww==
X-Gm-Gg: ASbGncsp43a+BKQaXNcnNP5eT/mMnd2E32jFWq7afW43x5zskN39JE2nVwg6QzDTupg
	VjIjsYbnvmhfVvb77CBqXsSgwwi290WV3ix8EQv75+kTGSjU0lg3eeF1pxDoveG9AaI8d1t1UEx
	bLVFra6zPr319/Am7wD5DGi1d67Abm54h5ICLUywLPF8PdLHHXZuD7uY9sBeiv68je5wLLsClKa
	NqQpwh93E4YPHRz/8tnfTS9HJwM88/dbgj+7IqLZVmwt57JpdIlNfuitcbcfIV3NH/88MD+KeVV
	3vexoZDzaJHYYSILx1QgW3OR2u8DcjB08yCa4SDLozyLhnh1EVhQxu7//Q==
X-Received: by 2002:a17:906:9fcc:b0:ad5:10d9:9061 with SMTP id a640c23a62f3a-ad85b2799cdmr1912493066b.54.1748489982849;
        Wed, 28 May 2025 20:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGvpqqAZuFEZNhtkIGDjJnONQJ3hQN1ikYduqSMmBqKDYUX8JsBp/1HPjY5wTGLHJ5InFanQ==
X-Received: by 2002:a17:906:9fcc:b0:ad5:10d9:9061 with SMTP id a640c23a62f3a-ad85b2799cdmr1912492266b.54.1748489982516;
        Wed, 28 May 2025 20:39:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2beff7sm56525466b.111.2025.05.28.20.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:39:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Akshay Gupta <akshay.gupta@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Guenter Roeck <linux@roeck-us.net>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] hwmon: clean up Makefile after sbrmi driver movement
Date: Thu, 29 May 2025 05:39:33 +0200
Message-ID: <20250529033933.281845-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e15658676405 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to
misc") removes the config SENSORS_SBRMI, but misses the reference to that
config in the Makefile.

Clean up that obsolete line in the Makefile.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/hwmon/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 48e5866c0c9a..726ffd9f6a1b 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -196,7 +196,6 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
-obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
-- 
2.49.0

