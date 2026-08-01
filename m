Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57D3C0A01;
	Sat,  1 Aug 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611426; cv=none; b=fCSMx7gBlAQKh0eQE0xCE9b7whx2odxc9/d6rkG/RBWiqF4zLQDSsxfUu5E0ugnxOz8BtlhhEf5liVzLNr3Jw0L7NRUi0rZIh6hwLxzsAVP0sE0XuxRY6WO/aAdn8oKV30u2V84BRuQccTFPHFTgPfCysOVhnjLpAQ0pZvwJ95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611426; c=relaxed/simple;
	bh=mKcrJmFzoXkCweAj363aSn/924DEr3tCAssfq1PdgSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ElqQDU/OHaOsutuUxOtsMS2lYw8X8wvFzHsb6sW0xF2SCI3A2QX0qjNVdIe9YaBVFg2Crfo1+iB5+rADeVfQN0ti2WzRM58Xykjc/Y5RxGOHy4qWHnZGpB3ijwJPBCHZKVaiWMEqYL74qvWwJyEHoAqaTl59CR/XO51goxeoN+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=uQ/jeTFq; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="uQ/jeTFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yF601NjEGFWfrAvUr4oOGdQWQoFukPqbdgEm/oEss2Q=;
  b=uQ/jeTFq42HJ15dBh9GE+PeoyUPJV893teMGoMU+tFqmcVLotZHYPNh6
   aKkuaKduKTN4vBRa5RyKRonKtC/AeZORWYdn+MTc6tyhzy6enWGoT6ynv
   vlNH8u8bKhVeKkE/bvKxXs3PrObyUk6OgNb0nxB2cpGZ5R/FjshL842+R
   Y=;
X-CSE-ConnectionGUID: KXZwmDrlRvW4mPIyIg5elw==
X-CSE-MsgGUID: +4xIFoETQmmV4CeP/cPfxQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769003"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Michal Simek <monstr@monstr.eu>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] microblaze: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:48 +0200
Message-Id: <20260801191002.1383835-2-Julia.Lawall@inria.fr>
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
 arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c |    2 +-
 arch/microblaze/kernel/cpu/cpuinfo-static.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c b/arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c
index c7ee51b09..1cc3fd984 100644
--- a/arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c
+++ b/arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c
@@ -23,7 +23,7 @@
 #define CI(c, p) { ci->c = PVR_##p(pvr); }
 
 #define err_printk(x) \
-	pr_err("ERROR: Microblaze " x "-different for PVR and DTS\n");
+	pr_err("ERROR: Microblaze " x "-different for PVR and DTS\n")
 
 void set_cpuinfo_pvr_full(struct cpuinfo *ci, struct device_node *cpu)
 {
diff --git a/arch/microblaze/kernel/cpu/cpuinfo-static.c b/arch/microblaze/kernel/cpu/cpuinfo-static.c
index 03da36dc6..1e4d30b6c 100644
--- a/arch/microblaze/kernel/cpu/cpuinfo-static.c
+++ b/arch/microblaze/kernel/cpu/cpuinfo-static.c
@@ -18,7 +18,7 @@ static const char family_string[] = CONFIG_XILINX_MICROBLAZE0_FAMILY;
 static const char cpu_ver_string[] = CONFIG_XILINX_MICROBLAZE0_HW_VER;
 
 #define err_printk(x) \
-	pr_err("ERROR: Microblaze " x "-different for kernel and DTS\n");
+	pr_err("ERROR: Microblaze " x "-different for kernel and DTS\n")
 
 void __init set_cpuinfo_static(struct cpuinfo *ci, struct device_node *cpu)
 {

