Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FF18C345
	for <kernel-janitors@vger.kernel.org>; Sun,  9 Mar 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508609; cv=none; b=EKR0LE7fALdiYqvzgpVWdWD1OBqxRTOyvKJzPguZZrjmD+rGEGu6NjEPow7Ra54nUe7H9blF7awdbmvIFSB6UPzRPhivbyU+ozhSX0lzIpNeF9NBTqjeNcNHNBA7EnYJB93OsgCxZf4Rx5QXVPi6y6+wu1KFvAckkw+tomOePxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508609; c=relaxed/simple;
	bh=AdePxRkljki58MxaxtSa3w6thvP25nj3BGuStrfBLcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yu/CXlkc4w31s9erYBhjv1RL9faJ1jK+e1sMpAkLXP1q1y3OOYt1aNxHD5gTWc2fg/N4Tc1rjeBFL9t1/Z4dyfQYfda0kbzNpnCy56GFzHEu51MsYv0bOLlADk/d0CYYNppy7YVPy8dz/QmoxZOGBx8ESJ9hKKewBCfalDhaFlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=pkPlGYgs; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pkPlGYgs"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id rBvGte4vv0ogTrBvJtWOU3; Sun, 09 Mar 2025 09:22:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741508535;
	bh=/6lFKfqaWFI3BulJkt+DFvsuCO/g2wx8Ki+YPYJ96Tc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pkPlGYgsf/2sNYgil0P1NmpofZmKMFU/QAMi2gtj+JxjP1k6U92qHILz2AKb/08iW
	 xKAyWuVq3kFEoIaE5Df7TEV5BqSRbKKfv9+2h5Wl3v8U2hRTvQ88LA5GDqmipHHCYk
	 j63t45j59mgTWm2FGKK49R6HBD5l/VzsIfjYlG5E2yv985befwlplGJujtu/vw64kY
	 AXou8+3g3gKLBdvDH8WAe0cXaHtyLz8IMVheQH/ZTodGHS1X5NWQl4N/QGo8k4SuC/
	 ROKxPsQOYft7ITMPZ6UxpYs5zKy6Dq0TYYGT+7roFmOi0zan89mOO7gEtQBhmhabfK
	 zd9LVDIcAWhdg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Mar 2025 09:22:15 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pierre Ossman <pierre@ossman.eu>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mmc: cb710: Fix an error handling path in cb710_probe()
Date: Sun,  9 Mar 2025 09:22:05 +0100
Message-ID: <25de6764b32724eac554d48d17d23c50bb862693.1741508504.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful ida_alloc() call, it should be undone
by a corresponding ida_free(), as already done in the remove function.

Add the missing call in the error handling path of cb710_probe().

Fixes: 5f5bac8272be ("mmc: Driver for CB710/720 memory card reader (MMC part)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/cb710/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/cb710/core.c b/drivers/misc/cb710/core.c
index 55b7ee0e8f93..394fc2488029 100644
--- a/drivers/misc/cb710/core.c
+++ b/drivers/misc/cb710/core.c
@@ -250,7 +250,7 @@ static int cb710_probe(struct pci_dev *pdev,
 		err = cb710_register_slot(chip,
 			CB710_SLOT_MMC, 0x00, "cb710-mmc");
 		if (err)
-			return err;
+			goto free_platform_id;
 	}
 
 	if (val & CB710_SLOT_MS) {	/* MemoryStick slot */
@@ -276,6 +276,10 @@ static int cb710_probe(struct pci_dev *pdev,
 #ifdef CONFIG_CB710_DEBUG_ASSUMPTIONS
 	BUG_ON(atomic_read(&chip->slot_refs_count) != 0);
 #endif
+
+free_platform_id:
+	ida_free(&cb710_ida, chip->platform_id);
+
 	return err;
 }
 
-- 
2.48.1

