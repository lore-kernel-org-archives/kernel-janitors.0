Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435691;
	b=GYxYkwFxupkIrSEToi+ToqQbVewQU0PmOXhf7BBuEo01zf90GY/5DuTti1dFW5tVE9b3
	 McpmmnSNt2qAGkyrGNdzYCQJj6owAyz4ID81eRcClOw6VDNVw4HZZ1YVCzVkgHHblPJHD
	 YJWjy3IB9sIXzKVjHz8jPKTF5H/iN2eUXjALYa6H56dWWz5UVOfAoLG9Oc7IRnH1FKM1L
	 aLrcuofjFNvDIcsnPpzXpEqC9xmM1BqG5aiTNs2P5/Rph0ywvhsOV3CkxPElc0Kr4ArRJ
	 PC/SSX9PLDc6DL2jffceo4vYS10XKwr7zjxoGj+Zf44xD2/Eaqyt3NWotbP7vUoSy0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TmtKdF1AWiRH6We9YcRb8zDEzdlOz4E493C6LB5k0/I=;
	b=5OoD1KHO9y2vsHqxDR3bVPmaVkleDail75+GB8t2HyicGPbL0aXfZ6flm852IiJd0oE5
	 asCmVcZibD8q/AmsjeIZZ65OR9Hkx4On8Ew39Pe3iJrUl9q4gyIZvVK1gP+jBuFka5OHX
	 oG4dkvGY8ChIdyKm2WXzI4kJ0z5Wg8t4zR+DfnhcOl4+Ea/Z6qLgtmXbWxYeyzOXX2T+j
	 3gyr7sIcrOOQXbO/dqPml85qtNk+pQdC9HORkrhGCUZJLePOMy3/gDsGgIzqrHMKjYrNr
	 9iAgk7AMuLBOQ7+9QXzrDWB4xe6RKbLrW0LXQgGoNaFlOx0Qhh5z5Qv1rUQH60Jyw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAhkWesh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887B9606A327
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 22:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 887B9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAhkWesh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2888855e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 14:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435690; x=1795040490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmtKdF1AWiRH6We9YcRb8zDEzdlOz4E493C6LB5k0/I=;
        b=GAhkWeshmXeULO0RrMSF/TEbMI1rd1Dbu9ohLHmmwmxzRDiTMT2sMZNOQ0a/2G4tSa
         H43L05tjDvA1Bxxt1FR0x7e35oZYwRvJ1bPbenazsGlsk6ItPwLVNWaA8oLMlpAkjEMS
         N1eitSPCAEted5vZEUqrFL1vZplEM9l6Qz1nDytE6InIAI6DDiR7kdkNiqHS3v5905vR
         Aj2onbDH/JimL5zPsjwpBGJkuAdihvFqTbdkbnw57v9zXPy5MYzjSmc9abLm6CNH+Ri5
         ol5v1SfAiMPfJRhlzhf4IPiRSgTD4nrdqYu0lLd92MoaB+d6cjc14Q7V5WsmiC9hHrTP
         qOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435690; x=1795040490;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmtKdF1AWiRH6We9YcRb8zDEzdlOz4E493C6LB5k0/I=;
        b=sTu2znB+e6YjS5DMBgQGlMEFoSAXsEENkc45OjpoHDHSWDIoJ+XHG3/aF5SSVLlYkM
         p5DJLkY12pOCY8PQI+rUbeBaf/arpWeGfVWQHPjt+JWDW5Q8+9RJIEF75knDXtdgtsaJ
         29RTej0QmDUODl36d0/RjRgY1rjRIsOV30NOh0ZEMyzT01/C82rqCKRRKEAVpu1gRNm5
         xep3ZwEtCL4XqaBgy6Gjz5CKURBwqPM4RQr/CNTet4BnS9++fCi0TBfnU1LbkeYoVNYR
         BUs1NUQb+yiNKTrQlfh+wr/1W68G21FWo9POi+DmPHXG5vt0zXFZfJKo1jAviJVpJbFC
         6rpw==
X-Gm-Message-State: APuU4Z+LbSmmykxkuCGrbVQUXvz9Dw6XkqboKcxf0jSC3A++Sl6fMsWn
	kpB9GilQpMqsjH9oj9oqqSDI5v/kG6N0cW6+bu055QUsYOcpEaCMiskZ
X-Gm-Gg: AYBFou1Gn5BGZGtaEwmV3icNiSJ+nfXs1HyLfsHTZ5L+B83wZsF6JsliKwdWA5Umi/F
	NmCP8fWTEjQYHn1QZgZrJH/tdhU3ZkehN0/UP04GsLeDMMrFI8YoM+Gs3n5V26x+qlZggmJYH3C
	gbdIVHnXuokn5TAenXdTQtiKUUkqXbksYfQMu6g5viZHwXlPSozFsZWysVJQOqWbUTEw/+dBsPK
	KBVFWuKshOXSmw6Cz9lOBFP2pY5HvUw7Lw4ruHy2Xapa239mIi/QMxgDbO9kzJCmdBXwGhOJNRr
	fk/CSnAX7WyBHw/iS6ZXdpIF9vxNzb9RSuC4HYm82xUaP3+WHaFXLbrBG7QQ2/bk/SgrgNqSffp
	cYZhoCi7PEbIcpfOWOMpdK/lGQyWl7yoTX9PHFTmbI7JNp0yoc976vtLYRTendvbKSXtCIWWJ2X
	fi+omuZ5Vj26iIfnLuSF/tEwlP4Lh4uQ6SRhO3pOd+dTYMygN/1WZWPgpcQKvw4aqI2+BYz11XW
	sXdLD3FX0T/AxGDL2lPYhjBldV1UrRMr/rGUO3sN7dzoKrzrjEPGeqX7hCDdT71vJJsjQXtKE3C
	b3k4ckbTpZIWCEo4x6LgVMvnX3F6YVubR5XnoFbbkSV8pifZ
X-Received: by 2002:a05:600c:c0cf:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb4e283f7dmr11079755e9.9.1794435689714;
        Wed, 11 Nov 2026 14:21:29 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm78893405e9.1.2026.11.11.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:21:27 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] power: supply: Kconfig: Fix two spelling mistakes
Date: Wed, 11 Nov 2026 22:21:24 +0000
Message-ID: <20261111222124.1035303-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of spelling mistakes in the Kconfig text, fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/power/supply/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 16d0a38b41b7..1ab617326791 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -246,7 +246,7 @@ config BATTERY_S2MU005
 	select REGMAP_I2C
 	help
 	  Say Y to enable support for the Samsung S2MU005 PMIC integrated
-	  fuel gauge, which works indepenently of the PMIC battery charger
+	  fuel gauge, which works independently of the PMIC battery charger
 	  counterpart, and reports battery metrics.
 
 	  This driver, if built as a module, will be called s2mu005-fuel-gauge.
@@ -463,7 +463,7 @@ config BATTERY_MAX17042
 	  MAX17042 is fuel-gauge systems for lithium-ion (Li+) batteries
 	  in handheld and portable equipment. The MAX17042 is configured
 	  to operate with a single lithium cell. MAX8997 and MAX8966 are
-	  multi-function devices that include fuel gauages that are compatible
+	  multi-function devices that include fuel gauges that are compatible
 	  with MAX17042.
 	  Supported devices: max8966, max8997, max17042, max17047, max17050,
 	  max17055, max77693, max77849.
-- 
2.55.0

