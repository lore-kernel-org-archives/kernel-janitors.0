Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5E2DE1E0
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708929; cv=none; b=MT2yTRyi1n5Sbhb0bL2uaj/ZyU9QyNjFjjk4kHjjt5Vcui0LzZfBkyX5VFc0AxdoY2MXZ7SCEp7DlUgh+8XU+wN1PfP1oca94QnFlHMkOOqgX/qqzVq9nPQ5x6mP1OV4C4GvjMVD1bn4SNYkge2IJ+mwLcnrzExD/jcjcrASeEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708929; c=relaxed/simple;
	bh=/Q9vCOreIoGjql+sVyN91PZfur9aXF/T51feLqehc4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hws6ESJZ0zW3u1FKw4AkaJZu5h3g4sc1obE/pUDdjie0ClWT0S0xv1gh0Ie7NeCmuGqBIoztV2u+0qZ5uIw2WycPyjn7BE1yr3Ttbosr9CjJ6/IPlkd7V5kxPoTFurspO/YxNrDYWCEgJ4O9K1LuNnkdgDqpuuzw2FtsSkNMc1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH9PCkV5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH9PCkV5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3fa528f127fso605994f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 03:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758708922; x=1759313722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOhc0Qxyul5wC2rt4MIQkux7LNfnaT0nE4lQR+NyZBI=;
        b=TH9PCkV5x+RxCdN7VoxYvAurJIrZhR20pr1r7UqewwPKUazge1Eqf9tEfFAjFjOk8d
         1MBogDvLU5QpoDHgHnOLxxVFIfe3V+tjwZWhIGfv/JWN2CxwR91KLxtXOZjjg3WV7q3t
         T9ueIsnX7i5WdMyV0NlAB63/Di08TNfQl92tgYyqAcsmyE1/p7fAdn1W5R+/dX2jR3nV
         98gXMrNbFBdbyx5lRL7xD0yIFKkNn39v3OwClULVyvp3h7C9r3UTpYUSKWTbx5HDwAJn
         qPVnRcelacyly8DQlYU1kacXBtFDYirmgqKhgQ/8fkfeRMGgjwTBE/FTEux1Db8faiwC
         UFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758708922; x=1759313722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOhc0Qxyul5wC2rt4MIQkux7LNfnaT0nE4lQR+NyZBI=;
        b=Y/Whgz/nGoZ1v/AyHZLRIB+e7JrRRfX0Dk4VQRz0TGAiKOZkW+fYSdZNx4b9nBcMQV
         rHZersnF4JlEVGG2UW74DYANjHAmG062wL9X+6j6L1AHZwcG+YAChI2eVgy21TYaA2Rb
         Uckazz9Ph69jM3gVnfacR5Q8znRD8RSwkeL/fCDrktjtGvni18MHgePdD4gLw4PWpFPD
         aHDG93MuqhpNHlT2sfJtDfdQEJf14w9jFCNnV3oyy+k/7BQZDdU3BeAOS9vHBJlOLCTN
         VCwU7y8wVU0th3Z89ccMbcx8wnxcwOI7VbAxw8MnGot/xQZ7eIkhizL2oMpqZ1+sv9Z4
         goew==
X-Gm-Message-State: AOJu0Yw3u+m4GKzB38wWEeP+yvGvh0Hs9+hcpfpc87JYAm43UGEQ95WR
	DrG91WYfuhI5zHX4NBo1VMUC3LJ8LP9IK4LdJdHgi2yYJJQsOvZIbLfS
X-Gm-Gg: ASbGncs8RMsT0ySqkmR0szZssl/VFcUT+yM7nVIMkwT+GSzUZ5VwVU8eXJ5q2/kc7uq
	PxSLC9860yvwabllFFZ0WtoXd1WzMH5lDLGkgPxjdBE0PM0Mwno7+oUVNTx6aeL4cHJLW2kGl8K
	BN+/ymprd7F6oF2lc5Z7eP7F9hDWOptfhil3lpwGUmbUQYYOZjtzL/y8afAE50MUN0T0aB7i//O
	wOQh3AT7xKb8H3vi9yOOyOtUVa2ac4xi8hksjiPd73SF7KCwWgyFjCGdGxxl6+SeQr5vXYcx6mQ
	YMOOUWn7JTxQ85+oZAZhd48VvVwumQUpPz66bPsHbM27EuzO9qpAFkaf7HmfWp+GW8N/GxCMJ8P
	UkhJUputK0a6HAx/Svd1OKw==
X-Google-Smtp-Source: AGHT+IEr/rY8DYnEgjfNqtZnQLYi8AIPod0JxD4snpz+21wUk07dSh+fVo+u5hSxKvTeDXsJt+uDWA==
X-Received: by 2002:a05:6000:400f:b0:401:c55d:2d20 with SMTP id ffacd0b85a97d-40ad1604b9emr1380003f8f.26.1758708921561;
        Wed, 24 Sep 2025 03:15:21 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2ab31bdesm24993385e9.11.2025.09.24.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:15:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Badal Nilawar <badal.nilawar@intel.com>,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset
Date: Wed, 24 Sep 2025 11:14:32 +0100
Message-ID: <20250924101432.8689-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable offset is not being initialized, and it is only set inside
a for-loop if entry->name is the same as manifest_entry. In the case
where it is not initialized a non-zero check on offset is potentialy
checking a bogus uninitalized value. Fix this by initializing offset
to zero.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..4f0a529caf20 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
-- 
2.51.0

