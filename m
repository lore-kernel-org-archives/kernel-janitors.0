Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37C156960
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853804; cv=none; b=DspwnQ9s7cPza4FaVmSNPOhLRzoBRTC86+P0mkXl4jRB9yR05wOGL/WTSTT2mpTcGnU9mJckRo8lRwIFZU8ebhmat05BvzLF3uPMjdHi2ZXjwheHFLtU30TOuRR3Box0fkHbyd/xnfmJeP1fFAPJB8DSx3DTz+7EmB8calROzdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853804; c=relaxed/simple;
	bh=JuOl0jwvRacIVVmMz9i/DNsJFghR7Ps+bku/MuxJZjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWD24CV/uil9kkeCZZDdWceHQ4Z9RWMXlTW38M0V6k2ppaV4MA9d4LkpBJISB7GNnSYDzXE70ODP9pBH7lNlyLptRkKNJT6iSmv0tez9FGOm1J9kpvINbLu4ZxD6xLl3OGd98LTE+grV2WAbdo3GmLYCYcHIolcYCNf/5+yZ6Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MgiUmdKh; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MgiUmdKh"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id auyPsh8Id6NRTauyYsps7P; Mon, 05 Aug 2024 12:30:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722853802;
	bh=26AbValjT7Vk4kQ03bbizfA7G7UEuqTMoxXJ/fluyLM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MgiUmdKhCqVn+pq6mwgruZpr78Pf5qVebAde0iagP40Tb3DeJV4GToVLMrKetEvag
	 TCao9jW44o+WgdqhEeoYSm8EzPrm8Wu7YYZ5DVKdLrRXSsBMQBe27yLLt4JdifQcsv
	 7oo4BUMmicd9xi5F+5JCQgM5VvDgJiSfLpCmtQHWUR1ygFCdxqVPHrDSWqRY0aAy3W
	 oxonoC+zybeDAJoyKjoXu+gYpqwQhxMmIVOqy5HSWgNbFLXAq603sXju6Cq/EZeBVl
	 afqQwMZLQX07/9stSc0S28tiF9hQS2zyTBUjAKaXlaLVHdw0WupHgoMBpMfUyYTAE6
	 wDOKYvwFBd2HA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 05 Aug 2024 12:30:02 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: willy@infradead.org,
	srinivas.kandagatla@linaro.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/3] ida: Remove the ida_simple_xxx() API
Date: Mon,  5 Aug 2024 12:29:48 +0200
Message-ID: <2e9b298991fb8cd47815c917a8fc069b553cea10.1722853349.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722853349.git.christophe.jaillet@wanadoo.fr>
References: <cover.1722853349.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All users of the ida_simple_xxx() have been converted.
In Linux 6.11-rc2, the only callers are in tools/testing/.

So it is now time to remove the definition of this old and deprecated
ida_simple_get() and ida_simple_remove().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: new patch
---
 include/linux/idr.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/idr.h b/include/linux/idr.h
index da5f5fa4a3a6..60216f8fc04c 100644
--- a/include/linux/idr.h
+++ b/include/linux/idr.h
@@ -316,14 +316,6 @@ static inline void ida_init(struct ida *ida)
 	xa_init_flags(&ida->xa, IDA_INIT_FLAGS);
 }
 
-/*
- * ida_simple_get() and ida_simple_remove() are deprecated. Use
- * ida_alloc() and ida_free() instead respectively.
- */
-#define ida_simple_get(ida, start, end, gfp)	\
-			ida_alloc_range(ida, start, (end) - 1, gfp)
-#define ida_simple_remove(ida, id)	ida_free(ida, id)
-
 static inline bool ida_is_empty(const struct ida *ida)
 {
 	return xa_empty(&ida->xa);
-- 
2.45.2

