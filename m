Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE923BE
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="O4u5rTof"
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF56DB
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 10:59:15 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id yFUmqLu9UdNF0yFUmqlWiI; Wed, 01 Nov 2023 18:59:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698861554;
	bh=nSCBkCeZL0EQ7NHodw1YX1UP/T3rsY2JwArBMjG08Zc=;
	h=From:To:Cc:Subject:Date;
	b=O4u5rTofB6KkdSZGCpBZFY1Yp76juWyKZtYGAbn0PX+e9vkx1MqBokVwOp5Diu64u
	 Gwq1TK7Ou/2WiF4YWCN46PQ4sw0oBsXjnutFBhhElG2x0ksu4Egj9PoKb9BWA4gcJH
	 vcGIe0B4H+m0GPti6Ot+G2B4J5XPNyE7h5n2sv1gcky2lF5M/P29tveE8g14XxwWa0
	 Kb/OfNwVkqbs+0cQy5upv5TqraMGpY3GTxxXrG3/MFztH/TF7SFt90YAjFxyBdPoCV
	 bJdW0W5BR8JpdRFsOpQOIOMRKqmS6bAIQrfBPsAyx46MQRS6tVTNa4EVQA2Q3UPa/I
	 ppyjuUjqFDiAQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 18:59:14 +0100
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
Subject: [PATCH 0/2] seq_buf: Export seq_buf_putc() &nd seq_buf_puts()
Date: Wed,  1 Nov 2023 18:59:04 +0100
Message-Id: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

seq_buf_putc() has a potential real use-case (link in the patch), but 
seq_buf_puts() has currently no forseen use-case, so I have split it in 2
patches if only the 1st one is accepted.

Christophe JAILLET (2):
  seq_buf: Export seq_buf_putc()
  seq_buf: Export seq_buf_puts()

 lib/seq_buf.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1

