Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115206;
	b=txP6qsJ2ZnFa5VQ+MzfQ5ipjJtpyds4w/vqZRDXreUjUK539X/SzqzNLPBtLdwd8M5yF
	 NDkzEy6MocJ7Qg9Z4EG8d731V5reey+lNZVpP61Yn6zoyDxkhtFibOVOwsI6fwxQ6Lmid
	 5hInLUvS8CpCPQKMAbKAiW3ObAd4ZQ1SEch0mosb5W8C5b4NqEETznIJQlIFzmlEw4QJF
	 9HgClQtfFY+ByDKzJZr94aJv9GXs8NagrunsCyewn+tNnTILEK1lGwugRO/0scwyv/swM
	 rGpJBHw38nFuPBeaOf3HYwb8+Jw9HXWTSc/WGWbz/HBAHRgoSBlN0hnzne54xTh8dAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115206;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=XEky62yZEI3PzyfRhFosu7siraHz5qttThAmv0fXEzI=;
	b=1y/WApptlCZon9VzTLWtMSd11mndwWPCtA2Jh7YfVAa8IkMvAdOcalkVYXqCQjXVO+fD
	 YMt5XWRIL7KZUTCT2vI/htOt1tIWp1r2V4DjLT0bCPbeakipSwzdtz5DdZVDXDCFIQ5DQ
	 HyBqxqU+OfCyyzGc19cuuTFYQfB+dO5B3zqEgs9JqHu4iD/tLrUJU+mT3hAPUweKlFtUZ
	 hXoTlLx2aMtHpD2kk0iRlg1V8DE7/98e+oTQQnUxdWtC7aN8KfRZgRl4iTuGOArW/kR8B
	 5LdwA07qN3w76YGq8AeYGsmCu8qQS3Ht/kHeFTLS2g7SuddlDgI6nldxvSantDyPQXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=HRiRyBL6;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5828606A320
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 19:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5828606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=HRiRyBL6
DKIM2-Signature:  i=1; m=1; t=1795115203;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:NjorPSgcWVruJI7Rvdh8KxINj+vZ
   0bB70EzGfoGVRqSGjBp44cDzRzA0uvFr77XC/jf3pa4fubSy53FbXSsrUE5WTSEEFgkRI37dXp1
   UBpxNmcSOvWUObn+r3e/ZuDC7l6J6osAA7iX/o7FKfPx7vonmksjA0uXiI5n+eiXVNqRgN+k+fu
   z6wctNyqvco2yl5OUleamZdOL/K4NnloHW7MA9PnBnhF3kW9sUTSm7lRL8j30sgcey57mYoNprx
   gOs2MQhcTLMoO8U+ti65sz7OUZc6L/AifUn+rOtocoN61lp2gWTGokL5XdexPiVDbHkWDbmsSVA
   lWOVgrSUFYTkcA==;
Message-Instance:  m=1;
 h=sha256:
   /4DLHHJ59to/jisC+sBnMDabSoqI/HMKiidoGCfo1b0=:
   XO9lZBJw+nAZUFtXM0SdiUjMaI+ZPCAPcq5lLmCIlzI=,
  sha512:
   ULxOFAUq0M9J2olW7dkT3mihCJ4y1tRWcYFaxENeulGpkYeXTTxR7A1A5rDZfUl78CNWzK+88Rtax1AxXgyHfw==:
   wIjEqcIRJ/C8MUuSNUBB98X1snBJUSDXgkMu+0ouAcqrAEbENCyytBged+hIAl++p9kdJvuTKvxITwjYXWI59w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795115203; x=1795720003; i=markus.elfring@web.de;
	bh=XEky62yZEI3PzyfRhFosu7siraHz5qttThAmv0fXEzI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HRiRyBL6sJQISfOJh30SD5wrV2mxHN4gIBoQfF/TlkfX6JmdfrAdgk9Sgm/CZk0Z
	 dSTc8xHyNqL5rhiqtbZ2gnWgOnwpZbrs8mzmSRRUbWJesXDyER7pjeRPKzmu5QIzP
	 FMTHCv56UYuSSgPsbDVKZsr70hh6+56G4f7+i/bkijMiRwLWbfY5QBQvsQdqbDvZP
	 x3oBmibzLytGe1o8y92aNpuvml1W3LXpczFkbrllkp+QyYWUgfmXD/nEwwZBgYfm+
	 XLBjyc9iWt6IjrD3X6FgQ/FF10nMQRn1HZVJ/C7f3atHqWbXUOkhADPF6ma7BwNjl
	 n9+Bm3edWYAeoQJOYw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYu16-1wzIv53FHk-00WYhA; Thu, 19
 Nov 2026 20:06:43 +0100
Message-ID: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
Date: Thu, 19 Nov 2026 20:06:41 +0100
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
To: linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Al Cooper <alcooperx@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Justin Chen <justin.chen@broadcom.com>, Neill Kapron <nkapron@google.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: bdc: Use devm_clk_get_optional_enabled() in bdc_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1rxXXBNg2B1UTV22Pp5qATblocaCTqDBn/YFcYwIp5LHemN5/SG
 MzLWdQvkkWa0XKNTClIQW+R6fDKECBoBMHgzzingBYkNcKxTYYeoXmDfz1++xxltLN4jfCn
 ah3dQppvlV6oBLdrFRIXReDDaxaUnCCcB139KJe2GOGxSwBrJbw9+IGJVSoqK4ZjjPzW3bC
 dN/Sjeezj/6xJRmjyvOJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tekpbcFTjCE=;vtgjJSx+gXj9my936pfKvvzIzaN
 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
 /p2K+kDUmZ0RA=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Nov 2026 20:00:07 +0100

Reuse existing functionality from devm_clk_get_optional_enabled()
instead of keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/gadget/udc/bdc/bdc_core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/ud=
c/bdc/bdc_core.c
index 5149c98bf9bf..ce09327250f4 100644
=2D-- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -530,16 +530,10 @@ static int bdc_probe(struct platform_device *pdev)
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
=2D-=20
2.56.1

