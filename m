Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D8B2D7DCF;
	Thu, 18 Jun 2026 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810268; cv=none; b=kMWZjmpHE0/Qj2+7gs3+2DUZr39XXCCbSKwyTJGtd2e/5jyMTJTIx5tfTPuG+fiUQwh/bvOMVGLhyWrTd6oAhspabjQBI9+talMnF+ZKtCW0PvnCKNfWmoR4GoxVO6mrNm8eYy1Xq2Ef/2+PZQGxexgKY4/Lx0SgGtmi/st7Rq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810268; c=relaxed/simple;
	bh=D3UeTqCwtEo00HtiBE01kd5bHptcXKPTr648Sx3KQQM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AAKCbScWNobeU5vGPeZYa10hJTVCjQ/bEX8Tmy1IofHnHDVV3rWYk8cYwWQOIwcQ4D7ZakaPzVEIh7vXgo9EdwqCZNwucxJQ0felglkHbEtFAbjILRZUw4zdAXv+blLei9Oxqwczv36F0MwdY09I4n6/73tsr26s1KQfNtD53vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=k63//Vqm; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="k63//Vqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781810236; x=1782415036; i=markus.elfring@web.de;
	bh=Dav70Nu4vyRiOCJbNY0vTUPpnrS7bo+NxiQ5ypAh3jU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k63//VqmIsH/z+xJTwFD01o39mx5pEAv4HK2mKKJa+w41P9GBZ9OB0wZGnCkuJH+
	 FffEOe0DHob8Mjtt7OEAy25ild92D3e4zwgbtTLAR+FSVhnYuM66WizX1UAVyXNjh
	 HZ64qt2Zucb/kN5hGZvcfM/dP0WjZxZOK1ygd2CDhsnFcDE9pzF5AXDUHOi4iiDyC
	 7JiGMSdyGnDoAmbn0FEEnATIkmqRR4jUiXtou9wifzRI7F32BdWaHDmYn0SYBFTUX
	 GAOdmakIZDbHG+0HwuAD2BTX0WBON9WhJO8EV2jgusBTiJsFt/0jLft6j+Ff/Dv9I
	 5092kZnho1aU68z+LQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrwsB-1wveXp1y7R-00mh9R; Thu, 18
 Jun 2026 21:17:16 +0200
Message-ID: <8dd3e02a-9d4b-4633-a703-890d5d108318@web.de>
Date: Thu, 18 Jun 2026 21:17:13 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Christophe Leroy <chleroy@kernel.org>, Kees Cook <kees@kernel.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] powerpc/powernv: Use more common error handling code in
 imc_pmu_create()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G4J+miUrK0mM1Pxj0Ufd3m+dHiupV0JoAuzf1PCuMz/SeivNXwS
 nnnisKcDN/+1fsNvd8yhpsSrpYFZGWY2+6TsPnyVEAkkRhD0WP3RIWuDzF6luBg9qB02sTp
 jgDjq+RIzU5qWZyQjLW4vAqyJp3WLRtretqGmoypXtMl7odRvvxGbdQMCErjMYHWSwNk6MK
 Kgt+WlIxS9J9lVycPH//Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SBOsiDOvW3o=;mdWN3JOHMteUmrgOflSdbkzoyiK
 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
 ewNFiQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jun 2026 21:04:51 +0200

Use an existing label once more so that a bit of exception handling can be
better reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/powernv/opal-imc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/plat=
forms/powernv/opal-imc.c
index b3fd5c648dea..522880d717f1 100644
=2D-- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -168,8 +168,8 @@ static struct imc_pmu *imc_pmu_create(struct device_no=
de *parent, int pmu_index,
 		kfree(pmu_ptr->pmu.name);
 		if (pmu_ptr->domain =3D=3D IMC_DOMAIN_NEST)
 			kfree(pmu_ptr->mem_info);
-		kfree(pmu_ptr);
-		return NULL;
+
+		goto free_pmu;
 	}
=20
 	return pmu_ptr;
=2D-=20
2.54.0

