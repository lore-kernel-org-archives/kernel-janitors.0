Received: from msa.smtpout.orange.fr (out-66.smtpout.orange.fr [193.252.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD85176246
	for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2024 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725807373; cv=none; b=u+ysIcNr/VQsoEVnhdOVbw3/Q0jw49xK7q/eKkcPMaeOF8SugfT0IJIhZbaAarsvO7UwGIDa8EaPKh5W6YpqQ9FP0FOkozNIUpi7MYckfXpfwW5lKzk8oOvfZv8fUL7QTcQLVMSGk0T8YKzbnoLhgGm1qcwotgwGaX6aJnysdXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725807373; c=relaxed/simple;
	bh=2878OUAvPn02hVcYzrKk0j2qA6pHn64HxA1X+3YpEIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AJe/5t89+R9M5YEWLZZ+i5aRBV6QVfTrcoW7oyYq5Hi5WVEDT0i6N9M+IIpufwoUuoZMYhzYeymydjcx7kOI/sdnMdzcs1RUrAXtIK/qdQL/xaNLCUGYaNEjeS/OaWpYalyIefmDDYyAFC6g6a3Ka1a8YBmKZ20Ar4uAL0m18IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=cyZFMvK+; arc=none smtp.client-ip=193.252.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="cyZFMvK+"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nJKcspaGM80YWnJKcsvWqg; Sun, 08 Sep 2024 16:56:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725807362;
	bh=RHBdDISU9XxsvKd0TEtXZNwSPdBnrbA7/zYXeOo/hTM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cyZFMvK+rRuA5lv4L9Y3RCgLI6m1UBlDGro8SIjXPFTMncZY/JnCNIDft8mlnIYqc
	 1UcjluFHIXmf8OpnLU+mDNVMyBr73gJwwuck43OMdf78WRI4dy2ul6boLtUeoKaiWh
	 7tfMSEfm0L1NpzgPYAFwi+5+sb21ShaMJKBEuSo+o3GlIvq4iL5y+w+gwE8Wq5SuQE
	 3t0/Dl2dbB5sq8X6K+FVIH3C5V8WiDnvp7tLD/fS2oRAorGChUJl6MHCftqc3idwzh
	 dySW1KHGpDb0rrXl5aMiXF3KjfLOpzs1h1urY017HoslYHzgaaLQXuvSjyampSjhPI
	 8H+VaKy3IeYoA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 16:56:02 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regulator: mp5416: Constify struct regulator_desc
Date: Sun,  8 Sep 2024 16:55:58 +0200
Message-ID: <fd8d1307f211ec7754f46b6678c04309556003bc.1725807320.git.christophe.jaillet@wanadoo.fr>
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
   3516	   5320	     32	   8868	   22a4	drivers/regulator/mp5416.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   8508	    320	     32	   8860	   229c	drivers/regulator/mp5416.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/regulator/mp5416.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mp5416.c b/drivers/regulator/mp5416.c
index 3457e650a994..e6794190cb68 100644
--- a/drivers/regulator/mp5416.c
+++ b/drivers/regulator/mp5416.c
@@ -163,7 +163,7 @@ static const struct regulator_ops mp5416_buck_ops = {
 	.set_ramp_delay		= regulator_set_ramp_delay_regmap,
 };
 
-static struct regulator_desc mp5416_regulators_desc[MP5416_MAX_REGULATORS] = {
+static const struct regulator_desc mp5416_regulators_desc[MP5416_MAX_REGULATORS] = {
 	MP5416BUCK("buck1", 1, mp5416_I_limits1, MP5416_REG_CTL1, BIT(0), 1),
 	MP5416BUCK("buck2", 2, mp5416_I_limits2, MP5416_REG_CTL1, BIT(1), 2),
 	MP5416BUCK("buck3", 3, mp5416_I_limits1, MP5416_REG_CTL1, BIT(2), 1),
@@ -174,7 +174,7 @@ static struct regulator_desc mp5416_regulators_desc[MP5416_MAX_REGULATORS] = {
 	MP5416LDO("ldo4", 4, BIT(1)),
 };
 
-static struct regulator_desc mp5496_regulators_desc[MP5416_MAX_REGULATORS] = {
+static const struct regulator_desc mp5496_regulators_desc[MP5416_MAX_REGULATORS] = {
 	MP5416BUCK("buck1", 1, mp5416_I_limits1, MP5416_REG_CTL1, BIT(0), 1),
 	MP5416BUCK("buck2", 2, mp5416_I_limits2, MP5416_REG_CTL1, BIT(1), 1),
 	MP5416BUCK("buck3", 3, mp5416_I_limits1, MP5416_REG_CTL1, BIT(2), 1),
-- 
2.46.0

