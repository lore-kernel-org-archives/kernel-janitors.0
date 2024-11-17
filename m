Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920184D0E
	for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731837008; cv=none; b=S3Bnr3SSSYkuut34Ljk3+r5ZazSG2X4pDS/CBFpiARjLgWtMQFvwAJyaOseArjvfz9tMMyGhukgnnU7ETcUBgd32bA0U2cRLuMDyrso/cUeZ+VVMaDuEEYVeoJ/YA/IqBTNaTCqf1ptwWt4LamKa+4BCL8sS3ejE8WR6j8w9WSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731837008; c=relaxed/simple;
	bh=X9Y7JAZ3FbOLMBkyjTswSpqphJew9Ldv6/eGGkqKyNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geQoglMQjhREwscDyq3NysNZ8wHEPq5LZk3v/2zAKaQvFZbo5pXEgLWsklFJiCUROAiztH4gXeLFU5TRyHESu5LMEqBrGmxnSNQ6j90aGGisTAzl2vnoBJ1X5rv7mkyxnZeWIpBw0FBOkqaiq7jNq5itjjVJO251WFUIutp+934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=m6GIGMCt; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="m6GIGMCt"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Cbuot94NAgiuVCbuvtxsbD; Sun, 17 Nov 2024 10:50:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731837005;
	bh=8Gtx2UMzfe2JOWGIy9aObdGR+c7t6uLGErdFIPGS7r8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m6GIGMCtCYY+JiumHhCAXbRqz8MmzurkEUIp7Dpf6pY0VGy3jMgeV8ANbwIX4mWqq
	 HOAh1sRC+aGDgS8CtuudMHL467JUSz0GT6o+bZAIzaE7+Aa2ToNVIY28ztC6ZeBlwR
	 djp6FTtziahkwHOkVZga0Rpo//fPe+IvbSNhXDX+PaOfqqdfJ8lA2OGIYqEbZLmbxC
	 NXjvI0O+qktvKgtB2sc+Cu4dSsE7qRMW4fQbVmE6v4DoPpJKoRg9quTA4HeHE5nMQL
	 /JGGJP0ofXQSy1n/DeQK/x2Bl06gnr26bmlRyxb/bJ7Tno1irsS9eZ1PprjRyLmHLh
	 u1fgijcceDcCg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Nov 2024 10:50:05 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/5] irqchip: Constify "struct irq_chip *" parameter in chained_irq_xxx() functions
Date: Sun, 17 Nov 2024 10:49:43 +0100
Message-ID: <dcc2288daad066ac7f5dcb1fd6c4d36192cf5f7a.1731835733.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731835733.git.christophe.jaillet@wanadoo.fr>
References: <cover.1731835733.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

chained_irq_enter() and chained_irq_exit() don't modify their 'chip'
parameter.

So change the prototype of these functions to accept const struct irq_chip
pointer.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 include/linux/irqchip/chained_irq.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/irqchip/chained_irq.h b/include/linux/irqchip/chained_irq.h
index dd8b3c476666..f248d63acfca 100644
--- a/include/linux/irqchip/chained_irq.h
+++ b/include/linux/irqchip/chained_irq.h
@@ -13,7 +13,7 @@
  * Entry/exit functions for chained handlers where the primary IRQ chip
  * may implement either fasteoi or level-trigger flow control.
  */
-static inline void chained_irq_enter(struct irq_chip *chip,
+static inline void chained_irq_enter(const struct irq_chip *chip,
 				     struct irq_desc *desc)
 {
 	/* FastEOI controllers require no action on entry. */
@@ -29,7 +29,7 @@ static inline void chained_irq_enter(struct irq_chip *chip,
 	}
 }
 
-static inline void chained_irq_exit(struct irq_chip *chip,
+static inline void chained_irq_exit(const struct irq_chip *chip,
 				    struct irq_desc *desc)
 {
 	if (chip->irq_eoi)
-- 
2.47.0

