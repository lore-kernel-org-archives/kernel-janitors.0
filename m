Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2102A404BD0;
	Wed, 10 Jun 2026 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094021; cv=none; b=OpF6CE7gIL/Pbj5jkPr2SbM5Wy+ACvsCgQBypKPRMLjZlMRSKCL/vciZXU+Z4kG8sOOhf2JpyM7VUzJxFyrf5ZbKoyVbSUgBcIMm+p2owFYSfA7GZ/Tw4wvr7xZDEUqUsis7mh4rhzKyhWwQnw9B1Ziy1/4YGBfcCLoJvA54P54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094021; c=relaxed/simple;
	bh=/oisX3IcEIqXI9WJLW+5rsgYSYWmUvBkIQXkbp+qCkA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=NTIKaWCFav0ho0mB/3pe1eNSORF3x/Ztu1w0g3KBHP4gsNGe8QNE4DRTAmh7oaDyUms5EWXPgVihLBUtnXFlGa3bP161BHlNykJ2Md7GpVGJhRu+1Xflw7wevt4ijlhOX6PFTEp+GXomRozj10ZEErrToVeCwmYh/u5FofyGL3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=iVXfwOnN; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="iVXfwOnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781094013; x=1781698813; i=markus.elfring@web.de;
	bh=n+zSiXxhkD8RzMPJ76NIsPv8Y5xyYIH4R453cH89flc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iVXfwOnNjLO1d4t+/g/DSSq9PKx5UFv0iRJwrU0lRXixnRhQ4T7fGiY+Dlzq7aao
	 3rTMuuekg7PL0gCPNvUYjbNquPq1h36v8mbh7swkZwTrW+grx9ZIPFC090CTWRG5u
	 hf5+heIvbt7MyIREhg2jMj+ztqdLv3ST0UBO/Qm8x/OHMslhElAa54OL6KnIyUMyK
	 Z2SNw26Z/3QIAkvE8/CCyayw2xql2mqny1b2xpPjPqE1bt2fYI8EVXump9SgygJtF
	 J8mNRKPonFlNTxbPwMVx+kxUj+5Yg2em9UD1Jm1upxyicwGCNQvLSHgVMxbKV1i7Q
	 baB1ygPgwz2yXLXlkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MxYXF-1xQ4SC2d5N-00rhZX; Wed, 10
 Jun 2026 14:20:13 +0200
Message-ID: <dd2f70a3-75ab-453b-a109-5632905d36ab@web.de>
Date: Wed, 10 Jun 2026 14:20:11 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>, Johan Hovold <johan@kernel.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: xhci: Use common error handling code in two functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7C0w0n33hh5GPyjMmW1CoQES8Hq6rbTjsizhnTIDw2GkM+a+zPT
 9VYBkFPRLeSVZCSAvEtHAWA3U0vUBGFefo2kPTkhiPpEw2KnunSgC+UX4zMgv21B8VtfpVv
 x+zHNaI8gcHANGs1+hix8YpsS9hEdqObiA8eXDjWkho7AykjAQW+Ee0KxyhRaRGOJb3ZyWf
 j9B17HdToFR1ARZyIeMFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rmhdVLwkpto=;tPcquZ1v7qpFTZWMStb0TV2fsfJ
 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
 mcht8Qe63bs+zrpEua600+/A6ro=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 14:10:24 +0200

Use additional labels so that a bit of exception handling can be better
reused at the end of two function implementations.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/host/xhci-mem.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..0e851d0c5bea 100644
=2D-- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -40,18 +40,15 @@ static struct xhci_segment *xhci_segment_alloc(struct =
xhci_hcd *xhci,
 		return NULL;
=20
 	seg->trbs =3D dma_pool_zalloc(xhci->segment_pool, flags, &dma);
-	if (!seg->trbs) {
-		kfree(seg);
-		return NULL;
-	}
+	if (!seg->trbs)
+		goto free_seg;
=20
 	if (max_packet) {
 		seg->bounce_buf =3D kzalloc_node(max_packet, flags,
 					dev_to_node(dev));
 		if (!seg->bounce_buf) {
 			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
-			kfree(seg);
-			return NULL;
+			goto free_seg;
 		}
 	}
 	seg->num =3D num;
@@ -59,6 +56,10 @@ static struct xhci_segment *xhci_segment_alloc(struct x=
hci_hcd *xhci,
 	seg->next =3D NULL;
=20
 	return seg;
+
+free_seg:
+	kfree(seg);
+	return NULL;
 }
=20
 static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment =
*seg)
@@ -2309,19 +2310,21 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsi=
gned int segs, gfp_t flags)
 	ir->event_ring =3D xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
-		kfree(ir);
-		return NULL;
+		goto free_ir;
 	}
=20
 	ret =3D xhci_alloc_erst(xhci, ir->event_ring, &ir->erst, flags);
 	if (ret) {
 		xhci_warn(xhci, "Failed to allocate interrupter erst\n");
 		xhci_ring_free(xhci, ir->event_ring);
-		kfree(ir);
-		return NULL;
+		goto free_ir;
 	}
=20
 	return ir;
+
+free_ir:
+	kfree(ir);
+	return NULL;
 }
=20
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
=2D-=20
2.54.0

