Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD150426D20;
	Wed, 10 Jun 2026 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104308; cv=none; b=VGfNa00IvleW2/wka3KteNgYkZWm7Rb5A4bsdRA65Usbd+7oXQqpsX9YckXW5bAHvPOS1lHfGLHOjfHZvMhsMj6p2b78JhYP3zr4J1oDrIPbJ/Vr0bqCBh/xee7Xzz0N/TrsMdqXmUwy3w/UDOZ0XeMuFoHnQTSnqwyTufrcNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104308; c=relaxed/simple;
	bh=09twubP6P+hF+HmDZjSrCaDAe9uCQ114yF2K7xZVaMs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VDI2VT7MK3LGJVgOpxw4tc9gfl5VGymPmPc4FazU1TBwwJH2rstxoO/kqWkafoEXdl25x5S+BGx4E2DHCJeYu48UcWwhM3Z9qkNUc1IUfjaY/kh19DD76MQ7g6vf3hz533agG2Q03PoHkwzuItwBrvVo7PuGbfb/ZFdnJYLE/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZiZ2eGe/; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZiZ2eGe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781104285; x=1781709085; i=markus.elfring@web.de;
	bh=/67hHk+W7NbPsYULrCbnnZFhKtw0QsXXIqIOpv7d2jI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZiZ2eGe/ykaqQ9uWwKmbO8c7WTyUHvApBvZmkqDai0rlaRCofDmIU1sXQR1klcOQ
	 J6TUd92lWMFNeLpVkr6WoDRi9nPEkFsujtr0ZCtOKlM838OfJ7bNnQI2y9CSPzh/A
	 UgfOAe7gjQqzXw+yW8+uyuaxZA1JlqjBSWScMeIuX06xH/Q1eWf9YJiA3m8RUYFkR
	 noJYuzEuJZUpB4t/2d40YbGkvCIiuTVoadFlVlaDrucxG5Qyfyj+u3QyOUDnniUMt
	 1nx8Ck9db+ljUb6JYbs54faGtuhG/CQDEDQDcGGZ/MFvyroH06M+A/fboxJfjn8DQ
	 l2XoRAfzJD1KscnTjQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7gXO-1xKIDH3PqE-00wJp6; Wed, 10
 Jun 2026 17:11:25 +0200
Message-ID: <f13e34bc-20e2-479f-92e5-167a139bcea7@web.de>
Date: Wed, 10 Jun 2026 17:11:23 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] xen/mcelog: Use common error handling code in
 bind_virq_for_mce()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MAq7XN4d+MqNcQHceBR09FGGS5D+dnyHF50hd5vl3mcYCbkhfBh
 cV5Y4yEAp1Vd+oG145zvrFIqalhWK2TEUCj4NaPAQlmIQCkQstz/CNeCdglRo7V9tU4fZwE
 FqTYu9gVPRCdjglBx+XysoQyPlxDrg3mPTdfCE0MwTA7feJrJlscA0Lu65FqankvaOz4QPP
 GOUPan+I8zAyvjh4RNX/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6mJcs9brbtw=;/YqmtxyExKkVsjjT+y/2uP4HMwB
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 17:05:22 +0200
Subject: [PATCH] xen/mcelog: Use common error handling code in bind_virq_f=
or_mce()

Use an additional label so that a bit of exception handling can be better
reused at the end of an if branch.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/xen/mcelog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 53a8720f5cae..df15d5cf6d4c 100644
=2D-- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -380,14 +380,14 @@ static int bind_virq_for_mce(void)
 	ret =3D HYPERVISOR_mca(&mc_op);
 	if (ret) {
 		pr_err("Failed to get CPU info\n");
-		kfree(g_physinfo);
-		return ret;
+		goto free_info;
 	}
=20
 	ret  =3D bind_virq_to_irqhandler(VIRQ_MCA, 0,
 				       xen_mce_interrupt, 0, "mce", NULL);
 	if (ret < 0) {
 		pr_err("Failed to bind virq\n");
+free_info:
 		kfree(g_physinfo);
 		return ret;
 	}
=2D-=20
2.54.0

