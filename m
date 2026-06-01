Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B133403EA
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345248; cv=none; b=lELBOLbupIg+QBikhx8cEmFJkoC0+Pv8+dLpGQubY48+RNSYWZQzPTHTf+ekZQylPTuC1gW7/8yZnXl6oTy8YcYpTfD487U2DJKIzlQatf9fn/eINKgcDNiSsPxewG5C3VizoGBX/VwrXiKyd3Jnj6xjI+kX4+dfQwVBr7lTSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345248; c=relaxed/simple;
	bh=qSryLS5iKBxGemo5rmVd1g79XSnCZBXC/72nbIX52SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+iSTOf/QVSjSYwsOnR/shbfU0udhOBmtiEZmAWKUT/V56ehxRh3BakquB3X0hs06s4ip2A5ZNKNnSSwPXutGI+iK87mfFcgrLc7a+gcXOGwH8FtE20BwlCCAhKS+bYAOi4YenNxMM4vfqOlVPJrdAEvcCjOOSAao8H6YdBJXOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=g6YracQV; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="g6YracQV"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTP
	id U96kwCRz1lEadU96vwwNhI; Mon, 01 Jun 2026 22:19:45 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU96vwPoIP; Mon, 01 Jun 2026 22:19:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345185;
	bh=2UVCh1HAmRi2yf6q7zLNRswFYhuqwbE5UhhvwmEkzXI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g6YracQVP3cG20u0MeNOaxM3aD3K6Swq57hA031zdn0Zn6ZF7oM4PKbwnn2VaRR03
	 uAEhndivMDyjltOiBV6UjsAw/fGBmgijVMHUbEXL6Jh46mlBgFtSfKKpsmSPfjr3xb
	 j0hTfduHVxobbF6RVJnmJA779a4/qknoqHwPHGaf11282z6C/UHAXC9iAt5CmrMCPS
	 CP4STTmrjo0jiv6a5GbkCU+dyXq6wLnpiw2A3wjj2PF/5RhJov8yN5bcLD6P0Yyqog
	 QIYTkvLmWYO4X4K0kMGEoqsGDUt+tlHJkh1xY6CidvnjnM1tEYFldmH/cgMxiZMBa+
	 JPmlRWnoPfF8g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:45 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 4/7] irqchip: Constify some struct irq_chip *
Date: Mon,  1 Jun 2026 22:19:04 +0200
Message-ID: <994d2107370834e1fb0af12be579b866985700de.1780343698.git.christophe.jaillet@wanadoo.fr>
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

When the 'chip' member of struct irq_data will be turned into a const
struct irq_chip, the const qualifier will be needed for local variables
that keep a reference to this field.

irq_data_get_irq_chip() will also return a const struct irq_chip * and some
const qualifier will also be needed in some places.

So, start to add some of these const qualifiers at the places that are
not spotted by the coccinelle script that does most of the work.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only

Changes in v2
   - Only places not spotted by the cocci script are manually updated

v1: https://lore.kernel.org/all/99871d898c2ff0023895d15169ca4c78c90d225a.1731835733.git.christophe.jaillet@wanadoo.fr/
---
 kernel/irq/manage.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 2e8072437826..1aa5e465bec8 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -653,7 +653,7 @@ int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info)
 	scoped_irqdesc_get_and_lock(irq, 0) {
 		struct irq_desc *desc = scoped_irqdesc;
 		struct irq_data *data;
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 
 		data = irq_desc_get_irq_data(desc);
 		do {
@@ -1351,7 +1351,7 @@ static int irq_setup_forced_threading(struct irqaction *new)
 static int irq_request_resources(struct irq_desc *desc)
 {
 	struct irq_data *d = &desc->irq_data;
-	struct irq_chip *c = d->chip;
+	const struct irq_chip *c = d->chip;
 
 	return c->irq_request_resources ? c->irq_request_resources(d) : 0;
 }
@@ -1359,7 +1359,7 @@ static int irq_request_resources(struct irq_desc *desc)
 static void irq_release_resources(struct irq_desc *desc)
 {
 	struct irq_data *d = &desc->irq_data;
-	struct irq_chip *c = d->chip;
+	const struct irq_chip *c = d->chip;
 
 	if (c->irq_release_resources)
 		c->irq_release_resources(d);
@@ -1384,7 +1384,7 @@ static bool irq_supports_nmi(struct irq_desc *desc)
 static int irq_nmi_setup(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
-	struct irq_chip *c = d->chip;
+	const struct irq_chip *c = d->chip;
 
 	return c->irq_nmi_setup ? c->irq_nmi_setup(d) : -EINVAL;
 }
@@ -1392,7 +1392,7 @@ static int irq_nmi_setup(struct irq_desc *desc)
 static void irq_nmi_teardown(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
-	struct irq_chip *c = d->chip;
+	const struct irq_chip *c = d->chip;
 
 	if (c->irq_nmi_teardown)
 		c->irq_nmi_teardown(d);
@@ -2743,7 +2743,7 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool v
 {
 	scoped_irqdesc_get_and_buslock(irq, 0) {
 		struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 
 		do {
 			chip = irq_data_get_irq_chip(data);
-- 
2.54.0

