Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F2D3C3428;
	Fri,  5 Jun 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675065; cv=none; b=Up47TG/WOHscAvXERTXHBJPnLL8Zfpo+JkkxxnntnFhVIDvxN/C28oGrGwGeYzvJsjyrYk1nzr6dNH97jRKico5xlGZReGTYo6YQHnl73yZc66IxIPgzQ50aBefGI2UDQwRxwyu2/VT1iI/iih7JzUweUW7DHj0WGmHr6R7Rl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675065; c=relaxed/simple;
	bh=aJJQZ5m5d/uM/GgOvVDWQukgytKGT4MX1WelnPQ96oo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UZE+h4ppm1sJjWxjRWxgv41AMAsHwh6kY76g01G2o0JggkxGUJt7Z2IgfNIjBmjZvIR46/YRr/hTsgMaC/lrHqjHDAw0FUqsX9FN8aUb/mS7A5abAi8yPgotV3z6I804sFEY+1O8j0ujFhybwFpV0pae8d356OVEr5wQfPb1J8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=D35Jshgc; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="D35Jshgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780675058; x=1781279858; i=markus.elfring@web.de;
	bh=xf6MbwD+0sIvrgm4zp0gSYvAhc2+bONaUW4e7zwhjPU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D35Jshgc7gmibSYh6ZMcf3oB8zW8nkZ43fq+isM2S1+hqG4Dw9G2D/FGpCEFYtiw
	 hy21s/cybWZSzY8R5pewBQRiFxfyOgiG7l2uC24wYF5O0ObTqHtWgHlu9yB1+cJLf
	 L8baBp+3MnOMs6asqzmKIXwDHJITsoVJsTSYnH4xJgGDVL9d79lNyQCwseYrYBDgQ
	 gf3ZivROFPL+5rmxyj9j9du9V/H7YJTOqZMGym/FxCLkG924R+T7gHaV+To7rXWGx
	 knEn71xoKlT9v6mev8lcNB29i+/eyCZ2Nd+DvPWyVhUOtYGIeKPyEYAAz5Scnp19u
	 koe3qPuKVLAbENe3ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0ZsE-1xRbeg0r00-015rpR; Fri, 05
 Jun 2026 17:57:38 +0200
Message-ID: <3fab645d-f8b3-4a44-8e1c-680608969f6f@web.de>
Date: Fri, 5 Jun 2026 17:57:35 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Minas Harutyunyan <hminas@synopsys.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: dwc2: Simplify data output in ep_show()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:28CdV6dU5nUeXGjdVZMK/A4yEgGq8deXznDy2CXeqYA8bZse8Zl
 AXqwAPGKM2/wEQgqfv+to29CjMmBkwkqi2KlandlmP3B2EOgpAagqld4pq2Km1sVmzeeh/6
 FANeUCSqTSjg4f9DdYgT5XCSCNnwqZFBiBEfmY9o2Lj9uIIWkio6Ko0mjE6zIq8djNmDX8x
 pX5M/RqMIPPlsB3VAU6Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OblnLqYUtiQ=;s0Zb8JKoeHiFFREMuQcJpqRgcfC
 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
 ngPJxGJzNI6u7E0DsLHNVvNRBo8=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jun 2026 17:52:15 +0200

Move the specification for a line break from a seq_puts() call
to a seq_printf() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/dwc2/debugfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 3116ac72747f..8fe873cf4af2 100644
=2D-- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -252,8 +252,7 @@ static int ep_show(struct seq_file *seq, void *v)
 		   dwc2_readl(hsotg, DIEPTSIZ(index)),
 		   dwc2_readl(hsotg, DOEPTSIZ(index)));
=20
-	seq_puts(seq, "\n");
-	seq_printf(seq, "mps %d\n", ep->ep.maxpacket);
+	seq_printf(seq, "\nmps %d\n", ep->ep.maxpacket);
 	seq_printf(seq, "total_data=3D%ld\n", ep->total_data);
=20
 	seq_printf(seq, "request list (%p,%p):\n",
=2D-=20
2.54.0

