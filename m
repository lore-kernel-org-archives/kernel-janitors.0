Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475F1D523
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3/ASwSC"
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3768385F;
	Sat, 11 Nov 2023 11:53:33 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso3846045e9.0;
        Sat, 11 Nov 2023 11:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699732412; x=1700337212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VCZuqrElRyiEpHz6VhAAB6ifUe/eycXTPkzvJwzq9U=;
        b=K3/ASwSCFBDgGbIEVFcIgm7F6e52Tn0krxYjJSdyjeMxdSMZ4gX2cg6ftOG3aIYj+y
         8mdb2zjB9o2gP4nwRiA8wxC+S1I5Kl4kRxwu1uwqx92Ftg7HHuD9vfPlCk8Sp2/RTQy7
         m7/yPl/dDHB6nPJTAS3J8to84Wgccu4JhTpT/XzGcfA2+oUFX2tUhS8D60SqLn4hB8Pk
         sinnfNj+fG8hIpJCeKNGEsOOl+a2NxH0t2erLo94NttBaGVgTNd/0EtB9l9rUEM4k34L
         epuJYv69Upu4nhcuPu8GXnMCb+5P9cisAMHJWy7Ir2mxwP6wv8ytk5l9PzqQ8ObYH6Uq
         /uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699732412; x=1700337212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VCZuqrElRyiEpHz6VhAAB6ifUe/eycXTPkzvJwzq9U=;
        b=K6+4uf/3JoqEfSivk429u/kUaZ72CXuYoRdGFDDPCYNu8VcTXefkPPyFhjrON5xVwd
         YqdfjzUnnNTLRMUa9CCJW8at7iOWYGfk2EYi9uEKgTTf0j+I85H7qZQtpPmV4/tqmzpC
         HTh+gg+qoHOz+IhahkKrxVhULnflqobG0nHQ9YDx4kebGDdkuij924M7JKxODJREZWBT
         yCcg0hFfEPmd4o47UqExr9uFmywA2CQLkk0HrKfX9OwLSokAYM7F7ERzE/Tzk6DpIl27
         VY4zmoQpS5Q0CyVZOmkY5Fv6I5qOT5fa/qeJA1IKRkDukgK+edT+mZ4FbbaVYhEOBRYI
         TRCg==
X-Gm-Message-State: AOJu0Yxu4ExNR+jSuWVkB2qG1JzfClgDp7kIGnVWrg9ARiecT9ErOSSt
	Rdv5ECbCk2XL0axByq4AB8o=
X-Google-Smtp-Source: AGHT+IGbKUlRfd3HWOHCEAQ/ZJ7CEL3cGM1FkjzQbqKP34p8L6l+aUA1RC5xSpHcoA8b4fohVzadhw==
X-Received: by 2002:a05:600c:1c05:b0:40a:5080:724 with SMTP id j5-20020a05600c1c0500b0040a50800724mr20284wms.20.1699732411981;
        Sat, 11 Nov 2023 11:53:31 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id fl23-20020a05600c0b9700b0040a45fffd27sm5364255wmb.10.2023.11.11.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 11:53:31 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-omap@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] regulator: palmas: remove redundant initialization of pointer pdata
Date: Sat, 11 Nov 2023 19:53:30 +0000
Message-Id: <20231111195330.338324-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Pointer pdata is being initialized with a value that is never read. It is
being re-assigned later on with the return from a devm_kzalloc call.
Remove the redundant initialization, cleans up clang scan build warning:

drivers/regulator/palmas-regulator.c:1597:36: warning: Value stored
to 'pdata' during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/regulator/palmas-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index e0dc033aae0f..60656a815b9e 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -1594,7 +1594,7 @@ static const struct of_device_id of_palmas_match_tbl[] = {
 static int palmas_regulators_probe(struct platform_device *pdev)
 {
 	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
-	struct palmas_pmic_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct palmas_pmic_platform_data *pdata;
 	struct device_node *node = pdev->dev.of_node;
 	struct palmas_pmic_driver_data *driver_data;
 	struct regulator_config config = { };
-- 
2.39.2

