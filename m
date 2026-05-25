Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8C382F00
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712602; cv=none; b=NreqTNXa53kcgfNVGb8mgPRpKhpuXs9RMb9nomWwIz/wQD8bhZDTC0aj0SRh1HxDyUz11DlgBj8yAS1ekwNUbjfmC5euEoNhd9PmA/9zU5C1WxCan8/l2tL6l/GGAMLOXVrt4jcN0qPEobNRU2oTNS20yzjqsso7thXhH7+geuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712602; c=relaxed/simple;
	bh=TZOaeH+vP4WW5Gs9wH47yeeHPvP/6SqcD+GMNd6E5gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9Eqc9if/bUhzl+SGTVg0qJCaohGs0/YHhPYwIyNYDrOsoVsUExc2y/U+hw5xdwaZSZgTP1JDC1kEDWHmtJgGwObZMcvtlDqxh3UADapJrY7lWqfBeXtQ+m1eceiv0lXF+EVTyuuUCRNme+OqK9zptojBlM9aMP9mWPq6f/YaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=WIonNY/4; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="WIonNY/4"
Received: from fedora.home ([10.65.86.64])
	by smtp.orange.fr with ESMTP
	id RUWnwAa6tjnMPRUWnwWTxi; Mon, 25 May 2026 14:35:29 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id RUWdwkexnb370RUWdw6JPe; Mon, 25 May 2026 14:35:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1779712522;
	bh=ljvFcHVr5NanSDqM3RBqxRSwTWh7Ck4wjtjVJuilOnw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WIonNY/4gKDnfqCVHquYVLbYKe9nCgMH5xepGWVv/w096T2UKTolcCStk+GyLi5l0
	 vQbrw7FbnzLiPeZY+RJi+PpvZw49lJP89HSXBntrI7sXBeoC3Uj2LOTIDLQXkA/aM3
	 VKbaxv31PLQFBr9cVOie//0eO9jqEzN20lCsgt6sXNFoTez8A40Y2ozcXSrlSnGARe
	 4IWetzYobZFiUrKIa79A7YKWq37adtSgYBxq0HYWI829T9PwIctZ4GmBJJxZEOwmvc
	 vZN3pGJXaX9feHVrwzs1hvFDlObXadBpryj2JXIkkrX4ovIac3q79zpJLxsjixYqPI
	 agIenAIN/4jQQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 25 May 2026 14:35:22 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/configfs: Constify struct configfs_item_operations and configfs_group_operations
Date: Mon, 25 May 2026 14:35:15 +0200
Message-ID: <ee83bb3bc0518db4a0a73c3e8df814a45549a064.1779712504.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  34095	  15704	    128	  49927	   c307	drivers/gpu/drm/xe/xe_configfs.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  34447	  15352	    128	  49927	   c307	drivers/gpu/drm/xe/xe_configfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/gpu/drm/xe/xe_configfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..5c2072f18a57 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -838,7 +838,7 @@ static void xe_config_device_release(struct config_item *item)
 	kfree(dev);
 }
 
-static struct configfs_item_operations xe_config_device_ops = {
+static const struct configfs_item_operations xe_config_device_ops = {
 	.release	= xe_config_device_release,
 };
 
@@ -855,7 +855,7 @@ static bool xe_config_device_is_visible(struct config_item *item,
 	return true;
 }
 
-static struct configfs_group_operations xe_config_device_group_ops = {
+static const struct configfs_group_operations xe_config_device_group_ops = {
 	.is_visible	= xe_config_device_is_visible,
 };
 
@@ -950,7 +950,7 @@ static bool xe_config_sriov_is_visible(struct config_item *item,
 	return true;
 }
 
-static struct configfs_group_operations xe_config_sriov_group_ops = {
+static const struct configfs_group_operations xe_config_sriov_group_ops = {
 	.is_visible	= xe_config_sriov_is_visible,
 };
 
@@ -1054,7 +1054,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	return &dev->group;
 }
 
-static struct configfs_group_operations xe_config_group_ops = {
+static const struct configfs_group_operations xe_config_group_ops = {
 	.make_group	= xe_config_make_device_group,
 };
 
-- 
2.54.0

