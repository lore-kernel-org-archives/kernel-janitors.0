Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Sw0GPVKq"
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B4DD8
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Dec 2023 12:31:18 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CmvrrmwWfLeGRCmvsrAVcE; Mon, 11 Dec 2023 21:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702326676;
	bh=vHzJfqKnTRuFgSnoz8eTVV5fD+/O2UFMaWIC2xo2TfQ=;
	h=From:To:Cc:Subject:Date;
	b=Sw0GPVKqbVO88d8UJ3tqzuM+f5EH2tF4ykBwRuK8UdGzxG/J5SE3wCajBx7fO7/NH
	 zDi3MGd6pjXxpI9P95iTCvQzf70q1dAHe7EVkApwev9+O7iZCaEjziglo86jNCoGUc
	 xAI8vqsB5NzXDOO3ZT3YS9TODXlKuKeP9rP6mxUqJvONUvhuganZYdPmT9e8mLn61j
	 Ze8jKAU3L2MNSZSUt/I7o0KB+b2DeWIw+E3PFJFgnoUJPEVa75CYAK9BmzqdoLHKkY
	 E/KUdt5GQMld2lMT+h0zU9JQYpblxV+IrzYftqy6cTM8pMWptg1qSckCDVGLi/GUCL
	 qmQ8ICncfktVg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 11 Dec 2023 21:31:16 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] most: Remove usage of the deprecated ida_simple_xx() API
Date: Mon, 11 Dec 2023 21:31:11 +0100
Message-Id: <988c218ef3d91bffaf4c3db9b6fba0d369cbb2b2.1702326601.git.christophe.jaillet@wanadoo.fr>
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
 drivers/most/core.c      | 10 +++++-----
 drivers/most/most_cdev.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/most/core.c b/drivers/most/core.c
index e4412c7d25b0..81d60d4ee8c2 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -1286,7 +1286,7 @@ int most_register_interface(struct most_interface *iface)
 	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS))
 		return -EINVAL;
 
-	id = ida_simple_get(&mdev_id, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&mdev_id, GFP_KERNEL);
 	if (id < 0) {
 		dev_err(iface->dev, "Failed to allocate device ID\n");
 		return id;
@@ -1294,7 +1294,7 @@ int most_register_interface(struct most_interface *iface)
 
 	iface->p = kzalloc(sizeof(*iface->p), GFP_KERNEL);
 	if (!iface->p) {
-		ida_simple_remove(&mdev_id, id);
+		ida_free(&mdev_id, id);
 		return -ENOMEM;
 	}
 
@@ -1308,7 +1308,7 @@ int most_register_interface(struct most_interface *iface)
 		dev_err(iface->dev, "Failed to register interface device\n");
 		kfree(iface->p);
 		put_device(iface->dev);
-		ida_simple_remove(&mdev_id, id);
+		ida_free(&mdev_id, id);
 		return -ENOMEM;
 	}
 
@@ -1366,7 +1366,7 @@ int most_register_interface(struct most_interface *iface)
 	}
 	kfree(iface->p);
 	device_unregister(iface->dev);
-	ida_simple_remove(&mdev_id, id);
+	ida_free(&mdev_id, id);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(most_register_interface);
@@ -1397,7 +1397,7 @@ void most_deregister_interface(struct most_interface *iface)
 		device_unregister(&c->dev);
 	}
 
-	ida_simple_remove(&mdev_id, iface->p->dev_id);
+	ida_free(&mdev_id, iface->p->dev_id);
 	kfree(iface->p);
 	device_unregister(iface->dev);
 }
diff --git a/drivers/most/most_cdev.c b/drivers/most/most_cdev.c
index 3ed8f461e01e..b9423f82373d 100644
--- a/drivers/most/most_cdev.c
+++ b/drivers/most/most_cdev.c
@@ -100,7 +100,7 @@ static void destroy_cdev(struct comp_channel *c)
 
 static void destroy_channel(struct comp_channel *c)
 {
-	ida_simple_remove(&comp.minor_id, MINOR(c->devno));
+	ida_free(&comp.minor_id, MINOR(c->devno));
 	kfifo_free(&c->fifo);
 	kfree(c);
 }
@@ -425,7 +425,7 @@ static int comp_probe(struct most_interface *iface, int channel_id,
 	if (c)
 		return -EEXIST;
 
-	current_minor = ida_simple_get(&comp.minor_id, 0, 0, GFP_KERNEL);
+	current_minor = ida_alloc(&comp.minor_id, GFP_KERNEL);
 	if (current_minor < 0)
 		return current_minor;
 
@@ -472,7 +472,7 @@ static int comp_probe(struct most_interface *iface, int channel_id,
 err_free_c:
 	kfree(c);
 err_remove_ida:
-	ida_simple_remove(&comp.minor_id, current_minor);
+	ida_free(&comp.minor_id, current_minor);
 	return retval;
 }
 
-- 
2.34.1

