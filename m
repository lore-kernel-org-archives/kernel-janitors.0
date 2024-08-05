Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618A155757
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853804; cv=none; b=URR51iBGDVkBP/w8bhy1NTgRhWTae2z3O70+quBb79TTLyYJobjksXNNKg5CHCA+JE+9urVMBdaHZi7IMl77jmmabMqlZOt6nNyhmZ+R2RY1c+HKOTeSP7QH2UOHDj5JG6LuVbIkI3r6dGAfCz2FRGvntXkpi4+tz81mnITsq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853804; c=relaxed/simple;
	bh=/cPONUnalwhAghdVZucg3m5xD23JaHM8N6fr9ohMXew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOxHgfbakOFMi/zIrcrzNKnGaFRBP0DfOppgMUnFFEwwHBgurCYMd3fD9ueXwBWf4a/QPBwYuho6JFrLWKsWb8W9wxieToZY62g3OSAQr/scrfR1hTQA5ec3k3fA30UTNENB/gZKCU872vx0Z+2IfYxwGeijZIKFiTmwmQD4dCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=giRnpPpX; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="giRnpPpX"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id auyPsh8Id6NRTauyVsps4D; Mon, 05 Aug 2024 12:29:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722853799;
	bh=p85YbJjmqld36aUPh9Xr2h0pVcDZA31M4MN1X79ClEQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=giRnpPpXwh2AaAu7Si+w1MSbHMhHx7ppsEwgMd529CpB0fOrVyBknY5Wgew8G6Phq
	 lHjkyCyO8Ry9SSEz+RNWUy73OXezBpvu7crDWcAJZyou63jx7Kz7eziz98L/X+7j9V
	 tuJBQWtQs0NzYAhBAXqa5nEpqU3bb9kOMGINcMn2y/Oly8AzqKoW2649u7rYkBdhar
	 S+jwdVlCGuyaxekrarCzjKy+7V8UYgOuhRMMOxJdowv4ZoQs9GhtHD9DqlPgXHcrj8
	 otdC78bj55LXNQI0a3KJYzBSAoZZTT58GS0w9Dgbs9VfxbzLhN7rcAXaLCp+08vttT
	 3wDsizw0KSSuw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 05 Aug 2024 12:29:59 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: willy@infradead.org,
	srinivas.kandagatla@linaro.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 1/3] idr test suite: Remove usage of the deprecated ida_simple_xx() API
Date: Mon,  5 Aug 2024 12:29:47 +0200
Message-ID: <715cff763aa4b2c174cc649750e14e404db6e65b.1722853349.git.christophe.jaillet@wanadoo.fr>
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

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range()/ida_alloc_max() is inclusive. But because of the ranges
used for the tests, there is no need to adjust them.

While at it remove some useless {}.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
Changes in v2:
  - This patch was already proposed see [1]. This one also rename the function
used for the test: s/ida_simple_get_remove_test/ida_alloc_free_test/.
    I've kept the A-b tag given at that time.

v1: https://lore.kernel.org/all/81f44a41b7ccceb26a802af473f931799445821a.1705683269.git.christophe.jaillet@wanadoo.fr/
---
 tools/testing/radix-tree/idr-test.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tools/testing/radix-tree/idr-test.c b/tools/testing/radix-tree/idr-test.c
index 84b8c3c92c79..2f830ff8396c 100644
--- a/tools/testing/radix-tree/idr-test.c
+++ b/tools/testing/radix-tree/idr-test.c
@@ -499,19 +499,17 @@ void ida_check_random(void)
 		goto repeat;
 }
 
-void ida_simple_get_remove_test(void)
+void ida_alloc_free_test(void)
 {
 	DEFINE_IDA(ida);
 	unsigned long i;
 
-	for (i = 0; i < 10000; i++) {
-		assert(ida_simple_get(&ida, 0, 20000, GFP_KERNEL) == i);
-	}
-	assert(ida_simple_get(&ida, 5, 30, GFP_KERNEL) < 0);
+	for (i = 0; i < 10000; i++)
+		assert(ida_alloc_max(&ida, 20000, GFP_KERNEL) == i);
+	assert(ida_alloc_range(&ida, 5, 30, GFP_KERNEL) < 0);
 
-	for (i = 0; i < 10000; i++) {
-		ida_simple_remove(&ida, i);
-	}
+	for (i = 0; i < 10000; i++)
+		ida_free(&ida, i);
 	assert(ida_is_empty(&ida));
 
 	ida_destroy(&ida);
@@ -524,7 +522,7 @@ void user_ida_checks(void)
 	ida_check_nomem();
 	ida_check_conv_user();
 	ida_check_random();
-	ida_simple_get_remove_test();
+	ida_alloc_free_test();
 
 	radix_tree_cpu_dead(1);
 }
-- 
2.45.2

