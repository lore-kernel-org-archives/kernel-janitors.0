Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86722B666
	for <kernel-janitors@vger.kernel.org>; Tue, 29 Oct 2024 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205135; cv=none; b=gGJlF5wCIBgEfxj+Y/a71+ucb5wLq/keK3FOhVl/q4bqwpfrhKazcK+06fxo4zLBQMYhId5RXjp5CyNy2fYkHi5nmWIjRpAW8bGos1Br1FfTsMmk9CkarMvWoO3r/toe0nb1cO5Xfr8MLLTRpJXcX6MFbdEydzYxHl6WTgE6izY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205135; c=relaxed/simple;
	bh=XZPeYZ6csh+iLgIU6dPxvjDU9u3yhGlNS/BwYc9pr+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZtOV6gWM9flK7+1vsomLGnzkYjVRnYCG+wmjuuVvff4W/iJ3V4FMuw6TvkMcUWmLynGcecHpqNd4pl7Je4jKv8zXuFoQ3uQuyCR9deGMIKN/CahdK0HSAU+EkM6V4TvZb9Wam46wdPgPE1aBGBHbShn7Gs+qhsQh5rVWne/vJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=C9UoaC1T; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="C9UoaC1T"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5lOGt6UZmWAQ95lOGthGvC; Tue, 29 Oct 2024 13:32:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730205125;
	bh=+mSbqJzHTb7UuKKE81wy4HqptEKJd9/7vkwwu/YmtSQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=C9UoaC1TVYmJLT+xkrE/mPPJXmjdVt33PX/USrYk+bzmxx4FPXGaBvzEf2oArG9YE
	 4RmB7G5sZzkZah1NeuhImFNiz5IhGrb1FFDkNe4Wgx0636meQNOIcB0AJlFhe4m+NZ
	 yr7TVXxX+U09+rA4L3dEC04Di7/C8bH5aSSgW3h8IlQ3PW7LMR815W62d5zu3KYMb1
	 E9FiOjuB8GymFcnw0uNMghNiUWekqhNtAc3PWR/jCWcKspSMMnwMFUigrY1iesJReC
	 UcoWxeAgWXHswE68YaFYUfG/8zaQ5fb/hdO21A2UinUIkhfbygHS/+9R2XyMFoxLLR
	 EzRD476nsEXdA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Oct 2024 13:32:05 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] mfd: cgbc-core: Fix error handling paths in cgbc_init_device()
Date: Tue, 29 Oct 2024 13:31:49 +0100
Message-ID: <83194335554146efc52c331993f083bd765db6f9.1730205085.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a cgbc_session_request() call, it should be
balanced by a corresponding cgbc_session_release(), as already done in the
remove function.

Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
---
Compile tested only

Changes in v2:
  - remove an empty line   [Thomas Richard]
  - Add R-b tag

v1: https://lore.kernel.org/all/24ec1348b99e76a853435ab081ae9a8f0e51fd52.1729938747.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/cgbc-core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 93004a6b29c1..7c0ee6d53091 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -321,9 +321,18 @@ static int cgbc_init_device(struct cgbc_device_data *cgbc)
 
 	ret = cgbc_get_version(cgbc);
 	if (ret)
-		return ret;
+		goto release_session;
+
+	ret = mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs),
+			      NULL, 0, NULL);
+	if (ret)
+		goto release_session;
 
-	return mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs), NULL, 0, NULL);
+	return 0;
+
+release_session:
+	cgbc_session_release(cgbc);
+	return ret;
 }
 
 static int cgbc_probe(struct platform_device *pdev)
-- 
2.47.0

