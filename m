Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992A16FAD
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Dec 2023 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NrHNZz+Y"
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id FSEnr9yeXuIvyFSEnrRqtn; Tue, 19 Dec 2023 06:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702962111;
	bh=1HXfZutebd4IF1uNL0rih5Mj5PnxGJrPUITlr9cOY+Q=;
	h=From:To:Cc:Subject:Date;
	b=NrHNZz+Yny3Q/Iv0otUfEvoRtvi0dFyGFaHfyAqn+F4rQnidWt7ZI4nw46d/JwhRA
	 mu9Iim9JSQsw/fppcAa1w6airT6gQ1nxftBwY9gBisw0P878G1h3wpteqx26Vc/7V4
	 LGvbQmR6wdvW5WVav7v/E04tw460U5nmlht0AmsFCR4QY8Cs7cO/frZuRK6Dz3GTbI
	 Sm3FqWHny6m+K9Lc0Ti7J6CBuE/NE6YZ4cmo/NkTrz52gBd2kYnPrIgnTcg1kldj/5
	 L+qgP9yONmxZX4yzMl0b91HTm0B/EgqqhoYeFIer4jN59Om4FEzUdx3M66MTRFL8cN
	 fdlMJPwO5eWHg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Dec 2023 06:01:51 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ppdev: Remove usage of the deprecated ida_simple_xx() API
Date: Tue, 19 Dec 2023 06:01:47 +0100
Message-Id: <ba9da12fdd5cdb2c28180b7160af5042447d803f.1702962092.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/ppdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ppdev.c b/drivers/char/ppdev.c
index 4c188e9e477c..ee951b265213 100644
--- a/drivers/char/ppdev.c
+++ b/drivers/char/ppdev.c
@@ -299,7 +299,7 @@ static int register_device(int minor, struct pp_struct *pp)
 		goto err;
 	}
 
-	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
+	index = ida_alloc(&ida_index, GFP_KERNEL);
 	memset(&ppdev_cb, 0, sizeof(ppdev_cb));
 	ppdev_cb.irq_func = pp_irq;
 	ppdev_cb.flags = (pp->flags & PP_EXCL) ? PARPORT_FLAG_EXCL : 0;
@@ -310,7 +310,7 @@ static int register_device(int minor, struct pp_struct *pp)
 	if (!pdev) {
 		pr_warn("%s: failed to register device!\n", name);
 		rc = -ENXIO;
-		ida_simple_remove(&ida_index, index);
+		ida_free(&ida_index, index);
 		goto err;
 	}
 
@@ -750,7 +750,7 @@ static int pp_release(struct inode *inode, struct file *file)
 
 	if (pp->pdev) {
 		parport_unregister_device(pp->pdev);
-		ida_simple_remove(&ida_index, pp->index);
+		ida_free(&ida_index, pp->index);
 		pp->pdev = NULL;
 		pr_debug(CHRDEV "%x: unregistered pardevice\n", minor);
 	}
-- 
2.34.1

