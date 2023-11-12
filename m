Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360F33F1
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Nov 2023 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ersE2zY+"
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0235D2D7C
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 23:44:21 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 258kraxZkSnL0258kru9kF; Sun, 12 Nov 2023 08:44:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699775060;
	bh=CMJ7mtbkQ6wr2X7EyGA8oyEfbM3Nf5YejXN8k/sc2Rw=;
	h=From:To:Cc:Subject:Date;
	b=ersE2zY+Kx3K9M/oDZf/q2qmZMRggYKp7QWd9xNoylpaz16so9XmICfsr/zPUKeKY
	 S0qRxmbdBHCHwWbc/mxfzJ6H+0XJtRb6jeRafZ6A5Ge7FQfHJZFJdbIs62JNplMPRG
	 ur+wLFZyn4k7hhL+2mS3wzTLnXfl2E0Qg4nfvGaNVE7OmT1dIjcmRuOIlGJFJKvXZL
	 1ZB44QWXHDqZSQcVWnaNTuhCEEvOj452lDib40/Sp4w1QoznsFBfe726kUG44yy2nW
	 jxVmCAXxlRmD6ATPfV9CghnQ6G8GhFAn2zBgn3POK1SY2Tsu0Sy2AaTmTzl0z6+5RP
	 R9+27WG5NGlWg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Nov 2023 08:44:20 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/dell: alienware-wmi: Use kasprintf()
Date: Sun, 12 Nov 2023 08:44:15 +0100
Message-Id: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kasprintf() instead of hand writing it.
This saves the need of an intermediate buffer.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/platform/x86/dell/alienware-wmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index a9477e5432e4..f5ee62ce1753 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -429,7 +429,6 @@ static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
 static int alienware_zone_init(struct platform_device *dev)
 {
 	u8 zone;
-	char buffer[10];
 	char *name;
 
 	if (interface == WMAX) {
@@ -466,8 +465,7 @@ static int alienware_zone_init(struct platform_device *dev)
 		return -ENOMEM;
 
 	for (zone = 0; zone < quirks->num_zones; zone++) {
-		sprintf(buffer, "zone%02hhX", zone);
-		name = kstrdup(buffer, GFP_KERNEL);
+		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
 		if (name == NULL)
 			return 1;
 		sysfs_attr_init(&zone_dev_attrs[zone].attr);
-- 
2.34.1

