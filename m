Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5903C276E;
	Sat,  1 Aug 2026 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611449; cv=none; b=k9V7+3ITLh4iAVTnljCgBP80UAoc7phg4nG2sCIruq7VrKac1gI/CAvBYZlsDGdKpJ1wydatfBa22ZUbUn9oT0pyZggQlSPTsvP0+MMdb3KSaf21B/SXz6rpuesfcK6cR/Fr43HnPnqkrxrvTOlcIFGEPqzc5TKplB4JTYTk3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611449; c=relaxed/simple;
	bh=zuuf098cimkPOATRkcNK0054LPtxvw2yt1eNv2zXC3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qZDCrgYu3fh9ibg9jgh2xF0qua2jpT5X461CPpOkFEDHVAbF8JZyASfDCKOA1ZQA5QwMclpF9tv5UnH/i0MdVog8kvRrqty6ZzlPvTto+LcepAhgXLmJdytlVuux+s9OLGH2Eyc2KU7Jy7WqpMICX4VojHlHbBXEoTcEOK6B0aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=f0IZo59R; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="f0IZo59R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NxludM8xT00SdkMOmIj+99VXv2D/cocXJvFnwQXb5uE=;
  b=f0IZo59RwLe2FQb4XDPJhfTiKOVXIGpqxOzJ1c3CzqzxRh3nNjfs9myv
   JWS5hRrR7cO4nTPkUtTRx3EH/b7THDhrziSVxwNtSMjIX5+wKxjG4gmS+
   udcivhjjyZlnf1wUpdgZp5v89TdojRvJnSDX6ojEFJLi/uNsIg+Hp08zS
   s=;
X-CSE-ConnectionGUID: mdFLCK5oReiEHIwvTnx1BA==
X-CSE-MsgGUID: B8HbKGOTSQGw441baGS+9Q==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769016"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:09 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] altera: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:10:00 +0200
Message-Id: <20260801191002.1383835-14-Julia.Lawall@inria.fr>
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
 drivers/misc/altera-stapl/altera-jtag.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/altera-stapl/altera-jtag.c b/drivers/misc/altera-stapl/altera-jtag.c
index 27e8e0c9e..023860010 100644
--- a/drivers/misc/altera-stapl/altera-jtag.c
+++ b/drivers/misc/altera-stapl/altera-jtag.c
@@ -17,9 +17,9 @@
 #include "altera-jtag.h"
 
 #define	alt_jtag_io(a, b, c)\
-		astate->config->jtag_io(astate->config->dev, a, b, c);
+		astate->config->jtag_io(astate->config->dev, a, b, c)
 
-#define	alt_malloc(a)	kzalloc(a, GFP_KERNEL);
+#define	alt_malloc(a)	kzalloc(a, GFP_KERNEL)
 
 /*
  * This structure shows, for each JTAG state, which state is reached after

