Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209404085D;
	Thu, 26 Sep 2024 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727382005; cv=none; b=WXzxdQLKJdByqLVZ6nQ89Uuw2LKa8kQZNUnaEdq0fzYDn4lhmRByArk4HpV2Fp2IOtlJx6ByBWFtpQvSSZcwSXbZDVMEyUlNTzQhCWA4gDnTnd4SGDv4Sv8II+Dnf97/05lbHYbhWBfXVANL/USpEQawsi9S1WlhOvRh5Jd5vrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727382005; c=relaxed/simple;
	bh=On6sHClqJDzPaLDcLYD5g0f7vaeqok+armajZPidrnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVySIdahGeY4u5Rlg4ZD2qpFDn/7zVgj5PG863nmi9m1QSH6buU28Yyx8KbDkZUQ0GLLfjU/V6rTLIyq9cdDgf4pqqrqiJS4VP6z8o0SzPWrs+2GbtPkRYKQNNUq4c3ioNz6Dd+ZRi2LH0t1ejb0c5HhSk+BQQjPhdq5s0Y0QwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hRkBhslq; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hRkBhslq"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id tt3dsX3A8c4tttt3esKcJe; Thu, 26 Sep 2024 20:17:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1727374663;
	bh=/snz1yDzwQCYPptNNf7N6Jlji+ecO3fr+UccY1kwzIE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hRkBhslq3AQc5Ot6Nty9PrNXCbUhYkEerpI9NXKQgdr36suwH9AHQilODZswcuU/X
	 jDCnGOOT0RapB2TTeGdDiW8tmxd6Jt9ck9zvBYbFetCei2F9QuvtwIUSAuxMB96jVy
	 h11uQrDutwVlb0BIZbQ4IchpHPyBKlocmGRA3eQp5J20YMHIfwW8L1vVNljsC+JZkF
	 k5QUaWyfCaMChI5+WtohYRCimTaEo1+2xrR9/AZ32q1Y37WqrNQXEE0kt83HvFpZBn
	 AjbYqst/Ui+rJ843wsMuWeO9ULvuHJYf/dii8fvl7POarq5mpJGfiISAjp8ERwdnTu
	 Tn2Nk1wg0s4xA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Sep 2024 20:17:43 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: mixer_oss: Remove some incorrect kfree_const() usages
Date: Thu, 26 Sep 2024 20:17:36 +0200
Message-ID: <63ac20f64234b7c9ea87a7fa9baf41e8255852f7.1727374631.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"assigned" and "assigned->name" are allocated in snd_mixer_oss_proc_write()
using kmalloc() and kstrdup(), so there is no point in using kfree_const()
to free these resources.

Switch to the more standard kfree() to free these resources.

This could avoid a memory leak.

Fixes: 454f5ec1d2b7 ("ALSA: mixer: oss: Constify snd_mixer_oss_assign_table definition")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

For the records, this patch is a clean-up effort related to discussions at:
  - https://lore.kernel.org/all/ZvHurCYlCoi1ZTCX@skv.local/
  - https://lore.kernel.org/all/20240924050937.697118-1-senozhatsky@chromium.org/
---
 sound/core/oss/mixer_oss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 33bf9a220ada..89b317c728b4 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -901,8 +901,8 @@ static void snd_mixer_oss_slot_free(struct snd_mixer_oss_slot *chn)
 	struct slot *p = chn->private_data;
 	if (p) {
 		if (p->allocated && p->assigned) {
-			kfree_const(p->assigned->name);
-			kfree_const(p->assigned);
+			kfree(p->assigned->name);
+			kfree(p->assigned);
 		}
 		kfree(p);
 	}
-- 
2.46.1

