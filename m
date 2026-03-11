Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF8C145
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Mar 2026 04:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203605; cv=none; b=cfhZWNxxM7O6uUkQolCVwfZSGUMUb106nu7zppOh/VFioSNH2tmdQ+6x6V9lM+DYHqOIgDXb46Upk3TBAghChnNdP1n0HoUbgZhuQwkAqzJPNp+9JlCWYAO+0a1MYpcx/mguQG2F8XDy2n5V5UpgCKmkSHCWXTf/jiNEDhhIuX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203605; c=relaxed/simple;
	bh=Wq4Ip34SDaoH3rYytnMKXLAMNzBwEXNh897YyZ/0r0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bL3hfAm/KyDaka023p6pPVYvwpIDxUy0mawPxIMzPspokNGBwgJUdSfFsmafO283+uiEuWg/qemjIN9Pmejld4ighR7nmSqRcTUbci5zcacCiLWd62vuhlxpBdeTArWm4Q+yi5/q92vFj719VSk95aCzvYehQLGhFwbZTWNlLHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emx/6GM4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZakfYa+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emx/6GM4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZakfYa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773203602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oeRkC7gWGdq0E7I8LmqbFac/w9ZeQGSINVcW5xDZxvs=;
	b=emx/6GM4pDmyOksXjgyRMg5PIoEuZXdrBz8eBMahZOsGGQ4gP73NoHEXDBZoUNekR0lu41
	xYTQchP5DY+oVBGS0JQC2U0GfWrNAZ+tnVEPy/Ug2y12kfD6QWalVaS7DyfnsZSr4gb4BF
	95uGo8rbicH0YP0P+hKm5n02A096zZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-VZFpveyPMZWekZls0P5ddA-1; Wed, 11 Mar 2026 00:33:20 -0400
X-MC-Unique: VZFpveyPMZWekZls0P5ddA-1
X-Mimecast-MFC-AGG-ID: VZFpveyPMZWekZls0P5ddA_1773203599
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso32552735e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Mar 2026 21:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773203599; x=1773808399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeRkC7gWGdq0E7I8LmqbFac/w9ZeQGSINVcW5xDZxvs=;
        b=WZakfYa+1P9ymCAFH+ZiOt2IzanckWUMqEoWTtB1aklZlAqApJEUV0O1Xdk2a+OEPF
         cdOo8z7mSsI7eND/V0NC9b1cHsUJZh9SW8F6wvoeaVXtMEATHPCVlsLeXqfYxoCxZOKf
         +l6rSJ5mLCcjZkrcbBA7AQDk8BfARyelle0Hq6iIGc3/hHr5qzlZ/nslj3M+MgvpnB/V
         BrY5yfEqTcmDu8dT1XKPJUxEZ/qZWvov7ySUx0ztEKKg6HFxqnvttaWLyR9yxWBHdDCt
         TuYa55O5Rkt0yhl5HmMWmyMWCr21vl10b5TH6scvjWHVw+WSfxLQFEoYOH81OUT0jVmJ
         acCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203599; x=1773808399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeRkC7gWGdq0E7I8LmqbFac/w9ZeQGSINVcW5xDZxvs=;
        b=DYR4n6TXIjWXO2QQpuWkikLJkdpPbr9NjqJxpFRD2lrxn0ZA2OS0PXKNFomRA4EL9l
         bNBX4imtOyotk9GyjEzXkwOZynf8etYCnj2IwAzJ23Sipu6LhccESak8UlgCMrI6POKm
         fHsYBppFvXO8263qqefGc2HbvKDhARuta5UVLZF9vJ0DIpkCui5K0mGxkKfDCow1NQHD
         G6WFmCfmTZ7ZaDlmzZSzOXHhxqFbo4t9qwTkko1jqCXhkeA+Y9522mENzytfMk6YF6sV
         lP4hjAuWZEbuq48rEMCp5/l6OxhjdqSCmML8S/ejFQS0Vl/DGWucfkiaYZVHseP/5M66
         ukqQ==
X-Gm-Message-State: AOJu0YyGATc9VyQDdPwAcSzYCFblXcTznuNgpXw6MLD8cIf3LhZYIvrr
	HrIC9o+jXFYVMK80cwOlbRLW1zIGSBdX+vW4aU1If3D+dq2WuizZv4GDQAlCwfAsRAUJkd7Pxrn
	fLpOSMptanJxYTpZUcv2ZPwL5hAmD3nyXeX8Qmuya4Xz3G1HigvbuRr0nMVhI0BrMqevlbA==
X-Gm-Gg: ATEYQzzqL5TE7Kb9dgKn1/1GF99a6BxBa7+DNhTINpoxBscsbsvxsTnr8DG1SwQYOX1
	SngDO4ptpyIJnP7Rzyo/48xJExDT+K4WWC6aADUHcvNTrbZlhlnpeDkCcIxzfh1mNN6pCEX4q7w
	h5rs4dZk+mQ9LKoeZR6TiQfCBIeKMvfriL5XD7NvoXD//uY2iQ89/JLHP9p3Sv7yYJgNNiypxNq
	jm76Ift2aTj4bKpLvW7EX75Oszi/17BTvXK7H/E7/he0bVlOOIZOLsEXrPBMs1aX5k0f2HPMZ5J
	M/EwivSr8zNwugQ2JYNZaksWaGEBqIKYMVUykWXWNkXnfXqxfgXVMtvLLAQDhOiGzTjLCp+sPQ3
	NnEz5ykHiyxxo0krkrZS2q9BMY/b8ZlmxPvwp9m2cLgTAKVtAiWpo8G0tMtt1H68Cg1n9ZWs=
X-Received: by 2002:a05:600c:a010:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-4854b0e705emr20583465e9.11.1773203599532;
        Tue, 10 Mar 2026 21:33:19 -0700 (PDT)
X-Received: by 2002:a05:600c:a010:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-4854b0e705emr20583165e9.11.1773203599058;
        Tue, 10 Mar 2026 21:33:19 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0b95f4sm12438785e9.5.2026.03.10.21.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 21:33:18 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in GPU BUDDY ALLOCATOR
Date: Wed, 11 Mar 2026 05:33:14 +0100
Message-ID: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The commit 4a9671a03f2b ("gpu: Move DRM buddy allocator one level up (part
one)") and commit ba110db8e1bc ("gpu: Move DRM buddy allocator one level up
(part two)") split the majority of the file drivers/gpu/drm/drm_buddy.c
into drivers/gpu/buddy.c, with some pieces remaining in the original
location drivers/gpu/drm/drm_buddy.c.

The commits also adjust the file entries in the GPU BUDDY ALLOCATOR
section, but as part of that, change the file entry to the non-existing
file drivers/gpu/drm_buddy.c instead of keeping the reference to the
existing file drivers/gpu/drm/drm_buddy.c.

Make the file entry in GPU BUDDY ALLOCATOR refer to the intended existing
file. While at it, order the file entries in this section alphabetically.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe2a6e548169..c847d05e6c27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8946,11 +8946,11 @@ R:	Christian Koenig <christian.koenig@amd.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	drivers/gpu/drm_buddy.c
 F:	drivers/gpu/buddy.c
+F:	drivers/gpu/drm/drm_buddy.c
 F:	drivers/gpu/tests/gpu_buddy_test.c
-F:	include/linux/gpu_buddy.h
 F:	include/drm/drm_buddy.h
+F:	include/linux/gpu_buddy.h
 
 DRM AUTOMATED TESTING
 M:	Helen Koike <helen.fornazier@gmail.com>
-- 
2.53.0

