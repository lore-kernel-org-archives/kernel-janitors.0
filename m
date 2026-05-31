Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E73451D6
	for <kernel-janitors@vger.kernel.org>; Sun, 31 May 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780222512; cv=none; b=pkp7CQnvzNORBzrDz4P9ojp+h3YFjDgCWkPZ3m9NXxQwdWqqMtmjOr63E2/tQWMsu3hE58CR5/sPxWBmWKSQ6QwiK50V69nmR5W61imE8uCFQwhAcxrnji/Z+bzB8EKDF0Xff/0ZXdGD01FlWhhLRAn6QY7KJdJssvUwvOfT7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780222512; c=relaxed/simple;
	bh=tw6peRAwz6RNPkG0j82Xv0xrb4KelQxz06G1Eke2tUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kUOh530hj3oOZjwpd7IYFViJW5CMOya2zEFlvInsVSqARq6D47iaEwPrgqggVu5zAfaGjx/beXqnSMvR2QQ+7gxezneVPkLkyJKh8FkN1cUX9JZPM4FV4wf+6vCbWd/ohGsUbGo+82XhxnwuheQhOYNqzJEWvOGgfNB05cvHDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HODXJSec; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HODXJSec"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso80866985e9.2
        for <kernel-janitors@vger.kernel.org>; Sun, 31 May 2026 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780222509; x=1780827309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1ZGEeNCdzdVrX3fZ7vKd89YDyLp8nWy8sViWIJqhtc=;
        b=HODXJSecgn2PlsSbGdB3TottTV7qMwysTCnhNQhVML0wiAuD+LVFWsCo2byHs9/UaD
         V/jhHJOPxzts+ZahTB1YhWKl34ZhEvwWYREPprb8zweqR8Sh7uf73o7Dh749HHPdldVe
         nBTNGIePWjdgpMO0FWE41/4izbmHqDN0PpllSW7/o0X5c4epfkbLIOIywUsu9+0KrqYy
         PP3d3afTS1oQpNHGx2/l01jFZscq4U1k4SFXrPqYuNIesTXqPj7ZDv4YtQ07JAspf13E
         W9QkrYDXQePjkPiW1F2JfdoWa6G2aTLPb1O6YTdrMq82nvtUE/NucvIxIxYyxUofavXN
         F4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780222509; x=1780827309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ZGEeNCdzdVrX3fZ7vKd89YDyLp8nWy8sViWIJqhtc=;
        b=fzfGGg9rgHVEjRngDF4BW5DO+e/rud8EX8BM8CVvArHKeyrv4NavvPXnCx6an51XuJ
         ZCM4iZo+KT6WxNXssHI+9cRaYsONEwvlx7p6YDWghOZy4KolU89SfCmbMhvje/PqEXk6
         vHECrZ+u4qZ9cMscBEa92pW6k+//i5s1JcRFuXEXTTqA/ihyYfXuYzn/OUg801yrCX0v
         Rp3de3WjEmRkT6VU2mjla+o55O3iUlXx1Nc4mCj5iImvd+S8wrR/CKLqRdPxs8ovoNCt
         PgUFeY4sO1b0jeznXZRtq8sDgZEzalTjqg2Ds6xYvnC8TbvNPdm4RZUvuyx85lHFdaKh
         QAgA==
X-Gm-Message-State: AOJu0YyX3zukpkV33sZCITa+EmGz6S0lS9WDxoKQduXy52PPgC6VNQx3
	UTOst0BxITtNh73EXbwnhIcqvN4iWXAsghBJ/R1tkNlzSmICubEhk+cr
X-Gm-Gg: Acq92OHOZDl3TjK6eQg8YkLGurv3RRO2aX/7UHrt0SC6/RNQHcu2+nlP2aYA6Xe4/rJ
	nznb6jhcsSRLqxkL2wMsVWWzOHa6jK1s0Yspq6xpgykBivwmKvHTZlsKpPKpzDTb5XhGzAzfgpN
	kUlMYiAodB2OhOs+WV0hcvpUNoU05O2zwUwTTL7AioG+EZWHkO5V2WX2end3bViWgABE/TEXSxo
	5G27bbJni5k1QAdQy6laT3aq2yyJbLTCzwUcReWjcV0VLZhNNNA+DYcbxTLQTPCntPYJ3v/tuPB
	myDApMci0aHJRDUGoGb/qWuTRcoqtmilRc6fLld2n2M2W4ffoOZjNorVu0rttZfOmfbx0WGkpWf
	pzGorwPHSXHA88IIaJYKUCfz2SEBc/ucXWYhjGP5VloKaWYas0qh2+5I+RyuzvbI1anQtXq3OXq
	ap1R3lc992rLGxuldVbCM4VuJK55zA0YOj
X-Received: by 2002:a05:600c:13ca:b0:490:845c:a1ea with SMTP id 5b1f17b1804b1-490a2953c87mr76925765e9.21.1780222509065;
        Sun, 31 May 2026 03:15:09 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0a89sm197038165e9.7.2026.05.31.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:15:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: hda/tas2781: Fix spelling mistake: "Froce" -. "Force"
Date: Sun, 31 May 2026 11:13:39 +0100
Message-ID: <20260531101339.42155-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a snprintf statement. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index d243baff95a7..0efc476abe8e 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -593,7 +593,7 @@ static int tas2781_hda_spi_snd_ctls(struct tas2781_hda *h)
 		return rc;
 	}
 	i++;
-	snprintf(name, sizeof(name), "Froce Speaker-%d FW Load", p->index);
+	snprintf(name, sizeof(name), "Force Speaker-%d FW Load", p->index);
 	tas2781_snd_ctls[i].name = name;
 	h_priv->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_ctls[i], p);
 	rc = snd_ctl_add(c->card, h_priv->snd_ctls[i]);
-- 
2.53.0

