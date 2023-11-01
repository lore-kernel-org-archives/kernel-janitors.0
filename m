Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437914AB0
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OTiGlgvv"
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C965109
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 10:59:24 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id yFUmqLu9UdNF0yFUwqlWkD; Wed, 01 Nov 2023 18:59:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698861562;
	bh=tp4MITVizuBEmp3ejOfTqUeRAaQ+yKheG8AeYiDBL6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OTiGlgvvl2fVGgJmRV1Am68m/67/gJYtyC/K8nrYIpeqt+9DmBDaf8rwtdCkEHhdT
	 KI/7HXpdUAVSKRCoc5bfbORYcoNai92D76s/h2TZDhsD+oHLO7PNBTp7xiXk2y8evM
	 OzT4Nvv0FJBbzrBv/K/DW1HAxp2L8n7sRX0lIuqomWs7crL3ldP1Rtlf7L6pZPndzS
	 xZmGLYz1zporFbz1v+3wvE4Hw8kfxmYCa7/HTwpsj+niuEwUgsZZcOXtxPetzChggv
	 n36Xz5fAoJv+/65UKzF8QD0OhCy1aLZ8vtjHO82l7OE2eOaUNO/7yGzmgeeoDcNiEm
	 lqPcTqVPbFMDA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 18:59:22 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: rostedt@goodmis.org,
	gregkh@linuxfoundation.org,
	keescook@chromium.org,
	willy@infradead.org,
	senozhatsky@chromium.org
Cc: list@mail.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] seq_buf: Export seq_buf_putc()
Date: Wed,  1 Nov 2023 18:59:05 +0100
Message-Id: <5c9a5ed97ac37dbdcd9c1e7bcbdec9ac166e79be.1698861216.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
References: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark seq_buf_putc() which is part of the seq_buf API to be exported to
kernel loadable GPL modules.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is needed for [1].
(It will need an update because of some recent changes in the seq_buf API)

[1]: https://lore.kernel.org/all/bbbab32e3e104bdc2238724a6a4a85e539f49ddd.1698512661.git.christophe.jaillet@wanadoo.fr/
---
 lib/seq_buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/seq_buf.c b/lib/seq_buf.c
index 23518f77ea9c..fb99168c3309 100644
--- a/lib/seq_buf.c
+++ b/lib/seq_buf.c
@@ -208,6 +208,7 @@ int seq_buf_putc(struct seq_buf *s, unsigned char c)
 	seq_buf_set_overflow(s);
 	return -1;
 }
+EXPORT_SYMBOL_GPL(seq_buf_putc);
 
 /**
  * seq_buf_putmem - write raw data into the sequenc buffer
-- 
2.34.1

