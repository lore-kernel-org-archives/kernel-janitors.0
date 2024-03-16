Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191541BF34
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710618763; cv=none; b=aOMZzEv3a1c3FDGB2Ain7kFdiDzE8QXUZ+EzQuwxeE7gfFTlEDftUOHHsY8JJLBnOM4xuv+N2wMM6Y+fklWFx5a/3gDxrAHGIE7NqBLb2CUqpXGKJFeL5svWjSoREBdDN9ERD0L/akp7EemcbLGPkOJ3fgkkdgWo6x/nymYYe4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710618763; c=relaxed/simple;
	bh=Kz6AxoyXS0ite1d+zI9BgQ9XZyg/PeBhDTilw9ktBHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7fIgJDXsBITEiQT8Mu28MfFWnOpN1nw9vt+EtwpI3EX5Am9IVrIf7EzEN4tcsHwffuKUf5dr/s7HXE6Dp/W9TdfhR49W1Ga6etVxmufnFRTyLCchDYVEU2Be4fP8lt208lJ8EP3b2LBzROjwT4rM7vtd6Ta82idQfDRRqpL9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=D9DxHyYr; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="D9DxHyYr"
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id la3vrEPOXk8gIla3vrpUVD; Sat, 16 Mar 2024 20:51:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1710618687;
	bh=SjbNtOBQ+cS5fJj7smJylRnTlii80ZoATXXlQUbJZNQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=D9DxHyYrkaOm5kE1mLlkXYRjXycXxsTBWVhnZ8Z9aVjjq+D6t1RBVaxow3EeogIP5
	 IM8Xv/gAhp/8W0xITHPIPKeeeMDDP1e2QqRPDB90yamocgV2NaU+1sN+IooU3WZJv/
	 5OjbTL/v2Y9NagH5qxNgBXRLe0a5NPm+eb8SyBwWD+YvsW2IR9Dh2pz4BmvkBixD+/
	 G8a4e+q30hS8hVo+0UJJ4APTF0fifdeurMlzzvjpN87gJzeWJBFvwZASjlRzKyC1Wk
	 uOj5Aufzu3x9taZdnIWltPU9E9HRp5PihX25hIsMzVEWvPGp2L/4MSHZGgsplBKvci
	 t72o/8I9nifHw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Mar 2024 20:51:27 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sam Ravnborg <sam@ravnborg.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
Date: Sat, 16 Mar 2024 20:51:21 +0100
Message-ID: <e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If lt9611uxc_audio_init() fails, some resources still need to be released
before returning the error code.

Use the existing error handling path.

Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f4f593ad8f79..d0c77630a2f9 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -965,7 +965,11 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	return lt9611uxc_audio_init(dev, lt9611uxc);
+	ret = lt9611uxc_audio_init(dev, lt9611uxc);
+	if (ret)
+		goto err_remove_bridge;
+
+	return 0;
 
 err_remove_bridge:
 	free_irq(client->irq, lt9611uxc);
-- 
2.44.0

