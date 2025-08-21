Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6F21B9CE
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771085; cv=none; b=pzF8oucf10ZqhfdS25bCltzu9lZ+YEqPVleBtQhBbLLYLMaEfC8Cg6IPO75Wl50BoXN536q0a4minHIueyIkyyJnNP/yZNqoOTZHZMlAYuD17X5DUpgXd4AHa9ZumNuRX0581B6/AEcd+9np3HfR+Z5YQGo3GvWcUbuQ18jn5/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771085; c=relaxed/simple;
	bh=RPMLvVMloA2cSqz77yb1IAXMPhYmiV5Dl1oHzNUQjHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Du56xFQGewwPxsX28XGI7JXFNxTg87w+YkSKgOih7uSe8TurxhTUqeKjfx7ZcFNT56UQ85V5h0rI5dC3Seh62IisSCUG183JWjB/v5bEHHjv8nbpYOu9L1FpofINMCW4btJpRs/fm6emWVuFfcvR5ppEqvgFqyQWALeoXT3wDyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bavapI4T; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bavapI4T"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id p27sunoTGn5mgp27tut2o3; Thu, 21 Aug 2025 12:02:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1755770553;
	bh=8/C56F0xk36C5zHc0NI94zAJrdakfJt6Ccq8eLvFcJQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bavapI4TTJrFLSrIHYHyUxYXF9/j/6DzRdFQkaVsJcJflqvoaQ27Z5JvZUBmtDwI2
	 oseVuDTz6d4A3X88IV97bTsSi80w5qarUCyCRIKevPZiTOHsG995RRzyarSciIzcso
	 45Pr9bg2KBEEgbGGhoEJj3XsGaah10vaT4EWVmJ0E4+gi53/w1VgtpKhay/FH/T6HA
	 VWZo5stMxNE4LCNqo7oBATDs1bJ14+d24IFt2Zy2msnN4Ls+8mBFsXHbAmlN+wUsMs
	 sKK5g7G9URF35iQfzZyutEZf2UdeV+aWox5h218Gsf6fh0SeGSmGwUxJ+vErFZdrLp
	 K0qEz5fI3PVsQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 21 Aug 2025 12:02:33 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] w1: matrox: Remove some deadcode in matrox_w1_remove()
Date: Thu, 21 Aug 2025 12:02:21 +0200
Message-ID: <458641ad2d7a7adf30a03e70038304f0e6a81ff4.1755770484.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The .remove function can only be called if the .probe() succeeds. So there
is no need to keep track of a successful probe in 'found'.

Simplify code accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/w1/masters/matrox_w1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index 2852cd2dc67c..146fa7c6e74e 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -47,7 +47,6 @@ struct matrox_device {
 
 	unsigned long phys_addr;
 	void __iomem *virt_addr;
-	unsigned long found;
 
 	struct w1_bus_master *bus_master;
 };
@@ -158,8 +157,6 @@ static int matrox_w1_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 
 	pci_set_drvdata(pdev, dev);
 
-	dev->found = 1;
-
 	dev_info(&pdev->dev, "Matrox G400 GPIO transport layer for 1-wire.\n");
 
 	return 0;
@@ -176,10 +173,9 @@ static void matrox_w1_remove(struct pci_dev *pdev)
 {
 	struct matrox_device *dev = pci_get_drvdata(pdev);
 
-	if (dev->found) {
-		w1_remove_master_device(dev->bus_master);
-		iounmap(dev->virt_addr);
-	}
+	w1_remove_master_device(dev->bus_master);
+	iounmap(dev->virt_addr);
+
 	kfree(dev);
 }
 
-- 
2.50.1

