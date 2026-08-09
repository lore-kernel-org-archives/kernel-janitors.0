Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E1218EBA
	for <kernel-janitors@vger.kernel.org>; Sun,  9 Aug 2026 21:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786311163; cv=none; b=ZtRmRFjdCeDgDAzdBQDakmFcAkL3nu8Q+RhL//qOjYFgpDXVwpgQbIORYg9jU4AYa81GYP4nZs5Ok/eFT58mQ1O5PWyK/+NbKDCZv8Ek8EGHxEZWTDzn5sm2AKDVANQ5sw5QuQlOivXmQ3qp14WiaiM+KXn837qpTXPH2Ekl5gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786311163; c=relaxed/simple;
	bh=hXi4MgfqSeDHP4/fZLS5j6DgObI7unNmg55pmGu92ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X07LvJjQKUfvLxq8op47TfOCOoY/SAyJFvbbW+68xR6lM4wCl6GNGvwBXHSL5blePYSzS2IynOXCqSpTkliZjSOrDcVuMoiw8bDQDvYtcYXkusZxjPr7Xk6GxR7BUb+UlzqRqQLxLUFFx9UTQ7y3BLZP+7ILfiWoKb69OH81yFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Y3Q7S0r9; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Y3Q7S0r9"
Received: from device-101.home ([IPv6:2a01:cb10:785:b00:6128:9b8c:c203:905])
	by smtp.orange.fr with ESMTPSA
	id tB8FwXYes9pEKtB8FwOlFZ; Sun, 09 Aug 2026 23:32:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1786311158;
	bh=LlvXqzXWBzaAx7QObLJEX4IVjZ6j8+ayStcW0evZzpw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Y3Q7S0r9mIWdd0Wkg1ylkoirRDr0ogORR6MUb1EyVtxmhbhpsMrNobFiot308OVQP
	 ZeznCuupkRG7tRP6r4SrGc9EvN/5O2RrClAtN/w1aszs287Z1hMoWq7rs4N3qucaez
	 cYSPWQg2/Vrc/Y1CC8kAIP5TdaRbwZai7EQOXlwbEczYfeCF8Toj2lPfLAznFeKx6I
	 RpnYA+3uYp0BGnKJUQAOkMu1/rVAz5YYW5sJuBIpaCLPOrJhcRhVbqbxkDOebQvcu+
	 bjO82TGj0gPBeMr3IOJ8LK+VudLiNkQsev73ZgfA7cJ0xfFZ6gIQTl3+3dqB6Qkww1
	 kdZrSgTLdt4hg==
X-ME-Helo: device-101.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2026 23:32:38 +0200
X-ME-IP: 2a01:cb10:785:b00:6128:9b8c:c203:905
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] x86/cpu: Constify struct x86_cpu_id
Date: Sun,  9 Aug 2026 23:32:25 +0200
Message-ID: <f08d3a0e7aefe3bad66251927cbd03b8cbf9df73.1786311119.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct x86_cpu_id' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security.

It is only used in cpu_has_old_microcode() which is an __init function.
So, using __initconst is safe and will save about 6 ko of memory at
runtime.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  55725	  28774	    512	  85011	  14c13	arch/x86/kernel/cpu/common.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  61464	  22918	    512	  84894	  14b9e	arch/x86/kernel/cpu/common.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 arch/x86/kernel/cpu/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index fa429f04f003..fb6ec831d250 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1427,7 +1427,7 @@ static bool __init vulnerable_to_its(u64 x86_arch_cap_msr)
 	return false;
 }
 
-static struct x86_cpu_id cpu_latest_microcode[] = {
+static const struct x86_cpu_id cpu_latest_microcode[] __initconst = {
 #include "microcode/intel-ucode-defs.h"
 	{}
 };
-- 
2.55.0

