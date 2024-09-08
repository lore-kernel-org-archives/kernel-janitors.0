Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77F01366
	for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2024 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725784879; cv=none; b=qg+aTVYDgFIevNkBAvfNyeD9KhlQJDf1+ALE05Q2om9D5GD2JFgGVrCetrUyYq/jPnirQ+fZGgb0W/OMNlSOrd9FMIuEqS2jVPQXzkx1LgpptJDN2fK7tAHUT7Jef0tyIjPA4eG7KxADmekkdSvFQUi22cDuV8l6GjMyz89ROmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725784879; c=relaxed/simple;
	bh=swX8JiMMbCaTv25KgcfazqFv6Ef4hCtJXe8YYMZMPtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/aye48QKmViZLmYl9cjPAgeuVMVLyEdKiGhhLNyOIyfDV9p5asjnnVQMcHmsdgc16a4cvcy3FeFjNX3eXzimitNuBRsXrR5h1MjDubZyaad8DAia5BjAOkmBmmrA8yVs3y/s3/i3QtmqcAEJWzL7hUr89N0YZi+HF/6OAEFSGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dVm7ND9g; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dVm7ND9g"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nDTus3gMDOcVznDTusuWLg; Sun, 08 Sep 2024 10:41:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725784874;
	bh=+hBT99Fq7TifafFYGgCRZUBtinFwQN/LKRQE0krLS14=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dVm7ND9gEa77AzHNeJfk6IHOjZH4vOU2ey01XtnLJ7h4HTmCzHZUDD/wAt+HQr8Lz
	 KGMCCUT0nW3e1j8dvlY4hJa6gE4iHMGsckNn6EMew52bcBlMzO3zFOr7/dPtNkFPUu
	 d11233hhf/+WYrVLDoezrRqRlgFLGi54vFgwAQbicnyl8zRXIH+Gs6rPRESkqtz+49
	 AkAlS03t6iK75KiwGS8N0H7YXUTwd8hR1vhV5Zjyjq8V0DSM7nfLQowU5FB5ZUE0YU
	 aBgvQcPPm4tBOkMbJY30LuKP3GgFaTldixA4sPoqm+aZVuIeLLK3WDMMaAKay6UAhv
	 sv5lcwGm+qPxg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 10:41:14 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regulator: da9211: Constify struct regulator_desc
Date: Sun,  8 Sep 2024 10:41:11 +0200
Message-ID: <54258bfe11112d70d2f1eb1deda2791eb9ef99c1.1725784852.git.christophe.jaillet@wanadoo.fr>
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
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  13982	   2118	     16	  16116	   3ef4	drivers/regulator/da9211-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  14622	   1478	     16	  16116	   3ef4	drivers/regulator/da9211-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/regulator/da9211-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index d8b39ea3de0e..d4f14d7ea8cf 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -264,7 +264,7 @@ static const struct regulator_ops da9211_buck_ops = {
 	.of_map_mode = da9211_map_buck_mode,\
 }
 
-static struct regulator_desc da9211_regulators[] = {
+static const struct regulator_desc da9211_regulators[] = {
 	DA9211_BUCK(BUCKA),
 	DA9211_BUCK(BUCKB),
 };
-- 
2.46.0

