Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B13287247;
	Wed, 10 Jun 2026 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091379; cv=none; b=C1EOxQR7VRvEQMtUydzLon0Py1xrpI2EFSf2a91zwz30ruaxLF/QgGAtkt8RIxvuGNHekKS0JH1S/qVtYQT4hQsj2GV+tldpWI3qQUGp+Elh//zeaWqk6NCKDDl2mC6qiwC0DnlCLgFGAasaQMWZKfBU+nNqtzkHS8RLnC2wrzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091379; c=relaxed/simple;
	bh=SubQmR9XtIIYMfcn/xvAJc/EP9tQvjgvU9GpwONIim4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ugSbd+b8jCipqmo+sSyElwJnqEgQmp/tzAMTCIj5VQsLJtIJz7qLDe9CFt3BRpNJA3OVM1bAFkrCAlG1ew6tijC15tA088NknX8F/BPeMUnUFZUL2W9VwjRNn1kMN15o3iQvVwKohCpaUgy7GLe7vrNfGys+MyO2ProN97hRssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wQ1hA9HY; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wQ1hA9HY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781091372; x=1781696172; i=markus.elfring@web.de;
	bh=Fb+uolMH1aiMCFSN5JrNJswIAtpx2BJMnAldpB/Rmys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wQ1hA9HYhRHn8X/zsIMW9FaxolMuxkJWY14bnSuNK4jF4yfFdnItyIv4onIYLD+S
	 3U7IPFsPYXQhCGxFyuA+N/6pUeYh2cQoubcybqmEdOk/Eyq58wOEgsUQ71vM7y/jg
	 mcGPE8V2L8heouGCTv+K/g4cOT5L2Y4+oPJb/nFlyazf0pWvMtoFXwKN/6ON4DjtZ
	 fi7GODJF1FVLMJb3Lk7otjSgBKmyQi5KsU1rS/DipVaBPQ9A6C2RCf29Nvtsg7GsF
	 VZq96QDmfwYG2/bDNIjXiVtLowEIILMBVP14HNmfeoFfdYpZ2q0CmHT3RAHtji57l
	 pfSPxKRbiraz5123kw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6BN-1wpd3m3upZ-00QLxj; Wed, 10
 Jun 2026 13:36:11 +0200
Message-ID: <07d8ed71-5813-451e-9eac-549950937ecf@web.de>
Date: Wed, 10 Jun 2026 13:36:09 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Pawel Laszczak <pawell@cadence.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>, Johan Hovold <johan@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: cdnsp: Use common error handling code in
 cdnsp_segment_alloc()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eA9VAT9+qLUJJVvfihY7wN8Boe6y6ckdZM0eAgHTmUgFNwzjrQ+
 EbIADbxSAgKGsohj6umtT9rJAJCheyiR2bFrOJCSuACQEdvb3AtVXyGpU/qwaxHY5VoRg7C
 taoduiW0OxYjaJM/OWD37UuBQ0sneNZ0miJSIFqLGV+VFLeHm4aR8sYtG9L5HZLAV9mkbtT
 dDa7kqTskphLPuz7VyCQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WeBHlExk074=;Vp3b3uqaTzmlftFlCDSQ7Zr1fdu
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 13:30:08 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/cdns3/cdnsp-mem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 5d8cdc91927d..7696e570f769 100644
=2D-- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -40,10 +40,8 @@ static struct cdnsp_segment *cdnsp_segment_alloc(struct=
 cdnsp_device *pdev,
 		return NULL;
=20
 	seg->trbs =3D dma_pool_zalloc(pdev->segment_pool, flags, &dma);
-	if (!seg->trbs) {
-		kfree(seg);
-		return NULL;
-	}
+	if (!seg->trbs)
+		goto free_seg;
=20
 	if (max_packet) {
 		seg->bounce_buf =3D kzalloc(max_packet, flags | GFP_DMA);
@@ -63,6 +61,7 @@ static struct cdnsp_segment *cdnsp_segment_alloc(struct =
cdnsp_device *pdev,
=20
 free_dma:
 	dma_pool_free(pdev->segment_pool, seg->trbs, dma);
+free_seg:
 	kfree(seg);
=20
 	return NULL;
=2D-=20
2.54.0

