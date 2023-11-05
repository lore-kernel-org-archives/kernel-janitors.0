Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B090F101CB
	for <kernel-janitors@vger.kernel.org>; Sun,  5 Nov 2023 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QnP4mZKZ"
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BE0E1;
	Sun,  5 Nov 2023 07:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699199415; x=1699804215; i=markus.elfring@web.de;
	bh=r9OwS1ivzSWe+FjftUfNAX167xv+AilwuKPkbzNdkTI=;
	h=X-UI-Sender-Class:Date:To:From:Subject:Cc;
	b=QnP4mZKZ+4SYxL2AJg7rZW0ShKW2s2yI9EF29FbrXQsnRTAZSLnlLS6HUoeX2/qZ
	 oP86/tpwDqXhl6mdOFbzyRLTuILXs/R49f3QfuBMOwXBYPxAlIJw79WEUt9QiwtEs
	 7elI5dSgl9S2nUTXRcXfUwYEQoSsF6bgO0ZiViQ+oW7eoMNQgCFDmtLRjpVGO5+wX
	 bFXEIpXoW909pjT21uaVNZ0f5P0qHX8sqd9ysqQ+AquzpWpkJNTa9VRkql061vPhY
	 XryFxKADTLTAQZtuaemajdosp/ZG3i5wAuXjgJauRSvQVizzyjH6cALLmXeAJhZW1
	 delpBsohl2Sw8lrlEA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MEUSE-1rESQG3vh4-00GIYD; Sun, 05
 Nov 2023 16:50:15 +0100
Message-ID: <c70c100a-ebfd-442e-875f-738593faf0dc@web.de>
Date: Sun, 5 Nov 2023 16:50:11 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Aubin Constans <aubin.constans@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mmc: atmel-mci: Use common error handling code in
 atmci_of_init()
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I12YPWcJkgb4qemXUDa5g2yz/0EJ7eNy6kviteJVU6Jvyx1IXDS
 fJCuAXKh/vFUy8tuheOX3CCAluN1Ta3/1IAR1zYa8HJvRrKv87P4jqzVRFa/BLvwn6jCnra
 7u3ncddjTjh6cn2V8NnXoXAOGWwDJ/kEAWfTmS4gd/zAx2atAkrTnRA63noA/yiikSwnP+t
 1AKh+NT4Rfn+v4pEcqAzg==
UI-OutboundReport: notjunk:1;M01:P0:95EuTFPbeDk=;WTLQLz2c0Yh4z0Rz5KBypRlAh7E
 +KLcnoIYyd4sX8G1993JEzz4y5+58I4wZPDuWHsqJc5aYDs6veaR0PCq2qwzooyP1JPzeav/U
 OOQ2Ul2+69foGufNMAJCuoQkd1ywW2D9YZ3uxXyoig165upItMG+uAOhldvawIfFegXwmdqt6
 kY4S3SFdx+5lfSStNt30OWRxVvDvUDCNZF+/NaSkmWgOoZuTMT6rh4YtwSAMsu/qDtalOjsiS
 VY80UtvKoO8HHnnkUHfsFIE4gtX4fff4pGkkvoBegyl6VQj00u7mrcHueB0JIUeAuIjYruavk
 m295PBP1h2Eg+6kTgj/KqEq6SmbPyU8ueToIYGdfxPUxA1WNfTHzkGYnJd4SQR65V+AYJcbMf
 O2QXxvvhmD6rZZVyZwXLCYzkBdWiH32t7nFGcAi/s8eZVDjfBViHNW6fbj+g0pv0yVNYWZ5Xb
 sJ7uZl8jbpNb41bgFa3GTCVq6TCxXZ2XHIkm3Jr4e+JlMRCPO/ixhZHUNMqmL0gYkoPuBKvwk
 Q3Go1WhiKNL0CPSl9833Z5DwZr0VQb8vN4+gmXd6X7K/EJ+bADYRWKDbGqT3Pm4QGNEP5+2+J
 qviuj0GmAP7Zy1Fj7VF9EC0Pxt8KAvi0XMSkCxm6bwFU5D8duSnjFUfy8WswThqTsuWw7EZ+I
 zK7X/8sYOHgShaRYPuM4Hc3+CMfDQ2h8+3VfMzOZIXE5AGyRLtj/ijzo2KVjL6HUR/UNC3iXp
 q6fyeFWCStCNnFUOQNr7gOAmAxzS8Ppk7Dh84fAiiwCv1RE49j3ldVq49Ky1BbYxTkt6I+ZPK
 vl4tpZQXpt0P1v/Tj7G+ycR013OQBY6uSRjZ6/VRZtulThv5R49UQYJ/XeB5vSDj3lNgV7t1m
 Dj/eRMdKIN3QzKXhMwWBnrEn71dFKmk2y9NuyD/naS7G32GdJk8u77zdgjCgmPkimaVZa9eH/
 ZJelYA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Nov 2023 16:36:58 +0100

Add a jump target so that a bit of exception handling can be better
reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/mmc/host/atmel-mci.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index dba826db739a..1e83119d1dcb 100644
=2D-- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -675,10 +675,9 @@ atmci_of_init(struct platform_device *pdev)
 					      "cd", GPIOD_IN, "cd-gpios");
 		err =3D PTR_ERR_OR_ZERO(pdata->slot[slot_id].detect_pin);
 		if (err) {
-			if (err !=3D -ENOENT) {
-				of_node_put(cnp);
-				return ERR_PTR(err);
-			}
+			if (err !=3D -ENOENT)
+				goto put_node;
+
 			pdata->slot[slot_id].detect_pin =3D NULL;
 		}

@@ -690,15 +689,18 @@ atmci_of_init(struct platform_device *pdev)
 					      "wp", GPIOD_IN, "wp-gpios");
 		err =3D PTR_ERR_OR_ZERO(pdata->slot[slot_id].wp_pin);
 		if (err) {
-			if (err !=3D -ENOENT) {
-				of_node_put(cnp);
-				return ERR_PTR(err);
-			}
+			if (err !=3D -ENOENT)
+				goto put_node;
+
 			pdata->slot[slot_id].wp_pin =3D NULL;
 		}
 	}

 	return pdata;
+
+put_node:
+	of_node_put(cnp);
+	return ERR_PTR(err);
 }
 #else /* CONFIG_OF */
 static inline struct mci_platform_data*
=2D-
2.42.0

