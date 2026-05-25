Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685037F018
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712279; cv=none; b=YX0uRvI9GWBn7qOWrJh7LLlqWFhli2HNEESs6yY+WphDiVspTKRiPyfXj3tsB6qRxpONJ88pW+YJdsF10Y+4qX3Dz8pfkIo8mPueOjHKZ8+AWns4vKRLyc5ei6UPBNeUkUxxlKicvzfSz49jZg/xB/cAKxp3Gc5mBwbggyr2jMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712279; c=relaxed/simple;
	bh=VrkAKFVICdseo5IERnTZKJChm5LvacJ6c/KKmZN7LkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ruzD4K/pf4K/mbDwE9Y4z9Ap/Nw7jTxP3RrSUfgn133JpHrWX4g/tZhUHDxIkCG2B8L84tQtoA4sdo1Hd3cuTjY55PtthuWuiWOCqdUdiA5OTNaqxWTiqjgI02V7HLnk6s/dRvCmeUV/mqh14qdI14dqqEvdJs/2wAj4OFUJuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=tqPBHSC0; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tqPBHSC0"
Received: from fedora.home ([10.64.95.102])
	by smtp.orange.fr with ESMTP
	id RUSbwisXnTilpRUSbwCGeI; Mon, 25 May 2026 14:31:09 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id RUSRwq2akQMzxRUSRwv4V0; Mon, 25 May 2026 14:31:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1779712262;
	bh=+24KCHj8Nhbt66nix0buOwJbN6z4qiKLJeZ5FnCFY+o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=tqPBHSC08dB51FytLI07zypkiHsmNulKxzm+DD6cQVpPAWR90GVK/yYtPQwhd+X3O
	 61FvAsTzGFC/hf1HbZDfYnmYIzaEzbqQwytc5aJoVH53R6h/k3W4yrV/VJAAp7Qm8V
	 xeS7o5Kn+qH6tbo+hRMhnwzE4zOC5KWpnDniOqVXi+/4aadK7QksAIfUL+Ck8zqfOX
	 okS67F/r1wJPODEZ6CR6lUvyCt9+XsV2boWisGX2Ub07QhwMY/Yjc6LCVRvYvZHSLX
	 sN5o1S9bd0hoP+Tllj9A4Sr/P1+wmBV4hm+ICvJHkHM97LMS2RAhNUQm8BsvBJP7Yf
	 vAM8Gu8NMfdVg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 25 May 2026 14:31:02 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: Constify struct configfs_item_operations and configfs_group_operations
Date: Mon, 25 May 2026 14:30:56 +0200
Message-ID: <ade89ec366460754dd1746dd8001afb53cfaffbf.1779712234.git.christophe.jaillet@wanadoo.fr>
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
  21554	  10096	    128	  31778	   7c22	drivers/gpu/drm/vkms/vkms_configfs.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22546	   9104	    128	  31778	   7c22	drivers/gpu/drm/vkms/vkms_configfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7551b8c7766d..b2b3343f9d35 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -189,7 +189,7 @@ static void crtc_release(struct config_item *item)
 	}
 }
 
-static struct configfs_item_operations crtc_item_operations = {
+static const struct configfs_item_operations crtc_item_operations = {
 	.release	= &crtc_release,
 };
 
@@ -231,7 +231,7 @@ static struct config_group *make_crtc_group(struct config_group *group,
 	return &crtc->group;
 }
 
-static struct configfs_group_operations crtcs_group_operations = {
+static const struct configfs_group_operations crtcs_group_operations = {
 	.make_group	= &make_crtc_group,
 };
 
@@ -276,7 +276,7 @@ static void plane_possible_crtcs_drop_link(struct config_item *src,
 		vkms_config_plane_detach_crtc(plane->config, crtc->config);
 }
 
-static struct configfs_item_operations plane_possible_crtcs_item_operations = {
+static const struct configfs_item_operations plane_possible_crtcs_item_operations = {
 	.allow_link	= plane_possible_crtcs_allow_link,
 	.drop_link	= plane_possible_crtcs_drop_link,
 };
@@ -345,7 +345,7 @@ static void plane_release(struct config_item *item)
 	}
 }
 
-static struct configfs_item_operations plane_item_operations = {
+static const struct configfs_item_operations plane_item_operations = {
 	.release	= &plane_release,
 };
 
@@ -393,7 +393,7 @@ static struct config_group *make_plane_group(struct config_group *group,
 	return &plane->group;
 }
 
-static struct configfs_group_operations planes_group_operations = {
+static const struct configfs_group_operations planes_group_operations = {
 	.make_group	= &make_plane_group,
 };
 
@@ -438,7 +438,7 @@ static void encoder_possible_crtcs_drop_link(struct config_item *src,
 		vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
 }
 
-static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
+static const struct configfs_item_operations encoder_possible_crtcs_item_operations = {
 	.allow_link	= encoder_possible_crtcs_allow_link,
 	.drop_link	= encoder_possible_crtcs_drop_link,
 };
@@ -462,7 +462,7 @@ static void encoder_release(struct config_item *item)
 	}
 }
 
-static struct configfs_item_operations encoder_item_operations = {
+static const struct configfs_item_operations encoder_item_operations = {
 	.release	= &encoder_release,
 };
 
@@ -510,7 +510,7 @@ static struct config_group *make_encoder_group(struct config_group *group,
 	return &encoder->group;
 }
 
-static struct configfs_group_operations encoders_group_operations = {
+static const struct configfs_group_operations encoders_group_operations = {
 	.make_group	= &make_encoder_group,
 };
 
@@ -579,7 +579,7 @@ static void connector_release(struct config_item *item)
 	}
 }
 
-static struct configfs_item_operations connector_item_operations = {
+static const struct configfs_item_operations connector_item_operations = {
 	.release	= &connector_release,
 };
 
@@ -628,7 +628,7 @@ static void connector_possible_encoders_drop_link(struct config_item *src,
 	}
 }
 
-static struct configfs_item_operations connector_possible_encoders_item_operations = {
+static const struct configfs_item_operations connector_possible_encoders_item_operations = {
 	.allow_link	= connector_possible_encoders_allow_link,
 	.drop_link	= connector_possible_encoders_drop_link,
 };
@@ -677,7 +677,7 @@ static struct config_group *make_connector_group(struct config_group *group,
 	return &connector->group;
 }
 
-static struct configfs_group_operations connectors_group_operations = {
+static const struct configfs_group_operations connectors_group_operations = {
 	.make_group	= &make_connector_group,
 };
 
@@ -750,7 +750,7 @@ static void device_release(struct config_item *item)
 	kfree(dev);
 }
 
-static struct configfs_item_operations device_item_operations = {
+static const struct configfs_item_operations device_item_operations = {
 	.release	= &device_release,
 };
 
@@ -802,7 +802,7 @@ static struct config_group *make_device_group(struct config_group *group,
 	return &dev->group;
 }
 
-static struct configfs_group_operations device_group_ops = {
+static const struct configfs_group_operations device_group_ops = {
 	.make_group = &make_device_group,
 };
 
-- 
2.54.0

