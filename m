Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370100;
	b=Anjrt3pHwZzrg1rNPbMZn7zgr/cLUAKGOtD6jEhTczaoNKl15mK8V70lvijEWcYnhnyR
	 Rxt9FVuwBec03vyWFFcdgt15W/HpetMOYdn/0RfgKEBpT4mGA6AnXogGoeSa3kawlFdWk
	 y1vItaMXQwaech5oGwb3C281XIEVNG1ZIuFomSjDRsI0imafV6vDOVNteDa6hAmcltgd3
	 ycy+23mY9/IKT93NKrAG64bRC07WtkeSViy/xkWmXp60EYfC+DbBbgmbt6sPVOuZvZ8V2
	 2PibFn5OW6jFRNii7Yk4NmTV7q9HigBJowoFeMDz8ZP0iNd65MvKzpdLpFxZXrkQaMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370100;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=JFofGed3Yd8ITEXbwYSDzQr3kZQj2H0tI8WIK0gN8I0=;
	b=ivsdcR1FsJB+lWIi/Yd1a/EkKvt7T4W50HpAOP4kB0h0fSJeFsz+9Vz5OK8aTlfLKoz3
	 fRk9xluzBc3nSRU5q7++XaiabtmxwxDtk6M/XOn5Kw1Bj5nniJAvmOlm3wRRAtN7tqYxE
	 5dKoGe+mo+xa7zPJJAeIqqGyszmR92OjsMFPwWZuX74Rkm1pKS22C8MH/vQRDXTHZ9PYs
	 Up/z3Ige2fUWkMOfYAdjjB7jFIZMGtUQ0Eh5e4TlxV+8RS2Ls5jo0A7YjgaRcDf4Qyny0
	 Rvy8ZmlDZwyz50XAQllpbGuEVgaF8jKVsaRUqCmz+aiA3LODornFDmyLbbIdmS4WqhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=U1N0VrFL;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662C606A320
	for <kernel-janitors@vger.kernel.org>; Sun, 22 Nov 2026 17:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E662C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=U1N0VrFL
DKIM2-Signature:  i=1; m=1; t=1795370090;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:bjhPrIINxQhS9fhzNz+blLjSKyvU
   VebRwQr/70PJwfQC5eNktz6/pKrMzos07Pbd/CQKRaAjyd2CzGYrrJY9XIbexNw7HHkvluM+sWV
   YTp97GOKWLoW9S/4c5TX0AF64XYwmPOLJ10E6RcIUxH+ApDFbFbBgOIxrlVFHcYlatHh/kXdLSY
   36539KhlFzsbfRnrzJ6Nxp2my7WPPBpnyh2I1Iq6OW/3w1nFi4titHZ/7gWtfeURdY7Nf5afCYp
   Rz1cMc2UFMGnyB6KnvFwzJUllwitX7MAVzvjYdSQbZFUNP6xDHuFO/G73GVS5+K6wnhOiG5HcLe
   0lw6ye61u1elKg==;
