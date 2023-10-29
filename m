Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3B7BE53
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="l4AlWDnc"
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68113C1
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 03:30:14 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id x33bqUCJFRr5vx33bqsdPz; Sun, 29 Oct 2023 11:30:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698575412;
	bh=0csRcwC0zp8g1RspI9Q/JAaWFLGDVf/EQzQzOfWYg+A=;
	h=From:To:Cc:Subject:Date;
	b=l4AlWDncAlsOegFIom9cmvrcSzm61IG9iUnUK/WhCAuIU8SYLlBwbE6Bi8C5v6mLl
	 aotEEC7COAl/0mAxBJiHOm9At/fyciMjWxe9nvB8MIO+aRxeL66M2XCY6pUza46weX
	 5pw0L1yFqbT24nfpdS08DO1URE2pwg6PdF6f0nkYMg9luatsVfrHSsKtVxjkuhco0s
	 o1J0opi6YXidPzGMQX5GTnJz4S1AOAJeXKjXHbPz9dZx5UNoasgTk8rOkCD8VkiiaH
	 WCSffMQxUyvXrScCqhIwugWUXs9F/j0RsaFaTguyjQJnDrpG5cakgRFuL9hbiKySek
	 9EsoPN930QBAA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Oct 2023 11:30:12 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Coly Li <colyli@suse.de>,
	Kent Overstreet <kent.overstreet@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-bcache@vger.kernel.org
Subject: [PATCH] bcache: Optimize sysfs_hprint()
Date: Sun, 29 Oct 2023 11:30:06 +0100
Message-Id: <9b82413f1ca0b924cc139d945777e32dd22ffe41.1698575385.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of what is in 'buf' is already computed by bch_hprint(), so skip
these bytes when calling strcat().

This easily saves a few cycles. (should it matter)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/md/bcache/sysfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/bcache/sysfs.h b/drivers/md/bcache/sysfs.h
index 65b8bd975ab1..798bcbeab0bb 100644
--- a/drivers/md/bcache/sysfs.h
+++ b/drivers/md/bcache/sysfs.h
@@ -78,7 +78,7 @@ do {									\
 do {									\
 	if (attr == &sysfs_ ## file) {					\
 		ssize_t ret = bch_hprint(buf, val);			\
-		strcat(buf, "\n");					\
+		strcat(buf + ret, "\n");				\
 		return ret + 1;						\
 	}								\
 } while (0)
-- 
2.34.1

