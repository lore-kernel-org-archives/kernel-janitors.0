Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092BC2D3A93
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055948; cv=none; b=ExeryFZ0iFRdqviCgb+OeKs4gAPlwTb9KIe719pTUy/iwuHlFnyyol+h54Yy4Voiqw69NluAoa/EGTzqCHYL6Pnc/7Gne3RFcZZ8WbolekiGzz7jYVdgWVrmRteoLC8IFARZ5iUFsYXT6ECOt4aIQ7dUUy7eZAwylQhRrLddFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055948; c=relaxed/simple;
	bh=tnQMkTzE03lhvxMEpHsQ6eE+3vyOLg3SNOxgNnmIPgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TeLKsz9hWGDVm4VKD4xsKVMyVTSPAPrHmagrgQ14xjAOabvLhl4xbYB+H4nEe2orNbpudL9RyUGUBcS+PphGQh1lEtsGwEtDLJEjHOmNjY3E+xnYyar3g3LQ7cCdMuxTWh0lHEeFqbwzbtCm+K2wssPKdRZnL8n9fjHd/+HVHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx02Br+A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx02Br+A"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so7590205e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055945; x=1784660745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmXhBG5qfGiwm5Sxpbw0Qfvk0I/spud/+tFxZ2U3z1s=;
        b=Yx02Br+A151uuug46yTlV6O5fbbcQsXLV6kH6oZDdGH/ei0v0Gv/SB6sd5w1L8LrrQ
         NIUcf6H1Fns2HpCxqT7zLxuW4IEm8wRwdG4S9RBRPBiDbBzauR/d0B7Mb8/qec080i5a
         69vmZI0nmwx+zkolWX3rxCLHAGn9kLGkJOJ5hwFgvET17wAwBQepWLvqtVDuYFPMbCXi
         YpA0Lo9wyLUrlRYhqriM/rSYAasNzSCteXq3F3cHyoqrMyEZP1SyJ/exUmsc95IYKLtV
         8QOajBuTIQltzGVbHVoxIVFCJcmZ/FiwnbolgDMqJWx8KNs2WqCIUXqryM5K9zgX2n1s
         L3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055945; x=1784660745;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmXhBG5qfGiwm5Sxpbw0Qfvk0I/spud/+tFxZ2U3z1s=;
        b=LF3CcRj0BtlAHF9OtrKfg8Uc7wSj9at8beaUZb/VN1X/zQ4drLaSFV99hr3fM2fqOO
         7Adji5o/TYEmCRjDy8znHPXDnTNyAo3uNziTteXtBEYVJWcuTUuhKgqztyOrwiVbg/9c
         FyK1D8BYsJgdTcFMGaGufTKSSr3oQTwyyioFdNlyVH1TwqlJJi9Htl7UDQBQ/IRrtPDv
         B/i90kn4WxxTSSmTQubsnV+SmDK18/IJHDPoWtm4uf0dEVDfLMJM4OTbE8MKyTU32QM+
         Oaf+TO9brc4uj8JUhZiKEw7H7eDM807BbRtpmdFEWmQUJQtJheZNrz3TGCOdeE1vS+EW
         BuPA==
X-Gm-Message-State: AOJu0YzZLFYHJWq+BEjUNANkzlrIivfQnKknN6bUu6GpqPLfH5Bhq83C
	duZhLr1LPRQDnXKsbmyAx/g4ghn/v9KC6RyxaGvqgiOSuegDDcH5qTJq
X-Gm-Gg: AfdE7cmX0z+1ElTfOGB/r+sMy5Zi99phsjDx/VViTBRYoWCErrkp+9n3VSzOpjMjhlH
	qVWsKXADKAjwjIvUB77rJWSo8sa4CfxqegJULfSMGehXSBbRca2sI3WWAIAfytqGQqWmqZ9kUS2
	uyNamEwRNe4dAi0EtlXZ1GU7KGO6/p2EoGByRcVWrts8P/JmF3JNff4QSzFgIbuCjx3zJ9iU0gU
	Zk5t4/I/+ddYOAmZWSQjUiNY/K417A1l3YWldQcRC1TGJMhFWn5RJXkoW6IDy14flogDCo4RgOk
	K//6xspROA4nFXkdD4pDGBVKphsnmmujJgYUFAb15ZWCU/eDf90GkdB3chMwiTYSn9rkLENP07B
	SwausjI7ISYwFjY1MAC2wHOBWw/whJdDaSqEeHCepkMdYxBEvo+3pomHz2dn89CZBvHd8fwa2tp
	2jtZukQ3lc7N8=
X-Received: by 2002:a05:600c:3f06:b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493f881de56mr142657415e9.23.1784055945154;
        Tue, 14 Jul 2026 12:05:45 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2e8f07sm86192295e9.7.2026.07.14.12.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:05:44 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/bridge: lontium-lt8912b: make read-only const array supply_names static
Date: Tue, 14 Jul 2026 20:03:59 +0100
Message-ID: <20260714190400.194605-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array supply_names on the stack
at run time, instead make it static

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 729b12b67470..62eabf0a3b88 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -673,7 +673,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(lt8912_bridge_pm_ops, lt8912_bridge_suspend, lt8
 static int lt8912_get_regulators(struct lt8912 *lt)
 {
 	unsigned int i;
-	const char * const supply_names[] = {
+	static const char * const supply_names[] = {
 		"vdd", "vccmipirx", "vccsysclk", "vcclvdstx",
 		"vcchdmitx", "vcclvdspll", "vcchdmipll"
 	};
-- 
2.53.0

