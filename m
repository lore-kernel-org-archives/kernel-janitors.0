Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E343BADB4;
	Sat,  1 Aug 2026 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611423; cv=none; b=J/tn/AatBmoR1kfZinKxbiu96OjCUHBkErJImE/+RQ58peAeuAV9rhDocMF9Vg2GuN5/0sxHYFfGV8WIL7/Ftjni+bLGB0CSoIkFkAU+2YWY7ZKh2Vdsclsi3ksFMRGr5+2OuJo9xsRHTxtUTkOSAcsj5mmUADQEWS5IAcjRDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611423; c=relaxed/simple;
	bh=vRuoTiJ0kMyjX428qYpKgtZFNDGRDzPK1evsdcmQEHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i4/y6n8KJYt+DXa7TwRVM0yjK4CTVOHH+q+/IGr80dPsWtuY6bpwBjqd+71tCEGDp6YMrdnRXLSGEaPjQe0cS/6Jz2WbWwjicmJwhLegzadHks/o4IeL7idzky90hfLeNhRkvCMP4NJo9hT7f+GTuNBsqQCJmVZwUuPt/bDoe5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=jgVcO1W/; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="jgVcO1W/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X6xC92YccmQOOoEa7onJ/6ENrm30EU9EGd+GnCwpItk=;
  b=jgVcO1W/VGxZWlImPT04/RuhMVYLmWgWsodZyjjLCxbVznfGgtQx/Pce
   JmvtiKSL1PW3TcwGFEkwssuMnKBdi4jEw1x3zY3sDF6sbRYvemSLKIkm1
   ebnKD+7CBdc7UceiSm05YewvsipZ6icIEd4Glso1RJST8KmO+h+ZvpqBX
   A=;
X-CSE-ConnectionGUID: KxWJydUIR2GQcQRRwHywKg==
X-CSE-MsgGUID: Wthrg9cNRKmXH7ZLWQQctw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769002"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: OHCI: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:47 +0200
Message-Id: <20260801191002.1383835-1-Julia.Lawall@inria.fr>
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
 drivers/usb/host/ohci-dbg.c |    2 +-
 drivers/usb/host/ohci-hub.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
index 9e0e06bbc..4c83a1686 100644
--- a/drivers/usb/host/ohci-dbg.c
+++ b/drivers/usb/host/ohci-dbg.c
@@ -184,7 +184,7 @@ ohci_dump_status (struct ohci_hcd *controller, char **next, unsigned *size)
 		\
 		(temp & RH_PS_PES) ? " PES" : "", \
 		(temp & RH_PS_CCS) ? " CCS" : "" \
-		);
+		)
 
 
 static void
diff --git a/drivers/usb/host/ohci-hub.c b/drivers/usb/host/ohci-hub.c
index b3d734ab6..84d10a932 100644
--- a/drivers/usb/host/ohci-hub.c
+++ b/drivers/usb/host/ohci-hub.c
@@ -33,7 +33,7 @@
 		\
 		(value & RH_PS_PES) ? " PES" : "", \
 		(value & RH_PS_CCS) ? " CCS" : "" \
-		);
+		)
 
 /*-------------------------------------------------------------------------*/
 

