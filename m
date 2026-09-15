Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA904A8A0C
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490263; cv=none; b=RPHjeHi8eygTfylvEzFtF7sTRClEtf0JblIUXVKhRuM2uqpdMwFGJUFe0BI3bvALKb8hhEwFFtpUB0l795B11JfUA2ocDuq2P8tJJY4efjOuFCC4yBGDB0V1yZh63UhQH31KteV2m510xU/b8LoC5xlxX7fFXRb4sf+vcaBGIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490263; c=relaxed/simple;
	bh=7Qxt1wD+w9m61t6EWvJaklYaWgCtdrsUC+CGZWyWfDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbIErMFfN8q0Vt0F0Pbvm9EocEloRA7K7p3LyRUx1nTRTym6UaEpOJpoky3BzFHgjM8mtVPpwO8oQwpeEBlDBn698WsjsmfomRtslm7SK79zHHXpENffUNTDuiJH778EfCUeEAceVroJjC4FBqMSsV17ZLz3PhDrmOl2xr+duCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUDjOURx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUDjOURx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so125655e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490260; x=1790095060; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nm5rOlIrEcg8aEx9ayIxOdzc2+zyQmd9qJF3zn77mz8=;
        b=HUDjOURxlOsY1g871U7JVWZ/J86WMauLmz8BDUpTP32UDY122n625c+XAGXVMB6BOd
         UGXNcvo+QSrf+rM5ODZi1vSqQxWNNkSnedz8h5be46J0zdpHGvaFC0S/WTHHwWG+cQxl
         0p6y7paO7jWCOJtGMn8AS2Y+LBk1BMNN0T0jALOZGDYKYz3MHN2W1Avqt4DkVX0SMUlO
         GgVWzUcG2XRTgF2+scDP62vop0gmunHnxa3wpLMMDv2qSgBLmgIoX+3fJqrZKPjcpboy
         yguJxYkn0Nq19z14T5gOSx3Ope+5o1KjFFDA0wOIuhuKD10ZmosDe+P5KQK5L2hAD3+c
         H/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490260; x=1790095060;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nm5rOlIrEcg8aEx9ayIxOdzc2+zyQmd9qJF3zn77mz8=;
        b=0+mNRPI/9RAvKkJEpu03hcWeNfVTKgcS1iRdcCpL9WgUagfwdfmjyJ6F6huO4mSaQ2
         z6Td4JdaroCcXSHJCVXaMSaBKnWFikrEIrsIElctLDBm4CEs8WicWmSFkyrwSJ4RLbDL
         1a+eKpYWna3XNi2SpkgkJhA44XpNfB9b6nlfye+rzApu9Rj97eSBO5C5M3VUCsNQvkkF
         j75bVEFeR7jUvvkQw/I7LZ3gTATYW6ZxtciM7UE54pY/dcN54yciUPi8h5lt48RIokCE
         B7HwmZbJo/3yop8TF9XnYhqB1XNW0AZaxIfUSMZlZkfRY261lHkcXiyqzKc2TJRtaH4T
         Gbsg==
X-Forwarded-Encrypted: i=1; AKwUvBw/5zPW3q7+ksz5eHLeiUr6siqfmo4SD3SUvgDOPuAItlmVigOkn28zNdYEhA/g5iX83cm1l+2zaJFbLVfawEk=@vger.kernel.org
X-Gm-Message-State: AFuF++mKEM7l9RiKG3JOKfQQlR9/Zj+cS2V091ht0wsOfsbqfuF+8TOB
	TeT6mVfN/874lxp0MlfFTF3BuxmxHUMxMIk90Z5cRHf2xq45mda7B0rC
X-Gm-Gg: AYBFou16rDFfwEUvhFgioDxKfkz6WumY4cAzTAT8fDdjBKyJfHSEBqnnuA5S4RmCZWx
	TdcRKtCV7FtC/juL1vfAzckrSMCcI4uVac4Hu8cfVObRu0Svvj65P8Pie7gb/PtIlVOxTn+120M
	iUwVPTsefp3yly4KG1L2Wt2hsrkozmAYwrmrTRKTGdsn1O/DnH+iq6SSWY0Q0qSg0lIKQvbHOiZ
	zraksMVjE3w6krZmGwAOhEKUteXKf/xQSjtddL0hpGpKJqIYrgfZeK6wbvyYxoATWcP+kGpJZgE
	okXbYv3bj9H7sRQbT8C1t8jfgDURyc9o7G03vRgd36q3SIDlXWy247tjmOz0l6HtdbTbvbPyKDz
	DjosuMdljQ5Y63UfLzBq/V6kDcchT3nlBKkodvx5LzyBeE4x7494rT7DgbVxy5Hf356qMGnoBBQ
	fXAksa3KWJLODPu/jXgc3pVBwmgo3NUlY1IAyRGvWKAoXH1TqcuuXrgio0OE3MERini0o=
X-Received: by 2002:a05:600c:8716:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e7a657f9dmr229988985e9.2.1789490259811;
        Tue, 15 Sep 2026 09:37:39 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc368fsm177635e9.3.2026.09.15.09.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:37:39 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:37:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/ttm/backup: Add a missing tab
Message-ID: <aql0ULKgvUzqxBn9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This tab was accidentally deleted in commit a8efc69a65fb ("shmem:
provide a shmem_write_folio wrapper").  Add it back.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_backup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 0c2d53a13b2a..658eeab73255 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -160,7 +160,7 @@ ttm_backup_backup_folio(struct file *backup, struct folio *folio,
 		if (writeback && !folio_mapped(to_folio) &&
 		    folio_clear_dirty_for_io(to_folio)) {
 			folio_set_reclaim(to_folio);
-		ret = shmem_write_folio(to_folio);
+			ret = shmem_write_folio(to_folio);
 			if (!folio_test_writeback(to_folio))
 				folio_clear_reclaim(to_folio);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
-- 
2.53.0

