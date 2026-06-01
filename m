Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA93F44CF
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345249; cv=none; b=prBKnM4Sj3EcloM6Y2Bb7Br/MDmrr9vpP8Zi2tlzUFaa6lPtXBcgJnhhuA5L7wJmr75IRkZRdAGDjsy1OIX3Jz0tFKmGSTzpUTL2u6J79UNAS86b68erwRrUDtxOPQmv8RDi0tPw/3TQM2PMbAMdgMOAsXaPapHIeTs1CySuYqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345249; c=relaxed/simple;
	bh=1gBQDa8/YxQQsJ8JnTJlyMdna+QxpU+A8Pyf9TMkwFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXXRguMw5+6md1bbqLkW8VLVq3iPKg1+Xqu9C/zNRxeWaksrH+hc5dM5r8vZcEO0LcbeWE/UwsILBryn740+gHV42q4o1gk1yxhQeGx9cUd1g+eLTnwiD66+Xik5jwZqbFc5/Coq6S7k1O5+GrXzh1CuQL4YyiKp5TwbgrQ9fOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ro9l1H9V; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ro9l1H9V"
Received: from fedora.home ([10.64.95.106])
	by smtp.orange.fr with ESMTP
	id U96kwvRAYPl3nU96kwwAQU; Mon, 01 Jun 2026 22:19:34 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU96kwPnw3; Mon, 01 Jun 2026 22:19:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345174;
	bh=xcBOGte96v6r7Ztz2bjbZESrvCFLxIHxsvHhIN1kMZw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ro9l1H9Vu9dvaJ5KnLprAu+aCGHcVCpDZvAPQPnnV+CbbrOvgLlDqnzak6XH0kIXt
	 o8EyLf/v+N647CV0w2ayz/vlsa4wcMKDUtjg2eopaD7CTvbEjpCVPbsh1i19mBJOW8
	 Q8a3plpuM8cAuzkwXXpK9coxOhK2HGUwXAXrlqZeSwI5tpPI4fsEHWR4XOTCPV/Ybm
	 LYdx4FBlBXksvbGCcUarcXGfoG9PlYDOQm2YRpQIo2MZ5jxOSK9B1rjhAkLmiJqrOq
	 nMUu6qowDbE25rkYXphRi9k9TOeTsR6BZqt4kEneuOeKftnr7Fc4QclIlKpLRnuwKP
	 Vaq+wfDUMBVrw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:34 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 1/7] irqchip: Constify "struct irq_chip *" parameter in chained_irq_xxx() functions
Date: Mon,  1 Jun 2026 22:19:01 +0200
Message-ID: <7960039f11796ae113a6322f62af629a56cdeeca.1780343698.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343698.git.christophe.jaillet@wanadoo.fr>
References: <cover.1780343698.git.christophe.jaillet@wanadoo.fr>
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

Changes in v2:
   - None

v1: https://lore.kernel.org/all/dcc2288daad066ac7f5dcb1fd6c4d36192cf5f7a.1731835733.git.christophe.jaillet@wanadoo.fr/
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
2.54.0