Message-Instance:  m=1;
 h=sha256:
   /vlDcWqT/luM336Ew0l4rfNOSgYL81GeIIN+WjylUVc=:
   BYlJ6GAas/tmfK141qoRLiz+Ip5IdU5ExJbydbbBUXc=,
  sha512:
   QofB2inU3otoxX4pWjJWuv+biMnzaI8K6FA3pIjf8z9tBzfINsNTQO9nDm88WASX1LVCKTXbhJfYE5FaajC4ng==:
   3pjWnfLU+CX4rGRKoTSDvkipf2hydjfUcFgvzYvi6Z1gx7qf7j6lzbP6FUPMK3GQzuc2zDBSsgFanZkfiSqPMw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795370054; x=1795974854; i=markus.elfring@web.de;
	bh=JFofGed3Yd8ITEXbwYSDzQr3kZQj2H0tI8WIK0gN8I0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=U1N0VrFLQ1/6Mul3PsGWfNXpQFJrMSsiUCKNefZazRSUl1v9zT0jsf1qP5zOQWrL
	 14RDfmIz4Bu4jgUwDRRdMW0lTI3XwWqKMYFUPB5F9SWFjHAM/jKT2XFZBF/e2hSYV
	 /eWDq51pGqty1qlraSsQYPQq5zZw0JG/z9zbTO5GQVZ/8BafZzSHQydCT05LxeyI0
	 Blor858/MWK0H6TwSovaMZtb26Y/Z/8fJIZPNxuG6wUKijnXToZvUnX41k21pb26t
	 HfRMFM3YeVm8NsInpp4fX/M8mgb191Ocv+6hocwU69a7lZd57T5Wzj5gQBnsZqTQg
	 CxbuIxCwyDjwPujSnA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mf3qK-1yAaKa2VXm-00jQW8; Sun, 22
 Nov 2026 18:54:14 +0100
Message-ID: <d3e781aa-04e6-4643-bb39-beb4dcfe9b33@web.de>
Date: Sun, 22 Nov 2026 18:54:09 +0100
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
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ludovic Barre <ludovic.barre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mailbox: stm32-ipcc: Use devm_clk_get_enabled() in
 stm32_ipcc_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V5v77LjoW3n9xKLMseieNnFi+VjFXljZL1U9w3hCL1a6HE/tgiP
 4nrWc4gDkPOSBZYvvohc6u1vMf1UwfP6T4FVP56hUDReEFWsPi2H/0Sn4yY9ZF7EgWZAQdr
 WAMoIUINO4Lg8vDWfznq28UacgmpVHnQCUdzH+MhHL3ejX4boJylhYgU+oLK6TUNu/34HVS
 etyUuOmbqZRiY2RY4iEUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Fk4T7PNfu0=;qMtm7dQuoHcNwcyEXUqC8NqN4b/
 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
 o4HHZEmKF0w==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Nov 2026 18:42:21 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Omit a clk_disable_unprepare() call on an error handling path.

* Delete the label =E2=80=9Cerr_clk=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/mailbox/stm32-ipcc.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index e88e198436a6..25d8138a3695 100644
=2D-- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -242,29 +242,21 @@ static int stm32_ipcc_probe(struct platform_device *=
pdev)
 	ipcc->reg_proc =3D ipcc->reg_base + ipcc->proc_id * IPCC_PROC_OFFST;
=20
 	/* clock */
-	ipcc->clk =3D devm_clk_get(dev, NULL);
+	ipcc->clk =3D devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(ipcc->clk))
 		return PTR_ERR(ipcc->clk);
=20
-	ret =3D clk_prepare_enable(ipcc->clk);
-	if (ret) {
-		dev_err(dev, "can not enable the clock\n");
-		return ret;
-	}
-
 	/* irq */
 	for (i =3D 0; i < IPCC_IRQ_NUM; i++) {
 		ipcc->irqs[i] =3D platform_get_irq_byname(pdev, irq_name[i]);
-		if (ipcc->irqs[i] < 0) {
-			ret =3D ipcc->irqs[i];
-			goto err_clk;
-		}
+		if (ipcc->irqs[i] < 0)
+			return ipcc->irqs[i];
=20
 		ret =3D devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
 						irq_thread[i], IRQF_ONESHOT,
 						dev_name(dev), ipcc);
 		if (ret)
-			goto err_clk;
+			return ret;
 	}
=20
 	/* mask and enable rx/tx irq */
@@ -323,8 +315,6 @@ static int stm32_ipcc_probe(struct platform_device *pd=
ev)
 		dev_pm_clear_wake_irq(dev);
 err_init_wkp:
 	device_set_wakeup_capable(dev, false);
-err_clk:
-	clk_disable_unprepare(ipcc->clk);
 	return ret;
 }
=20
=2D-=20
2.56.1

