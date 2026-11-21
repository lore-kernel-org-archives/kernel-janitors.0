Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273242;
	b=HeYcUUdZM0H400DB3MUzuBv+4iixwVmURiY/u0uwwLjE7aMY88CVxlJewgz/13l35fXj
	 Chf3c38oxAuiYHXGBlRZxxvExMxiifTil05BRZQz2CtrlWPVm8XSMl8qVcH8/oYNjwZlo
	 NbwNlE9AmI/d12hpmCrGwEHGn18PIi7pvTVzzDzTiJg/DTTsVDdMvrmwzaN6kxXr9MHDd
	 J0tCWcOqDdzXUo5Q8TRLuei3+6BEp3OBqPEMRVG9/eyCMUodU3dHDb+8G1hUMlAKq8EVZ
	 WczXt8WYj76EH2A4Yx9JJvZVMOblpgNNRiPeQ2W251Oz5HQazwZadVZ30obtJW/e+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273242;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=1Bf8Rb2qkJE8FFZlHI178igE9Sw93RWzRCPnFzzx8QI=;
	b=0pgi1z6JXvPo7liFzeTZY1CA5xTLbgqEA2oF/Dwf1ol9LDOC9TDFArecm9Bi17tHmq0I
	 yzbdM01R/GJNu6TQ3Z6OrkCgz81S3PSlohilZfO/QdOw67s68Jw/+5qSh6Z250ofk7l4f
	 LYNH3DDCYRk1yatrzdPmRTStIwU54LVCmKZCsZ2kFh+EP9twwERVxu/NJtuyYBMXAji1a
	 3Eftb4R4O3K0pOboaiSqrcIxjWOg7MtEFIT3BzFIPr0s0bogS46RrGJihgRH0y9Nw2cAd
	 Zhzmkn+DsWqSlbwLTyYHdMme56gfALLqy0Qku5jQ2eoXBElU0Art3d9VyhqiqAYKgmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=QwMYw7dR;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51BF606A331
	for <kernel-janitors@vger.kernel.org>; Sat, 21 Nov 2026 15:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51BF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=QwMYw7dR
DKIM2-Signature:  i=1; m=1; t=1795273233;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:DS7dUOadbdTTWT392I1Xg0vWjIZk
   gsLnzXx8pceZcZ/MBHle+7P5xpg7AU6XHaBsBC2GUdbHKkaw1jNxzGMcWrHftw7wu59CsXLT3FW
   HrX6tAlW+bcFFlsyq8etN76s66VNzRlrgJWPTdK622WDNi/pUhDJbT8Yruv8RgqotF5ZS8eNWeF
   L3O5ZxREzZ457DX8TozE6nFi5r805ES6+0si/OYPaeyZFn8E8tXHCx8xRaZabRNRREULnTlUZKd
   eYnUM8XVuI/lzmhfh4tqdFBzvKD06CgtnNe5rrA23hJ5ZdBLc9ROYTHhITflcM+XV/0+Nh7ZS4R
   FKtFiIFf0V4s4A==;
Message-Instance:  m=1;
 h=sha256:
   mvB401Fevr3SiFiNvyorKZTBLfg4DsQ/fzD/q8ibHZQ=:
   /jj2l7He0JXQHNpBB6cJGCmMVvVhVrIdLLejocvJGxI=,
  sha512:
   dCaQDstCNzCZQMIzcXKGJqwNKD+i+adUhHH2hDwd/mFKeFKhjG8ounssiC5CdBNO4CSreK6BxG60hpqhVezU9A==:
   Jr5/uC1DAR1fwpg5wnalOzCwQ40A5YAPvH65aoS6yZknCUyaZEDvCbeZdBHT2axF18SNPo+C5EZx+9cO3VekAQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795273233; x=1795878033; i=markus.elfring@web.de;
	bh=1Bf8Rb2qkJE8FFZlHI178igE9Sw93RWzRCPnFzzx8QI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QwMYw7dRs0drLV7cZFSN3tyfVw/5fRQ/5ihYL4jtLAlJq0pi05AEuBnLDFWBFsWv
	 4cRt9n9TUWHXnjP5i5SrPxgW88NfUbgUtP0xtwsjt+EFBCol85dlF4o8qBAF6HtPq
	 oLLrQWpJGG4//BaTu6gvstYpwm6KRgnY5ifrRDRB0adC0xklWHZglXtVK9AD1tTiI
	 sRQo8o0MLFeQ1evud9qnrs3WIeYSK46/T6ZlTN/Afr7SRE5u4i//TNzpWlfOvH7NH
	 OnLGWu98grtzeLZTSYO0c2wfcLvuh9bBkJrPuFTVgBcFsyAb2773WoEXsC6M7CPWx
	 tsq4s6dVeH0Eag+M7Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MpCmZ-1yKZsE2G6R-00p3FY; Sat, 21
 Nov 2026 16:00:33 +0100
