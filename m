Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4612E1D2
	for <kernel-janitors@vger.kernel.org>; Sat, 13 Jul 2024 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720868641; cv=none; b=l1fZnuS6NdxBR77NEr9SuyNTnfFyVk4gcez4bywRQVnQKY/lPNSJOLVfU1QT4FT/Ro+T72bWToin+tvkSTdljloR36Jp9iCuDdJnxVOGcICbeGI2tAJpm7yxSCwiUA11woJxb3ayYiJuSDC5q3sDMn2HIBkRsOzyhLdNQidFXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720868641; c=relaxed/simple;
	bh=uD7ddHPNCv9re7jh+GgSVnOkNYW3iWVk5/d0ybro+S0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PsahxNmMgtBCcjFzi9z4UE1bPl46iq8aWPvEtp3Ayshj6LqQGCMa0x8JAvx9zz43uVA2DdomWw2bzEFxDfbQJHSEOHUqT4LdVpHXL5t244Q1/Ywh8z1aG6xaGyQUJqCkJoWotMr3V2QBMYyNH08fp/e33SKaU+aD7Czu7aLe6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MHxueTaC; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MHxueTaC"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SaWWs33AVt4p9SaWXsZPUe; Sat, 13 Jul 2024 13:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720868564;
	bh=+95BoV2zMSWhEXD4+8PYZ6sPnem7u4o6Qt+9aNjgw34=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MHxueTaCXcUv0jTgyKWZKCmJIlffD84NUjpqOZ8OqbEnwBJtH5V+rF7Punxk7IET6
	 ZqMBhWXqQP7kq7CQGxPkxMxlDTdoMR0CBspSjjmGf/++DcXfsHNS2+HMbwXa0v2V59
	 k3+Qhl31MEpm+YZB5BpEw6XqGoEAsOBETdt7v78+M7xGJnRqaWWRJlYNkrEFaY94OX
	 08oZW/s3KQPBgz5/xdfz9H6tiH10TWu4gltfYNFEm7SBUunqBcmYGuWWAX+vpmISxc
	 eQSszVUtEfW64RlVeY1eJ4UbqKI/vOM8JvR1mfrhF6dgVoFiNFlZI7NODVRLzeixJv
	 Im1okBIi0e6eg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 13 Jul 2024 13:02:44 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] x86/resctrl: Slightly clean-up mbm_config_show()
Date: Sat, 13 Jul 2024 13:02:32 +0200
Message-ID: <b2ebc809c8b6c6440d17b12ccf7c2d29aaafd488.1720868538.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'mon_info' is already zeroed in the list_for_each_entry() loop below.
There is no need to explicitly initialize it here. It just wastes some
space and cycles.

Remove this un-needed code.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  74967	   5103	   1880	  81950	  1401e	arch/x86/kernel/cpu/resctrl/rdtgroup.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  74903	   5103	   1880	  81886	  13fde	arch/x86/kernel/cpu/resctrl/rdtgroup.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index d7163b764c62..d906a1cd8491 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1596,7 +1596,7 @@ static void mondata_config_read(struct rdt_mon_domain *d, struct mon_config_info
 
 static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
 {
-	struct mon_config_info mon_info = {0};
+	struct mon_config_info mon_info;
 	struct rdt_mon_domain *dom;
 	bool sep = false;
 
-- 
2.45.2

