Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7E35E1A9
	for <kernel-janitors@vger.kernel.org>; Fri, 15 May 2026 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778885851; cv=none; b=TeyD6j2P3GhY5A3ub7+L5xpWRklEmRzttQgKom57CUGab8PzDE6r9pRSDx4/H05nYbhlU4kcJ25SY4ZObWC+bBM9iMlUR56uAlbhDZu2PcrdsBYBGlVDODWFoz3tOkq80sh0E7EZamBNSN9nFs48xX+f2SoNzgCzX5+pXAjNkZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778885851; c=relaxed/simple;
	bh=qnnHmeuD4B3ib6QErbfOiGA3ssD2oWWRu2a05LVDhNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2s7HjGVQ1na+MwyX/3RfpCKXvpltndByBSW9e0/dTq3ne7ZJaq8MWUo2/xxG3boLSc6jcZlOhEFPXg3uhUmdxZWphvyI1UqNTWlzhuyrE2fZIQ/ly7NDioppf5ZoPyEGsbMtywNKjO4fCDYDt7RpgRn+KF0fCih8ELm3TY83VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vassilevski.com; spf=pass smtp.mailfrom=vassilevski.com; dkim=pass (1024-bit key) header.d=vassilevski.com header.i=@vassilevski.com header.b=OR/0cKyS; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vassilevski.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vassilevski.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vassilevski.com header.i=@vassilevski.com header.b="OR/0cKyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vassilevski.com;
	s=protonmail; t=1778885842; x=1779145042;
	bh=74bsjubzgflcd9M7LjMJofPlrdTcXGeyKv5HA4b8SOs=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OR/0cKySMrmMkZXYWAVWLylTjxT1+D22HHKf5w0yq3hhkiZ8rO21O7zE/UsOYV6uV
	 71uDlCvoBwT4zPf5cKP47mKJBCIWsQFA9+9GaDThqGv3EBBxEjNHgH4GsGxGinNHCP
	 HqnQFU9H2AjKSpH3tFTtgK4ZkSLA8s2huJu7bjyA=
X-Pm-Submission-Id: 4gHMz06syrz2Schs
From: Alexander Vassilevski <oss@vassilevski.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] net: ethernet: ti: am65-cpsw-nuss: remove dead vid check in slave_add_vid()
Date: Fri, 15 May 2026 15:57:14 -0700
Message-ID: <20260515225715.3641804-1-oss@vassilevski.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

am65_cpsw_nuss_ndo_slave_add_vid() returns early at the top with:

    if (!netif_running(ndev) || !vid)
        return 0;

so vid is guaranteed to be non-zero in the rest of the function. The
subsequent

    if (!vid)
        unreg_mcast = port_mask;

is therefore unreachable. unreg_mcast stays at its initialized value of
zero and is passed as the unreg_mcast argument to
cpsw_ale_vlan_add_modify().

Drop the dead branch. No functional change.

Found by Smatch.

Fixes: 7bcffde02152 ("net: ethernet: ti: am65-cpsw-nuss: restore vlan configuration while down/up")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/kernel-janitors/aS_lhMwppbDHoEcX@stanley.mountain/
Signed-off-by: Alexander Vassilevski <oss@vassilevski.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 7ac75fc8cd..77f59996a0 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -316,8 +316,6 @@ static int am65_cpsw_nuss_ndo_slave_add_vid(struct net_device *ndev,
 		return ret;
 
 	port_mask = BIT(port->port_id) | ALE_PORT_HOST;
-	if (!vid)
-		unreg_mcast = port_mask;
 	dev_info(common->dev, "Adding vlan %d to vlan filter\n", vid);
 	ret = cpsw_ale_vlan_add_modify(common->ale, vid, port_mask,
 				       unreg_mcast, port_mask, 0);
-- 
2.43.0

