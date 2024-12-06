Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE361213E78
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733523963; cv=none; b=vC3JWyv+Abr+6PCziBZheXxXE5BnA9EHpY9mHvjKOIWjj1XgAKKsKcG7sgAui+N1xcSBETsdZWpryDtP04u5l2e6o/GnQrwuyo9vxgiavc0xF72Ucfyoi04mCLkVwJhVxgYvxyW5nNKn1mEn0fFHyY+4jNRhr2dTYORYFGOXi/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733523963; c=relaxed/simple;
	bh=Gj8qfJWC3S8S7/kNhOtCoDZ6nA2QRSN8OsU0VXDUZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pnYiv2KHRj/r8kS2RsN2JMmU/vEuoZhQIOw9QrXuABpRhXiBp5wHjXRoH9dcl3GwMrN5biLpwfSJuOvZOxZJDTIHq7UEMsQ7X8qO/V5idpzQwP9REp/EDLYZWW5P8c0NNkVsJRIAQxJi3VKDjt5sgOsMzv8cOvGnMofobVPVNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dHbdQEtn; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dHbdQEtn"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id JglqtTW6qgyqpJglqtoJN5; Fri, 06 Dec 2024 23:25:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733523959;
	bh=5ZO9jSvUWcczovjcsOHSrSDS+9eidGvAZd9lWWiZAvw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dHbdQEtnA6FjVRprh/dyZ1PURHZcC7EJOXdiYfWsUUEin2YWR3Lqrn2LPHCNiuhC/
	 Q3jqtvjGz40fUu5UjVJThlsR7tO+rZRK8HWxKagmqgxGKpzxsL4OgN/skW5sx2zn/g
	 2uZmvNT3jaRGRTUVLTFQRISAmKn9ujwphN7MxFB3IX8Oye9uKVg49MoFlCtgePCl9C
	 zLqo6Mv0y7VIy2/5qKink5no2/UOM/uoqSinn+bJnqERtH6KUthcCh4xsjXLppOJps
	 i/aDPSPwChOb9uj4GbWY9VAeaxgROO+9RtSTw4TaxS12EJ0fLOu9TWtdMuzkncV4iV
	 4q6LQLm6r9nWA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 23:25:59 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Paul Burton <paulburton@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] auxdisplay: img-ascii-lcd: Remove an unused field in struct img_ascii_lcd_ctx
Date: Fri,  6 Dec 2024 23:25:41 +0100
Message-ID: <35fab997bcac76cd4135797a4968c2c72511dcb9.1733523925.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 'cfg' from struct img_ascii_lcd_ctx. It is unused since commit
7e76aece6f03 ("auxdisplay: Extract character line display core support")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/auxdisplay/img-ascii-lcd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index a802678a6f74..693339ba89d0 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -36,7 +36,6 @@ struct img_ascii_lcd_config {
  * @base: the base address of the LCD registers
  * @regmap: the regmap through which LCD registers are accessed
  * @offset: the offset within regmap to the start of the LCD registers
- * @cfg: pointer to the LCD model configuration
  */
 struct img_ascii_lcd_ctx {
 	struct linedisp linedisp;
@@ -45,7 +44,6 @@ struct img_ascii_lcd_ctx {
 		struct regmap *regmap;
 	};
 	u32 offset;
-	const struct img_ascii_lcd_config *cfg;
 };
 
 /*
-- 
2.47.1

