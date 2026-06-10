Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA113959D;
	Wed, 10 Jun 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080838; cv=none; b=YflkQYDBmoCaSBhPw7rDPZgbCoKv910bjYMTPsdU3Kcc3Py8mYbf189QOtoQ+E1OUlD+VfgGcDdffLf3IE1/g0TQiw+jHk+RGvV7VXdcK+WyYe0NazYyBdYaD7qXh/+nFV0fLSVCrQfwkRNjq/1vRjGr8ejMlVMk8MgPUij6mEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080838; c=relaxed/simple;
	bh=VQP3i0zcEzvlF8N+/8GRUI8lLfd6BXs0TFwgWNPgKE0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gX91vzpeftsZmzl13Ixa0d/+x+QYCyeQ5/SVV1AK2uhbQdiQfhhHKxYe7ooXNyJahpw63CIiFa5YyeQhG+1DWWryTTjsfIX02VfV0UCvlz4v1pH2OnPc//t+RLsF+23pmGeGjX+9cm/GYDJHDNRa+Fp5U2scTdjA0VhWpwlnxJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MeUtJtue; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MeUtJtue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781080834; x=1781685634; i=markus.elfring@web.de;
	bh=Hp3x0V99iEPJYIgjeRGiiv/Kg0j43xWQao6nHDsMj7k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MeUtJtueGNuROCCw8c9X/r7FcSDXSPMRXSu/ezAMVymoyj2luig1fR4w7gRbp69O
	 SyirPW4xKT1nSv5CQrwSOWPccfs2S3BqVDpre2ykvk7tW1JvV7Uw7W6tgYOdt6g5l
	 kTyAnMt8Wx0oUi1iRvCP4Inrn7RA6D1EAbUq6VYXxJ3OPAtt2zusaf140VjxPefkD
	 4DI49wYDHyJBmUljnRrlt6mTFug335b8IzzgKvBJ2zJHJfnBki8J7ZusB4RXOdfrb
	 uIYy6X0+qjg0bMjORLQBWP+ojFLazBvimhvLzLO4gtbTS+SZrrMI40S2UEADPp9jL
	 umlYVEIxuBgsa7XHZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMGyA-1wqYK41ZNm-00PWkt; Wed, 10
 Jun 2026 10:40:34 +0200
