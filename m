Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB62745C
	for <kernel-janitors@vger.kernel.org>; Sat,  6 Dec 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765004627; cv=none; b=M+GYD/X+zoX5tp7geJylFAX8UtVVztT85CeeXP4hod/ezU4W8fB+NafuT4Rl7tT2raO6e15K+A1GsUOk+9p9x/rTE0zAR3acc7zjodJ4q+DAPQHG4/lveK4b0M2zHxFdart6yl10DnjZjAQTOgttu9JDNIsrEgAj7tO1PiJ0ngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765004627; c=relaxed/simple;
	bh=JFFVTnh6qqbp5v5IrwbrECsr3qpCTRniNlpDYSrnEPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1b1QtPa4z4ySlHwnritBS0lgScxJsuGKCbO5eXgweq++f/8hFPfqIjbrvw7zXVFVfPfuVjP79QGNNa2jNBhtTtFz7FP0SH0SKabQYd0oawkMzayg4cTE8OHWAaO38KD4hs5JJAOQa6ois5pjtYmn6Itqdy/Va7CLqe+TA4ZTYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=N9vMMuwA; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="N9vMMuwA"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id RmJLvaMLWm2TeRmJLvIxrF; Sat, 06 Dec 2025 08:02:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765004551;
	bh=VWt8oPiNyRDrx7CIMVv9QyrwVo8bjKRxW/96p8K+3JA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N9vMMuwAApGwKvOFXGu1DTob9oXN/cOlGlZCVNnzsoLO4YBlPpLc8E5G/ikZVDtwU
	 Grxzehw0YuZ3vwFk0bnL+UXaV+71we6eHTKHZt/Qvk+5B/fIdMOl2ZywWC1LOL7mgh
	 7uMydmPCZc5R0IYsHilVcdTSWyHCFo1d2KVZht46/JLwLLJHCXfUdnRKX+6CM4vUSb
	 I1lKor/qhCxm4rC4wu6o4Tf1GHffSSOBDXefEHo7y89ojQ9i0BEE/HTVz8uisxa17Q
	 PkHh+yVxBq5fQ11omRzulY+pPizY1Xofa28wRfPAkH5VbfyluClnRdFXPRBAVBFABp
	 hO8KXC5T3A+Gw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Dec 2025 08:02:31 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] gpib: fluke: Fix an error handling path in fluke_dma_read()
Date: Sat,  6 Dec 2025 08:02:25 +0100
Message-ID: <a7b70a8c5dda16c2ddfab4309b4371b91d0ebc34.1765004481.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is strange to call dma_unmap_single() with its 'dev' argument
explicitly set to NULL.
It is likely to crash.

Fix it by passing 'board->dev' as done in all other cases in
fluke_dma_read().

Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.
---
 drivers/gpib/eastwood/fluke_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/eastwood/fluke_gpib.c b/drivers/gpib/eastwood/fluke_gpib.c
index 3ae848e3f738..61eca22dc2b0 100644
--- a/drivers/gpib/eastwood/fluke_gpib.c
+++ b/drivers/gpib/eastwood/fluke_gpib.c
@@ -586,7 +586,7 @@ static int fluke_dma_read(struct gpib_board *board, u8 *buffer,
 					      DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!tx_desc) {
 		dev_err(board->gpib_dev, "failed to allocate dma transmit descriptor\n");
-		dma_unmap_single(NULL, bus_address, length, DMA_FROM_DEVICE);
+		dma_unmap_single(board->dev, bus_address, length, DMA_FROM_DEVICE);
 		return -EIO;
 	}
 	tx_desc->callback = fluke_dma_callback;
-- 
2.52.0

