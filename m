Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02B13EAC8D
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345732; cv=none; b=K7tqFbjwGP8ChDC+Hy9f9eMmc+q/SWWJBtuQes/Q2GVF9lsR7SydTGMfGZzy8Vr3IgOvrt20IYVL98UF93sAwkxG5I58GK60wj9WzfjRj9ZMWknnRwBdopSfMULqV0/Zk4f/61FqB4X1++leS4Cj4AVUvRhDi5ABKAPI4N16LG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345732; c=relaxed/simple;
	bh=UckaZ2SFQdkZriUJnf9Y0+PT7uk2z4a6ae3g8atXg3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFezhk7r+fZC/aaYpHT/JdNvltkiaY7dueR6tbyjRrzJ5W/mvr0nvjgv5eDuzoRwfS6MKoSzd6nUrYBorhNHhVZTV19FfjSXA4vkGrkB7lDGjknQlg5wDudB93BVmAcMfVuvz/h8UhnntvFgU4x9ceiktkHXw+frbJD4e0LWD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UQp1NnIz; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UQp1NnIz"
Received: from fedora.home ([10.64.95.106])
	by smtp.orange.fr with ESMTP
	id U96ywn4EWXwA3U96ywrpBn; Mon, 01 Jun 2026 22:19:48 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU96ywPoNi; Mon, 01 Jun 2026 22:19:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345188;
	bh=kdzuyFpd1BA9avZeTWSyR24HjtqOQIPWU/SROmBTPzU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UQp1NnIzlXLF4k3lPjlIC99uyjiiYcGaFwQZaAw4zsOOZsQRpjSXoyI0obISkllCi
	 f88m2lhsBPV5UrY92Cvt/QG7tl1gpDNAvaUZ+GqvQbRbuMaxJJd5Nl3syWOEqtx0VB
	 qZ9mMqFKgHge889K+mNUjcUx4MeGupuygBgeNPVwGNEKx3Oj73lN566e/e2pWi0ZZ+
	 Oz059oStgWPz9iRlthWJYgLYsJ/UNsh4dBHWwl2Z0e/OHt9dMv561a3BKAmWz/zLsF
	 iWH1xJXRa3vHVBz6K2SdwYgzC52p4AUQ6HmhGD/uluqHJNXb8qL2RB1huA4Fhv9/87
	 b2nADvOnMp1AQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:48 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 5/7] x86/irq: Constify a struct irq_chip *
Date: Mon,  1 Jun 2026 22:19:05 +0200
Message-ID: <c31599ead770495f3f4674f9a83c3459e9dcb133.1780343698.git.christophe.jaillet@wanadoo.fr>
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

irq_data_get_irq_chip() will also return a const struct irq_chip * and some
const qualifier will also be needed in some places.

So, start to add some of these const qualifiers at the places that are
not spotted by the coccinelle script that does most of the work.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only

If preferred, this could be done differently. If the scope of chip was
reduced, the const would be added by the cocci script in the next patch.

Changes in v2
   - New patch

v1: none
---
 arch/x86/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index ec77be217eaf..7afbdf0ee13b 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -522,7 +522,7 @@ void fixup_irqs(void)
 	unsigned int vector;
 	struct irq_desc *desc;
 	struct irq_data *data;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 
 	irq_migrate_all_off_this_cpu();
 
-- 
2.54.0

