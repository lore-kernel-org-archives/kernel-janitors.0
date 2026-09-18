Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA075481DD;
	Fri, 18 Sep 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736801; cv=none; b=JnWnf01uvCdZ5n7j8XgpK7iHqPJRhPj1i0fLic6CGxKcM98sU8Z3t7ha9PfJj3lWOljmIAkj7izpiVqh6I0B2LWaNBTO9X/D3PclJs76pRdtBB01tVxKGOmWLCzZ+92vN+8NcPZ39hTrWUlzb26x3UnZnS8XgALbyYqrNwfa6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736801; c=relaxed/simple;
	bh=/nakVwmxaeeJTK5KzN//btReFIAOeTh6IiuKR27HZzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ko+nbYv6IPoS7dHbXozlj3jXc4JQf3EzGWXQB0ODkmWUYxW4L5n4aNFAkX71w3lQI135mxI595SW7Y4DWvaQPIpPYP7v+5Wg+2OsFV7BCULCi9tJTPYnBQhdlgIJSf9PpYN10uvTKg3s4wyD1Gfr4u6riuY6yux/JujFpT6U+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=u9AhtPcn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=u9AhtPcn; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="u9AhtPcn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="u9AhtPcn"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hmXvB5JlbzKp22;
	Fri, 18 Sep 2026 15:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789736790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+TtMD/N6SgzaMVWEle+qL0jO4JALOAaC+jKdUPI5lys=;
	b=u9AhtPcnvF9+I6+HfzGgIs8skVxl4znEFMhyXZQcV2/+6IS2t9zquv/iYXC/IVhDgG0chh
	ZC7rLTgNMIZzGLwd8nm8PdD4cqEBXH6/1/nDwAGTg7FPuchY/EMcKOmMWolwepmrIptica
	O+BHVRZeh7hgfjcbNYS0L00bSi78f0OLDnErGomHpoRJVCOhM6inGq1szTrIaaWTPaemDF
	rwF1tD7ZP2MeQdpxcnLJtzEhS//VWelGi2oanYNGqlpZRHcUAFazR3xLHzjAX6Kz1jXsRN
	N/EI6cMZ5rTXl75Z/i5SfI0NIoSA8tlzpHOaqJ9rjVrHwEFrzhupxMNGdk+8cg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789736790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+TtMD/N6SgzaMVWEle+qL0jO4JALOAaC+jKdUPI5lys=;
	b=u9AhtPcnvF9+I6+HfzGgIs8skVxl4znEFMhyXZQcV2/+6IS2t9zquv/iYXC/IVhDgG0chh
	ZC7rLTgNMIZzGLwd8nm8PdD4cqEBXH6/1/nDwAGTg7FPuchY/EMcKOmMWolwepmrIptica
	O+BHVRZeh7hgfjcbNYS0L00bSi78f0OLDnErGomHpoRJVCOhM6inGq1szTrIaaWTPaemDF
	rwF1tD7ZP2MeQdpxcnLJtzEhS//VWelGi2oanYNGqlpZRHcUAFazR3xLHzjAX6Kz1jXsRN
	N/EI6cMZ5rTXl75Z/i5SfI0NIoSA8tlzpHOaqJ9rjVrHwEFrzhupxMNGdk+8cg==
To: Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux kernel <linux-kernel@vger.kernel.org>,
	kernel-janitors <kernel-janitors@vger.kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Yi Xie <xieyi@kylinos.cn>,
	Manuel Ebner <manuelebnerli@mailbox.org>
Subject: [PATCH] ipc/sem: Fix kernel-doc notation of perform_atomic_semop_slow()
Date: Fri, 18 Sep 2026 15:06:03 +0200
Message-ID: <20260918130604.452053-1-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4417f5af454c730b19d
X-MBO-RS-META: jqeizzsb3xfmaop5wao5pknayjfwx9z7

Adopt strict kernel-doc notation to make doc recognizable, this fixes:

$ ./scripts/kernel-doc -none ipc/sem.c
Warning: ipc/sem.c:629 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * perform_atomic_semop[_slow] - Attempt to perform semaphore

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 ipc/sem.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/ipc/sem.c b/ipc/sem.c
index 5ec41de7e85b..642be4170065 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -627,8 +627,8 @@ SYSCALL_DEFINE3(semget, key_t, key, int, nsems, int, semflg)
 }
 
 /**
- * perform_atomic_semop[_slow] - Attempt to perform semaphore
- *                               operations on a given array.
+ * perform_atomic_semop_slow - Attempt to perform semaphore
+ *                             operations on a given array.
  * @sma: semaphore array
  * @q: struct sem_queue that describes the operation
  *
@@ -642,6 +642,8 @@ SYSCALL_DEFINE3(semget, key_t, key, int, nsems, int, semflg)
  * Returns 0 if the operation was possible.
  * Returns 1 if the operation is impossible, the caller must sleep.
  * Returns <0 for error codes.
+ *
+ * This description is also valid for perform_atomic_semop(), the function below
  */
 static int perform_atomic_semop_slow(struct sem_array *sma, struct sem_queue *q)
 {
@@ -716,6 +718,10 @@ static int perform_atomic_semop_slow(struct sem_array *sma, struct sem_queue *q)
 	return result;
 }
 
+/*
+ * The description of this functions is the same as the one for
+ * perform_atomic_semop_slow(), see the kernel-doc above.
+ */
 static int perform_atomic_semop(struct sem_array *sma, struct sem_queue *q)
 {
 	int result, sem_op, nsops;
-- 
2.55.0

