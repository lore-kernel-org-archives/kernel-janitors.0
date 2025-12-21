Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71420273D77;
	Sun, 21 Dec 2025 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766330046; cv=none; b=u3d99xfaM5l8XqRQvO0mzLhygX1EGCfDaLFNlq5t82Ciy2UA/rrIwp9YHugD1ew4uK4iyb9I5gtpE+VMr8MAydheqQT01YCUK4A7pCo5oH3sp0CDeajLEOT6rYPXcvT+O3YeR35VbY8wkphPwnQMXJQojyeQOueAQK/T4JCGIVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766330046; c=relaxed/simple;
	bh=kyLDU0C5KYfFwHRXswXpKOyfgnlSjZP3TSZURVyu3kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UfyY1wlFSQ5q90TvAnl/9kj28QhaQztGEail1lErSZXuUEJd6s+jJOQ02odOgyyXRQrRN6ockXSwXcRvBd5cAhXlywyYt9wkPyG8w1B310T2lZT/hE0kATKZP336XvaC54I2DTuMKvL2A3p81JkLLHi2kJGAvcc0QvTrm0MtDsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ToXsPb/m; arc=none smtp.client-ip=80.12.242.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ToXsPb/m"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XL84vR0u8rrflXL84vSmXB; Sun, 21 Dec 2025 16:13:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1766330034;
	bh=SYW2hJtmsJu1fQ6navI6sVhjRiv7DvFk+6/et3N6fQ4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ToXsPb/mk/2g2FZNK0oCulTlZW53NRZrv5tiXodV8tFAbS3j8vTXm8a2RKMECt8aq
	 UGR/P5oPhWyFl5C0MevAKgi+qfHmIv9j77dad6Q1MkcQqaMML5hKn3HffYaqrTlX2t
	 5gsyTYPn/A8POqFNejQv5t1gLT/oKa7zGVPOKufMKXytaE1CBjInCC8Bl91uFd0kS4
	 Cs6axDDUjcuxbPk5HWq72L4F3ZvDMOCybkDmWVLPoDDu534zkIiVika5sz7tWfFgEN
	 wdMpf5rA62tCd+cKUcfvwJIUhmjj53xdbGZRo9hnXZVNaJzW6WxalIccFzF+wi660l
	 chuktzORaoO2w==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Dec 2025 16:13:54 +0100
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
Subject: [PATCH] drm/amdgpu: Slightly simplify base_addr_show()
Date: Sun, 21 Dec 2025 16:13:48 +0100
Message-ID: <66adb62e93993ac0a70fdbe174908c36a560b98d.1766330018.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_emit_at() never returns a negative error code. It returns 0 or the
number of characters written in the buffer.

Remove the useless tests. This simplifies the logic and saves a few lines
of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 20d05a3e4516..b44f0710b00e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -888,22 +888,19 @@ static ssize_t num_base_addresses_show(struct ip_hw_instance *ip_hw_instance, ch
 
 static ssize_t base_addr_show(struct ip_hw_instance *ip_hw_instance, char *buf)
 {
-	ssize_t res, at;
+	ssize_t at;
 	int ii;
 
-	for (res = at = ii = 0; ii < ip_hw_instance->num_base_addresses; ii++) {
+	for (at = ii = 0; ii < ip_hw_instance->num_base_addresses; ii++) {
 		/* Here we satisfy the condition that, at + size <= PAGE_SIZE.
 		 */
 		if (at + 12 > PAGE_SIZE)
 			break;
-		res = sysfs_emit_at(buf, at, "0x%08X\n",
+		at += sysfs_emit_at(buf, at, "0x%08X\n",
 				    ip_hw_instance->base_addr[ii]);
-		if (res <= 0)
-			break;
-		at += res;
 	}
 
-	return res < 0 ? res : at;
+	return at;
 }
 
 static struct ip_hw_instance_attr ip_hw_attr[] = {
-- 
2.52.0

