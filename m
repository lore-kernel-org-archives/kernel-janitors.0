Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F90B2405ED
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304532; cv=none; b=jAw+Z9GQ+tDGUmG5ZQrNTK+dQI+efq2XUctkYN75S1wDoBABvW2+UFzh5N7vXCz+LrMUUUoY/TVyb2uQtjS0ks0cDwJVMLDDhTsAqt/LGyNwf7RSg3k1vB/D5E15HKJFiAtZHaI25nafBRXY7vlWDcEwemGhY9ScEvUnFrBHLZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304532; c=relaxed/simple;
	bh=O0Yq9b0ntIV2rXwmu5CJkLogXD7qjpje5XMHRfj6JVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uwt72KwpUJj/1KFF+50MJD6bv2lSZ0e8Y5TVyd0xvfiTA1NXQ2ofzNTJMMhBnrCC+UPnxUnVmLa5u0nWWuAJJ+xjWCL3afT6uk0YZTA2BZqWITQICMSk8d8SBQMaVjxKy1sUwJS5fpFrsLGTTOeGa4dcKLUJKvE6yH/HQ1XewUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5hLClOT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5hLClOT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47117f92e32so17968165e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761304528; x=1761909328; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjnWrdwJJM6Xkd6ejbGWp0lF4mtBxwGKExhzOcwx4QM=;
        b=Y5hLClOTg1UL71XBvkW8/po2xRWzMClQMp9JrbL/Lz3mlMCyE69j10hJCGrpnSz3oK
         tExai27nKFNjcHXOkjK406JWs5UuosvuLLNyD8csfMpk5wpZLrMh1K1rrKVx2Cp+5iwf
         m3fYtTUCawTlRa2iuF1WiPcnZHzJuWmNut60pEgjQxXs16QYPx6YZIuILkj5JLjsA+uk
         O9vVNyhgy+CKNezJbeRifmsvmQNRr2WXKcEmNLhYducHgjYY8JBPhfRcoQezf6/OoDDl
         38AZh3NMBwGhP4peaTiefBcpU/g+fz5wOdMoCjWusoHkzV4BJRLWytXEFZRn1nsU5xyG
         SuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304528; x=1761909328;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjnWrdwJJM6Xkd6ejbGWp0lF4mtBxwGKExhzOcwx4QM=;
        b=AOigj6CIZVFcOff3oSUGPt0o4+FUTowh4HMs2QI59J8W0R4Fo+vQLjjE4SALEmGd4U
         Sh4aAmIpcJGZGjoPujWus8+D51h6BrSjtbDG1NOGD4o+V3LXyBCk1T8fglof40L++b0K
         IaC52Xm7pg76ZciZEMA6j68jFDku6BiX8a9rPAwVQeoBGk4VvRdNJVwxTzCmYXdU0yJg
         CghNOAaEHQH/4c63N3p3FS8r8W+6wQVECvAUkKIWeuBv9nwpu2PuxKEUYHIHCwjLJfw5
         LkZFhhq3Oohsd29ORv+q2ZHVlOflmrjar+dH4C+mCxYIVEv35a0lxlHoHLoG3HFtMVDR
         dpSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnT5vF5oB+5D5rwEk/HpB1ZGO2DRFjHPJvrWd/G5qkl2IYD9r/bFeXO9pyZp8BRi9n63ZI1cBMlNhZQm5s9nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZcm7VG/4MtGgxpc31kb1apkk3twk3W25YkTotcAUFqxcPjDD
	R7WXam+2bEPj0USUyVB4eYZDytt4OBafUOUQyUZXrBom13k7Wl5ih6cAucxPW4pXzJw=
