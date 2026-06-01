Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F003F4137
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345255; cv=none; b=LcjPCoy3Dz3oTl/1y5TxJOLso+dMN5+Z7bZE5rYwqMPRo/4QmhtjL8pGf4r6wceinyjEG5oTg2yiWzwW1oO7Cs5tZT13l9YLkLrW674y0vFvzgelRJUDfAv26Ua1q/JUPohCB/p5KKZv4paIpVKVwd49+uqRS7uvcrZyLTZKJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345255; c=relaxed/simple;
	bh=T9U7wVldKRlzUX+iFltU2canoCuZeGvOEwocp4VLd7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZooiJ1UhRoj5SiKSx6yTHLiZK83il9FU9tFx+YED2UR2YYIJatcbujYUB9mXFoz0pqC4sq9wfiVv5C4+PMFHbYTWDQwU2lLUN3u2FQr6L/WDetgIZkz55ySxVvLlLdcZSYxZiH99y+eAZbruX9ZrFkz4fczEk+hpjobya2GQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bshP9Aji; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bshP9Aji"
Received: from fedora.home ([10.64.95.106])
	by smtp.orange.fr with ESMTP
	id U96swZYhjG0XwU96swCqO8; Mon, 01 Jun 2026 22:19:42 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU96rwPoC0; Mon, 01 Jun 2026 22:19:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345182;
	bh=0RRXyKmmVz4UT0DXeGKQ7+Tn4qUBejGCdUpZtcd+hmc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bshP9AjiZgFEyhXii1+PaK7O9cagOisNnwWBbjSjxrKa0hEw4VXabwsAUZHSZeFl9
	 EeZgJxF4/v1uQ1+5z6Q/Vb82MhMu+ckcseRHSahoz1n3yT8btozZiJX/fEhbLgTl+o
	 XAiRqhB0bi8yoDy+xQxDue/GgcXqTh9zyNNgV+skoOQ8OqDMC++IfXGOQreCRpvu+7
	 kUhPwgzheisG9RErEm1JE28++pKhaUBE8lggpydJVm+hmyJifaAjNQ6TSNC8ttcSp4
	 iZrUo6t31xcRGxQAB0rBjh+yUo4cSyARudBSWmrr3+7wWNKIkJORDEAnF9ruNgCyf5
	 6P0K2yj2lc8Lg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:42 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/7] pinctrl: samsung: Constify "struct irq_chip *" parameter in to_exynos_irq_chip()
Date: Mon,  1 Jun 2026 22:19:03 +0200
Message-ID: <25b70558d35ce4686eed3520588581c5f2f880f8.1780343698.git.christophe.jaillet@wanadoo.fr>
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

to_exynos_irq_chip() doesn't modify its 'chip' parameter.

So change the prototype of this function to accept const struct irq_chip
pointer.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only

Changes in v2:
   - New patch

v1: none
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..e8b2d47ebe45 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -50,7 +50,7 @@ static u32 eint_wake_mask_values[MAX_WAKEUP_REG] = { EXYNOS_EINT_WAKEUP_MASK_DIS
 						     EXYNOS_EINT_WAKEUP_MASK_DISABLED,
 						     EXYNOS_EINT_WAKEUP_MASK_DISABLED};
 
-static inline struct exynos_irq_chip *to_exynos_irq_chip(struct irq_chip *chip)
+static inline struct exynos_irq_chip *to_exynos_irq_chip(const struct irq_chip *chip)
 {
 	return container_of(chip, struct exynos_irq_chip, chip);
 }
-- 
2.54.0

