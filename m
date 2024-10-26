Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC9217F22;
	Sat, 26 Oct 2024 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729941166; cv=none; b=e/Kneh1O6adaSLFEPGFefVJtDrGee0YzFTEoMQvSZBT7B4YnRDQmqS1K9QVQ13LC3WHpQ80rPvsaWnhY+Tlut5BYSfiECNglmPFTmOXtySjP2uJco+UowZT9KK22sc/RM9fFRm8x6oftru6lQcX6BFnniui7OZVX9rOdO1NQImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729941166; c=relaxed/simple;
	bh=G84evT0B+lKjUGpRq56h5jxxOl4TYHxpYmAc92bQ8oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCh2LwAz38wJCmRgzqWsXHuqpsbdPwQ/1fg+CN/7+YFBP1JtU3lJgaC2QHUyztTY19I3Dp2giSPq5T8D0teL+98sE+W4dnBuStbV2i5W11f+1eTyJ7QqE0pK3ddtyUepbfL7Jy02c5A00XVxTeb6kUBPo87ZDQ6hzSgq2HqBNwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=h3EaZv8S; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="h3EaZv8S"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 4ea3tEjBah54N4ea4tPuht; Sat, 26 Oct 2024 13:03:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729940620;
	bh=G5GY2rPQRKm/v2JYqMqWO5YhIzdqawHoojEX7tDA53g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=h3EaZv8SCmDWRQWQmRUXi1k/LikSzIZB8nBI6Hs8poRBs07+XCQ4+jqw+619awLEN
	 lJxHw9tO+aii6QxY3TZr5aRrTTYRiI0ba/DvR9lpzhiP7TogdW9d9N9c0MusKa2oDU
	 +TA5rYy8oTtyUuWRuhmu+6jo/IhAL4BnI8AMW1cUHEKYVSeROg49C2fP8hjRj3m39J
	 Hd9NYj68W9hzYMtgHUKu0i7R64iFRf19FYxRU/wg7FJHSKUGpjN19WtAkNs14uuizu
	 x42ejo/bc25726NiuqOr1ZRUqXHpz4FpOQkUc8ww6QOK/QCdeoYodcJJxXM9x/VBrP
	 Y5JAAK2UIHU4Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 26 Oct 2024 13:03:40 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: gpib: Fix error handling paths in cb_gpib_probe()
Date: Sat, 26 Oct 2024 13:03:30 +0200
Message-ID: <459c267de8c9bf48fcb555364930ae7e3cdc798b.1729940596.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If cb_gpib_config() fails, 'info' needs to be freed, as already done in the
remove function.

While at it, remove a pointless comment related to gpib_attach().

Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
*NOT* compile tested, so provided as-is

It does not compile on x86_64 because of some missing includes. I've not
seen if it was dedicated to a specific arch, so couldn't cross-compile
---
 drivers/staging/gpib/cb7210/cb7210.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index c827d03dacf5..98f20dab320a 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1194,8 +1194,7 @@ struct local_info {
 static int cb_gpib_probe(struct pcmcia_device *link)
 {
 	struct local_info *info;
-
-//	int ret, i;
+	int ret;
 
 	DEBUG(0, "%s(0x%p)\n", __func__, link);
 
@@ -1223,8 +1222,16 @@ static int cb_gpib_probe(struct pcmcia_device *link)
 
 	/* Register with Card Services */
 	curr_dev = link;
-	return cb_gpib_config(link);
-} /* gpib_attach */
+	ret = cb_gpib_config(link);
+	if (ret)
+		goto free_info;
+
+	return 0;
+
+free_info:
+	kfree(info);
+	return ret;
+}
 
 /*
  *   This deletes a driver "instance".  The device is de-registered
-- 
2.47.0

