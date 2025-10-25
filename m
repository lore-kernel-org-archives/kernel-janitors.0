Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B692169AE6
	for <kernel-janitors@vger.kernel.org>; Sat, 25 Oct 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761391794; cv=none; b=j/Jz+DyJ/4JBtF3gAfH1BB1ydz0mn1VqXfk8ZOBkU312mBm9m9A6v7uGxe22fgQGqlEnb14qnmIEfDb67x63kZTm6iomwO0TsUD53F7JWI5TinhM2vxnqppquE+WCK3hfLt81U0L9zgUaBLVpGMQENigCGsHONKBnug75++Dfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761391794; c=relaxed/simple;
	bh=983wrdIPqGXr1N6X2Mpe5PcJJmYZnpG29rdSC6H+ghY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=is07UFaFq7Bv6ViUb8uMxnyBBGiA4COWJzsBppv8BpME8qWhotFjgeGbj4QGGNB2+iaKsCBbgZsRpArv37nFr0EpKCrRjw4Zd4zFBPrQr34EmgZfWAWeFQJrAHyWrZqce41Aq3qSBJNXeyQ4dbFkMsPOVTlGxasq0THb93I6wSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hY4l+euV; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hY4l+euV"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id CcSpvHFqxHVxLCcSpvAo6u; Sat, 25 Oct 2025 13:29:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1761391780;
	bh=1V5B/4hJFNtFCYVTGP0SlVNqPxchzTua6ZWkv7JbXfE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hY4l+euV1CHCmjpz1OiTAhmbe9gAPBOLWvIlirTJnh/hGoNmj1iZLNAa5ekPMU15r
	 DylxnJODgf731g5uac07kWd60vSsPnIkkH3gn5nlaMGiFOZeXXbr6bqF4ailMQSt0C
	 4kjRob8CF4IPcEn24+tF3OJ/jgnB1B4nA/rWYGo3ZSj4O+o3bG5pXDdS6CpRz7wnUD
	 Gcy0xmKwxhp8O9yZsLHx1kwCIPO8s3D1UFOBHeGBsOW+MrRGY9U5qxPaFOMsJLgl/Z
	 0dtj7z1fsrSL1Icf/fn9ZRMUGZBdpqO1GugwjcHuUiyane1axUwNBAF14vJKXG9Fjk
	 12R9Tz+HIwWqA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 Oct 2025 13:29:40 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mfd: da9055: Simplify the error handling path in da9055_device_init()
Date: Sat, 25 Oct 2025 13:27:16 +0200
Message-ID: <871f52e7ab5d12853bc39f36ac78b5a8e484d863.1761391599.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If mfd_add_devices() fails, there is no need to call mfd_remove_devices().
The needed clean-up is already done in the error handling path of
mfd_add_devices().

So, remove the unneeded (and harmless) call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch applies on top of be8512ed1582 ("mfd: da9055: Fix missing
regmap_del_irq_chip() in error path")
---
 drivers/mfd/da9055-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/da9055-core.c b/drivers/mfd/da9055-core.c
index 8c989b74f924..158590ad37d4 100644
--- a/drivers/mfd/da9055-core.c
+++ b/drivers/mfd/da9055-core.c
@@ -387,7 +387,6 @@ int da9055_device_init(struct da9055 *da9055)
 	return 0;
 
 err:
-	mfd_remove_devices(da9055->dev);
 	regmap_del_irq_chip(da9055->chip_irq, da9055->irq_data);
 	return ret;
 }
-- 
2.51.0

