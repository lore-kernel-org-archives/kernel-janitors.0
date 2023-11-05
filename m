Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB815B7
	for <kernel-janitors@vger.kernel.org>; Sun,  5 Nov 2023 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NCdv0eeq"
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB691C6;
	Sun,  5 Nov 2023 06:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699195941; x=1699800741; i=markus.elfring@web.de;
	bh=cTUM0tlXKDqvxN6TopqTFS5ikFPl23V/+yi1WeDuI1c=;
	h=X-UI-Sender-Class:Date:To:From:Subject:Cc;
	b=NCdv0eeqk6RaELUh9BVJgRCGmsZDvR5nPWvQ6H51qz2W+LIZMLIDfVgvXVtNi6Or
	 sA+ZvNcI1jYtWuIRax7tY2lmDiXw82gZoUBj2qNjEvz63baDA4cwt/endhJsOAV1G
	 AlGh6jXlYRFKXuuXe8HgdBzfKBPridF49nwWReFThlmTyIXYhtNjhudfNXK+kZEmU
	 ZLnRdXT8Vm3jNUuZzMByjy3ESe1qS4P9E+9UCs5/VNjx38eyQpBxoWqcxxU53CySg
	 +0/P3zrBMIDnZwS9hvK1Y6jPOw4rXIyiIVqt4Kur2OeOVV5i0uj9L/tuokiyuvaFJ
	 fIX3GECIGhTZWFj7Sw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnFy4-1rgNDV1kKS-00jbwg; Sun, 05
 Nov 2023 15:52:21 +0100
Message-ID: <f6dddb61-e803-4930-885d-f353d9c7cc73@web.de>
Date: Sun, 5 Nov 2023 15:52:18 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julia Lawall <Julia.Lawall@inria.fr>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pmdomain: ti: Use common error handling code in
 ti_sci_pm_domain_probe()
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EVx6K6Dbhllcg76fEBr8eJp8TNxpr36C3n52XAScpLwXLybWEx2
 8sBDmghFFz/lqOXYx5P6g787lSmK2UnLWVWFAR+42XsuyY8QnJ2YWrQjMiYK4pNQN0KV4B6
 H4FFTGmU4IAkfPiVxPJfSOwwsX08ANPNsDhn45Ua6Z6s6vd0EefwFpRDWo5coKk8MbtYbne
 Z1u/0Y7pSRWyum9G2SWTQ==
UI-OutboundReport: notjunk:1;M01:P0:asLwKnFE5+4=;MLkdzKDui2wx6SyKPwy0ffvxPSs
 5HxknfqweUZDkdVMBoyyCoUXr025K5OAIOFxNwjh19AorPw2uYMU83aGA4dePx+mXXPTUu/y8
 rc72gPzX5qfkMCfdIYvNRWScdifu81vTV3Mo+28hI8BH2Sty3WarTX6Y9Kk5byKtROwBaP+MX
 oafREwZ3/Wg0VjIhsfLyQzDwtV9U4dZHmb0HXAow6bp+R/H1KcGAGn4D7eYEHiKWsRSFYhr7E
 4aNHgdauHiE4GxQZjdoQiOjC2lFNexmO9n9955rTB14QdgdJQcwN4p6UpcRBZgBHsSus7fhSY
 jLYk7PJ+Qpwyk31uYH2A15l0/WvKRvN80nhvoAINNOskNZ0m9TDDuDEl8C7uaAhvoQRcz/odq
 fNGyac2lhSeSkt+S5hwJi9bS1Ix/GjAz5knlWz24P29xZdWtrNDFo13HgQPinIKiPgg0IXPeE
 YVzFl80ghgNEdezturGjCwqq3xbZ5274gmMRWdk7yVvFYy4oEuU1l/eetu9SXZ/uPN+Yc5MCJ
 FRt/HaCYzlKihJ0+MWn+w1Vd1rfBEztU9RCIrQilqdsdcTz+D55/2MHYZCQhIn/jGZ2Qmy1Wq
 +eyA9FntNoufnz0jQd+rx/Dvtg7sHOMwqm56TUnE6qZhPEmMwAYw87K9AHnsGMbxoOQtiDDrQ
 87mIZT0vdVQ+7hmH9hFD5CAYrXDnbgnGbUQ3zqzGFLu4A8GStI5n+AUgmhi33WxPShMgj4Lwa
 LxAnKRnKksLoxJGBXE/0z9uRU3FOZnDmpP7vhN0TxMzGVDsA9MpW6O9s2k+NF1GcKRDm9vgR5
 QOSIQ4LERQSPOh9xbWckxUN2ASy+2IOT+YH3HCkWKromDOL/DuHeKt5B8wvC3L0uiFy+t11wT
 YOhB65y5BLdHMbKIB2dq4rsacAyGMZkKGSlmPLFpHwt0x0AL1tu5vxuFyyuSmbGrf9yHlsmDZ
 T9xZBA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Nov 2023 15:30:28 +0100

Add a jump target so that a bit of exception handling can be better
reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti=
/ti_sci_pm_domains.c
index c091d569ecd5..af8a1ed2db70 100644
=2D-- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -153,18 +153,14 @@ static int ti_sci_pm_domain_probe(struct platform_de=
vice *pdev)
 					max_id =3D args.args[0];

 				pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-				if (!pd) {
-					of_node_put(np);
-					return -ENOMEM;
-				}
+				if (!pd)
+					goto put_node;

 				pd->pd.name =3D devm_kasprintf(dev, GFP_KERNEL,
 							     "pd:%d",
 							     args.args[0]);
-				if (!pd->pd.name) {
-					of_node_put(np);
-					return -ENOMEM;
-				}
+				if (!pd->pd.name)
+					goto put_node;

 				pd->pd.power_off =3D ti_sci_pd_power_off;
 				pd->pd.power_on =3D ti_sci_pd_power_on;
@@ -193,6 +189,10 @@ static int ti_sci_pm_domain_probe(struct platform_dev=
ice *pdev)
 		pd_provider->data.domains[pd->idx] =3D &pd->pd;

 	return of_genpd_add_provider_onecell(dev->of_node, &pd_provider->data);
+
+put_node:
+	of_node_put(np);
+	return -ENOMEM;
 }

 static struct platform_driver ti_sci_pm_domains_driver =3D {
=2D-
2.42.0

