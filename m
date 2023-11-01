Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC76FDB
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="BbVBnsZm"
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2BBDA
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 02:33:39 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id y7bUqR7n2QRiPy7bUqGpjn; Wed, 01 Nov 2023 10:33:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698831217;
	bh=Lk6by+apJlXOTJCfTgHSgCgxJ2Nx6rTRDAgAWtwwfU4=;
	h=From:To:Cc:Subject:Date;
	b=BbVBnsZmRk2OMHr0SyJFrkLIzjmbNG6017Q+W8zqghSIP2TMIyMLZArrpLCPxvnF5
	 4x7t+NAHTlbmCfMcwD5W2LI8bqKszLrscaC2+j+/BbVhqNtNHs1TRVGKHVHnac8zEz
	 dgajdDB/wKaW5JtsL4GXQnfLhIqLFiSY5OcL/a3tOQvqv31nOLhYOLl9c3hJpVXB9D
	 IlCfF5Xk+5iRalotiMUMGdCId+VOoxodLNLCrWDIYUOFKqhidUyWi9xLgpZ52Dxpeq
	 Ff1cGFU0RPUELO5nH2cwprGhHxZSZ421QjYbTQkJ0KasVPcsglOikh5gQ7kC0Ij1Lf
	 S+tGPGydgTuIQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 10:33:37 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] base: soc: Remove usage of the deprecated ida_simple_xx() API
Date: Wed,  1 Nov 2023 10:33:33 +0100
Message-Id: <f0ef849446c9b3df7d6b16b1a58d089b4c17276c.1698831191.git.christophe.jaillet@wanadoo.fr>
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
 drivers/base/soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 8dec5228fde3..c741d0845852 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -106,7 +106,7 @@ static void soc_release(struct device *dev)
 {
 	struct soc_device *soc_dev = container_of(dev, struct soc_device, dev);
 
-	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
+	ida_free(&soc_ida, soc_dev->soc_dev_num);
 	kfree(soc_dev->dev.groups);
 	kfree(soc_dev);
 }
@@ -155,7 +155,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
 
 	/* Fetch a unique (reclaimable) SOC ID. */
-	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
+	ret = ida_alloc(&soc_ida, GFP_KERNEL);
 	if (ret < 0)
 		goto out3;
 	soc_dev->soc_dev_num = ret;
-- 
2.34.1

