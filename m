Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210E160783
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672864; cv=none; b=YeLVajblL7xB5SB2HbjuXw7twangl7XPx6IUA+oa4eYqpEQ26YujmmCITuuO+ZlNzgf0dJ5+Y17qYCJhEhx/NO1LjZq5nAVFdZWRLS1aa7s23H2dd8YVw3YN4x5YfJtmH3BNX6CaW/9agZnczNu5MwAvQpOK6JGQWqsvVoWp3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672864; c=relaxed/simple;
	bh=AhxknCPZ2gcrOaKuKqEw8OHcUo+zkXArRxDbHaTse4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCqKU4x31k2SLXA1miRg1YvQ2BZyXo4C10TpKxEX3Snhi1wi/2YWf7giqCFMiqKDOmcUHqAyD8Q6LcBkr4YvZcnfb9vPmohDaLaPfZpiFkK+YLCmwE7svCvxZcxSj2xNoDSt0ux8WYWmtEevtxah1vLzADrGiTrnGKuUmTYlKqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRfEktUa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRfEktUa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d51055097so4784002f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672861; x=1730277661; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=;
        b=cRfEktUaUBudFW1wshptFe8OVAlT7/V2/M0FQxYdQm/Ovwz/qYJEqkh8PoV3MUii+i
         dsHh37NRVlb71xNqHcdlCY9vaxv0uCLVFdPyBb+tOTmPU/tivlJkUwHpiGEuJyW98z1l
         TJ7i6XaKCUm63/0FYseldqeAMsKbKq4GoSNUUacj+ZyKzQK2JqrKfIGZxWOtf6/zJKAJ
         xHS6iv3pLtAenyh/Yo7Ycka3H/2PGlAdnty4tpYdtUL5tlCu3XxY7pqEikSBgw0UBWek
         H4gPR8WzaF9wHuBmgUUQ0purOB6fDgzOUXQRqNhqldHjmMBqskiM7VrizOKvxy7u/y5C
         tYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672861; x=1730277661;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTGtBlFhpF4KfA5UaZkwNHNmAJyTL8PF0NqzCKMi89Y=;
        b=WA3koTcTMAKQ1gO48KouB4HfvUsIpHfl7pZiZUxQm4a3KDU/QLmZqMU5cOV2xTk8ZX
         jX6zyUu7Uja2xIyicGTenUFVNHhHtvnUqRkd+ehwabCOq8Sos/cSUOIl8LZVm8fkkrED
         DpS6VA0wyLAY4iOVVvJ2tEvBq+EgV2NPdH9YbIGffK7ZVhD70sQp3lS1MlBcQfaBwyg2
         PVj+LWqyi9j1jdXpW+dR7qFvPw6NMjLwBvtOUcnqq8nGFYjr9V1agKN6alBDpxR80Cte
         rpXX9qLZ8jEt/WbEeWNYu9VpFQPbIeuSo/2V4Ucdi6W6b6rC6m30Nz5Og3J4pVJJyfWh
         HlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM7CohCujj4VEgtvQSMlwNceeogYS4HXIKpuwLzE9OBgIdmojTrIPGt+FEjNI2QtWEIpLTzNcH69u0cf9m6OY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+bP/N7916wheG6uVMQvG37J4Q8Y0WSE46c8jNBjVfzGG2Akz
	frwBhYAcV263nxm4YCBFC9PRZkk7EvDo5eLvB3LkC9STniZEwIrC4BU6zmvCRh8=
X-Google-Smtp-Source: AGHT+IHBkbz8Gkiu8syBDS0U/jZ595MpfEdCm+s1X/ZgIeh+fOEidnPqxPO8f+s/cE9RJuzVEPDXEw==
X-Received: by 2002:a05:6000:128d:b0:37d:4a68:61a1 with SMTP id ffacd0b85a97d-37efcf926d3mr1140382f8f.56.1729672860806;
        Wed, 23 Oct 2024 01:41:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93e76sm8408355f8f.82.2024.10.23.01.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:41:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:40:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: rawnand: fix double free in
 atmel_pmecc_create_user()
Message-ID: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "user" pointer was converted from being allocated with kzalloc() to
being allocated by devm_kzalloc().  Calling kfree(user) will lead to a
double free.

Fixes: 6d734f1bfc33 ("mtd: rawnand: atmel: Fix possible memory leak")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index a22aab4ed4e8..3c7dee1be21d 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -380,10 +380,8 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 	user->delta = user->dmu + req->ecc.strength + 1;
 
 	gf_tables = atmel_pmecc_get_gf_tables(req);
-	if (IS_ERR(gf_tables)) {
-		kfree(user);
+	if (IS_ERR(gf_tables))
 		return ERR_CAST(gf_tables);
-	}
 
 	user->gf_tables = gf_tables;
 
-- 
2.45.2

