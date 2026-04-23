Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE40320393
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928168; cv=none; b=OouFuOI6DUR7UkhjBDG/7Cy/yVUy2dq+tJkRQxQZ966X2pP7GbjvvWr2mUUYzeH9skdUGN4CxNE/FzgsglFkFbWR50cvM3VOidArpFWib0iFC5MiTr1S2dpJEO6AGxbJA2mrWOWEMBX8cpylYGxukuiSqim5JzE0ZEZWWETKVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928168; c=relaxed/simple;
	bh=DupynI6gpH1hFGwBJMBqwZF2os5L0Q35W2Yjj2yAnyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIfzkqtCId8BhYYqZJF2XBiu567JH9Z+Pwt7g7qHvtY8geD5y1bzzI0M13XIGPOqQZ7ANDE1W5gsKi/QD9Wk46w3Qe6+uvVpGxy8WmXmJLn6DVCUl/Q1xVl5WbjeCxuV/eeP2rUAFDl2AB9Lj7SWhWMX0FbIshbS7O4CweXEees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2JBFIvU; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2JBFIvU"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65492d097acso207381d50.3
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928167; x=1777532967; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+G5xDeM2eEmKTciid+jelsafennvBZ1THzAZAjB59Gk=;
        b=K2JBFIvUOl0E0jwg+fD+fdJfJFVF96BoOssPBv6/9F/MPAOik6k3oy7xQn6e5mwfsO
         YI0yVNaQLCHXUpomsI7pV9OAnGcTglx118UXT9VHY04ZHbFFptl/wGkjHjfDUrG5suQ4
         7KipD+8fOpoWy6a2mKbqNw8wZFCe3yhHcQy8ps7Hkye4yTgFjIMYvAB691DTFg6ey2zD
         Yy0rJbw+CeEDRcK58EH/+OGToHvxRpIu6lvgxljgt5DMS1/fH/IzNTxkWaEmRzi4yRRf
         eZ0XQ3GQTNam2DFecM574dVFS48mufQibF2qjnsyuupTW7qf7eTmzicESZwM+IYq359B
         mZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928167; x=1777532967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+G5xDeM2eEmKTciid+jelsafennvBZ1THzAZAjB59Gk=;
        b=hilkmXeKPlsiD0CP0eLLfi/5M2YuinecxCo7eGYrihzlOdwOXPKYOpWN2sdBUeysQb
         apby0ibXxgcsbcwFPbvcr1QijwgracG0aLYy9TsNLnXWI0wr1WODCincdqEfiwnjdhks
         /yGFWqIJLZCf2pGI3NGwbEQc+ONONejQfiQidFgXGKEmXbJGG4uywSernr9Sg0jKaPfj
         Dvu/oBXGDt8MItA1mZZWSWs+WRCWC++9q8e1cNKzA2IW9QOHyBeUASBrefFlT4nlDRII
         4y9XdmRAd/RfpCONhclSM0S+pq0dJXuJdWqRArCNeDoy8mFCOzXiCswvSegD4x7jdsms
         ildg==
X-Forwarded-Encrypted: i=1; AFNElJ/by7QTIogtJMgckDPAVurHZNkoPN1x0F8uFFkBvydoYwzt2SAnTYsCLGQkMjLYq7M5PRfltU54q2DQiIoijB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYPCWP4Dr472qOPKcNznbkLfkRvCBwtFtkHBKSdj+49RZrIqMl
	yrBrPlwowIhPrUy5AQpeOKOmUZYBGUVN6PLQN/GHCxbH/uFu3ll9j7+T
X-Gm-Gg: AeBDieviMglImGtQvABV/iRscuBvvksVePiZ9diRnhHoaEqtwH7AdDoSmqGwpNy9CU8
	rZ7dV3+MKWXKGQ4pJwhhkGNbGVBDKUE+wYWb3EXFk/VD1PuCWS+YYijykR5fy4Rb1afVuY8O07+
	Q1DXf8ARgvvPUhuqM7wIhaayWV3SCQ5NkRLjULAB6bkC9eQUj4XuKGZSGlgLicY6YmXK0vUfdHz
	zGGlLGA3pRDNOqBIt/cZJuoFLTmLUSUeiCvih9LqK7jU3DhqTBEg3HWqw71JY1+2ShHfOIAjcOU
	I/iajKoBe5i4ZKr50r1LgdHmuD12fs0xzLVtf6FVpnSDfVPVIXCoXDfg5NPDtOAlSlZSMgmBnsO
	wYZnc+bc1+aw/WfV7k6oDLlb0zYBeeJPdUlPmJLZle4ndsZoDb/ClpRg//Q14fuXQMRv0yK5K90
	rUsnLgbaJ+SfHhgzazz7a/z+1oXBki
X-Received: by 2002:a05:690e:4850:b0:649:e871:3eb7 with SMTP id 956f58d0204a3-65310b03ee5mr15847316d50.57.1776928166757;
        Thu, 23 Apr 2026 00:09:26 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314e328d6sm8799738d50.11.2026.04.23.00.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:09:26 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:09:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chenyu Chen <chen-yu.chen@amd.com>, Ray Wu <ray.wu@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Clean up allocation in
 initialize_backlight_caps()
Message-ID: <aenFoICS1syeOPEm@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Just a small cleanup:
1) Remove unnecessary initialization.
2) Use the new kzalloc_obj() macro.
3) Reformat the NULL check to make checkpatch happy.
4) Remove the unnecessary NULL check before kfree() since the pointer
   is not NULL and anyway kfree() accepts NULL pointers.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/display/modules/power/power.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power.c b/drivers/gpu/drm/amd/display/modules/power/power.c
index 6c73fecf57d5..68b5b3b967be 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power.c
@@ -470,7 +470,7 @@ static bool validate_ext_backlight_caps(
 static void initialize_backlight_caps(struct core_power *core_power, unsigned int inst)
 {
 	unsigned int i;
-	struct dm_acpi_atif_backlight_caps *ext_backlight_caps = NULL;
+	struct dm_acpi_atif_backlight_caps *ext_backlight_caps;
 	bool custom_curve_present = false;
 	unsigned int num_levels = 0;
 	struct dc *dc = NULL;
@@ -486,11 +486,8 @@ static void initialize_backlight_caps(struct core_power *core_power, unsigned in
 	/* Allocate memory for ATIF output
 	 * (do not want to use 256 bytes on the stack)
 	 */
-	ext_backlight_caps = (struct dm_acpi_atif_backlight_caps *)
-		(kzalloc(sizeof(struct dm_acpi_atif_backlight_caps),
-				GFP_KERNEL));
-
-	if (ext_backlight_caps == NULL)
+	ext_backlight_caps = kzalloc_obj(*ext_backlight_caps);
+	if (!ext_backlight_caps)
 		return;
 
 	/* Retrieve ACPI extended brightness caps */
@@ -611,8 +608,7 @@ static void initialize_backlight_caps(struct core_power *core_power, unsigned in
 		}
 	}
 
-	if (ext_backlight_caps != NULL)
-		kfree(ext_backlight_caps);
+	kfree(ext_backlight_caps);
 
 	/* Successfully initialized */
 	core_power->bl_prop[inst].backlight_caps_valid = true;
-- 
2.53.0

