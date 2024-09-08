Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037A157A61
	for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2024 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795662; cv=none; b=Fr4AQ+xEIKM6DKKyMAhD5w/5s+KQyElvkrxSinRLI9tVBFyG8t9E4wXhu1seyszqe5e+1bWxOBSq6tNdDVNEe+jQBT5cmkNeZK3NYfdzE7r5kogWgs0hGvU8llAhFtrGSCxj6sOylxQaB2xXKNkKrlVhl4X8y11pGGgXtWmiIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795662; c=relaxed/simple;
	bh=1Qhx0AQRK9ttQdmzZmSAGaRrUT0Salp94PcJRhj61wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+wSQfs2fYlMsIXHluvRhBczowwi3bgbm92YRoyZ4quQY9GdwNVW8xlSEbcrgnAXXfkr4MPik58PoO0pC7l0T/juZJgwbRaMchwKzSRsoNsuBaN4oaw+5OQI/kTem/YpGuZ8BTfew6gjgsSC23Io0bMOjHeYXXWKE3JQROpqsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AqGNOmWK; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AqGNOmWK"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nGHgsexU2GrBenGHrswgtK; Sun, 08 Sep 2024 13:40:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725795659;
	bh=rkF1WqCp0VrtzogJvR0Aay0dOwijVk8Eg1QDROv0aUE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AqGNOmWKnq45uCle5syYWekhyf5/Be1v40Tr67NyUwzh4pZ33RmrpsW4Im67j9fI0
	 qg2UWYq2MRXMFTgPNLgSIHorXLkVia3kiIXTmhHAZ+tLEsIUxhFZSmHFcs+FTFUKta
	 e2UWEOIWvt9yrED5SFGSJpkAOqRGFmQRcXWtByl5CC570yIsbIzSsQO4GChZpTqKwX
	 Q97D3FLBrzlPRV9oRJjWyTf22C7HjA4bewV32+jNfqS9z1QUPg566NqdoyXZ7YogGk
	 uzHGrcpSmq/+s68PC8h1hI6dwqLd5h8yTDo2J1iaDUc7I/g2a7KEqF7CwpmFlM6R9M
	 ilPgjiNjMhOsQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 13:40:59 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com,
	iskren.chernev@gmail.com
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] regulator: max77826: Constify struct regulator_desc
Date: Sun,  8 Sep 2024 13:40:44 +0200
Message-ID: <1aaff0efb601832cd11949653d5872e7e39fbd7f.1725791361.git.christophe.jaillet@wanadoo.fr>
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

'struct regulator_desc' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   3906	   5808	     16	   9730	   2602	drivers/regulator/max77826-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   9218	    496	     16	   9730	   2602	drivers/regulator/max77826-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/regulator/max77826-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
index 5590cdf615b7..376e3110c695 100644
--- a/drivers/regulator/max77826-regulator.c
+++ b/drivers/regulator/max77826-regulator.c
@@ -153,7 +153,7 @@ enum max77826_regulators {
 
 struct max77826_regulator_info {
 	struct regmap *regmap;
-	struct regulator_desc *rdesc;
+	const struct regulator_desc *rdesc;
 };
 
 static const struct regmap_config max77826_regmap_config = {
@@ -187,7 +187,7 @@ static const struct regulator_ops max77826_buck_ops = {
 	.set_voltage_time_sel	= max77826_set_voltage_time_sel,
 };
 
-static struct regulator_desc max77826_regulators_desc[] = {
+static const struct regulator_desc max77826_regulators_desc[] = {
 	MAX77826_LDO(1, NMOS),
 	MAX77826_LDO(2, NMOS),
 	MAX77826_LDO(3, NMOS),
-- 
2.46.0

