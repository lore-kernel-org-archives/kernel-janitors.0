Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74F3451C6;
	Wed, 10 Jun 2026 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110972; cv=none; b=IqyxL11tqRrPbQKH/RVg491nZ6JKS2QtEmOZsWfcWvQ5aM4ZN9CJe/Ima7w48kvotoMB2fHZi9U6VGH9ry87tPycYFEzRt/vWfy2twpElJC/GnrcdIIG/+DfO6zZNIHx8Yh7bcLY8yU6a4O7TiJn/VCi526lnB9wWXdlOMG2vnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110972; c=relaxed/simple;
	bh=l/YPK8QLGCce76mlhUuGBfFrOPBfVfDXtl8+tRRRfVI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aGUE54sQ/tpFicQYUn1UoBIExNkfMIHI8yuAfGlC1k/9jcGlkbLJ1P+Lj6o4nj6623VkY3nCPqbzpOO/0Y/9detYBFzfVsLHc9Pn6SPVr09+yKc05/K2K2J3VCQ5UIWMg87SDNd5pcCCHpSh0hPok/erlImZXdvY7C0kAY9znUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Sn/xpS46; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Sn/xpS46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781110961; x=1781715761; i=markus.elfring@web.de;
	bh=JqW8AdZlekxLfcp7ZjeWeQdoj3JwyvQamm2x1YRqFu8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Sn/xpS46C5A6MadkE/v2JwaqH4Bkk7FOoRJXN0D0u4zRt3fZVIO15LzDNPIJihFo
	 i9ywSz9FyZhSgVUMDbLRTjTG4j/oSHF97yTaJTRBD/MqMiJwmbpjxohRpxJLNb1Lx
	 366sABMdrW4Z8NxE2JEusrKDf3ksWqSEXJquNHOgrVubLlezpV/2NGVbX8TJuEnxs
	 03j6vSXfWjf47xzN0gfTpx54I45oMqltQ2xPlYncVLUE5As5j+A7Su6rPbnUcs3GO
	 LZKtUvklcbu8j/LEBRMOlOZm2gdwJgkW2HEPhNITcDNWdK+UaTdSTIIjXXtGE0viz
	 3srtn+CrsffXtw2qqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6FV-1wprDI12sn-00ROV2; Wed, 10
 Jun 2026 19:02:41 +0200
Message-ID: <a24a6bd9-a8e1-423c-9eae-b9ab08a8de81@web.de>
Date: Wed, 10 Jun 2026 19:02:39 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org,
 =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Kees Cook <kees@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ALSA: 6fire: Use common error handling code in
 usb6fire_control_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N1Dtnl3TGrTpAfy9qL0jAfNHcuWvV4dLD2qg2b5K48OO/9Q/IGy
 vm7w09GukJIyG4JJeHlk7Hn6jX1ZfOq8t40H1jDcrU/KifDYcArNUZegF63DIWTlhPRAF3x
 BNqJhzbQ5FmkQEjkjn50TcM9LuUy6ugBBmGyANfI6pY3hJ5AR1aajyuanlNMjJQo/1zNYqf
 CDg9JULgwASwTDMTz+0rw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aM/8+VYTe4Q=;Tu5n+pN7KFet2U7JoX84vnGoFJg
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 18:57:17 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/usb/6fire/control.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/usb/6fire/control.c b/sound/usb/6fire/control.c
index c77a21a9acd7..10104cb42165 100644
=2D-- a/sound/usb/6fire/control.c
+++ b/sound/usb/6fire/control.c
@@ -582,30 +582,31 @@ int usb6fire_control_init(struct sfire_chip *chip)
 		"Master Playback Volume", vol_elements);
 	if (ret) {
 		dev_err(&chip->dev->dev, "cannot add control.\n");
-		kfree(rt);
-		return ret;
+		goto free_rt;
 	}
 	ret =3D usb6fire_control_add_virtual(rt, chip->card,
 		"Master Playback Switch", mute_elements);
 	if (ret) {
 		dev_err(&chip->dev->dev, "cannot add control.\n");
-		kfree(rt);
-		return ret;
+		goto free_rt;
 	}
=20
 	i =3D 0;
 	while (elements[i].name) {
 		ret =3D snd_ctl_add(chip->card, snd_ctl_new1(&elements[i], rt));
 		if (ret < 0) {
-			kfree(rt);
 			dev_err(&chip->dev->dev, "cannot add control.\n");
-			return ret;
+			goto free_rt;
 		}
 		i++;
 	}
=20
 	chip->control =3D rt;
 	return 0;
+
+free_rt:
+	kfree(rt);
+	return ret;
 }
=20
 void usb6fire_control_abort(struct sfire_chip *chip)
=2D-=20
2.54.0

