Received: from smtp.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9914F3C4B73
	for <kernel-janitors@vger.kernel.org>; Fri, 15 May 2026 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857225; cv=none; b=HVeqSZQpQ3ybrTAOJ+nfAxUk7rekTwSCDDZQfAgZ/t3TA0FJlOUt9FL/QMh3Cjr2/fKWYEpDcuWbSiUx1W1GVCYPNXcPK+F/xXFusH5wrkDl2xgWfyl8IHH5efDOMBbvlEp2f5KutOyOe69Z77R+5Zj9UiI40bjZOAY6dEfZvIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857225; c=relaxed/simple;
	bh=c22ZD/MmN/a4onHgNs0fnMFUToNJkqc4sbq7xQCnCEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3u/e47YKGz9Xw6OUQhkYCEfLI9YpBvFvrIpL3xNVglTRKLG0xpF6J/B5MO2BeA/hsN49tOOsrzZIopwBDhNz5VQOst8jlZAODB9ANASuyuaffnUIg2urTYOgr5KPawiTrhX7dHVtuutsUaykzGfu+fGl/r/PUTpPZQp4tW9A+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=TerWnb0B; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TerWnb0B"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTP
	id NtsFwWJVVKe9nNtsIwCBEk; Fri, 15 May 2026 16:50:50 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id Nts1wguySDTmsNtsAwk1zC; Fri, 15 May 2026 16:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1778856643;
	bh=lcPXlx4BAkS4tA31+H7qeGyoefUdwpUgtRh2zR4stAU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TerWnb0BY6h+hk4+lJf3aTqgXGBL9lQD648pQv8dN23IW196zfdMXA/1q/AxRmF0c
	 DnWInTIXquUd0WkhbNovYZL9Cq3p213xoWmAAP9f0p03eqKGHXcs25jXphcbUK/A/D
	 KBEdzhS4tmurXHwf0hR7vGLpF0YsDjhtrxqJ5J7/wO8xzUzmgXz6sis7VoaxAH5eAN
	 n//dK2sI8TtHQNQyrfk5uY8fR92+9Nx18uoRie7Afm2/DlNpkVfePWzc/lOE9RXcCG
	 jYcz4mj8J9Ans1qWzog/q+HlQPW6PKU19LhVTdoGsnP6yGBQo9HbgzPTODtX8Zhz+W
	 I6+Hq8eL7v5tA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 May 2026 16:50:43 +0200
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
Subject: [PATCH 1/3 net-next] net: mdio: mscc-miim: Remove some redundant code
Date: Fri, 15 May 2026 16:50:24 +0200
Message-ID: <11209c6c6485656cc9a841c495381c540783798a.1778856199.git.christophe.jaillet@wanadoo.fr>
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

*pbus is assign twice with the same value. Remove one of the redundant
assignment.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/mdio/mdio-mscc-miim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/mdio/mdio-mscc-miim.c b/drivers/net/mdio/mdio-mscc-miim.c
index 259944d37fbd..03878bd9091d 100644
--- a/drivers/net/mdio/mdio-mscc-miim.c
+++ b/drivers/net/mdio/mdio-mscc-miim.c
@@ -233,8 +233,6 @@ int mscc_miim_setup(struct device *dev, struct mii_bus **pbus, const char *name,
 
 	miim = bus->priv;
 
-	*pbus = bus;
-
 	miim->regs = mii_regmap;
 	miim->mii_status_offset = status_offset;
 	miim->ignore_read_errors = ignore_read_errors;
-- 
2.54.0