X-Gm-Gg: ASbGncsJec6bi89ByBGVNNE7hTg66bATtc1vyytsN1LfPM4emBTdlkYRRaKtiKM3lwX
	eFhJ9donhRHR/QYts9oTtXhxMrrbt39RI3xlt14yn5qBcTTLwuf6iqJJS2vLw4Cx93+bLeENP+J
	V37ceNczSLJxsNcUXWxSF+0LtdgzKK1J325x6leketdHEDuQDRYRIVwukJatNjIcIPiFZvq/lyH
	6rFsbpHapb7EQZkd4LQNc5fFBkT/cIh0dMRG5Vq7oETKCtvZq2vOwnOJS/tXZ/n2KwDYjLpcPZ6
	qX82bos/SIH5BkB4KTJl4tSkXLLEj10hGKGWj1WHMP5SvmQM2wO5W/iI08DmTzbWNUMtiFU/0ol
	lCUPw5XTZgyRTVr44EZWcphaYERKunGQ1lFydKPXwdxazoSn+EsnPuu9AykRG/8r8WGfRnGPawH
	4XgMRSkA==
X-Google-Smtp-Source: AGHT+IHppQw7OhXyE1vh506SaVqjXNUIJ+8VzvhstGEr4RfM3xhdsHlPAMgvjfWhOUYwQyK4GXMIgQ==
X-Received: by 2002:a05:600c:5287:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-47117876738mr245432555e9.2.1761304527664;
        Fri, 24 Oct 2025 04:15:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429897f5696sm9120866f8f.14.2025.10.24.04.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:15:27 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:15:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/vkms: Fix use after frees on error paths
Message-ID: <aPtfy2jCI_kb3Df7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These error paths free a pointer and then dereference it on the next line
to get the error code.  Save the error code first and then free the
memory.

Fixes: 3e4d5b30d2b2 ("drm/vkms: Allow to configure multiple CRTCs via configfs")
Fixes: 2f1734ba271b ("drm/vkms: Allow to configure multiple planes via configfs")
Fixes: 67d8cf92e13e ("drm/vkms: Allow to configure multiple encoders via configfs")
Fixes: 272acbca96a3 ("drm/vkms: Allow to configure multiple connectors via configfs")
Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 07ab794e1052..506666e21c91 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -204,6 +204,7 @@ static struct config_group *make_crtc_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_crtc *crtc;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -219,8 +220,9 @@ static struct config_group *make_crtc_group(struct config_group *group,
 
 		crtc->config = vkms_config_create_crtc(dev->config);
 		if (IS_ERR(crtc->config)) {
+			ret = PTR_ERR(crtc->config);
 			kfree(crtc);
-			return ERR_CAST(crtc->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
@@ -358,6 +360,7 @@ static struct config_group *make_plane_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_plane *plane;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -373,8 +376,9 @@ static struct config_group *make_plane_group(struct config_group *group,
 
 		plane->config = vkms_config_create_plane(dev->config);
 		if (IS_ERR(plane->config)) {
+			ret = PTR_ERR(plane->config);
 			kfree(plane);
-			return ERR_CAST(plane->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
@@ -472,6 +476,7 @@ static struct config_group *make_encoder_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_encoder *encoder;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -487,8 +492,9 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 		encoder->config = vkms_config_create_encoder(dev->config);
 		if (IS_ERR(encoder->config)) {
+			ret = PTR_ERR(encoder->config);
 			kfree(encoder);
-			return ERR_CAST(encoder->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&encoder->group, name,
@@ -637,6 +643,7 @@ static struct config_group *make_connector_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_connector *connector;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -652,8 +659,9 @@ static struct config_group *make_connector_group(struct config_group *group,
 
 		connector->config = vkms_config_create_connector(dev->config);
 		if (IS_ERR(connector->config)) {
+			ret = PTR_ERR(connector->config);
 			kfree(connector);
-			return ERR_CAST(connector->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&connector->group, name,
@@ -756,6 +764,7 @@ static struct config_group *make_device_group(struct config_group *group,
 					      const char *name)
 {
 	struct vkms_configfs_device *dev;
+	int ret;
 
 	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
 		return ERR_PTR(-EINVAL);
@@ -766,8 +775,9 @@ static struct config_group *make_device_group(struct config_group *group,
 
 	dev->config = vkms_config_create(name);
 	if (IS_ERR(dev->config)) {
+		ret = PTR_ERR(dev->config);
 		kfree(dev);
-		return ERR_CAST(dev->config);
+		return ERR_PTR(ret);
 	}
 
 	config_group_init_type_name(&dev->group, name, &device_item_type);
-- 
2.51.0

