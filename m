Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E438F649
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Apr 2026 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545171; cv=none; b=APEhsszLz52Hr8L7NCz5025UVqUR/p/NmmFhfp/gexUVM2UInot/+23KsYCtvwFG9vU77vcRNeLiFi0BLwFJEANWT5L+ZQ4m0VyF+YZOeVPsi6RPIKjhq6bV1FcjFXPZkbxK7iIqQ7AW9tpFAgVvYRQsy4OUXOPMJM3a/dhkCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545171; c=relaxed/simple;
	bh=bBcpBqNdkL3GPcxQ06QpROEKI8JaHAFAoMDpbmSmwlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ca28QZ9XGhZPRIafEPifrsC52j6TrAEm2ml11bVKsajFoE0HV/fyP/MU8iMJ0W5sZ9JvWntl1UyaZ/fHBGB9YM2Gp5Zxw+wuxfpNzYAzplnBQAbYbmqyQ/LskoDFPWWY0w3wxFBBTc3OGK4Hmr5wjv1JBDgBOgEvKSM2AvisI8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZkpfKIE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZkpfKIE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfce3a195so2808090f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Apr 2026 23:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775545164; x=1776149964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQDoymknzN02+yzB9HgAmTahnsrc7TSfCPMON3BQVeA=;
        b=IZkpfKIEtJhLvAD19wHxxUlqKY5LMt7jZxk6vb94toRlEBLRX6UPxJqSUj2McNJbRB
         2IURtxwOl97DNV8GemW7STl7IVvMXrY8DY21BDLm/XfQLYpP0aN3oUxZoWiZ4404Buou
         y/fKuXlu0p6sc9ERWFy88Y8rXLYyJy1CLJZ3Dm2noRLp/bFzYdRExE4B3lcuNs/5DCzK
         wOfn3c2dD2zaBkiPTcuQrcw9FQUxNjtCXHf7Wl6bjXaUVfXEPlf5uAtQTy82qVzRSQ1q
         IhRZ1K1bKqx3jD4s86ViMr1rwji29y8YXJ+Mx0GNohyFthE3vrXOQC84t9CO73Z2TvX7
         kMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545164; x=1776149964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQDoymknzN02+yzB9HgAmTahnsrc7TSfCPMON3BQVeA=;
        b=k75QDrsfQUp3Pjtd8/jGXPZme84UkH8gQ/x5Y8NuiVvaYADy+276oV8OWXq/zUoJIa
         Zd6SYokwVK2Cbys9cjwvDC9Yq50dgFLSZTiYV1wWAy8/mUmqbgLZjXvfTRcJDMSyj1FO
         G4pZ0zesgUQCL3owwRfVw3izb1JWIxLDcR2P0PPXk+VdSPqnDgMwO6z1HHB2P4NYWsuA
         Qd0iyfAYbsE/LkrFjQiUWYpTUVNjqQfzSINNSvz7B2U6whlUa2wa9YHAMTKr6SU8LCHN
         0HgsSJAfAUUQIni0TRLYlAh9mQjfU1aM2VChRpao4DLbOYhyzxU1frTRjzIDWejs6rvv
         bkhA==
X-Forwarded-Encrypted: i=1; AJvYcCWwdtbRgSek050OEzT5bNKXZ2zpdtjbyueLDvO9T7Cmhn6IZhjbpJBAruUT8eExr/5C6gZwrQPDocYG3XvpLGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwus3PD3hpKuOntCQcy2eh4neNckwg1Y0pFjd1JSQiWFW8v7D
	FR039vaEOUWl0qfa0pgAr7iXdH2jeGJA3wGgIOhH1qxCBagmyutGl4l1
X-Gm-Gg: AeBDievDYTgfktEhd5yXBMsKO9asikWtySQvQxViU2xJSBEAjFEW4qv2cy40uxGriFp
	7dHSASNyIoQBf/zFWgm71QHyD03tOFe0UEHMPtfgx1mlRlyi/KycB2mIrhjr2u3rc+c69xgaqUV
	28QN2MrgGGAdwtDfhuOBA5Kwa1+yJNiqAogzk8Hsh6v4y8P4tXtM2pVhxau3ECLRFB+iR0XoRq+
	k3WHeEm8ywn1zDEd8rpf2RXUKj8ce/FPdXWKK32J9sQTXxHKZqIgXoFvGL8IOvOBgpzknhkf/Ik
	4pimzgKBRQwIJbcWEPj7/+Ty+yOwXRf1R6A2Y2TzHgEhYLLXF8Dj7RURpc5eC71Q7f2CEFC6sgv
	M+IzMXK7IrU3AAguvstZzVfuRdiOebAksXVp3MSCv81Fu6a0iM4yfu6Tx/ANCOTzSbuzc7A0ZHA
	8fPj5DuCbDNSs4sJkOUw3M/BlGqEfFxQ==
X-Received: by 2002:a05:6000:208a:b0:43c:f81f:3e6f with SMTP id ffacd0b85a97d-43d2927f3f3mr19248494f8f.8.1775545164387;
        Mon, 06 Apr 2026 23:59:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e4f5294sm44326818f8f.35.2026.04.06.23.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:59:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	initramfs@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [PATCH v2] vfs: init/main.c: change comment and pr_err: opening /dev/console may fail
Date: Tue,  7 Apr 2026 06:59:19 +0000
Message-ID: <20260407065919.3246787-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is for VFS.

Today comment on console_on_rootfs says that opening /dev/console never
fails. This is false. The opening may fail if /dev/console is not
present in internal initramfs. So let's update the comment and pr_err.

I tried to fix the problem itself in [1], but the patchset was rejected,
so I will fix the comment and pr_err instead. :)

v1: https://lore.kernel.org/all/20260406090815.1495095-1-safinaskar@gmail.com/

v1 -> v2 changes: changed text and also moved it to pr_err (inspired by Al Viro)

Link: https://lore.kernel.org/all/20260219210312.3468980-1-safinaskar@gmail.com/ # [1]
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/init/main.c b/init/main.c
index 1cb395dd9..daf115d08 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1645,13 +1645,15 @@ static int __ref kernel_init(void *unused)
 	      "See Linux Documentation/admin-guide/init.rst for guidance.");
 }
 
-/* Open /dev/console, for stdin/stdout/stderr, this should never fail */
+/* Open /dev/console, for stdin/stdout/stderr */
 void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
 	if (IS_ERR(file)) {
-		pr_err("Warning: unable to open an initial console.\n");
+		pr_err("Warning: unable to open an initial console. "
+		       "You likely supplied your own internal initramfs, "
+		       "make sure /dev/console is there.\n");
 		return;
 	}
 	init_dup(file);

base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4 (mainline)
-- 
2.47.3

