Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C743BB10D
	for <kernel-janitors@vger.kernel.org>; Fri, 15 May 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856719; cv=none; b=LfYhuNCqmqQp5FHuRF4+jdk76Bl3kKIrg8KrrGg0VRKaIIsJB4DssoI7Dt4rAOBQNgzRdiVDk6HfJKa3WopxBp9ZxcPLaYPn8jd0DDi+OAzaoviCdFhMy+SKDt+l+B9YYsRgBaScYHo4xy7ACxzOY+0cNXKz7w3ZY53odR7Y8dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856719; c=relaxed/simple;
	bh=s9VLSmAHWj0fdoNIuqJrjoZ5YXTT4s9Ibk+lEqfY9VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUBeYneB6qGQddQfWGrkVRqHVd+rm6I3wolJvH6kn/MbyFaPCTF98kohBgzb99szMq1nvhsSkgr5dRS+KpfQFpfZ0N0Kz/4CmbSElnpJ3tvXj55SPFHpgT8GCYPAaxEio8aJDcmj8QL+GIds+yE/mOE1GFQJ059aJwBAeqRBunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PYaiFOsk; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PYaiFOsk"
Received: from fedora.home ([10.65.86.62])
	by smtp.orange.fr with ESMTP
	id NtsCwGWdpu0AqNtsCw1xW7; Fri, 15 May 2026 16:50:44 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id Nts1wguySDTmsNts1wk1Vt; Fri, 15 May 2026 16:50:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1778856636;
	bh=G03VaXEuBKvCaC9Qfcc7bTAZrEJFyxVeTaTBztvmiCE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PYaiFOsk8X7wKV8yX2Rmp4t8PqDw05nfJLj8KUopevx1Ul+Y+Wu9LTuImdMQNuYNB
	 JzDVgmd8lu/WLJfoZ/gUv0rJSEC8D4GEp35So5ahHu2EaEJpauAMZ39ZkBjvI3T7vD
	 9QOS1gwvQgcBfsO3tuOCCW4iJRdDVqfjL0HAAHXroROJq5n7w+jRQXlnOSFE1WW8mH
	 iFA7ruyOOIYGUFNxyyshRoHNyGsivvyuQ7HZgKpRVAHWZfEFspIegPhuUXY05ZVrrY
	 zwFM4i/6WUYS0JzuOD3a7kgjs9InZiZHR07gy/0b5ODWOcV1xXRIbymK3UAav5MSO8
	 EAG+SEbe6pRqA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 May 2026 16:50:36 +0200
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
Subject: [PATCH 0/3] net: phy: micrel: Code clean-up
Date: Fri, 15 May 2026 16:50:23 +0200
Message-ID: <cover.1778856199.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is only some clean-up related to
drivers/net/mdio/mdio-mscc-miim.c

It depends on a patch called "[PATCH net-next] net: phy: micrel: use dev_err_probe()"
that has been sent recently.

Note that in the 2nd patch, the order of the calls in the remove
function is changed. I don't think that it matters, but I'm always
relunctent to change such things.

The patches are compile tested only.

Christophe JAILLET (3):
  net: mdio: mscc-miim: Remove some redundant code
  net: mdio: mscc-miim: Use devm_clk_get_optional_enabled()
  net: mdio: mscc-miim: Use devm_of_mdiobus_register()

 drivers/net/mdio/mdio-mscc-miim.c | 34 +++++--------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

-- 
2.54.0

