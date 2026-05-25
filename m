Received: from smtp.smtpout.orange.fr (smtp-82.smtpout.orange.fr [80.12.242.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BF3D4129;
	Mon, 25 May 2026 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697968; cv=none; b=QW6Xtcqr6e4IlkUKhIs8gispOYl+EieqQIyCqnmryHg2yf3gNa6NbP47Ztlt6KaQyah7bWcEYkj7q4wGTu8bLdba2tWPznPw2ndCwruow/5gEaTO26nBq3+B1JlZhXu4V8J1uGKFrq1fReekzvRLVLvSeF/2fwdkHkuFp6DpNfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697968; c=relaxed/simple;
	bh=5yuYm/M+I4rP6YnZDJ3MB/+tx0UKjJT+VUdbVI6lnY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+T+1BW9kgx7EDNogLoRBZSYxleq6Agf97FxkUYgCNXWghzRNwseBgPZYVnTjM0opXxOo4l3HZLWoj3a1uPlen7g3tOvcoB3gqVpztHWunpEiCVFntSgro9+J+DhRd7s9c6c4vtYBm1ORrS9AokNqzLE/nvphZishlE2dMdg7GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PccIQ2VK; arc=none smtp.client-ip=80.12.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PccIQ2VK"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id RQjiwSvJZ0kQyRQjiw1ip2; Mon, 25 May 2026 10:32:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1779697957;
	bh=Fnk8oA7PB8/6xVAhw25jvSyQJRQLIGQflxrmLhnBdRo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PccIQ2VKyrevZzrYIjYqBgNLh9cFAHJBttmCptFv6GX/GwQvirJXgUxZL0/513jAY
	 cxm2+F+6ESHC8BbVDrlkd0ZGrjqrkjyPzuUCG2kM9kArfiFWsZa3w7xtkh8OiC0q5Z
	 J1p0qQLq0DozgcH3xy8++i12iGnF+0fBTHOkwZKlGuA8Q3n3B350jJT9bih7Drq/cg
	 r5RfekM2wO0Y9Bt5etPVy+OQ0Ebo4kIvkZcFm+8L9NGGwUYB3pBJNcsdyTAzR5bOvg
	 6uCmrxjIi1kDnHurGkYzecdHh5t+HszuQSL1I/45o2WHpqoePRuUcs8EsPQApZXhMl
	 B+AJvpUmBj+Zw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 25 May 2026 10:32:37 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: optimize psp_copy_fw()
Date: Mon, 25 May 2026 10:31:35 +0200
Message-ID: <e16b3b7bba06c6c9b4f0577b23b25cf0f5045fda.1779697857.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In psp_copy_fw(), 1 Mo of memory is zeroed, the partially re-written.
Save a few cycles and use memcpy_and_pad() which avoids writing twice
some of the memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile-tested only.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 665a2632379d..9525a6bab33b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -4586,8 +4586,7 @@ int psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size)
 		return -EINVAL;
 	}
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, start_addr, bin_size);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, start_addr, bin_size, 0);
 
 	drm_dev_exit(idx);
 	return 0;
-- 
2.54.0

