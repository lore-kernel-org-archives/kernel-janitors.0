Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31F433D8
	for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731837005; cv=none; b=CYJ9dWsodvmLHwZI8mY8EvmGzQXpqmeKoi4PG68vL604Nvg1+Elnp12YY3asOkS8TLKCPvvvkMzOTUR0gD6UdJJQ9Qvi7ms4NmijSg9tW3RVnz5lqj1oWPWnhHI6gUIWWxB1noLdNmerG/g4W1nVLKE4is7UmXxGCGHBIcG4+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731837005; c=relaxed/simple;
	bh=8A8rgtXqoEFDE6e2Cc4oIq+UZI65ZZQltOMDMpOl6YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ep2HkximuFwvpeHfRfp8lspK+YU6NsfzlFa+M6BnNxK5FcKIG/2U4/LyOtZoWpK8x87+gTMZgOBPFGxOHwCR85iIEloGsnh4Vp0DwTWosg3qyUJzamB36qEajrfKY7BYQGxrPj/OQlr4ZYIToGJDjwQ2qjW087R/jQc5BzMVbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SilmOkIE; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SilmOkIE"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Cbuot94NAgiuVCbuotxsQw; Sun, 17 Nov 2024 10:49:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731836999;
	bh=4pIjtqmxpYW6XNZHQmnJjjyahBUNP0xyEvLy1B23afw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SilmOkIEo6S2qouaKgZrKjtW/0QCEI6GyVLrh4AmOuYpG53kBF/8F5sP6wD0WsQQn
	 9hdpoy+ViLgeUAgAaDw0XEdSo9Zc8TWBta91Vvf7AVYeTivYXOZLd8WB1hh2wEQh+u
	 dX4Kx3ZF7nDCG1czf1fUBSsszxQLxgZKFgcE/GNiDt954peVh5kBhoXQSVrda9TxQu
	 CbmrZEOlr8pzR/lcSIZUKJHWAdg8p8fb35ZnJ3Dxh8e03eefPel6E8QzwdlQluP1vi
	 BTYpMTK8zZlJmi1qQPeQXXbHhfBMK4kpiAUIErulXA5pCEuqUD8GaMyB5hjtMA1xDv
	 AuBM5HXeT7cCw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Nov 2024 10:49:59 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/5] Initial steps to constify irq_chip
Date: Sun, 17 Nov 2024 10:49:42 +0100
Message-ID: <cover.1731835733.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct irq_chip holds many function pointers and so, is a good
candidate for constification.


Some steps to constify these structures have already been done in 2022
with commit 393e1280f765 ("genirq: Allow irq_chip registration functions
to take a const irq_chip") and ef6e5d61eb7a ("genirq: Allow
irq_set_chip_handler_name_locked() to take a const irq_chip")

However these commits introduce some ugly casting to store some const
parameters into non-const struct members. [1] [2]


The goal of this serie is to try to go further, and eventually cleanly
constify irq_chip. As a consequence, it will increase the overall
security, because of the constification of some function pointers.

Based on elixir, it is referenced in 565 files. [3]
So, the road looks long because this structure is used in many places. 


It will need to constify the return value of irq_get_chip(),
irq_data_get_irq_chip() and irq_desc_get_chip() which are widely used.
It is expected that many other functions may need to be tweaked in order
to propagate this const qualifier where needed in call chains.

So, let start somewhere and see how far we can go :)


patch 1 and 2 only update the prototypes of some functions and should be
straightforward.

The 3 other patches update some variable declaration in kernel/irq/
I have split the patches according to the way a reference to a struct
irq_chip is gotten.


This serie may be invasive and touch many places to get rid of the ugly
castings, but as least patch 1 and 2 should IMHO be merged because they
are simple and go in the right direction.

The 3 other ones, and all the oher ones that will be needed, may not
need the effort.

Before going further, feedback is aoppreciated


CJ


[1]: https://elixir.bootlin.com/linux/v6.12-rc7/source/kernel/irq/chip.c#L49
[2]: https://elixir.bootlin.com/linux/v6.12-rc7/source/include/linux/irqdesc.h#L236
[3]: https://elixir.bootlin.com/linux/v6.12-rc7/A/ident/irq_chip


Christophe JAILLET (5):
  irqchip: Constify "struct irq_chip *" parameter in chained_irq_xxx()
    functions
  irqchip: Constify "struct irq_chip *" parameter in
    cond_unmask_eoi_irq()
  irqchip: Constify some direct access to irq_data->chip
  irqchip: Constify some irq_desc_get_chip() usage
  irqchip: Constify some irq_data_get_irq_chip() usage

 include/linux/irqchip/chained_irq.h |  4 ++--
 kernel/irq/chip.c                   | 25 +++++++++++++------------
 kernel/irq/cpuhotplug.c             |  2 +-
 kernel/irq/debugfs.c                |  2 +-
 kernel/irq/manage.c                 | 20 ++++++++++----------
 kernel/irq/migration.c              |  2 +-
 6 files changed, 28 insertions(+), 27 deletions(-)

-- 
2.47.0

