Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92D14B06C
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Sep 2024 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725908192; cv=none; b=CCIvyUrVG8pNVuCZFz7R68hS9bBYI+OuLx+olM2vTi7b2nEZBYu1+5+3A3AAvCSXdapqhm3Vr2/bJ04Dpw/C4TKValLZ2aQvc64X0BzML2/lAjqf+jB7oQW7pXuEpHYegLXxLQzAxtVfOpTmzEBwsZG4NmZqy8XW/ZId1f70LMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725908192; c=relaxed/simple;
	bh=XCcv3+VlTU1TeVzrkssO+GKniXKe8/aUNEm6kzJOjgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GrAS6E1l8BvnYnsZ9OsFx/TfpLdiO2T6zW52VzJidS9eAf2tTZ7yEFuicHInxunLQUz/oNQJd38k6VWqgXKskI81P+VphoF231J0NXYj6xk+EgC9loWHrnKGjC0DhDxbqNOpsCetATSp0K1SfQbQmd8XbuqpUciKjFlepWQzjgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=KZRZ7GCE; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="KZRZ7GCE"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id njYjs4Yu9S3tRnjYksQc9b; Mon, 09 Sep 2024 20:56:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725908182;
	bh=JfsrWdUALDFWGBoAJjftMZEZMQOsusEm4Te/n/W4dxg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KZRZ7GCEDi35/3ir7iCUl8ZMlebXNyhM/bYXfoKv1sLllx3moY47ze3IPXtRyvCQt
	 BvxZwnlAI1Tjk/uICy1TYUJADy2dGWoZCCRJ08BHCe4uIWVFBPrlrtSkjVfZlXhSX1
	 nmiwV5koZ4fL3w2nxbBxnH2drry675oNZge5/C4zE2JALMe2JbMaAFHa69QQZRYwew
	 sf/4Q7yPLjBRkx1Dc5vleKE+SdfmTnKtVWsPUjzANvkpetLJxc4DXVLvPbQNo8VLmU
	 0ZrbvLUrU+vbNss7glSiKLoJ3XRech10iyNAl816D26BS0eqH722oRR+2ay1eaqGaV
	 jxsDM4Z5NTelQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 09 Sep 2024 20:56:22 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regulator: tps6287x: Constify struct regulator_desc
Date: Mon,  9 Sep 2024 20:56:19 +0200
Message-ID: <7727e493490d37775a653905dfe0cc1d8478f8e0.1725908163.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct regulator_desc' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   4974	    736	     16	   5726	   165e	drivers/regulator/tps6287x-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   5294	    416	     16	   5726	   165e	drivers/regulator/tps6287x-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/regulator/tps6287x-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps6287x-regulator.c b/drivers/regulator/tps6287x-regulator.c
index 7a0551f0c8c0..97f5ce138548 100644
--- a/drivers/regulator/tps6287x-regulator.c
+++ b/drivers/regulator/tps6287x-regulator.c
@@ -103,7 +103,7 @@ static const struct regulator_ops tps6287x_regulator_ops = {
 	.set_ramp_delay = regulator_set_ramp_delay_regmap,
 };
 
-static struct regulator_desc tps6287x_reg = {
+static const struct regulator_desc tps6287x_reg = {
 	.name = "tps6287x",
 	.owner = THIS_MODULE,
 	.ops = &tps6287x_regulator_ops,
-- 
2.46.0

