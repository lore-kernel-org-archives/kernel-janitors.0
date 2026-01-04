Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B335979;
	Sun,  4 Jan 2026 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767546096; cv=none; b=OcD29/wy0SjQuQmX5nX+RBSdDE5uWSzpmqQ0RvHq01d1jTCjysvj59tp5y/r2XTQWDbIqIR1xd0zv6/W0qLw1pWrmvKKc3wc3myQe7By7cRwDTUiZlEXKhVXdvbymAJDBRp4YsBOSByZJrPO4Bkxpor9+emc9GTHqcROqwGl02c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767546096; c=relaxed/simple;
	bh=q8DIFGJvI4+j/vU3AR4o9pvKDgntDYFUP4QI6M77zNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rAhTImjV2UwQ5MeL3iFRYfuEfpkSzoL+rkVXwlG4/oo61Sd43BjFB4IuIDcwNxMdnEMB/vtnkjX11IDcgiTGT7+AT9lrnU9Ey4nmeDiXz4FUEih2d0bzCjYvIBgzBhAaAez5+J16I/YV0LfRlygG+9lkVt9+woGfyJhYJz2zQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=aSXcUmvK; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="aSXcUmvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S+B+I9C6Axbl6RJbwl9HfDr99/TjNLbhwTMGhfk0tSE=;
  b=aSXcUmvKpmAgJzzYO0G84CGy1kGq6+iBHF5uUpgEVYNUjNlL3rHVJq/r
   El/D+BCC/5ABtsscUNJfHt0f4SEqH4wbtmihaupqvVfUzrSl/cXRWqA8B
   KGtUXCRxaJQX49PjjZ3Nei4cxbmbJ/A/ofFvTXi1lo6ua7fJCHWMaR+5H
   k=;
X-CSE-ConnectionGUID: LsDqransQEuUmr1JGII/Ow==
X-CSE-MsgGUID: q390n3o1Qla3qonug8Xvkw==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,201,1763420400"; 
   d="scan'208";a="135015474"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 18:01:25 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] optee: update outdated comment
Date: Sun,  4 Jan 2026 18:01:19 +0100
Message-Id: <20260104170119.291968-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function cmd_alloc_suppl() was renamed as
optee_rpc_cmd_alloc_suppl() in commit c51a564a5b48
("optee: isolate smc abi").  Update the comment
accordingly.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/tee/optee/rpc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
index ebbbd42b0e3e..97fc5b14db0c 100644
--- a/drivers/tee/optee/rpc.c
+++ b/drivers/tee/optee/rpc.c
@@ -247,8 +247,8 @@ void optee_rpc_cmd_free_suppl(struct tee_context *ctx, struct tee_shm *shm)
 	param.u.value.c = 0;
 
 	/*
-	 * Match the tee_shm_get_from_id() in cmd_alloc_suppl() as secure
-	 * world has released its reference.
+	 * Match the tee_shm_get_from_id() in optee_rpc_cmd_alloc_suppl()
+	 * as secure world has released its reference.
 	 *
 	 * It's better to do this before sending the request to supplicant
 	 * as we'd like to let the process doing the initial allocation to

