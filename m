Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAB3403EA
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345197; cv=none; b=SJopJrsThzzfHgurkh+RUt+Uy0Ogen4C+xFjkkK7z5cJtqpZHZGaO94DPYuuMQHBkJhl8F+Ms9WwGWcfeEJ7beoy1rILOiA7l8gt+FAXjItTdwKDPCRXs7IkBixqRUAN4AbYNde47xLihJ9NBXY6/GpTfRmZGsNXnSBM4FX942k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345197; c=relaxed/simple;
	bh=WBwTJv7OLU7Ns/6laTRB1O9XGSuOyNd1Z7hU4nz8qbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8xw3cKZlzns9utND+IG/u/Kjj9cA7kNiS21MYg93wEJIh7rNjH2y9CcfAbMUG9/Kio2b42t1nt4VpVL2lc3e4gxl5TaF880zowwbQ78nrHWfQoVvAvDSvPkGpysRcS1wOVnh0M5B+uIEGZB7v9FgOTXv/lXMsKrR2SUUIJ/Cys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=p6oQL4ZN; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="p6oQL4ZN"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU973wPoWz; Mon, 01 Jun 2026 22:19:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345193;
	bh=hzHHvUm2l5weDDKP+zE7rqXQMyF1TVPDFIpkSrC7Mvw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=p6oQL4ZNm4b6ruODwQkjMBCu4yFsNa8lCz52hNzuimyEZl/kRByfeacY5tWOxRQYS
	 tGCcDk52lacFnJuAK/18HE/LCq3yYSBqI6stRVN/rALZCthz/O4Yz98eY2/CJwxNr3
	 OLfE9cuo2YXLtg/FAGrnQ2W/mIavu7lHeSm/9qxSOR+DGVeNDLCM38E0XuQBy8zjUm
	 mcuwCfEDkYaZLY3aod3h4JjK9LILsSwVpspCYNT0SfFhNVfbJkW7pdvznxQTsY5ssv
	 jw+Kb5Ad9XQbO+NQkuGiDvWotxFYuWXl71qAl9TVZT7GSCEEAQ9aR70n9Tfd870n4d
	 AgMAwX8MLLN5g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:53 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 7/7] genirq/chip: Constify the 'chip' field in irq_data
Date: Mon,  1 Jun 2026 22:19:07 +0200
Message-ID: <41b4818e14f2f6e6a7406751d65b59899bd40331.1780343698.git.christophe.jaillet@wanadoo.fr>
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

Commit 393e1280f765 ("genirq: Allow irq_chip registration functions to take
a const irq_chip") and ef6e5d61eb7a ("genirq: Allow
irq_set_chip_handler_name_locked() to take a const irq_chip") have
introduced some ugly casting to store some const parameters into non-const
struct members. [1] [2]

Correctly constify this 'chip' field in struct irq_data, update
corresponding asseccors and remove the now useless cast in
irq_set_chip_handler_name_locked() and irq_set_chip().

[1]: https://elixir.bootlin.com/linux/v7.1-rc5/source/kernel/irq/chip.c#L48
[2]: https://elixir.bootlin.com/linux/v7.1-rc5/source/include/linux/irqdesc.h#L250

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile-tested only, on x86

Changes in v2:
   - New patch

v1: none
---
 include/linux/irq.h     | 6 +++---
 include/linux/irqdesc.h | 4 ++--
 kernel/irq/chip.c       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index efa514ee562f..cde56cb98db3 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -183,7 +183,7 @@ struct irq_data {
 	unsigned int		irq;
 	irq_hw_number_t		hwirq;
 	struct irq_common_data	*common;
-	struct irq_chip		*chip;
+	const struct irq_chip	*chip;
 	struct irq_domain	*domain;
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 	struct irq_data		*parent_data;
@@ -817,13 +817,13 @@ extern int irq_set_msi_desc_off(unsigned int irq_base, unsigned int irq_offset,
 				struct msi_desc *entry);
 extern struct irq_data *irq_get_irq_data(unsigned int irq);
 
-static inline struct irq_chip *irq_get_chip(unsigned int irq)
+static inline const struct irq_chip *irq_get_chip(unsigned int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
 	return d ? d->chip : NULL;
 }
 
-static inline struct irq_chip *irq_data_get_irq_chip(struct irq_data *d)
+static inline const struct irq_chip *irq_data_get_irq_chip(struct irq_data *d)
 {
 	return d->chip;
 }
diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index dae9a9b93665..53dbed301375 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -162,7 +162,7 @@ static inline struct irq_data *irq_desc_get_irq_data(struct irq_desc *desc)
 	return &desc->irq_data;
 }
 
-static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
+static inline const struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
 {
 	return desc->irq_data.chip;
 }
@@ -247,7 +247,7 @@ irq_set_chip_handler_name_locked(struct irq_data *data,
 
 	desc->handle_irq = handler;
 	desc->name = name;
-	data->chip = (struct irq_chip *)chip;
+	data->chip = chip;
 }
 
 bool irq_check_status_bit(unsigned int irq, unsigned int bitmask);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 957e4264bf46..b97881ac7775 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -45,7 +45,7 @@ int irq_set_chip(unsigned int irq, const struct irq_chip *chip)
 	int ret = -EINVAL;
 
 	scoped_irqdesc_get_and_lock(irq, 0) {
-		scoped_irqdesc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
+		scoped_irqdesc->irq_data.chip = chip ?: &no_irq_chip;
 		ret = 0;
 	}
 	/* For !CONFIG_SPARSE_IRQ make the irq show up in allocated_irqs. */
-- 
2.54.0

