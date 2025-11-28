Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605923EA94
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764351267; cv=none; b=grWwyO8QKTj5wnw2nBdKTod+egaPpGq0Ace7xrgArLXrr288JgVad24zPvZIbAkk6RV8BEr2QL3EL/P4YxXnA0t6S81W7lk7eRBNU15hktVcE0HJ6MgQxyeDTjBiSaxgumwKZ5+fMoV1YhcOdVYCNIkbfV/2wrYqmXVQ282v9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764351267; c=relaxed/simple;
	bh=NgDFq9cuCpSo6J1hvLf9P9F4t2vw0nLtfbfK3/gf2R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HRvLpa8mioqkGay6cG4sivsTIuvug0ZVV5Y8hhvYx9/boeA1uA7gwy09+JSjLxAsW7mvl1qfIHuG0RR9t5xtjj39vRi62uVhD1fIqWZjbjwmIZP2G5QC781k7HTS6rH5PaZyTuVHo533CGFMyFr0YmAXcf0c9IC6wAEVEnG2dco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFAmMmMR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFAmMmMR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so1865701f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764351264; x=1764956064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sgP7CtXkJBmpniv++l9Jyi2R5Im8Yl1+Q4ukLyH+Ms=;
        b=OFAmMmMRZP2G1hwp2tpntujLbmg6OA4/Vak3rgdpyD1+TDIa4PGhSKEJdo58FK/MwT
         qj9jYKDST79MKdAuMg5SSZWCDw5PcYzEKox6rN3J55G8bRYvkzqOvIJZzMT6pU/g21Y6
         a0OPQYsTrJQbyQnweiiVfcip0Ef+u/m3VlpwP+MwZlxru09FhrxOZL3zRzLnk68Px+Ow
         fcrgVNWcKSkghAwh8LIApLZxEnQd80XyjmjTwcipVcSughmsgPrN+xY4T6Zs8vPCLpw+
         GhGNK0SCu5KChKbfutCsiA5se+UZBmLOCJMKCzvS029lJ1gkyTVoJecQMpHprFTeEYQk
         0G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764351264; x=1764956064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sgP7CtXkJBmpniv++l9Jyi2R5Im8Yl1+Q4ukLyH+Ms=;
        b=TuXfSP3fKBZje3CgFTsZN2BKS07FVKnKSPwn722QeQxwCEyI7NgtfBcjG74AekPAIc
         SFXQ2sZEMe2mnZm2tK0RNXHtCMMjqA8Jd06Sa2HeM2VEVkgGSKZMNy+MCI1ieDXrhkvt
         KjNinfnQbRphBFZxoaSKywD9HHa5pKgW3bds24EOAkY26B/MMb9RmvG4V79JF1GGnHoa
         oFebcizJ7L4fSL/5ZJJmaSGsIA8xoywHEDzcfhogcjCEEJckcDvmaHbxNEZQx8e6n1Mm
         nwgNXoXp27sUQEn7A0srKkmj8nERDqhgcY8d3JkAAjJhKq0E721V2sHpwkyAdsJlni5m
         KtBg==
X-Gm-Message-State: AOJu0YxetLRsCo80gDf8fkD4lX1B5/57ekHZv/fcNFxCJy75bn4XUuc7
	53+lLHNX4EIObviVR3ZQEETZ3TMdwQ6o8mSv80Tbtr2R2qCe0zMdwrJV
X-Gm-Gg: ASbGnctA/1nyCadVNCffdF9Z6mkJxjqFK3fmQ3k8Ga3Eq+wdCPenbY2bLP8Qh8YqNML
	t1tTTmyEs7Lvqgr+psbGbdjEq63T5egJSYCxJguYwxSonbDE4Zw+meAV0WIzhUxqwcMJnq9a38O
	yI6jImoN580IjiGz+aH5Sb6eHVhcEiyKqAN5/0txYXjgHM/v986QTief+xETp880fzZXfnbtGuB
	L/YQT0wusA1vtOwwQVWlX+jvoxys3ft8tuCGrmsr64SDtrYutExWSisEPf2qFu5X0m+lXWRMgtj
	6iWEevm4QcTI7a1rcbYrKlrHxhtUXDFaNFkSvBONsp8seraONEaegA1a4LEvHWaUU4fLqmMn1WQ
	kTl0rEcFzk/P818AnmC3CFNU0MP0a7BXTuU4tRL4Ez1jm3vil+rtvqNBKEJ+sjPCMsTggZ09SJb
	il6viASamB6Q==
X-Google-Smtp-Source: AGHT+IHyxSGG3hgLl6lCY8Xa7muEnfLqEs1ko+keZ1C5MJZEIG9/+bd7IyzXr7/0ynf0jrFlO0/yVw==
X-Received: by 2002:a05:6000:2c11:b0:42b:3131:5436 with SMTP id ffacd0b85a97d-42cc1cedb16mr30013813f8f.16.1764351263575;
        Fri, 28 Nov 2025 09:34:23 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c30c4sm11410535f8f.9.2025.11.28.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:34:23 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: fp9931: Fix spelling mistake "failid" -> "failed"
Date: Fri, 28 Nov 2025 17:33:29 +0000
Message-ID: <20251128173330.318309-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/regulator/fp9931.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index 875d875d1a50..fef0bb07fd5d 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -444,7 +444,7 @@ static int fp9931_probe(struct i2c_client *client)
 	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
 	if (IS_ERR(data->vin_reg))
 		return dev_err_probe(&client->dev, PTR_ERR(data->vin_reg),
-				     "failid to get vin regulator\n");
+				     "failed to get vin regulator\n");
 
 	data->pgood_gpio = devm_gpiod_get(&client->dev, "pg", GPIOD_IN);
 	if (IS_ERR(data->pgood_gpio))
-- 
2.51.0

