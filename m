Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B927C318EF4
	for <kernel-janitors@vger.kernel.org>; Fri, 15 May 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856719; cv=none; b=CSBL3/jZ4eKFKDL0Ujf1wsmc+ZjK8NMb6zEizsDqRmuWYj0ldxyEPEJPpF7IQI4K02FJRebvuxuGuDzXZnxskL/XobxdMkbWkKtOHMQtW7z9mg87G2OkAk5OjKyFTEwLPoegZsXF9nejvKfAZz+c/7RI7r1hefMpg9CESUySvGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856719; c=relaxed/simple;
	bh=g3ptDJxJxQCUv+cK1mS6Te2bzjyh2+ToCFQDd0hFbUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+rxKzsz+h8rZ8e79IdZqyK8eKVDUbupNr2hIP9UGvQP+juMLuOXNaTSmvyCGSKVi696z6kqABcGqi9UVyDw+PsFhQvHDQK9PUHG+/7SfzfX6h8Q7iADVrqP7pUy4HW29BeKMDHjslVdVi1cM4XvKcyVDc93vKZY94BWOm2OkDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UKKih3mK; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UKKih3mK"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTP
	id NtsCwGWdpu0AqNtsFw1xWB; Fri, 15 May 2026 16:50:47 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id Nts1wguySDTmsNtsFwk2Cc; Fri, 15 May 2026 16:50:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1778856647;
	bh=FmW+Of738giidRlcAYcxTdkOQ9EHS9blbA9sumeTjtk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UKKih3mKCkNqBb0MLmPJQYd9i9Zgyk34y2Do4mHTZQCKpf/nIK56C9leZtAXc9QJi
	 NIX1azAmDH/8W0zds0ujNnjWD67D1EY46ofCnl4JEITVtAfdcZpBSu18u6qLtvi6Vl
	 3VsC3L7+OwxrdMRJFibiM34CJP7IomoQz+Uw1sapUb7T8cpVufESXB6BElC8z4Kcne
	 ejKpesqBFenpdvx+PeOoCZPOtn5dyw/Cu8kkYyOEqR6Ty7XJHTXE2agDi41sscobxF
	 +KVH310Wg5PW473ZgecCxR920OM0g/tYSq1ydDNOnexjQdI38rzysBOujJtulk83l7
	 pDVFNU6SEzl3A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 May 2026 16:50:47 +0200
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
Subject: [PATCH 3/3 net-next] net: mdio: mscc-miim: Use devm_of_mdiobus_register()
Date: Fri, 15 May 2026 16:50:26 +0200
Message-ID: <139ebd0e3698de5e785bb0c70a4d4da43925a7ae.1778856199.git.christophe.jaillet@wanadoo.fr>
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

Use devm_of_mdiobus_register() instead of hand writing it.
This saves some lines of code.

The remove function can be removed completely and the
platform_set_drvdata() call at the end of the probe is now also useless and
can be removed as-well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/net/mdio/mdio-mscc-miim.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/mdio/mdio-mscc-miim.c b/drivers/net/mdio/mdio-mscc-miim.c
index 4d8f60d458b8..7bdcf3e9baa0 100644
--- a/drivers/net/mdio/mdio-mscc-miim.c
+++ b/drivers/net/mdio/mdio-mscc-miim.c
@@ -322,22 +322,13 @@ static int mscc_miim_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_mdiobus_register(bus, np);
+	ret = devm_of_mdiobus_register(dev, bus, np);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Cannot register MDIO bus\n");
 
-	platform_set_drvdata(pdev, bus);
-
 	return 0;
 }
 
-static void mscc_miim_remove(struct platform_device *pdev)
-{
-	struct mii_bus *bus = platform_get_drvdata(pdev);
-
-	mdiobus_unregister(bus);
-}
-
 static const struct mscc_miim_info mscc_ocelot_miim_info = {
 	.phy_reset_offset = MSCC_PHY_REG_PHY_CFG,
 	.phy_reset_bits = PHY_CFG_PHY_ENA | PHY_CFG_PHY_COMMON_RESET |
@@ -363,7 +354,6 @@ MODULE_DEVICE_TABLE(of, mscc_miim_match);
 
 static struct platform_driver mscc_miim_driver = {
 	.probe = mscc_miim_probe,
-	.remove = mscc_miim_remove,
 	.driver = {
 		.name = "mscc-miim",
 		.of_match_table = mscc_miim_match,
-- 
2.54.0

