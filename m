Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ABC2F7AB8
	for <kernel-janitors@vger.kernel.org>; Sat, 25 Oct 2025 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761391084; cv=none; b=qivp/8lj9FMoNN2GLemFI3z4bTe1Ku4Z3q5Mr5FpBBoVmJbUBM8wXw9XNEReoEyNOtc0Gp9y4+Aiylav3KQ+DaiTD/1HMHXXfmrTqIsrBICbDOdE5i0KGnnwn+bIDBg2tojzUlvBmPakicUoCZ1tLBmvftiA5vIHRz3d+l0qseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761391084; c=relaxed/simple;
	bh=SpKHxgF2ARH/BdQ+OHb950R1xoLHDWjTlV7gpt4N14g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rl26lYD8yqNdl/0n6WxxERriYcxOjtDp1pdKQ2Flry5bnEBLHV0VfGMHNbV4r4VIWh0TOJI4sRkEbeqGzu3hKyZv3xAPEfrKkL5h4lvGVRR8qY537ePCwXRWfQzt4ACEW58FiroISpKsQlJDiVqe9elSgX8mMHCq2sD0sJhjHtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=QiNWXidt; arc=none smtp.client-ip=80.12.242.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="QiNWXidt"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id CcHGvE38qB8skCcHVvnF0T; Sat, 25 Oct 2025 13:17:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1761391077;
	bh=4NvIhj9vk2wKrMeBxFqBm5W9goe8YypRXR6TDgExS7s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QiNWXidtwAu+bQgUFAifYtVFcwtjcDkHQPDlo2NPATjQ/gncEDChUaSeKD9+yY4wM
	 FoPIu1YWkl3+TWlYAeKr4BqY6FvdtSIStyVEP2Ih2o2VgPNYx9ADg0CkeAnCJKWdol
	 jjXfb1NDFVb8h7/sa0kXZQE15U33Z3ImRde81TOwqETj6LIizt99am+Yw2OOdiw3No
	 aP4EC03SCXvp2jrRU43FILva6CHCVrkteiXgWFDYoAg5SLX/7t/+Vmao0XvXjXwifH
	 WU3htYpSPGCervNcg88Hvoik/BiilfBKllJpCprCWpOrkCro99mOG5UCuGJu0JaTUz
	 MtLZSotTxUqRA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 Oct 2025 13:17:57 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: a.hindborg@kernel.org,
	leitao@debian.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] configfs: Constify ct_item_ops in struct config_item_type
Date: Sat, 25 Oct 2025 13:15:38 +0200
Message-ID: <f43cb57418a7f59e883be8eedc7d6abe802a2094.1761390472.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
References: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make 'ct_item_ops' const in struct config_item_type.
This allows constification of many structures which hold some function
pointers.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only files that explicitly use ct_group_ops.

The script used for that is:
  while IFS= read -r -d '' file; do
    obj="${file%.c}.o" ; echo -e "\nCompiling $file" ; make "$obj"
  done < <(git grep --name-only -z ct_item_ops '*.c')
---
 fs/configfs/file.c       | 2 +-
 include/linux/configfs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index 0ad32150611e..affe4742bbb5 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -30,7 +30,7 @@ struct configfs_buffer {
 	size_t			count;
 	loff_t			pos;
 	char			* page;
-	struct configfs_item_operations	* ops;
+	const struct configfs_item_operations	*ops;
 	struct mutex		mutex;
 	int			needs_read_fill;
 	bool			read_in_progress;
diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 31a7d7124460..ef65c75beeaa 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -64,7 +64,7 @@ extern void config_item_put(struct config_item *);
 
 struct config_item_type {
 	struct module				*ct_owner;
-	struct configfs_item_operations		*ct_item_ops;
+	const struct configfs_item_operations	*ct_item_ops;
 	const struct configfs_group_operations	*ct_group_ops;
 	struct configfs_attribute		**ct_attrs;
 	struct configfs_bin_attribute		**ct_bin_attrs;
-- 
2.51.0

