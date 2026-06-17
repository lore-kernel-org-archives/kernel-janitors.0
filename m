Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161843C342D;
	Wed, 17 Jun 2026 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683004; cv=none; b=UFV4IWvdmnMttdX157+bceJn2ZEC0rerGHhNVK8+wInq3pwMMVuHpxKx2voJfQABtI9tQCGsnPiUfm9XiptZXzG9NAwYYhFQv3F/RTB6S5+k06ZYdr7KZm3G6X+YPw8a2sS1Q74Xf+IfEcPZE2c0rkY3kt9XaSus9AVoCpA60VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683004; c=relaxed/simple;
	bh=Dwc91ciS35wnnZfIQKQ/s6YreLFXVwwl38NL7Xjvgqc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=t9w6b/Mh9HdU6F5Lu7EsHZmgy44VTMO8vyGmp9x9F0cuv3u517jGP/NzUlIxSj0kemMYGaoC4PkP5TeIaDkjmUBwQy3LQIZ1CGuF28Dx/jbm1j3IzzDwBI9PiA9gt6t0uhUc9ChbShYFyZ7VYeZ5KPL/Qv+7ta7TDAMGBGRRz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FoZxye/P; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FoZxye/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781682986; x=1782287786; i=markus.elfring@web.de;
	bh=xSF9YM6QznhD9FfEywMJJl20z/BmKS0aSkYdW0tanJc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FoZxye/PrU35frEIbexJ7ter3dwGBWnjepIMaF5zcuc2WFxmaHqyCV+iGmUfg1kn
	 Kvl8gapVEHq/7MOYgHEjQpiXYg580J75rNtbWXztkUjU9ZwZQhMlHJ0i38H0aUwvY
	 xR4M4ZnvGT5KF+fH2nx35MW0C4WCVUSxToZ258id+7YEg/N66qpvmLwarf0+KvprV
	 G2GHMboE8AEYZf3zbFvkLZQiJ7ZqVOmtVmUxm91VQcEsv719LfVyJgCq9V9qqCfqi
	 rsaDQTrOIGniR3AFq7mJyXxli9+2MV0MokVek9+SNcPkKayArPkB7Lc1CrpDtUcwm
	 VC/cOWGtJWvfa+adbw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZjIb-1wevwj05Dz-00VWFz; Wed, 17
 Jun 2026 09:56:26 +0200
Message-ID: <40b93192-68d2-4de1-845b-9c9ba994a75b@web.de>
Date: Wed, 17 Jun 2026 09:56:22 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ASoC: SOF: topology: Use more common error handling code in
 sof_link_load()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8iDY2/eKAiKnYsJ6C+y3oBp7pQE9FWKrhr8cI7TKbp7pQ6UCgBz
 GKRjJv7GbLQAp4lrWYonjUbHsUH/ii5iuUj1YPD73/AN9+ZkzqrPqKqK0GXXRth+uPneDYG
 f2RG8F/0xopvhotGzrr1I2LynZVtNjPQF0MVi5qF1ZAuu4O9zm3CpBoMvzEcRrLNNObehaN
 02UVRDZHCPxRGItvZpbgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5Qbzv9Ggqqg=;Y141P3mxv7Sgmy2xIa50m1UzriI
 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
 QP7gGxoSq/g7gfvH0o=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 Jun 2026 09:33:45 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/sof/topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8fc7726aec29..999eeea2f512 100644
=2D-- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1940,8 +1940,7 @@ static int sof_link_load(struct snd_soc_component *s=
comp, int index, struct snd_
 			       private->array, le32_to_cpu(private->size));
 	if (ret < 0) {
 		dev_err(scomp->dev, "Failed tp parse common DAI link tokens\n");
-		kfree(slink);
-		return ret;
+		goto free_slink;
 	}
=20
 	token_list =3D tplg_ops ? tplg_ops->token_list : NULL;
@@ -2010,8 +2009,8 @@ static int sof_link_load(struct snd_soc_component *s=
comp, int index, struct snd_
 	/* allocate memory for tuples array */
 	slink->tuples =3D kzalloc_objs(*slink->tuples, num_tuples);
 	if (!slink->tuples) {
-		kfree(slink);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto free_slink;
 	}
=20
 	if (token_list[SOF_DAI_LINK_TOKENS].tokens) {
@@ -2067,6 +2066,7 @@ static int sof_link_load(struct snd_soc_component *s=
comp, int index, struct snd_
=20
 err:
 	kfree(slink->tuples);
+free_slink:
 	kfree(slink);
=20
 	return ret;
=2D-=20
2.54.0

