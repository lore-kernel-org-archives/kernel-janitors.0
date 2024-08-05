Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B94149C68
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722840138; cv=none; b=NWnOrzzHmZbrDF6EBpFTp+ZOvVBMUjg73ABFkZ6GRLZbVNi1NlwoN/5vVaIhpurRkAiRj6GwudQGyypg4DuQpTxoyJreHdT0bQ+1ONqUy3+3fEZg3IqtTrCvK+3p2qAkDnD8tfs3k66y/p9N8xC1oh7WR3LqTzNRL24XIlOs1iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722840138; c=relaxed/simple;
	bh=1vVlM+ddG3u4gl7LGc93Oxc2DWNsUj/ZLGTJnTpYqhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGlhVi01w3Zu0YSOPZJRQox37oLLZ2rwDUHQif0UE3Thd73eTSNYGtpL5FWRlpviUb6PUaRw3Im7i0iGTFXkgqMki3xHVtkcF3priHOqmPy5ZqfXHw/u05O8r9gulbMSSoVSbw0aOSBkaSSge5JewkCVlbtHTI3smXGh83dOVvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=oAiuMJFh; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oAiuMJFh"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id arOns5eD41n2IarP7sUUaO; Mon, 05 Aug 2024 08:41:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722840074;
	bh=mJMkslPd4nPyVR0NUNbJ2BCmn3CCKJaHPZ6kqs8kapw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oAiuMJFhCQDJqPupslN/Hno9mNLMZkWXBud0oinY200B2BWcq2gV/0TWYBr+z8OiN
	 ngqXZdeM8Wuv2pXC+94GsGjs4cNsSz5sjL+wvjuw9F9D0vRepQUZg6EE1oWZFuxCEA
	 73iohyLeVXa78q6IBkS5dEiHvi2qh7D9rWkolMpFXyyxcPmNWoNk4QNCf+ugW5yKDU
	 9CbLUpGKKbZBg05CKFsy50IHTWh0EB2fEuaLsauL3upIx/gkXpueM2JWGuiW7wuJ3m
	 +uk6XidzLaH9rNMhnVIi6S+GLdui6dRwxfvIXWhM2KydVO848ps7n79StZf9fKyo4L
	 itJQ+Bsb/thQw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 05 Aug 2024 08:41:14 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: stas.yakovlev@gmail.com,
	kvalo@kernel.org,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-staging@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/3] lib80211: Constify struct lib80211_crypto_ops
Date: Mon,  5 Aug 2024 08:40:38 +0200
Message-ID: <0cc3741c15f2c502cc85bddda9d6582b5977c8f9.1722839425.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722839425.git.christophe.jaillet@wanadoo.fr>
References: <cover.1722839425.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that functions in lib80211 handle "const struct lib80211_crypto_ops",
some structure can be constified as well.

Constifying these structures moves some data to a read-only section, so
increase overall security.

Before:
   text	   data	    bss	    dec	    hex	filename
   7273	    604	     16	   7893	   1ed5	net/wireless/lib80211.o

After:
   text	   data	    bss	    dec	    hex	filename
   7429	    444	     16	   7889	   1ed1	net/wireless/lib80211.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2
  - No changes

v1: https://lore.kernel.org/all/a1f822093dbd01f39d9afb931bece744273b8b9d.1715443223.git.christophe.jaillet@wanadoo.fr/
---
 net/wireless/lib80211.c            | 2 +-
 net/wireless/lib80211_crypt_ccmp.c | 2 +-
 net/wireless/lib80211_crypt_tkip.c | 2 +-
 net/wireless/lib80211_crypt_wep.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/wireless/lib80211.c b/net/wireless/lib80211.c
index 51e31316bcb8..64c447040786 100644
--- a/net/wireless/lib80211.c
+++ b/net/wireless/lib80211.c
@@ -234,7 +234,7 @@ static void lib80211_crypt_null_deinit(void *priv)
 {
 }
 
-static struct lib80211_crypto_ops lib80211_crypt_null = {
+static const struct lib80211_crypto_ops lib80211_crypt_null = {
 	.name = "NULL",
 	.init = lib80211_crypt_null_init,
 	.deinit = lib80211_crypt_null_deinit,
diff --git a/net/wireless/lib80211_crypt_ccmp.c b/net/wireless/lib80211_crypt_ccmp.c
index cca5e1cf089e..5aad139130e1 100644
--- a/net/wireless/lib80211_crypt_ccmp.c
+++ b/net/wireless/lib80211_crypt_ccmp.c
@@ -418,7 +418,7 @@ static void lib80211_ccmp_print_stats(struct seq_file *m, void *priv)
 		   ccmp->dot11RSNAStatsCCMPDecryptErrors);
 }
 
-static struct lib80211_crypto_ops lib80211_crypt_ccmp = {
+static const struct lib80211_crypto_ops lib80211_crypt_ccmp = {
 	.name = "CCMP",
 	.init = lib80211_ccmp_init,
 	.deinit = lib80211_ccmp_deinit,
diff --git a/net/wireless/lib80211_crypt_tkip.c b/net/wireless/lib80211_crypt_tkip.c
index 5c8cdf7681e3..63e68e5e121e 100644
--- a/net/wireless/lib80211_crypt_tkip.c
+++ b/net/wireless/lib80211_crypt_tkip.c
@@ -705,7 +705,7 @@ static void lib80211_tkip_print_stats(struct seq_file *m, void *priv)
 		   tkip->dot11RSNAStatsTKIPLocalMICFailures);
 }
 
-static struct lib80211_crypto_ops lib80211_crypt_tkip = {
+static const struct lib80211_crypto_ops lib80211_crypt_tkip = {
 	.name = "TKIP",
 	.init = lib80211_tkip_init,
 	.deinit = lib80211_tkip_deinit,
diff --git a/net/wireless/lib80211_crypt_wep.c b/net/wireless/lib80211_crypt_wep.c
index 6ab9957b8f96..3b148c7bef85 100644
--- a/net/wireless/lib80211_crypt_wep.c
+++ b/net/wireless/lib80211_crypt_wep.c
@@ -226,7 +226,7 @@ static void lib80211_wep_print_stats(struct seq_file *m, void *priv)
 	seq_printf(m, "key[%d] alg=WEP len=%d\n", wep->key_idx, wep->key_len);
 }
 
-static struct lib80211_crypto_ops lib80211_crypt_wep = {
+static const struct lib80211_crypto_ops lib80211_crypt_wep = {
 	.name = "WEP",
 	.init = lib80211_wep_init,
 	.deinit = lib80211_wep_deinit,
-- 
2.45.2

