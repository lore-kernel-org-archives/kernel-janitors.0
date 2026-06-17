Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44933B4EB3;
	Wed, 17 Jun 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679497; cv=none; b=hIUMxRXQBZjaeykO8wIllN3GUEBEMpCeaTLO/lma+TxrKUB8ITw88RJxOzSwHZyg+82u3ulh19oMLj1du2VPraOiDv2wRX9ZLfq4t0i39R7sHHR9eAjAubMO7MMNIhm21grOp/t/lLs7Ie1GjJGlwhe160dnIdcHl1hI5uODboU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679497; c=relaxed/simple;
	bh=XMFVDxguVaQpUmA0iJDBnGD8kwWjn3meabutmruyzy0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Do6/5Buj5a5+9KuJsxRotKMbfoPvB3/ecxqg2C3t846DW2rCdZVB6P4WYz+tDttjKZp2EafQMhcrMYkv1lFamzApBSAkJU37D6ZGsvNeDaqHov/BahwCY2eaX6YT9RyBP3GS12qUCH3PdyTzljK2A23vJ1N7aGo8aF0IyqBztEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FidSsIWy; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FidSsIWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781679494; x=1782284294; i=markus.elfring@web.de;
	bh=uoJVQToiI3roj0lV75YfheiyxD7tRT2K2FrRHXs673o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FidSsIWy9UUvqkPeJ0FplCMh3nukEKyQYx4zUi2iFyLsBw3JmElhNDCfJwV7fo/W
	 0woJxVp4Q4v2+nba4RKn7PZcmAgWXYnt9cZj5Oy6YGZ3yv4ZmFldHmcJiZUHYYbvd
	 zlheU1p+KxcdCggn7nRX339JQ78RP0b9YaKFkYRltpDpT2VpFu4+46snwjK+cUURI
	 Z2vSaYt4u7sDlF83skrpt9cexTMIQxMK9D2LTWkRXmdbNuFPxTK2QxbCCM4sm470R
	 L4+8NSiALRl5SHyVTYdfu55Jy+885/notmTWhyGptmk5fjt2X7JuMAf6Rf96Hg9WQ
	 wbRWPKDFh7JRc2htuw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MV2Ka-1wj3Wz1gaE-00RPl7; Wed, 17
 Jun 2026 08:52:55 +0200
Message-ID: <47413de1-015b-4543-8e8c-25e41dfa9e39@web.de>
Date: Wed, 17 Jun 2026 08:52:53 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Kees Cook <kees@kernel.org>, Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ALSA: sh: Use more common error handling code in
 snd_aica_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pT615bjxiABa+qnqHnYAf6QKzcmT0aIj4tjZz3SJ0krhvHbDjNZ
 LQ5hqyGnAQZM44oJWr276RXXZZhNcC3Ihf08F0MkZnOtAUxYIs5BOMGG2zMCYYh0LsUdsmc
 jQCzAiY3XuaED/d6RrM6whF77FX970vg7FO4Dswz9ANM3FvwFo4TOSDsjHmr/rgsgxWRcf6
 x/tuudkQj5JbEhbJggPTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DpPi6TjuMYE=;Nc+0K7TilR3k92FfCewaaR6sVTS
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 Jun 2026 08:42:18 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/sh/aica.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 9438c3a68ee9..8196e1bf0416 100644
=2D-- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -564,10 +564,9 @@ static int snd_aica_probe(struct platform_device *dev=
ptr)
 		return -ENOMEM;
 	err =3D snd_card_new(&devptr->dev, index, SND_AICA_DRIVER,
 			   THIS_MODULE, 0, &dreamcastcard->card);
-	if (unlikely(err < 0)) {
-		kfree(dreamcastcard);
-		return err;
-	}
+	if (unlikely(err < 0))
+		goto free_card;
+
 	strscpy(dreamcastcard->card->driver, "snd_aica");
 	strscpy(dreamcastcard->card->shortname, SND_AICA_DRIVER);
 	strscpy(dreamcastcard->card->longname,
@@ -593,6 +592,7 @@ static int snd_aica_probe(struct platform_device *devp=
tr)
 	return 0;
       freedreamcast:
 	snd_card_free(dreamcastcard->card);
+free_card:
 	kfree(dreamcastcard);
 	return err;
 }
=2D-=20
2.54.0

