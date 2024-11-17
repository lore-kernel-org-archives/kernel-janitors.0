Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B0188CC6
	for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731837015; cv=none; b=GFjD4qEOEB4/Ql+jC3z44UEubqvnrH6iqkH4SZHHAk9m5MxlxY8Jk7tLt5GsYURqdmN3pyWoT1rQcvUk1u59+oMDxyFKDtlOZEsNGKCpDx5vl+CNCn3Si5/+/Qbuq+1AfpSWj9V3La5NH+TQO0F6xs8qx204W9t25ZRJKrOmAN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731837015; c=relaxed/simple;
	bh=VIWlpCQZr5s42IrRQMG8HvlS2IyT4vl4I34GslmqBfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrP4cISjvu2mNQDUFzYRcVQa8nuiGDx+u/CgXqzcglrCzvVBaqf+7lGiAKGM0EoJoMVfDis/TmlLnsdtuG5YfMjRFgzgDW7hjwugzuCJ51pJbmDn6S8zzy4E3mFvK1nTYjEwhznqlJd5FicHL3nA0owI2/z7N79zg2FH0t4TX78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mBP6KyPU; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mBP6KyPU"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Cbuot94NAgiuVCbv3txsjg; Sun, 17 Nov 2024 10:50:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731837014;
	bh=9J3BipkXAD9q0ylgi+Wg4usr8m6odHLbDpmH9jlLsLs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mBP6KyPUtkyZ+0PZ7/qAdeBd5u+nsXOhAds/pgmx+S9IlwLEhD3GLMJ52F6uOvLep
	 6EA5GbxjUBTEQueLZn/rvmAi/g0kXMt1HFvdYgdNnjIFZpPLqQTpdjkThRaOI1gU2U
	 NCQbKTH98fdYULfm+xZhXA4GRWGr5zQteiTsh5a+Jp1FvXLYc9AeWJ5PazdYO+6zXc
	 Bs7Nyy60dJfjVXT5NCoFsUr3VpI0n/U6oKk4qHo+mfYNVhlaZqFXZiXYFnAaA1NhwL
	 Vu813LVRUxoTAyvYFv6IbXU+SBcVYq6pJflSX3I0qG8L+/9ufZQTahAJJb9knr8Shl
	 JtIyxy3sJG7vw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Nov 2024 10:50:14 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 5/5] irqchip: Constify some irq_data_get_irq_chip() usage
Date: Sun, 17 Nov 2024 10:49:47 +0100
Message-ID: <98dd8f88c7dd11474925b65b6bd6e34f1be7198f.1731835733.git.christophe.jaillet@wanadoo.fr>
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

When irq_data_get_irq_chip() will return a const struct irq_chip, the const
qualifier will be needed for local variables that store the return value of
this function.

So start to add some of these const qualifiers.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 kernel/irq/chip.c       |  4 ++--
 kernel/irq/cpuhotplug.c |  2 +-
 kernel/irq/manage.c     | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index d3acccf7e2e2..2d540884ca05 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1145,7 +1145,7 @@ EXPORT_SYMBOL_GPL(irq_modify_status);
 void irq_cpu_online(void)
 {
 	struct irq_desc *desc;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	unsigned long flags;
 	unsigned int irq;
 
@@ -1175,7 +1175,7 @@ void irq_cpu_online(void)
 void irq_cpu_offline(void)
 {
 	struct irq_desc *desc;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	unsigned long flags;
 	unsigned int irq;
 
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 15a7654eff68..dbfa7d63438f 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -53,7 +53,7 @@ static inline bool irq_needs_fixup(struct irq_data *d)
 static bool migrate_one_irq(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(d);
+	const struct irq_chip *chip = irq_data_get_irq_chip(d);
 	bool maskchip = !irq_can_move_pcntxt(d) && !irqd_irq_masked(d);
 	const struct cpumask *affinity;
 	bool brokeaff = false;
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index e7f548bc976b..dfe184218cc2 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -207,7 +207,7 @@ void irq_set_thread_affinity(struct irq_desc *desc)
 static void irq_validate_effective_affinity(struct irq_data *data)
 {
 	const struct cpumask *m = irq_data_get_effective_affinity_mask(data);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 
 	if (!cpumask_empty(m))
 		return;
@@ -225,7 +225,7 @@ int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
 {
 	struct cpumask *tmp_mask = this_cpu_ptr(&__tmp_mask);
 	struct irq_desc *desc = irq_data_to_desc(data);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	const struct cpumask  *prog_mask;
 	int ret;
 
@@ -353,7 +353,7 @@ static bool irq_set_affinity_deactivated(struct irq_data *data,
 int irq_set_affinity_locked(struct irq_data *data, const struct cpumask *mask,
 			    bool force)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	struct irq_desc *desc = irq_data_to_desc(data);
 	int ret = 0;
 
@@ -658,7 +658,7 @@ int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info)
 	unsigned long flags;
 	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
 	struct irq_data *data;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	int ret = -ENOSYS;
 
 	if (!desc)
@@ -2799,7 +2799,7 @@ void teardown_percpu_nmi(unsigned int irq)
 int __irq_get_irqchip_state(struct irq_data *data, enum irqchip_irq_state which,
 			    bool *state)
 {
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	int err = -EINVAL;
 
 	do {
@@ -2871,7 +2871,7 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 {
 	struct irq_desc *desc;
 	struct irq_data *data;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	unsigned long flags;
 	int err = -EINVAL;
 
-- 
2.47.0

