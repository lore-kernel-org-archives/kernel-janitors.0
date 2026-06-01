Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB2D3EAC8D
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345730; cv=none; b=UfVQOKLMoMSpz1EPr9rtH/8XKz/QwH1j+yd3Tq+W+DPerXiDrl06LVSUaRcyT5JMzwy49IMwidcT1LvspAlixO/sa/GjQDrlMfdYPn7tvZ5uZBKrdV3qEaQLNmqMNhye0YRQXvfTuZ+58iTxq48P0vjFeXoDW3bF1UEvqg+AMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345730; c=relaxed/simple;
	bh=gKPnNB3JD2aPiYaHv4nie4tYSgwzP1lFAFwEIvJrmFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptJneDYnfn214ePBVBQRKX4Y5njF6k5IKGUtH1k2bpkpww3IuQTIRHYXBKWqhUPIAxWwWbltJ7kBoUXejtsZ6Qn4FH31b75jRRD1VqPUQdY+CH1jCY+JnLm3GP5w0Wj4XKVk0fjMQlin9dyChwBvX918sRVyJxeUc7xlawz1o80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=QL5HykZ4; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="QL5HykZ4"
Received: from fedora.home ([10.64.95.106])
	by smtp.orange.fr with ESMTP
	id U96owPWhS3f8AU96owluyW; Mon, 01 Jun 2026 22:19:38 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU96nwPo2e; Mon, 01 Jun 2026 22:19:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345177;
	bh=BFjG4ezBEHZTOxg2018d1I+h7/1DOGqjn78CYnXyNLg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QL5HykZ4spHKOL0g0q2EwvK8PjOHkIyBMTpMEvLojUO/r+n3dZXJwxqZYYHKf6zeh
	 AgFph/UCPpS4UT9ZDMfUW85Zcc4zddXTCnGL/+v12/4kF7TONKAMnlMGU2E5Q8mN4g
	 3Kou7cSr+bV/5lz07f//z3eiXIfN4zW7vv9vrEhfOy/TOwe0ZMMTmjKJcGcjSP0PM6
	 yrt65ea1007aAqeFT6984uUta3S3mOdId2IfVy+QHQRNFtPEz4Vg9HgnS3KVtKtL9U
	 +sAlMrtdXKe2xm25f54XJDu2SCsnMnQAmfk3ljo6oZbk8sGMhNpDxYu+9IEMVmdf7W
	 iVQ9d4PLJBO9g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:37 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/7] irqchip: Constify "struct irq_chip *" parameter in cond_xxx_eoi_irq()
Date: Mon,  1 Jun 2026 22:19:02 +0200
Message-ID: <4bff474cf71dc5f5e2fa4334eef4d501e8a67bf6.1780343698.git.christophe.jaillet@wanadoo.fr>
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

cond_unmask_eoi_irq() and cond_eoi_irq() don't modify their 'chip'
parameter.

So change the prototype of this function to accept const struct irq_chip
pointer.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only

Changes in v2:
   - Update cond_eoi_irq() which is new since v1

v1: https://lore.kernel.org/all/db3ec8b3425552b3921281e88fe6a0b1cd55e20f.1731835733.git.christophe.jaillet@wanadoo.fr/
---
 kernel/irq/chip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index b635e3c5d5b6..04e478a2adaa 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -699,7 +699,8 @@ void handle_level_irq(struct irq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(handle_level_irq);
 
-static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
+static void cond_unmask_eoi_irq(struct irq_desc *desc,
+				const struct irq_chip *chip)
 {
 	if (!(desc->istate & IRQS_ONESHOT)) {
 		chip->irq_eoi(&desc->irq_data);
@@ -720,7 +721,7 @@ static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
 	}
 }
 
-static inline void cond_eoi_irq(struct irq_chip *chip, struct irq_data *data)
+static inline void cond_eoi_irq(const struct irq_chip *chip, struct irq_data *data)
 {
 	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
 		chip->irq_eoi(data);
-- 
2.54.0

