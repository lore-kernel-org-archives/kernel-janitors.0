Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F497610A
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="t3VEn56I"
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2EDD3
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 00:20:48 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id x06DqqqBCvx99x06Dqyxs3; Sun, 29 Oct 2023 08:20:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698564046;
	bh=MDsDuhCr9olbw0nTq2ub5nqlO4/+Skgqu55qCR4cVX0=;
	h=From:To:Cc:Subject:Date;
	b=t3VEn56IA1ozmNuyAqXus1ROpaXMxRPzyaxwLbtPDKkv1rCqfILUjVpGwY5GimzS+
	 semo9phsAuSxLBztVY1VPDi+iRtmwM+VSBCqXn3Z0O4eyA8k//AMqKexA5uvtMGszG
	 VtVjtZTvQrjcb9W6KDxwn4aZ+xdjXwlIjPJijmhXYwr+PoFcLLohHJonM6JG6OVFmd
	 jCU009uZPxDSWkgnGLA8QJAlhbEw6ELCo/bgLkAgorOtMOFT5csSclgdPGFQTmUwEq
	 audeq/OkxTsFvQkCLer/LqyznHYzAWWfMVPJUWCa8MEen4vNoGXKJ79nZIBNKQXvqz
	 3DltTAecjWGeA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Oct 2023 08:20:46 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Fix an off-by-one in get_early_cmdline()
Date: Sun, 29 Oct 2023 08:20:40 +0100
Message-Id: <9f66d2b58c8052d4055e90b8477ee55d9a0914f9.1698564026.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ending NULL is not taken into account by strncat(), so switch to
strlcat() to correctly compute the size of the available memory when
appending CONFIG_CMDLINE to 'early_cmdline'.

Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/riscv/kernel/pi/cmdline_early.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index 68e786c84c94..f6d4dedffb84 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -38,8 +38,7 @@ static char *get_early_cmdline(uintptr_t dtb_pa)
 	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
 	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
 	    fdt_cmdline_size == 0 /* CONFIG_CMDLINE_FALLBACK */) {
-		strncat(early_cmdline, CONFIG_CMDLINE,
-			COMMAND_LINE_SIZE - fdt_cmdline_size);
+		strlcat(early_cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 	}
 
 	return early_cmdline;
-- 
2.34.1

