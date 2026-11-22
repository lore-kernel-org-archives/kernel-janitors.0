Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367038;
	b=z0JkKGidsd7l5DYVlMHWI/VNkVYeL1qMco5Wfgc//iv3c3BEtQQuxs3tuR3F21CGbBsD
	 KbJWbnJc9Atdg3ts/a3KT14kjEq3VQRfKTQNUQ3qSwnSBXX1Ho1a+ng6cRtB25t4WTxkD
	 mwsRLfLCThuyItTrvMAA7xhtTNbrhJYRzOi/yviB47qWUoH+mZMAzoYzFaNu8H9Qz0HWx
	 1B1M922h4eS4DHm6KZWA1dOEDvvY+sbmOAPYWzzuwHg6l2WFjOlk8NZnBYFrZPRozTCSr
	 w89vRvnPmyVd1YNlNqmNtplmeYq+Qj0DeLfPKgClIVxUamy0omqFR+nzZknx8mo9HNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367038;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=TobLZ0j996C6KCyjUMP8Od8GQOZGqVuimZSa0GMmDnc=;
	b=04pJ7ELUaGxe1ttlAcFKp/34Mu9ojy8B+ryCPV+nrAepins7xn1sQAPnA0H67mvZmufn
	 pWy8Wkfwtjb/9evRbdKCInFcKJdjgzXOPX3J00Sudtdx6lJzJMb/Zy1shtYoUzlfvjhQb
	 1Yfl/ZGGUqLYEWxjXzyxWcmKaQ9wn2A4Ol3HyF08YBzfEl3MzlosKLkoGyz9exFC0iyeq
	 uYVYKJRnObfshOdMiY7tWPkhjBRwzkmynYswXe3wbY5Dj93HiL+4BQ7hPRZKQGoSCUVrj
	 FCej2Sa0BYbWe0MpElTK2mDehldii9K8xPm14sY/05CCh2v/CxPjQw7staw0ZMFmcgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VWSxWvoA;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0C606A320
	for <kernel-janitors@vger.kernel.org>; Sun, 22 Nov 2026 17:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E0C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VWSxWvoA
DKIM2-Signature:  i=1; m=1; t=1795367028;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:LonF/uk5u/VD+4YdroEa0oE6RvKi
   YNnWU7FypYGDBcQ/dCbPtF0Krod2nuIN/e9w4Qz56R5SXnlqYIPZyJSC+CW0ZEJZJuX9uQG1n7+
   H7KC9ZJMHdPcx5jvCt1A1kU2h/M4bW2Y80kZ03FXbqWodAT6hFsHy7MmgdbgDfk8gLYIOh8w2aE
   uXiAaJbg3uEPxdupb1R5VcEH0ioPT5RqSmCbvCmVJfDU6cRMgdb9u+q4vBqy6bUZ7xTsvaa0Cgy
   xb9/t8HrZcxneP4FBaxOiQrEktom9UGTblgIjJ8sTSvkP9leWVek2aegBCO9B+nQ4TqiJiOEIPi
   iMAuMzIhpP2AAQ==;
Message-Instance:  m=1;
 h=sha256:
   uuikcE95foXE/UUbbUnmzWcsFe1LvbvnK2KJJ8Pkj5k=:
   ThGhWhxEDx5NPGEJHiR7z/wlGnkusyb1U2vlGYGv3xo=,
  sha512:
   jpq7w///A75KrCuE0iOtgMB5xkKqWQATBDOumL3jWFzCK8Wky7Hx3j3QkhhsHYT8I/JntCQWl0HLXw0AIiG+Wg==:
   AhQzdbo5M2DJR4VGEEnJcdFsAHxmzwjTwT8g6f9X1rN066i1B43E9QWgkC+ibTNbPKtjGe2WTtxAhtIzrRjORw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795366983; x=1795971783; i=markus.elfring@web.de;
	bh=TobLZ0j996C6KCyjUMP8Od8GQOZGqVuimZSa0GMmDnc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VWSxWvoAJst3YmYFcKNn9q4cSmepscU1KMkotqcGdyuuyHJ12lCdVVHINUFyC4g2
	 3c+tta3SjuLy7p/IaVA8XXpV35IpnqM3s0HoMQBhMqNVSz+vXTeKqf5U7m5/8oXkF
	 UQElLelRbtBoUN0phHM2tCyjeTGrevz4WpND2TBMLTXu9J+is4A26Vwuw/jQx9Vux
	 4CnFGogOniyZAybvXwLeznWpKC6uYsMO3dlj8TxgPhSGGdQBN57auRNJHhnN3O5GH
	 9ZI3WL6k10W+OZ0ugtTZvVVNwj3N5mvJnWOk2DLLIsmEmSG6+SGwlVovcrvg/JxjN
	 dXlTPin9B9aahbR9pQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpTxm-1yL0Sx1HMi-00a2uw; Sun, 22
 Nov 2026 18:03:03 +0100