Message-ID: <cc916c01-fb49-43ae-ac08-047f5fc5001e@web.de>
Date: Sat, 21 Nov 2026 16:00:30 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Al Cooper <alcooperx@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Justin Chen <justin.chen@broadcom.com>, Neill Kapron <nkapron@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v2] usb: bdc: Use devm_clk_get_optional_enabled() in
 bdc_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e08j0PPUV2gxnbKfeZinrjM3tDZyY7PEYab0Oxdj7pIKS+mQx3n
 v2b33oQqqB7zuIJoXvb9Xo9BvxkH3ylT9eB5zOskRjsp6j0HRFfJH4W8+CNwiq+3wlJLOqL
 O20DUAtRKWdJaJ3uRPl09ZAHEgWeLLpeuaG+84ocwzCJOS2BnHj4/vJ5cbLW5nApcYtzBfz
 AmCSDUjNtN8qyKTdLLHkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JWi7ubydhso=;jwGIf3yjmmrf5osuoiuB7i64CAj
 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
 Q03V0AV

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Nov 2026 15:37:14 +0100

* Reuse existing functionality from devm_clk_get_optional_enabled()
  instead of keeping duplicate source code.

* Omit a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Cbdc_remove=E2=80=9D.

* Delete the label =E2=80=9Cdisable_clk=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
Christophe Jaillet requested further adjustments according to
the proposed changes.


  drivers/usb/gadget/udc/bdc/bdc_core.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/ud=
c/bdc/bdc_core.c
index 5149c98bf9bf..2369fbc1b70a 100644
=2D-- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -530,20 +530,14 @@ static int bdc_probe(struct platform_device *pdev)
 		}
 	}
=20
-	bdc->clk =3D devm_clk_get_optional(dev, "sw_usbd");
+	bdc->clk =3D devm_clk_get_optional_enabled(dev, "sw_usbd");
 	if (IS_ERR(bdc->clk))
 		return PTR_ERR(bdc->clk);
=20
-	ret =3D clk_prepare_enable(bdc->clk);
-	if (ret) {
-		dev_err(dev, "could not enable clock\n");
-		return ret;
-	}
-
 	ret =3D bdc_phy_init(bdc);
 	if (ret) {
 		dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);
-		goto disable_clk;
+		return ret;
 	}
=20
 	temp =3D bdc_readl(bdc->regs, BDC_BDCCAP1);
@@ -576,8 +570,6 @@ static int bdc_probe(struct platform_device *pdev)
 	bdc_hw_exit(bdc);
 phycleanup:
 	bdc_phy_exit(bdc);
-disable_clk:
-	clk_disable_unprepare(bdc->clk);
 	return ret;
 }
=20
@@ -610,7 +602,6 @@ static void bdc_remove(struct platform_device *pdev)
 	bdc_udc_exit(bdc);
 	bdc_hw_exit(bdc);
 	bdc_phy_exit(bdc);
-	clk_disable_unprepare(bdc->clk);
 }
=20
 #ifdef CONFIG_PM_SLEEP
=2D-=20
2.56.1

