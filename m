Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038B33997
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731705890; cv=none; b=JJH9EE0zU8uqnR3u5iPZsbZkrPz26+iDHtHyH7J5yJFQWqAeEXZRF+4fjXWJD9Bl3GKmCshxpyTSwfxPdvXyIKM3Cw0gEBJIfpQfhhlBvy0v7uRHoAE8g1KDWDXNkV1oXWXhYAMOpUHtyPeZ2aWkftcNukovx7+dRUqlTWJkpjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731705890; c=relaxed/simple;
	bh=Bgs/12PtZuTnrvMeWK5ZWfYat10JaNSvHluJaDBzt2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d35UyThVCgr+OyFsZPJ6r6s0ZKLTsV1blmTkzTqcS4G8k8eYet/zAaDGY5S/VEIeb72LrG1/3K55D9pARDJJP522EHdZfaZXMb0k2YGzZYvl5yOZ0IX+jjt00rv3Rra4YrWj/LjxfsC9V5WJi0wKac+bTg0EyAqkUtVZ9VGb9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sXW1ZkB2; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sXW1ZkB2"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id C3mwtFV0AeGuUC3mxtsoiA; Fri, 15 Nov 2024 22:23:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731705815;
	bh=Hs/wZDfKXx3ShBLaY4pSoUha6GqQ4qK+FdcROdbUR3o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sXW1ZkB2a1904wsfA+dXdNNvVC5/+Q3NlyOKX6RxWyt7VipMhR20sWwrck/u81oBX
	 8EPnl28rnZPHvmUOPT0fRY9+VTeMLvj4TXP1hEn9YyvHXnKSoHjTUveXNiKZcfWU1u
	 OLxIHAaNhqjmyKjtOEbwa4j849DWDuwqlEduxJIkfpSAaPZGxtW2mWQ+wqipEmgz4B
	 gzuzJvpndLaVjVvYBc1tw7H+nehgfjhqriwLVnAU90GgU+N3lPeJWJBpRnhWRfeWQ2
	 IJwwVDaSVRfNMWjE1OeFN5AfVaCx6PKeeXDTV1tq5on/V5soxFuy2ILeVHSePdBgYY
	 zVat3qTHOayYg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Nov 2024 22:23:35 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] parport: parport_serial: Constify some structures
Date: Fri, 15 Nov 2024 22:23:21 +0100
Message-ID: <d658d87078312fd2860a91a167eaa7ca5365ea23.1731705791.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct parport_pc_pci, 'struct pci_device_id' and 'struct pciserial_board'
are not modified in this driver.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   8125	   5232	      0	  13357	   342d	drivers/parport/parport_serial.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12272	   1072	      0	  13344	   3420	drivers/parport/parport_serial.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/parport/parport_serial.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/parport/parport_serial.c b/drivers/parport/parport_serial.c
index 3644997a8342..9ffbd69a32d9 100644
--- a/drivers/parport/parport_serial.c
+++ b/drivers/parport/parport_serial.c
@@ -118,7 +118,7 @@ static int netmos_parallel_init(struct pci_dev *dev, struct parport_pc_pci *par,
 	return 0;
 }
 
-static struct parport_pc_pci cards[] = {
+static const struct parport_pc_pci cards[] = {
 	/* titan_110l */		{ 1, { { 3, -1 }, } },
 	/* titan_210l */		{ 1, { { 3, -1 }, } },
 	/* netmos_9xx5_combo */		{ 1, { { 2, -1 }, }, netmos_parallel_init },
@@ -168,7 +168,7 @@ static struct parport_pc_pci cards[] = {
 	/* brainboxes_px263 */	{ 1, { { 3, -1 }, } },
 };
 
-static struct pci_device_id parport_serial_pci_tbl[] = {
+static const struct pci_device_id parport_serial_pci_tbl[] = {
 	/* PCI cards */
 	{ PCI_VENDOR_ID_TITAN, PCI_DEVICE_ID_TITAN_110L,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, titan_110l },
@@ -328,7 +328,7 @@ MODULE_DEVICE_TABLE(pci,parport_serial_pci_tbl);
  * Cards not tested are marked n/t
  * If you have one of these cards and it works for you, please tell me..
  */
-static struct pciserial_board pci_parport_serial_boards[] = {
+static const struct pciserial_board pci_parport_serial_boards[] = {
 	[titan_110l] = {
 		.flags		= FL_BASE1 | FL_BASE_BARS,
 		.num_ports	= 1,
@@ -619,7 +619,7 @@ struct parport_serial_private {
 static int serial_register(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	struct parport_serial_private *priv = pci_get_drvdata (dev);
-	struct pciserial_board *board;
+	const struct pciserial_board *board;
 	struct serial_private *serial;
 
 	board = &pci_parport_serial_boards[id->driver_data];
-- 
2.47.0

