Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0D317F1
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EoVYKNhn"
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40B3F3
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 23:56:47 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id xMCXqf3ZpdFbKxMCYqfBpU; Mon, 30 Oct 2023 07:56:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698649004;
	bh=KkbJNouXf1jB9o5VmPFQMXyslZ7BV0Kwtr1ZfMOhED0=;
	h=From:To:Cc:Subject:Date;
	b=EoVYKNhntLWgaYt3lWeEflSOZ13HEfu/PRa3sOcgLqsK3MV7pxUJifqbTgmfk2O7/
	 vWjc7K1Z2Qbu21SmYAlk9rUHOYm6MlHCVJqFw2G2qJgljuXyc/CRI+92VrdCXZMPrZ
	 AlYLANf8MBiak0D//G9tr+2KOybPtRV2adO1fED9zi91KE9VoSKzeC1xY2I3szqAMw
	 zbdBSRWA2TkEOCnTLeTZxt6bUvI6AGzHTeiErlLWZpoDYhc83ym9e859FZQFnQ6rey
	 hwbvzwcgRfI5Zf2LSKh96lQUMWAsMjF7ZLWt/OZl4BWM/Cd6WfZuzttBDWgfGm6Eek
	 WvVUEnoMFaTiw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Oct 2023 07:56:44 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abdel Alkuor <abdelalkuor@geotab.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH] USB: typec: tps6598x: Fix a memory leak in an error handling path
Date: Mon, 30 Oct 2023 07:56:40 +0100
Message-Id: <23168336f18a9f6cb1a5b47130fc134dc0510d7f.1698648980.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All error handling end to the error handling path, except these ones.
Go to 'release_fw' as well here, otherwise 'fw' is leaking.

Fixes: 7e7a3c815d22 ("USB: typec: tps6598x: Add TPS25750 support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/typec/tipd/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 0e867f531d34..b0184be06c3d 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -968,16 +968,17 @@ static int tps25750_start_patch_burst_mode(struct tps6598x *tps)
 	ret = of_property_match_string(np, "reg-names", "patch-address");
 	if (ret < 0) {
 		dev_err(tps->dev, "failed to get patch-address %d\n", ret);
-		return ret;
+		goto release_fw;
 	}
 
 	ret = of_property_read_u32_index(np, "reg", ret, &addr);
 	if (ret)
-		return ret;
+		goto release_fw;
 
 	if (addr == 0 || (addr >= 0x20 && addr <= 0x23)) {
 		dev_err(tps->dev, "wrong patch address %u\n", addr);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto release_fw;
 	}
 
 	bpms_data.addr = (u8)addr;
-- 
2.34.1

