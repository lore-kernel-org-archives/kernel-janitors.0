Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8871448DC
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Jan 2025 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725968; cv=none; b=hxvX9Qa4GaDCan7AwOg+myzbr3pkOhT6zg4QSJPpx9MYy8KdZ6qgPlm9h3MYk2LrKpnvnoz8XsF5XilwCxks4FMSEMwfrzmmC0KwIwPFTdcF3qBBHunwmWiJKlV+7Wc/D4S0s5Zy8VhDMnfTt7ODNhBlswIJmTRs+96bTQAvsuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725968; c=relaxed/simple;
	bh=li1QGvGeRBv/1tHy8JxHIOTuugKIv/WFSvWkzrgmGMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4WkHb6EW9q7JdN/4+368H0+t3fgjANJWY1gfp/CrmDewEylSMexuoPgKwE0Qxl+jQQokDr9MKLYSvKUk1njv4EcUzQtQeImY3ol6Ad8DmRcB7aqzq7rROVw2mJU0bI6JI6/+pwDZnodjtU06fvq3xKcllOSebrLoby1MDKhY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aSug7eeR; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aSug7eeR"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bJsvtCI2l88UwbJsztiLsD; Fri, 24 Jan 2025 14:38:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737725894;
	bh=ZBzbe7/PzpC/217mqKEsSdKnbWoYxTS4mHGlWcUBpHI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aSug7eeR8hA5w+hWPvJBCfGdXvXAKGPG/FqPDAySrl092+EekQhVuBWwJ/jSKD1Tp
	 zPtZmSUA297+6zFXXk29amLqf28LSJ8xaVmhtlnG/GHA2ccRbBOwesu42IzIRJHtYv
	 eRJOcMbUyY8O0xP/gwKCy2SH4oX/USz2g+ERdK8uTcw4pYibiQj24uG92B8V82X8XC
	 0eSxd1gh6jZXeAEADSLwR5vLiykUpUGuP6CE6fZ1IF4uZgAKbA9wL1lIDDSNHwCbN9
	 NLuZxPyk+mTwDyX79+JC9YO7ScC00CyDKUFb3K+MA5H7kX1Bwi4Px+RZGvWyaIEPT8
	 EFpXyBy86N6Aw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 24 Jan 2025 14:38:14 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regmap: Reorder 'struct regmap'
Date: Fri, 24 Jan 2025 14:37:58 +0100
Message-ID: <f01f900d15633d5cda5f27763723acb307c0d22f.1737725820.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a x86_64, with configured with allmodconfig, pahole states that the
regmap structure is:

	/* size: 1048, cachelines: 17, members: 78 */
	/* sum members: 1006, holes: 9, sum holes: 35 */
	/* padding: 7 */
	/* member types with holes: 2, total: 2 */
	/* last cacheline: 24 bytes */

So, when such a struct is allocated, 2048 bytes are allocated, with most of
this space being wasted.

Move a few bools so that the size is reduced to 1024.

After this change, pahole gives:

	/* size: 1024, cachelines: 16, members: 78 */
	/* sum members: 1006, holes: 6, sum holes: 18 */
	/* member types with holes: 2, total: 2 */

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

More could be done, to be more future-proof, but the changes would be more
invasive.
---
 drivers/base/regmap/internal.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index bdb450436cbc..6f31240ee4a9 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -73,12 +73,12 @@ struct regmap {
 	void *bus_context;
 	const char *name;
 
-	bool async;
 	spinlock_t async_lock;
 	wait_queue_head_t async_waitq;
 	struct list_head async_list;
 	struct list_head async_free;
 	int async_ret;
+	bool async;
 
 #ifdef CONFIG_DEBUG_FS
 	bool debugfs_disable;
@@ -117,8 +117,6 @@ struct regmap {
 		    void *val_buf, size_t val_size);
 	int (*write)(void *context, const void *data, size_t count);
 
-	bool defer_caching;
-
 	unsigned long read_flag_mask;
 	unsigned long write_flag_mask;
 
@@ -127,6 +125,8 @@ struct regmap {
 	int reg_stride;
 	int reg_stride_order;
 
+	bool defer_caching;
+
 	/* If set, will always write field to HW. */
 	bool force_write_field;
 
@@ -161,6 +161,9 @@ struct regmap {
 	struct reg_sequence *patch;
 	int patch_regs;
 
+	/* if set, the regmap core can sleep */
+	bool can_sleep;
+
 	/* if set, converts bulk read to single read */
 	bool use_single_read;
 	/* if set, converts bulk write to single write */
@@ -176,9 +179,6 @@ struct regmap {
 	void *selector_work_buf;	/* Scratch buffer used for selector */
 
 	struct hwspinlock *hwlock;
-
-	/* if set, the regmap core can sleep */
-	bool can_sleep;
 };
 
 struct regcache_ops {
-- 
2.48.1

