Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD63C3C16;
	Sat,  1 Aug 2026 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611445; cv=none; b=rCY/mtILT7MnPw/bZRQYBBu4Gsib2RqrYp42nbHQsawxuSwuAvqusYUuQp39vjsHos/FpgNGiH6jyLCnHYtjZ+oI11MJpYyQLb+abq57Q658OQe3c/uKND5ga0YUZTETgRU7ObYkcjr6HbeAUH9MPNLdp2EeZ4vAG89Azl0LBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611445; c=relaxed/simple;
	bh=pz4kmCHSIV6it6xE4nrJz3JTrDpRXjjDr1ZHavlVwjY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D1jEkYGkuTBnL4vxXxMCdgVqslATBRBcFtc3TrNF6h4CknkBfmP4ja2Qf6W4HHD5Vkgj0w2VpVRIdQjEWo+yXLrIe42k7DsNlsf9wG/xU4uetpnBwMjC2oDT590okiUOrPg6iiKq+uD6pejM2Te7I2Q+QHlTN0nwGiaUMzglqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=e2vHcGMN; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="e2vHcGMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hwqKHN86kUjxnhAhuYevx8dXWkRDkbo98+BmPVh1exA=;
  b=e2vHcGMNJFg0p4v5lUV+p+NIi4aRRKqszzbQL1mAvav0ZrY1A29Z+I7E
   83AOMKywsv28SXHZKLGERvCupzEg+3iDru/lEUae0WOxdpfn4ayqtfeEt
   XLnzfAVxvAFUGw7e0h7sZgnGVz/tHOhHpUi2La/vfH0m1q7hWgiD2iTcD
   o=;
X-CSE-ConnectionGUID: V0V+VGPUS+2oDIqhWM7zog==
X-CSE-MsgGUID: ERS4RZ+NTgKt8Vi9oBrmbA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769013"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8940: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:57 +0200
Message-Id: <20260801191002.1383835-11-Julia.Lawall@inria.fr>
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
 sound/soc/codecs/wm8940.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index e631ec072..229252363 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -333,7 +333,7 @@ static const struct snd_soc_dapm_route wm8940_dapm_routes[] = {
 	{"ADC", NULL, "Boost Mixer"},
 };
 
-#define wm8940_reset(c) snd_soc_component_write(c, WM8940_SOFTRESET, 0);
+#define wm8940_reset(c) snd_soc_component_write(c, WM8940_SOFTRESET, 0)
 
 static int wm8940_set_dai_fmt(struct snd_soc_dai *codec_dai,
 			      unsigned int fmt)

