Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCE3C2762;
	Sat,  1 Aug 2026 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611439; cv=none; b=gRNYEsaB3sPJLw+cBagQnLTn5n6hM1PqMiwQcaPjK4yJUsoojIXqx/rkmWsvqTs6C8vDpriVYMA/DEpCE9Uq8IvAbptc9GCt92BCYYD/7HJSSm23HNMRcLSvOBmrChTSzfQSjUhpp9ivmUr7HwmWrgipZKGYGMCQ+8IP76zPJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611439; c=relaxed/simple;
	bh=kyOzMz7YOKH6vNzfCY32ALEWj9AYpoC1w1b5LlerG7o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QZYYCfjUNFijtI/Vda9vnwMD4ppXwhGFWlcKMOVvvtOhGnpiM+urLJv/QziaopiA1xHvLl+cIHwcMxU8xyk5Q7HKNkElOD5EY4F4RSxOjtq9EgZ3wvfXfCnJaggdncP7FRncIvWQXJ0cVUeBEFowBh+lmgNMCzQimXcKtl/ejJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=QM0r4+rW; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="QM0r4+rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eGNzqQoF4RSNQLvpJf4olM07e0yunhY4ZG6n3gv0Pbg=;
  b=QM0r4+rWXtHFIynievF2F36tTDpXJJvjv8QAnmZ7jiVtuoGatIQlIEBm
   p2YlTSKM4oY/5WVNY/Cgre9K7+yNZ2e70oeNLleKJTJsjqgx/PzylTWV8
   gix3DdaR2VdZn6ghmp6Uol1gVH823uhhEosB3mrPxXbJa/UsCydBPvMP8
   g=;
X-CSE-ConnectionGUID: 0W+Bu0iYTbyt4Z338D48tA==
X-CSE-MsgGUID: eaIW/iH/Tm6zTtu7JyXogA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769010"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Lyude Paul <lyude@redhat.com>
Cc: kernel-janitors@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/bios/init: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:54 +0200
Message-Id: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a function-like macro expands to an expression, that expression
doesn't need a semicolon after it.  All uses have been verified to
have their own semicolons.

This was found using the following Coccinelle semantic patch:

@r@
identifier i : script:ocaml() { String.lowercase_ascii i = i };
expression e;
@@

*#define i(...) e;

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index b54f044c4..3f888fb97 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -403,7 +403,7 @@ init_table_(struct nvbios_init *init, u16 offset, const char *name)
 #define init_io_condition_table(b) init_table_((b), 0x08, "io condition table")
 #define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io flag condition table")
 #define init_function_table(b) init_table_((b), 0x0c, "function table")
-#define init_xlat_table(b) init_table_((b), 0x10, "xlat table");
+#define init_xlat_table(b) init_table_((b), 0x10, "xlat table")
 
 static u16
 init_script(struct nvkm_bios *bios, int index)

