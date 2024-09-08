Received: from msa.smtpout.orange.fr (msa-217.smtpout.orange.fr [193.252.23.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3CA4503C
	for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2024 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795669; cv=none; b=EdXrc4DZV4KHaUwKfj32WiL9PW+V8euV9ZsB84lq80x+bpRfPdU51qYA1iWWgyfg4O/XWlGsZG3/DEDtCZNA9G8TEryVy1oDGmG074BqLVmJgS1UUBjbXL/GxV27CmBbZEOPppwabbVwmLhCzFuVo7u4UyxozA3jKV4r20Ygf9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795669; c=relaxed/simple;
	bh=ltZOXOEbg7XQE/584SV9e7dnc4lbUDxScr6IpzLIAQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeoGPoGo7BD2ycN40+rcMPQMJSlPwDK74hGiguCi9CJV39YPXH8M22cSlvTk8edDmLpSZzwtJYkTXLeWMa1UkG0crCG92e10zCYfpydMWDevElVutIcsperdaUQSyY5J8saclOuOdjHsf8ytxDo9DmB2C0iiZ8mmRO/0v8uLrwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VA6oGiuR; arc=none smtp.client-ip=193.252.23.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VA6oGiuR"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nGHgsexU2GrBenGHxswgxl; Sun, 08 Sep 2024 13:41:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725795666;
	bh=5e0Qm15ALIQxn7vbSh4VAly854bRiZwGfw2gToWMa2U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VA6oGiuROfQ+8eZe7YNRCPyi3xSK0Z5UyvoIYIrInT2NY5rKSQbBI7OA91eDKMEgD
	 HVDB4dxFBqOiVQ6drvPnY75PaeTNKvs+Sst8eFpGjpb7ak5r692PwhJXIjr4Gz0X8k
	 ePHR+soRJsRaYIk9roBC1UQ4eHM4xTZZfHS294ZXA6W0xpCXEsXxfttPu/mioIoBRr
	 /uBzfoYX8FPBn9rVF0W51oNoop0OhkuDA9O/XXRpj8RayFyzIGWd/QtD4FlNguppts
	 dY8ZlsjbtsDovUJmTv2PuMPyWingZ03g7fZ76PVkt13CdvuV0ICTE5kCbYGYAy7an6
	 rYvTffOUAsSww==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 13:41:06 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com,
	iskren.chernev@gmail.com
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] regulator: max77826: Simplify max77826_i2c_probe()
Date: Sun,  8 Sep 2024 13:40:45 +0200
Message-ID: <583fa0bebbe18f8cb6e215a895f57b2eb944218e.1725791361.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725791361.git.christophe.jaillet@wanadoo.fr>
References: <cover.1725791361.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct max77826_regulator_info' is unused and can be removed.

There is no i2c_get_clientdata().
Resources are managed, so there is no need to keep references unless
explicitly needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only.

This patch IS SPECULATIVE, review with care!
---
 drivers/regulator/max77826-regulator.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
index 376e3110c695..3b12ad361222 100644
--- a/drivers/regulator/max77826-regulator.c
+++ b/drivers/regulator/max77826-regulator.c
@@ -149,13 +149,6 @@ enum max77826_regulators {
 		.owner = THIS_MODULE,					\
 	}
 
-
-
-struct max77826_regulator_info {
-	struct regmap *regmap;
-	const struct regulator_desc *rdesc;
-};
-
 static const struct regmap_config max77826_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -235,30 +228,19 @@ static int max77826_read_device_id(struct regmap *regmap, struct device *dev)
 static int max77826_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct max77826_regulator_info *info;
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
 	struct regmap *regmap;
 	int i;
 
-	info = devm_kzalloc(dev, sizeof(struct max77826_regulator_info),
-				GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
-
-	info->rdesc = max77826_regulators_desc;
 	regmap = devm_regmap_init_i2c(client, &max77826_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "Failed to allocate regmap!\n");
 		return PTR_ERR(regmap);
 	}
 
-	info->regmap = regmap;
-	i2c_set_clientdata(client, info);
-
 	config.dev = dev;
 	config.regmap = regmap;
-	config.driver_data = info;
 
 	for (i = 0; i < MAX77826_MAX_REGULATORS; i++) {
 		rdev = devm_regulator_register(dev,
-- 
2.46.0

