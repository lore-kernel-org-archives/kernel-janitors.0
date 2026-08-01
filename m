Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263393C3F62;
	Sat,  1 Aug 2026 19:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611453; cv=none; b=IQatdOHiQ3xOljCh86jdUEX0913c33toKLtZC/gJoH9rGtj+22gAcFVZ9Dj8TtSP79seTwfcT6dT4qPiKJhR+cuLmClN+cVS5VQ/9R/L7zoTsdUJk7xTpT+V3yNDg9xfbtlKUvf/YylvTbM0XYmgSnaurGz35MLoxqxPFtT5zNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611453; c=relaxed/simple;
	bh=H/iUzFcxispZEOGVEkSGJ+olxf7JgA4FP2yGkogmPgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mcHenbw0JmJXaAUjhWsflbnkEbWL26gd9ie96C7GuOCKxzU1eAVOoOg5qC5wGERxt2K+Hj5KLf1+jZsfssvwvf+VcbZLvtjYAhXrscwEAI5VG7B5H6JbpBgkQpi+AUM7HDs1FqLgXQvGnMLr2NKx/gYGEJnGWga+x679Q0BgxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=l44oSOJG; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="l44oSOJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IVBc0u2m1fX2+j/QkGaPAn0MB3Va2qIKHZ/MClFKEEY=;
  b=l44oSOJG01vnWt3hgmNoGuXi9eYviXcDZr0FMbiit/R005XKSCnYLjin
   DqlPax4zOxbW280Ov2MHVpbQYABd7C3qnCyXDCp9k5n4TFVJ07OFEJvWS
   E+aX96P07HOSXyqYftPTQ9/1bhsu9lvAk5wXnXAPkeQSh2K6kh8B8be2r
   g=;
X-CSE-ConnectionGUID: ggDWuLtURuiCQ6plEXZ5iQ==
X-CSE-MsgGUID: ctS2BtEAQDuPe5q+6vrC/A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769017"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:09 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: siano: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:10:01 +0200
Message-Id: <20260801191002.1383835-15-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a function-like macro expands to an expression, that expression
doesn't need a semicolon after it.  All uses have been verified to
have their own semicolons.

This was found using the following Coccinelle semantic patch:

@r@
identifier i : script:ocaml() { String.lowercase_ascii i = i };
expression e;
@@

*#define i(...) e;

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/common/siano/smsdvb-main.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index 415c24fbb..012ce994b 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -223,19 +223,19 @@ static inline u32 sms_to_bw(u32 value)
 
 #define sms_to_guard_interval(value)					\
 	convert_from_table(value, sms_to_guard_interval_table,		\
-			   GUARD_INTERVAL_AUTO);
+			   GUARD_INTERVAL_AUTO)
 
 #define sms_to_code_rate(value)						\
 	convert_from_table(value, sms_to_code_rate_table,		\
-			   FEC_NONE);
+			   FEC_NONE)
 
 #define sms_to_hierarchy(value)						\
 	convert_from_table(value, sms_to_hierarchy_table,		\
-			   FEC_NONE);
+			   FEC_NONE)
 
 #define sms_to_modulation(value)					\
 	convert_from_table(value, sms_to_modulation_table,		\
-			   FEC_NONE);
+			   FEC_NONE)
 
 static void smsdvb_update_tx_params(struct smsdvb_client_t *client,
 				    struct sms_tx_stats *p)

