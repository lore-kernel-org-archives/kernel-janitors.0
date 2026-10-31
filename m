Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793482618;
	b=pwkko48Y8bVB+3+8w762Ub5oiwzWqUBW3XdLNKNlCYKDZpTO5lbe5Bm4jrilVghT/91g
	 0CcKAi3G66pya6QTGqP2+gRqnVF3yqgJtbzYFBXCdEZbNn/Oi+bhqTLTQW0BmwRPW6Swm
	 wxEmONMFIP2xJ0E/k6waJemPjReS8qOGOGrxLGhuQC2ZDH/6mK9acUs/zmLdwVuAg7Vrs
	 9XVvRCHhA6pHITzhsv1XpAetoi7Xb57+HMBJx2ThWvxhwjExR7f0Y69unaNw9u49YSh+4
	 inur+cBk+pR4juF7xorMk0ce4xeNfgNPaOy8vB7tfkF+ri1iKanSw1na7iB/jyWhEJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793482618;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9GksjCUt61tneKQonk5k4yGW1d91mGEwlUuzESkWVdM=;
	b=48zSaeJP74fJqlbx01VxLmmcHHE02hxDqs/t+nnnjceVGtxJLuikpflKvLe/QugyW2VG
	 wBs+WRwKtPpN1tm2X64TUArgkKU5BZQXn4XtBtBbEJwrwTZeSXljzxtdyKrxlQjb/IZsR
	 xvCTOvmoGuaDlw69yRwl2pFdOKnuTi9JqpNCKNvIl4sMACsBTMfbG52WvPOq5G3/hGLYP
	 IPw/Pqo40Um4SUPKJwDFoGpYUTLWPnBjy2HzS96jmjOYeAJSgaDv28dp2lvbT2B5WtdnH
	 EtSe/vQURVTbCWltAUARu56EihPzCEwKm3AEy2CZh2GoFcsv5Rd826eBkLuwM8TcHRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=T1t2jRp4;
	arc=none smtp.remote-ip=80.12.242.76
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16932606A31A;
	Sat, 31 Oct 2026 21:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16932606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=T1t2jRp4
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id NGkpxLFbCq3IhNGkpxq0kr; Sat, 31 Oct 2026 22:36:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1793482609;
	bh=9GksjCUt61tneKQonk5k4yGW1d91mGEwlUuzESkWVdM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=T1t2jRp4vCVQgbFqdPR+5NhpVM1dink/iDTDwrZDzwg+2FgvxTRyKQbqs+P1fcMik
	 YDjv6RXviLwQJx+w/dYPmT9kuUfwUxTOrvSiDt+HbDoA4MZHOa2A8xBDv+XpcJql2T
	 8AUsj83SJyj4AG0tYHcbrdomrjkWkQrpqbs/ASgCbzH+NXbihCbouVniSa33RgWiPE
	 HEtQWDY1vpC9kAG/30oHFhxIe2yKWN50GFLRDbPt/NFxDDUOpeSY2cXlB8TeQQxdzi
	 y97GvZUKDW+Opj7hTnhs+alh4HrGrzC8ghNOZIesKBgrvzQSqm6+xE51gPzeqT4n80
	 lvT/L+Az7gLOA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 31 Oct 2026 22:36:49 +0100
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvmet: pci-epf: Constify struct pci_epf_ops
Date: Sat, 31 Oct 2026 22:36:43 +0100
Message-ID: <3e4d3ffc4e3ec822759782afbaac1279c4a83135.1793482573.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct pci_epf_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  90026	  19680	    768	 110474	  1af8a	drivers/nvme/target/pci-epf.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  90090	  19616	    768	 110474	  1af8a	drivers/nvme/target/pci-epf.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/nvme/target/pci-epf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index c683450df422..377cd428fa65 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -2587,7 +2587,7 @@ static const struct pci_epf_device_id nvmet_pci_epf_ids[] = {
 	{},
 };
 
-static struct pci_epf_ops nvmet_pci_epf_ops = {
+static const struct pci_epf_ops nvmet_pci_epf_ops = {
 	.bind	= nvmet_pci_epf_bind,
 	.unbind	= nvmet_pci_epf_unbind,
 	.add_cfs = nvmet_pci_epf_add_cfs,
-- 
2.56.0

