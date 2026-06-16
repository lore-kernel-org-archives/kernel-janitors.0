Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021846AF2E;
	Tue, 16 Jun 2026 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626815; cv=none; b=tHqKoD6BpJqwXA2t4aSOqYKVPeJ/Db7WV00kMRSNidKIs1A2nMNe6KccaTOoSs17Uf3LRPd5Jom8ItWwLb0YazaTWFfy8vPZe50Qvt9mJXqAqvUHdSL68qnG/lo8mCb9QuIsnva4Hn3tVKbm8xBnRzMgqB6JyqsYlVYbhBvPzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626815; c=relaxed/simple;
	bh=gm0BBaZf6z3EbloLy5M8/yQVjyVVJNG0+7l3jhDtG/8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=rY4Z2DMxWh7uncBG0rLxbLn3pXHnrj/ScrBpQi6JVMaYV5DzhekoFoTu9dprOROHLucvObJzyz/RDH2BORXTjhZDqJQRqQoWH/1VGxLS7aK9qOwOUnXRFUDehrKckSbkLdqOKnlJ15rsJCqLfAvKwTM2Df3/DwFV0+cYczbAI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tibaT0rE; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tibaT0rE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781626811; x=1782231611; i=markus.elfring@web.de;
	bh=4r5qIchrB1rc07cAosKJSmJWeJHL8o9d6ymB4G+sw14=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tibaT0rEvDjwFuohPxqm4iXfYda9C0MsBANI+fxHXZd3Pwp1T+8vrFh3PVB44GdZ
	 r4YSZbVkXqU3msEtT+UiCFD0alqqx032QSdRhOim9JycNo19UJvJ2dc6xzdKWvqat
	 MKHF2et51KhXTAPDG+e2Jk72jtrL3s8RN0HK/TF88fABL9+BouBgtq3CJNdBwGxA6
	 /nx9XOmYT9U3deUf7sLO4eB/HvJj+QZkIlZJy4C7mAupx5hDp+pTbm4SxXYcrlkRn
	 MOjhWKNS4LUuS0Bit3xgCjVx0AgvL+q1peWCC8Dvq/CBbC70zSbJJqpLCyZLemYwY
	 mnb8ijMvdlahWJjeyA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1x98En1tFD-00awHj; Tue, 16
 Jun 2026 18:14:54 +0200
Message-ID: <453375c4-c3ca-4e6f-8880-0e6ff3c74ee3@web.de>
Date: Tue, 16 Jun 2026 18:14:52 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Axtens
 <dja@axtens.net>, Uladzislau Rezki <urezki@gmail.com>,
 kernel-janitors@vger.kernel.org
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mm/vmalloc: Use more common error handling code in
 pcpu_get_vm_areas()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qHSoJ8u/bT1+Ru/5W9HjML+E81GiNHswbrdaR5cl61h1gZxUk/l
 dwK2NLG45fYgtnz0BDdnoBRRCRf/mhqQ7WE+5+dMSKHJxMM4l8hwsFLujJGF97ZvQ62cew0
 xAe66a7eMtnUJjonuk3Ae/pZs4Y9zfplJ/V0e9QqX9yxcIdrG8V14QrKzKtJVF/okrl4NqM
 PPnaLA0CFugYynxMYRgVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5pj5/QQPZEs=;Tb5Ru3uSjPqgW2NnCW/mM/r3uMy
 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
 Ou4cpYevqCtWsWGlea+d3Mrd6hQ=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jun 2026 18:00:16 +0200

Use an existing label once more so that a bit of exception handling can be
better reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 mm/vmalloc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 1afca3568b9b..21a890586fef 100644
=2D-- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5198,9 +5198,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned =
long *offsets,
 		kfree(vms[area]);
 	}
 	spin_unlock(&free_vmap_area_lock);
-	kfree(vas);
-	kfree(vms);
-	return NULL;
+	goto err_free2;
 }
=20
 /**
=2D-=20
2.54.0

