Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC1F9C0
	for <kernel-janitors@vger.kernel.org>; Sat,  6 Dec 2025 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765005009; cv=none; b=X/BvGU2+3cVZZIF4dICnjucjJPsKuWWb0QLF0ppnfixVqg0EoDbC7ZyOMWl0DHaQa0hJvSp4D82rSnI9BcONudIj7R3322xGKd+/l+kGbcsZe70PJ8Qp0WPpoSavNmk+PxsvFuGR8B5cVeSOCgcCnZjlU3Y8Ii1kh506vcNIMzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765005009; c=relaxed/simple;
	bh=stfioGmUs1ZhVtq8QNOmxk2R4LbbiQ5+8qUVwVZYscs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O27yY6gIpl9BTMiihjsWFwAx+X3dhU2KgOAbISJ8Ugk8UKIjqaqzHw94Xc+ioAl1Fg0v0r8p5em8Vo+Z8bSak5O2h1J0tN1FxuCUbUhAQZvB04MeKbnURLUSiV7HlJvKOriYFM/MS3hsORz7UYI/GR+QMAnau7UDb4ekeIWV0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=kem8hJVv; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kem8hJVv"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id RmPXvzLmS5RZgRmPYv7HRi; Sat, 06 Dec 2025 08:08:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765004936;
	bh=uArb2xwIvBEfMxd5lGqAD8yvq3B86ljlyalO1SXl21Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kem8hJVvFlG0ZMPpau1QVBa8vi2FdPRyAluKksXdUPVWI8YLM3T/GnykKo4DcTain
	 DEKmMCaMV9j+a8n6VC7eBVxeEYOg9BbSuVNi5ALOS6eCmMzM9WIHpUdezMtNBasP4R
	 fwmKOictTO6DrfmxbutA7lGGGCE5x+ADxNaoxhtDMM/r8OHh6yo2cGzI1GSktiXTl/
	 QjQEt91mBCm5rohYDRYThX+XRAutMKhj36NsuV4g4rSQgNjmTzFwLTt+Lbt5K52sOp
	 77CQtFyDZ3bE22aX8O7o23hOQ+MBjd/e3TQWbdMnxxOgbVVBNm9qAaXHA3cREFwllG
	 KoQx0rAicta+g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Dec 2025 08:08:56 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] gpib: fluke: Add some missing dma_unmap_single()
Date: Sat,  6 Dec 2025 08:08:52 +0100
Message-ID: <6bfe7399c41d8b50a05b050832c6061d3fc04762.1765004907.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some error handling paths, a dma_unmap_single() is missing.
Add it to avoid a leak.

Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.
---
 drivers/gpib/eastwood/fluke_gpib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/eastwood/fluke_gpib.c b/drivers/gpib/eastwood/fluke_gpib.c
index 61eca22dc2b0..1ef5c16a81ba 100644
--- a/drivers/gpib/eastwood/fluke_gpib.c
+++ b/drivers/gpib/eastwood/fluke_gpib.c
@@ -454,8 +454,10 @@ static int fluke_dma_write(struct gpib_board *board, u8 *buffer, size_t length,
 		retval = wait_for_sids_or_sgns(board);
 
 	*bytes_written = readl(e_priv->write_transfer_counter) & write_transfer_counter_mask;
-	if (WARN_ON_ONCE(*bytes_written > length))
-		return -EFAULT;
+	if (WARN_ON_ONCE(*bytes_written > length)) {
+		retval = -EFAULT;
+		goto cleanup;
+	}
 
 cleanup:
 	dma_unmap_single(board->dev, address, length, DMA_TO_DEVICE);
@@ -641,8 +643,10 @@ static int fluke_dma_read(struct gpib_board *board, u8 *buffer,
 	 */
 	usleep_range(10, 15);
 	residue = fluke_get_dma_residue(e_priv->dma_channel, dma_cookie);
-	if (WARN_ON_ONCE(residue > length || residue < 0))
+	if (WARN_ON_ONCE(residue > length || residue < 0)) {
+		dma_unmap_single(board->dev, bus_address, length, DMA_FROM_DEVICE);
 		return -EFAULT;
+	}
 	*bytes_read += length - residue;
 	dmaengine_terminate_all(e_priv->dma_channel);
 	// make sure fluke_dma_callback got called
-- 
2.52.0

