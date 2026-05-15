Received: from smtp.smtpout.orange.fr (smtp-67.smtpout.orange.fr [80.12.242.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936683BB131
	for <kernel-janitors@vger.kernel.org>; Fri, 15 May 2026 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856719; cv=none; b=emBLKH7zVcMiZ//KmfPBDRM5IjyY8oosqIwgMP1Umzvfl5CoMjaUswBPxIuh+QdR4fHJAGK/mak9aFbyo/SUaQkldBRuRrcSUz9aPuNYleeBJ/fxFqxXY8K0AtTUd7arFiJ/HHDh0MXXPAONYGsE3UvmqBAE2BtiaJ/6XFppMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856719; c=relaxed/simple;
	bh=dSiK2d5HHGG4axsv3+vMzoiypN5x6RYhvbf7IPwT4eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBSffBIoGwsoL3jpULPb2COiWcwqby8zDx2a38mIAgoHpGzH4l3CCFKc3D9KzmvRQy5b2d6iPeYF4d86OiIICCGACJK4akY/z4ZdDmtMoGaGGlhpKB8uhqXg61Dj/u9SGBfDwEPd5TBP6TDUOfC/eu1NNgdQnPcz9gcu4RslEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=BmodFq+n; arc=none smtp.client-ip=80.12.242.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="BmodFq+n"
Received: from fedora.home ([10.65.86.62])
	by smtp.orange.fr with ESMTP
	id NtsDw1tER778NNtsDwfXiN; Fri, 15 May 2026 16:50:45 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id Nts1wguySDTmsNtsDwk26Z; Fri, 15 May 2026 16:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1778856645;
	bh=4OQ0NNNNJoZiPc0P+s+xkhSrdNg3Aq027Eag1qLTTHY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BmodFq+nHLpH+b+RGwAPftM3d69ZrVc7RKX+H4ReDSnEMWkBs+APfJ9kI/c4evFpA
	 bLfRBsAms3m5LwNIkaKtL4d+GBZcx6OiPnVJ7VdorS4amFN6fV+qnFosZ1dBtT7w2a
	 YTZJoOSybkvHmX69zTzm4ow4GiGHIYwSArjogimWpfTSNaS1Arw/R6pXBw8UaLIa5W
	 T+BPnBAbNcpkagPVJfAcd9zM1vB0VumSCLHT/KN0R/CQxlJCr/9/EN4TtIw0jNlZlg
	 ppjiH7V9dCD7WOlicUtlYNdnKTGGYFQ1kWDd6TaAr4NsuRuMUthiawjlWP2aP09ydJ
	 OVnruDa/v9/8A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 May 2026 16:50:45 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/3 net-next] net: mdio: mscc-miim: Use devm_clk_get_optional_enabled()
Date: Fri, 15 May 2026 16:50:25 +0200
Message-ID: <542f88aee5de2ac24fca58001eab24ac817abee9.1778856199.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778856199.git.christophe.jaillet@wanadoo.fr>
References: <cover.1778856199.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_optional_enabled() instead of clk_prepare_enable() and
clk_disable_unprepare().

This saves some lines of code and simplifies error handling in the probe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

In the remove sequence, clk_disable_unprepare() and mdiobus_unregister()
are not called with the same order anymore. I don't think that it matters.
---
 drivers/net/mdio/mdio-mscc-miim.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/net/mdio/mdio-mscc-miim.c b/drivers/net/mdio/mdio-mscc-miim.c
index 03878bd9091d..4d8f60d458b8 100644
--- a/drivers/net/mdio/mdio-mscc-miim.c
+++ b/drivers/net/mdio/mdio-mscc-miim.c
@@ -307,7 +307,7 @@ static int mscc_miim_probe(struct platform_device *pdev)
 	if (!miim->info)
 		return -EINVAL;
 
-	miim->clk = devm_clk_get_optional(dev, NULL);
+	miim->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(miim->clk))
 		return PTR_ERR(miim->clk);
 
@@ -318,35 +318,23 @@ static int mscc_miim_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = clk_prepare_enable(miim->clk);
-	if (ret)
-		return ret;
-
 	ret = mscc_miim_clk_set(bus);
 	if (ret)
-		goto out_disable_clk;
+		return ret;
 
 	ret = of_mdiobus_register(bus, np);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Cannot register MDIO bus\n");
-		goto out_disable_clk;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot register MDIO bus\n");
 
 	platform_set_drvdata(pdev, bus);
 
 	return 0;
-
-out_disable_clk:
-	clk_disable_unprepare(miim->clk);
-	return ret;
 }
 
 static void mscc_miim_remove(struct platform_device *pdev)
 {
 	struct mii_bus *bus = platform_get_drvdata(pdev);
-	struct mscc_miim_dev *miim = bus->priv;
 
-	clk_disable_unprepare(miim->clk);
 	mdiobus_unregister(bus);
 }
 
-- 
2.54.0