Message-ID: <d957773a-dad2-4c53-a93e-e189aa8605e9@web.de>
Date: Wed, 10 Jun 2026 10:40:32 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] parisc: wax: Use common error handling code in
 wax_init_chip()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tJzjqUeUhIka09OWMV3wwFbPQaUaVHlR2NsmcXHnQXp02EkHp89
 /e4P7yHpVlnwngfUyx/TWfxjaL6o/QG3TASozZ/b6dgEqTxlpbpixYstmoFB+cco0mUVIHl
 lIL+ISek0I81MyTcEoAMzNdJ4tTjJEYu9c39QMQ3FKVKEwk6Bs4Rfao9eo9uym52BEvssvd
 0lUKqBLnpg3myBgDvCgSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vajKU3KT+/g=;fVW9RAiOTP/V9syrxyRWWxBqQgR
 ZM+4Fqq9E1cOxXtyHYpJAVktj7cnqYzKGNNBmjvvPIf6CsU7bxPDIwZProxT5n6tlQq7LJSwy
 CgyzL4KSSbgNTA38uUyspLwOY+RdL7sR0LjmvkjZD64ooSRLNex3r4FbcLfv8qOGtB+tLMhVG
 P6+L/cwai0qv4ITNTx2ZlbVj3RknHwAiCDy73oTBIpoVRyyCskISP7Hue+8Syxam/fKGcYwQC
 N46UZ9isD2tupH+1fOdhKvmz01+xkq4+jqLZbkCcvxJYUDXa72u2Ptj5dWykD5d9Sbc+x4h23
 9hdrtMm0//D+Vl8GCIwyqZ0YEyFKYezcowiUVadjQMOWWZmY55ShW5Q6eReI/733flyA6rlFn
 QNqeF8dVQI+S5r8RdE/YqkzlDCUZGRzclu00j/MNfhX1377lHHpYZk82t10eHnqF9BBCtvNLE
 QvIGeRM+i2qDvp/pAI23iHmOWcVBZDJmJSaIC4aMahTSMYi82u4XpFvoJMzyy7Io8k4UnCjzI
 4ATqb8bzVhoKQWSmSJMqvKLRVOqiryQdnaB2rKPeYleYKOPJjQOFCrNYgBmXnU24viXQ2RIzU
 TXJ4kyG7e6RnRNw3zb2NSEKZ/ROj3sTLHlnqBw8IICFFvvlJA0hAfY/pcNwp0e3JjiUeGTECj
 kAzbqn8/OvNJKQXavcwuniOSTWFcpJbcsQT6VXdCVsurBAFmO3pN6kSiFafzcZsTFXSWDxV7+
 1h1E5EUsP/2HmyQTKwthZh30h0PH4Q44kKNx9TaWeZ0KgJNPaIXsoAWptUUVOJDy6mg8jLyL1
 E/ra3wLFh/ng9+ayKbVh5Mg5ug5W5f9nJp4IgyxCKpSnhmZvBGSQ/NCXMeRIGm6SAQbSu/SV4
 LhKuNQU4PHCIUq9sTG8sHA0hsCaGTeLQmSPVbZetU2SE/SzKn0nOUnEJ2pdo2CXCNUmGTHMn1
 A6mbkiH+Ea8JErTaEc2K5awjtq9YS7YzWbzjEJSciXLM7qQbcQIA+z2zOIPlGO36bnMSW3/FG
 lnTGbKzkvRf7fouaRAz0A3fQgMbwHgMBe1qqI18GKqhW7+i08DA7JMEKk2HjNahaOh8Lwe2uy
 jCQwERUJgSonSv1cD+w+D3dZ2R9PxBmfTXZMSPG8rAKiyaBXST0cQQnHsdk2Yfz6Flrvc0G/9
 MwhMaPuGmQitC5h0fbDsIWHKlb3mKAKA17Zlj3xO1jwIiqo/R0VoADi92buQpu3c1Hh3LmJ7d
 4xPVcdvqz8Ybc8uqpZb14MZ1JSgKtgjU8RmwOcYxQ/Pr4CL7dXltFTNOTBSzZhMVQvhzt6RkX
 EVEBent3bKeAgPizj7x82uGe7k4Al0D2ADktb8tV008tJDg0A+hrnlDsUKDVIUG8l4vw2JI1G
 LLtMn1Qz4cVW6OuQ2kfZaUMpRQ+9nuZyTCJZF8xdFFzW2CdI2JsmYgmogNEjGqRY1tReeDthQ
 GxBEQJy7i6QFf5oltmowsXqNJ2w5wPcvbHmB1fO0XmzP2bT8OgKDtDI0ohzF37DcTmjKvbrm4
 8Jkdz4Fzb69HKNBRjpZiJ6T2VWMarsBZjRbnER2WUUWbdK+lnCOdKaVfANKRpH6iHls4bmZEc
 zOHsLSjbyiOLFYYB+8z6w6K+OYcdFspVI35/pRW1jTTrBqHZCqtXCM+2NW9HGsVuUj4L6I/AE
 yYk4qB8Sd8ckpCdYlkMmSZ4Vuwy4rIy7aY3h4KtaWmKENd2vcnWitQGCSlT6XdWEYNla/NjrR
 N1P0RpfS/v8veMEYCww1AfLXMaBymbBvWID6+2ZewtqPhyYGApP28qmgdC+8W+2p+Fb54LaTk
 8avOYN7vW9tj1YGRR5E1nIBZVAFsT7cRtN2k/E4iJo8YTt5DH/BtuKzbA5bECuJD7h34mhQKv
 fPDHyOdn6l9AOdSjMh0VEBRfXZe4qrdtAKKWLppsWko/B+iBn/YGS7WJJ5xa0jFyelFtqQ3+u
 FotPyXmfl0IHJiSKyxPCMQ9y2kvQe87oCIhNIRfWr4oiAHy0qYB24cxatdJn3dMremGbqueWM
 17/MKGlI3vdzv5NfOP7ZO4xIjl8Ps07Zb5w9wqy1P9QlbsKKxxdzdFE2dh971e/Dvo+I/4wX0
 Kw/TRmv2db+aTwoSI94xJ1vK733w89vcQtST1yniKi0Xg8AV/2VY7n5V0ALRGYYcVVgLvNJGM
 qJ8Sb/8PDrg/UVXQdXXx5+Scf+Xutm9YUHcu3zge7LKiLRrCviW0vwYMWbXkHk0d4FjBiJxsQ
 uEBY7SfebRG+V1jUC84Em3YthI+fnumRF5gPcAOnFB2Y0WohoL9FGYH1Ynjag23jR11LJPoHA
 2Pgi+I5MyGc9mKXObqnSwew2eLEVT5jH+6aoj2F40RN/1OitPcFQ0L/9P0knz4lHntF5i64Ev
 xUWZXrcTpw4Hu4auqNRfOfsht2BqQxYlk481qMbni2V9tmZlsOU+osFggVaPm2eYk9oWAhWvw
 ogV8rSXyup3sAw5j4MLYqWKZDtO0fefi7Uni/Salq4UUkBEZeyG/YG7xRA1O2QveZNyZMTrjj
 hiMNflgl6QXS2AMu2i3M4j+bX3s5wlcikPsjTnFjNVK3JsInlmSjFj3afshrzXGNgQcaTKDQ4
 69beTJdV+iDJAHXH02PtCtcHzonRpWu7jccyP/JFANJ+eUmRc+STMCwpF1RJ9XKOIq4VIJWYb
 TXcPpZ7naQBSCpThnRtt2R2O6FHJoW3DqJbjtYgidP3SYGgVsVDNKzNBZLMs+Px/IWaJHSWrI
 XKVq4tJina32Q71HzmHnopvWR/qH+6Brv4/OjHVS+4gji+binOP0In0DTc0M86Kgirl7NdlMN
 XVp73Xl/dij1CTrO0cD2EyvK6xlzddz/1Xpv3zA6UcZXgRAu67wYdWH/QA+aJUz3661xJoZp8
 zE/bp0BVax7N2IzPJDsHxJ4Qly5NMWvs/UbjQqbToCxv6sNtYSU58tt4MfxhCpje9yl7LMzY5
 KTYyOUP3Wlb8/6ryTSaJC3yzaW4hKoQWMsDCakDyTUNX7yvqywpy1Gxemqc5IA/7W0gWztQsg
 7XbwQ2qdR6OXGMrlm/M4//OzX2skDsgJ+Yuo1oNGoDDxkgFGK6GckNlmxANcJvcRcVYF24Bf/
 H94SxaYUmiZ9EN5926NBkWLEVzoViN1efPyZrFtcxxfzGY/D7O+T0CU4zjXMJmeWA9WLjAie3
 krpYNo1Ux0bBYAchpEO1TdfyZDZwxuuOOmWRdbQ10hmwcLiig5tLESFe1PSANV/it8oxGNuQO
 krTev/zHGbnAUj2/BScShQXxS5erwlwMMI/s+WdtgdR4jaQaTTSGMfSA+7wUuk+xX8TQ4s9Hd
 0OHAFBFQnLHoir9lfSMfI1YdFppR8waCXke5YTU3KtMN/hFfXXDyJJ76rBR3oy/HBwa5Q00IB
 Lptz7Qb1+RqP2dl0dgQL16eX6ocH1tDQqwRmRsheSZ1H5E+nDdY5Uaosl1CwmIAQmjbMfCnP+
 BM3aHGXaN7zp4kYWNM8YY+Q52m7xwxfQ2mRkcyz/yFtPg+mZhTHB0fp/+Vo91w41q9QZ/qVZS
 xJJJVl81wmpg/zdE1Bz8rCSpVGTkBajOpgPREWlGX9F0g0jG42kyTUybOqquaiVNobNwqvBvy
 hbbkmn7lXp96dCm742ZXWIVYCsTMgoajtCi6jhfn5cNPTJpwL6Imqg69qOZC9HgV2Bqdl8Hqb
 anc6dSfO0ETQwbrWdYN4U9plwwAI1a9r0jgtdknfvXYZH28P8rZPwl6dBgn6DtVsDTZmBYvM5
 3VdD8ByjsnxOKB9tk2YoBQmdICsbnQaQl8LytVwcDCfdJVqUq7r32dtMfCUnXmsJRPySMtOK1
 tcKIn/xAqa7j3zDfmfLm3Isl3uyqdSRPiqimcGFPJcAKoikoxR8Q5K2pIQ4OJVriKYu8M3E39
 r8kez44fhEq+AJrM6cMA0Sq6lhhfLfTVIYbyBjWllgAhs0G7vZqVZXZNOcTcbDQ/QcPub/AyU
 FU3pb2oQ9TTh9082cFSs4i2sVp9A8EOjKYtTR6L9iDqgGc00P5wfWiWt8j6fLnFaIU9m5aGgG
 9dT9IYMHU+h0TW72ZqXOzFGsx932wjVfplF3qYKhc5Hf6fDdylnN5zr2vGC7I+nQWiy5k3iS7
 4KgoNcJDer68zfPNCnoh0oWaK9ktnwDYCqWYK3blUFM4D4dQ5cV52ZX5UQRQT1JhNeeG3fiHk
 rqeXxg6Iz6vPsR+DwGNXnRpe31FKH11NNEuY7iWeUsqe9THP0hUhL0yxDDtyAwaZPixiEgrwi
 I9KLZZGDaELlIsPvsGwxjrCsSS4QldaQ81sPk8DEqty9z+KED04F09QtcEFV2HBvwUkUIzmLZ
 2l/comuD1ETkFwnGPLG/wxYfBF8xRkZEOjGt48GiiCZpZQ3VzA2m15MazaebICMFW75GRjZHp
 +YAwh9kGD/zRyISbMiPCeVcFyatAuFrU7soMKZ8lS7RIoCj/J5jobtbRid+eS8TR0tvlqQseG
 yvVd00bQHYQhieB23noEeMGf008bv73v2gklJlgNtZXi1occXAHxILB9t1ooCF9pc2G2XnD4t
 t3E4Be/cQSDoIH+jHy2A+JcCZTLp9MMGdOuSeRjj1MbSAEB0i5ARpX5m7gEcw8rr+0PYkAWEb
 5ZhG0efcyoqwg8ARKvKMbRNfudoNnY9JY9Hl05Z/s2bLP2YschMRUKgoWbxuPX+XLKLvzh0PA
 qMwu98gXsbHxd1xk5wFjmvbX7yO+eetJOMryEjuJuY+fimKSZhcGVAMOqlqSNAkhFoPdC5Zd3
 UmPfDuj2zOvdG27JiWVVFzu0Rshlrc0/sZHOE/q+x5vGIw0ibCQVI2iGpSOGZnLHw9RqHP6Lb
 nPOZYFp+v+C4Jy3a/G3t86NmcGbU+oMUyHNwMW+akKR6Ghn8N45jsC0cFMbS+9XxQDEZcN1AQ
 oXfsIuj2jHp+uHJktkQtupFZ7bzg3UoNMaOo+mq5mdUsYm1yx8aE+gUBCBMQxLcSqQM5Ts0w0
 aGn/wLK+/4QFrF5wl2uePESFHsRW6ZE1YOoZDQNgNic6a7jyhNpGLD/dH7Z4fXahmqEEnsoHe
 qCH9DNrejqkpgFyFQ6ASbd/pXHlPPjTBGA3kXNCQiodDxrKw1sri47669uV0qnVZj58hHV+XL
 33KCzd+ySspyCsNgm/qaxuEFa1C+EtojL7zKjMayldjkiwX4YPWt1xk0+AGWghtgKZ2ZTkkWC
 ZcCQF1rvsRMc3demYaWhmuCRejU/MlKkvSbi1gciWo+yACj0TOxDGB9TJHoGjToYK9AN3tBy0
 uxbHRe75O1C+5QdUkxlt0aMMs37fAF17Yfelq2n6uTbWFBw8STm+TJxcT1m2U7d1dVXxGzXkR
 mefVSrl3Tt6rFN7J8/IJa68c2relb0YZCdTbdXFC/dbFQo8LFfA9lpo5tr1bIQp8Cyd6PZaKa
 W9RTobqUTrbKaykSymzmkTnYA1oa5/Xy/pVt9XkytdoavGcJUeVeBfhKcFH06rZBiMUKyrBtd
 nG2Y82YFiFJtUCETHjLI0o95CvXwbHCTe7yxdL7Cg1ZKLvIpFYa9/fbE7gt+7rJXtXtUURbVe
 28oTC3Ci9KhaOXlEeusSLMcUKhgd3hPm8uK+CnIyi2H7d5Sh

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 10:36:06 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/parisc/wax.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/parisc/wax.c b/drivers/parisc/wax.c
index a82a5e88ed6d..5146b37b7016 100644
=2D-- a/drivers/parisc/wax.c
+++ b/drivers/parisc/wax.c
@@ -88,27 +88,23 @@ static int __init wax_init_chip(struct parisc_device *=
dev)
 	if (dev->irq < 0) {
 		printk(KERN_ERR "%s(): cannot get GSC irq\n",
 				__func__);
-		kfree(wax);
-		return -EBUSY;
+		ret =3D -EBUSY;
+		goto free_wax;
 	}
=20
 	wax->eim =3D ((u32) wax->gsc_irq.txn_addr) | wax->gsc_irq.txn_data;
=20
 	ret =3D request_irq(wax->gsc_irq.irq, gsc_asic_intr, 0, "wax", wax);
-	if (ret < 0) {
-		kfree(wax);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_wax;
=20
 	/* enable IRQ's for devices below WAX */
 	gsc_writel(wax->eim, wax->hpa + OFFSET_IAR);
=20
 	/* Done init'ing, register this driver */
 	ret =3D gsc_common_setup(dev, wax);
-	if (ret) {
-		kfree(wax);
-		return ret;
-	}
+	if (ret)
+		goto free_wax;
=20
 	gsc_fixup_irqs(dev, wax, wax_choose_irq);
 	/* On 715-class machines, Wax EISA is a sibling of Wax, not a child. */
@@ -118,6 +114,10 @@ static int __init wax_init_chip(struct parisc_device =
*dev)
 	}
=20
 	return ret;
+
+free_wax:
+	kfree(wax);
+	return ret;
 }
=20
 static const struct parisc_device_id wax_tbl[] __initconst =3D {
=2D-=20
2.54.0