Message-ID: <4b99426a-d831-4d55-9b3c-ce83ba9fb081@web.de>
Date: Sun, 22 Nov 2026 18:03:00 +0100
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
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Bjorn Helgaas <bhelgaas@google.com>,
 Danilo Krummrich <dakr@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Kees Cook <kees@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] w1: mxc_w1: Use devm_clk_get_enabled() in mxc_w1_probe()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mS6FpCPrc/bXuqI7Jjr7wV6rx7iy6PF37hSY4ObTF7b2hS1HzjT
 RqQGtUyHU9L1TH0YpGMYVPCxlEUWC0TkwN1VR4sNbvwM0g88Lfo6VrC0MlLjSSWoZlHVXUx
 q00g4Y9J2/gFEAE6Rc3AXsP15b/nht+pJWc7u9HjlDLmiU7OrDcw7qbZELFgdVspBC9lht0
 mcP/aG6co/pJPs7fixsQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LK2rYQxrHhk=;7DWg6PXWBAoeL8lEm3McSZGNFzE
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Nov 2026 17:52:20 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Omit a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Cmxc_w1_remove=E2=80=
=9D.

* Delete the label =E2=80=9Cout_disable_clk=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/w1/masters/mxc_w1.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
index 06be7bf0b715..f40ea120127c 100644
=2D-- a/drivers/w1/masters/mxc_w1.c
+++ b/drivers/w1/masters/mxc_w1.c
@@ -98,14 +98,10 @@ static int mxc_w1_probe(struct platform_device *pdev)
 	if (!mdev)
 		return -ENOMEM;
=20
-	mdev->clk =3D devm_clk_get(&pdev->dev, NULL);
+	mdev->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(mdev->clk))
 		return PTR_ERR(mdev->clk);
=20
-	err =3D clk_prepare_enable(mdev->clk);
-	if (err)
-		return err;
-
 	clkrate =3D clk_get_rate(mdev->clk);
 	if (clkrate < 10000000)
 		dev_warn(&pdev->dev,
@@ -118,10 +114,8 @@ static int mxc_w1_probe(struct platform_device *pdev)
 			 "Incorrect time base frequency %lu Hz\n", clkrate);
=20
 	mdev->regs =3D devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mdev->regs)) {
-		err =3D PTR_ERR(mdev->regs);
-		goto out_disable_clk;
-	}
+	if (IS_ERR(mdev->regs))
+		return PTR_ERR(mdev->regs);
=20
 	/* Software reset 1-Wire module */
 	writeb(MXC_W1_RESET_RST, mdev->regs + MXC_W1_RESET);
@@ -137,13 +131,9 @@ static int mxc_w1_probe(struct platform_device *pdev)
=20
 	err =3D w1_add_master_device(&mdev->bus_master);
 	if (err)
-		goto out_disable_clk;
+		return err;
=20
 	return 0;
-
-out_disable_clk:
-	clk_disable_unprepare(mdev->clk);
-	return err;
 }
=20
 /*
@@ -154,8 +144,6 @@ static void mxc_w1_remove(struct platform_device *pdev=
)
 	struct mxc_w1_device *mdev =3D platform_get_drvdata(pdev);
=20
 	w1_remove_master_device(&mdev->bus_master);
-
-	clk_disable_unprepare(mdev->clk);
 }
=20
 static const struct of_device_id mxc_w1_dt_ids[] =3D {
=2D-=20
2.56.1

