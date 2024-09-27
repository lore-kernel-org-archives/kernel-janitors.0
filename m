Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBE433D9
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727428962; cv=none; b=Ilo1Uge+ac6oqWDBpZEvYx16HHpgWrRA7s9ZY2fdx7mhlp7F16tSFarBIwhi3OqxTCyBhUNRL36WSQBUWKPqHdDmBgumXXFe9tIDOmcnRWMtxGqWdz9fQnzDCzkYqHbgd6TRebalOpvZ0gAkf4W3kdt2jFRvsquBbGYTWn9UCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727428962; c=relaxed/simple;
	bh=nUpUWNBamg84qW5iTRwtodgh/0RU7dlLqiD9L8w4Y9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=isLO0dJIq5SALZgfYqx9fJ8AK4r96tJORX9p3ZuwiXeBORZYpxzdiKFMl1xJFG6AixUZVoQgQWHflSppND3RDuFuUAvNBTdHrZUo3FM6IsLl2BGgW+SN1ybWVoA94PoyrE0h8mImaSMjpLK/XwNOkO6tX5swZ9VWlq9PkiiNnDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=apfziwkn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="apfziwkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727428960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=;
	b=apfziwknBtr+WIYItHgLf3ZQzODAaXw5/VED5GLVg9mQaPj1ikmr6a5I6CrMy74VUtZjTZ
	jKbwvReYECYU3WOSk683RDsv2Sv+Bn1kP2XQ2z/7qiq6YKZ8NR46NLpdwsK+4ORp2PaZsl
	TOa7rGTuXxk33D1VMh3flhQWGtS+hmk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-VvYQWe83PkWXMDP4zaoJtw-1; Fri, 27 Sep 2024 05:22:38 -0400
X-MC-Unique: VvYQWe83PkWXMDP4zaoJtw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb33e6299so14102035e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2024 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428957; x=1728033757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=;
        b=OtDOCoo+qeMAzb4ntso9rQ8L8OmA8X/NAoHwmdagsH8fasVGl9eLZJn6c/fw10l1sh
         Q7fmZyvljEFOYvp5LTHIwKPhK7CchoQ8GDmUn44jTX5LxgLHbvCtUM3lC6t+nVCuK+Tg
         q1OGPDv8MBzLXcuAdkvd1mRjoVHtWR9DEGAZOF8woxbx/dK1gYsTJVZ3PdO4X7THJwvH
         uDn1Pfg22krmkFbTTEdSgviAnctPFWoPzPGKEOT+Q9UfFBDY5T61Hz4EW6CB7hoHbNsT
         49yaN0vwmLfZ7eNZpjJyuUtoUBGiowCdjVblRRpKibUQu6JhgcWT9FZWJG+J9Cgvq5TI
         VHJg==
X-Gm-Message-State: AOJu0YyTptc28sfjjLhJXeJDPvXucNULQmgvHEmHERIcEecy7UCfUoQ5
	nj1df0A2tB3MmG4ZI/jztnOl/Yh0dwM1Y1bJ7H9h4JhEljJ4g83Aar2wqc8V3M0j6tJyPnIKQEe
	jaR1gTUIeZubBXcj9nw/r6OZqx6nH/0KFGFdv7hRfVvGD+/8OZO77BreQzBfDDNealA==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr16809115e9.26.1727428957284;
        Fri, 27 Sep 2024 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJWCF/p5auGwFMcVVPbMUAZcGcxwmZH59KUVxG01mmgdWdNTVcOZrU3cbtQVowAR5ZCeffkg==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr16808955e9.26.1727428956917;
        Fri, 27 Sep 2024 02:22:36 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddadcsm68540605e9.7.2024.09.27.02.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:22:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: mediatek: drop two dead config options
Date: Fri, 27 Sep 2024 11:22:32 +0200
Message-ID: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow
module build") adds a number of new COMMON_CLK_MT8195_* config options.
Among those, the config options COMMON_CLK_MT8195_AUDSYS and
COMMON_CLK_MT8195_MSDC have no reference in the source tree and are not
used in the Makefile to include a specific file.

Drop the dead config options COMMON_CLK_MT8195_AUDSYS and
COMMON_CLK_MT8195_MSDC.

Fixes: 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow module build")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/mediatek/Kconfig | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 70a005e7e1b1..486401e1f2f1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -887,13 +887,6 @@ config COMMON_CLK_MT8195_APUSYS
 	help
 	  This driver supports MediaTek MT8195 AI Processor Unit System clocks.
 
-config COMMON_CLK_MT8195_AUDSYS
-	tristate "Clock driver for MediaTek MT8195 audsys"
-	depends on COMMON_CLK_MT8195
-	default COMMON_CLK_MT8195
-	help
-	  This driver supports MediaTek MT8195 audsys clocks.
-
 config COMMON_CLK_MT8195_IMP_IIC_WRAP
 	tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
 	depends on COMMON_CLK_MT8195
@@ -908,14 +901,6 @@ config COMMON_CLK_MT8195_MFGCFG
 	help
 	  This driver supports MediaTek MT8195 mfgcfg clocks.
 
-config COMMON_CLK_MT8195_MSDC
-	tristate "Clock driver for MediaTek MT8195 msdc"
-	depends on COMMON_CLK_MT8195
-	default COMMON_CLK_MT8195
-	help
-	  This driver supports MediaTek MT8195 MMC and SD Controller's
-	  msdc and msdc_top clocks.
-
 config COMMON_CLK_MT8195_SCP_ADSP
 	tristate "Clock driver for MediaTek MT8195 scp_adsp"
 	depends on COMMON_CLK_MT8195
-- 
2.46.1

