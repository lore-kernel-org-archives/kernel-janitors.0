Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06F7483
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZuWrnT+/"
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E09EFD
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 02:41:21 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id y7ixqyFEudFbKy7ixqnEFP; Wed, 01 Nov 2023 10:41:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698831679;
	bh=lci7+3XvwKBuDxgeW1wZiQqQ9+xbVFXx8gAOWcltF4c=;
	h=From:To:Cc:Subject:Date;
	b=ZuWrnT+/z6mhaRO+RjEg7sfHBiks0kwfbkKTfXvCeJDOBJrVbBfXue2PRK7hml0nq
	 hnUBezI3CTTXVRZn4Y1OjI05wCe2qDYx5CPE+kGx0oljosiIzaAFN8BAwJW0BNHfu7
	 8mUnoVjyjAu8/9lPRRnOrsNhr4rx4FE1Pvoex6IYmsK0J/o1BW+HsXWzjF/RKrm9GD
	 IfsLshZMz8GB+vLGU/5LBRpiQsNJJSHby+PpJiDJ43rrfQVOKpwTZFNXNgxgTnbFTU
	 8suae4HiKPcn41G9tJ9ibzUsZpCvr4p5EPI9PDIzpt9GAT4nFyQOYAk3niCnGnjlkn
	 /mDrT5XRbr5Ew==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 10:41:19 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Jens Taprogge <jens.taprogge@taprogge.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	industrypack-devel@lists.sourceforge.net
Subject: [PATCH] ipack: Remove usage of the deprecated ida_simple_xx() API
Date: Wed,  1 Nov 2023 10:41:17 +0100
Message-Id: <435bd17b8a5ddb2fc3e42e2796117ee02263d02a.1698831664.git.christophe.jaillet@wanadoo.fr>
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
 drivers/ipack/ipack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
index cc1ecfd49928..b1471ba016a5 100644
--- a/drivers/ipack/ipack.c
+++ b/drivers/ipack/ipack.c
@@ -207,7 +207,7 @@ struct ipack_bus_device *ipack_bus_register(struct device *parent, int slots,
 	if (!bus)
 		return NULL;
 
-	bus_nr = ida_simple_get(&ipack_ida, 0, 0, GFP_KERNEL);
+	bus_nr = ida_alloc(&ipack_ida, GFP_KERNEL);
 	if (bus_nr < 0) {
 		kfree(bus);
 		return NULL;
@@ -237,7 +237,7 @@ int ipack_bus_unregister(struct ipack_bus_device *bus)
 {
 	bus_for_each_dev(&ipack_bus_type, NULL, bus,
 		ipack_unregister_bus_member);
-	ida_simple_remove(&ipack_ida, bus->bus_nr);
+	ida_free(&ipack_ida, bus->bus_nr);
 	kfree(bus);
 	return 0;
 }
-- 
2.34.1

