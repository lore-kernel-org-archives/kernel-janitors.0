Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AB303A37
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Dec 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007511; cv=none; b=KfOL9By3h9RQSWSrDQwcoc6Hc+Uq4ifYXN4o20VlxmZO4zwBFJ/KFcoJw7o7elT768EAnhiD/lUpKf1rQf5kG+jwiTz/nVn2WAIgcyC7y4CMO4HCbwUaW5wYbDO3yGJtMJAcTr9IQ+LA8nDbMbUb3VlndB6T6RMR0j8mXNkjUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007511; c=relaxed/simple;
	bh=Tb71V1+Xe6Clkb/lBgJqXMWWU+Pn5d4rA79IFIVnxXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q1gwihC9sx9JVF0USSYRl3InuBCys/3CYJlfFNp9/ySjVhDaKAPqdtfV3L2JALHNmPuF9jLrX1MmQ6mAXYG8Gl2TnG+I0M/O+v8Piu4IwlPsJN2HnsALU9VZRkVSJAqZrdIzwJ1rFTA11OltpJE9Sb048BI+OiqJDr3JEsAVjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aM9ufcXe; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aM9ufcXe"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id aBLwvRLEgibOdaBLwv8oxn; Mon, 29 Dec 2025 12:23:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1767007436;
	bh=s7qvpaZTIbNIbm8UTu0JejK4SAO6KRhiocxdfPVu3h4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aM9ufcXe772wavGCMhjx/YzmPgDkWnr4qtd0/mLgKi2G2NnBxfNDHV8gxWbjDgWMI
	 ciQjJo8phJVAxxJqOp4mkNGhlHnKViBPeumQhiQvjuhnLjyyN/u+L0TNJdtvssU3Bq
	 OqQJMznJPUGht2i9PKB9s9jbSMW+KHtuYmYr28dE+LLyj0x7PBV5NApO8W8vf4RbGP
	 /TFRz4P+EXA/REsNrNgQLsmG4cDUmp8/31dXQSeA4a2MByDZ7pzNQ5dXvHY/9RjcA8
	 hpASiugj+5fh2JY+roCuR/AdH8iWHEmUL/SifJcE4R4KmyIfDHHSS/GB/JPMLjVJvT
	 5w9g5uaFg8G4Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 Dec 2025 12:23:56 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] samples: configfs: Constify struct configfs_item_operations and configfs_group_operations
Date: Mon, 29 Dec 2025 12:23:51 +0100
Message-ID: <70c5fd68fcc4d3ba1f18002012fae19acf4ce50b.1767007414.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   7507	   6504	     64	  14075	   36fb	samples/configfs/configfs_sample.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   7827	   6184	     64	  14075	   36fb	samples/configfs/configfs_sample.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 samples/configfs/configfs_sample.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/configfs/configfs_sample.c b/samples/configfs/configfs_sample.c
index fd5d163828c5..c1b108ec4ea0 100644
--- a/samples/configfs/configfs_sample.c
+++ b/samples/configfs/configfs_sample.c
@@ -158,7 +158,7 @@ static void simple_child_release(struct config_item *item)
 	kfree(to_simple_child(item));
 }
 
-static struct configfs_item_operations simple_child_item_ops = {
+static const struct configfs_item_operations simple_child_item_ops = {
 	.release	= simple_child_release,
 };
 
@@ -215,7 +215,7 @@ static void simple_children_release(struct config_item *item)
 	kfree(to_simple_children(item));
 }
 
-static struct configfs_item_operations simple_children_item_ops = {
+static const struct configfs_item_operations simple_children_item_ops = {
 	.release	= simple_children_release,
 };
 
@@ -223,7 +223,7 @@ static struct configfs_item_operations simple_children_item_ops = {
  * Note that, since no extra work is required on ->drop_item(),
  * no ->drop_item() is provided.
  */
-static struct configfs_group_operations simple_children_group_ops = {
+static const struct configfs_group_operations simple_children_group_ops = {
 	.make_item	= simple_children_make_item,
 };
 
@@ -292,7 +292,7 @@ static struct configfs_attribute *group_children_attrs[] = {
  * Note that, since no extra work is required on ->drop_item(),
  * no ->drop_item() is provided.
  */
-static struct configfs_group_operations group_children_group_ops = {
+static const struct configfs_group_operations group_children_group_ops = {
 	.make_group	= group_children_make_group,
 };
 
-- 
2.52.0

