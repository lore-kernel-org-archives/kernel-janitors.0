Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834345;
	b=NdZBeAjq0aLcCVPzhA60KFQTh4b5YSVvXhOEXFHgR2L3umaKkaD6WJWzb7rDg1PzCy11
	 MeBOCYOdAGagyOllVfYPf8vw680BiAD4EPhyHZf8w8KBoFmRqYE6vfS4/IxVgZWJOKCas
	 QNrCHIWtD0XjNiC8cDIgtHMK5nptXbUn0hFLvgj7CklqMo54/ay0nQRaug020C8zb9Bfo
	 mhjbodVRgo/vkT0stV08bY4+NpFCH/pA4+PZL7zMnOmw1qYA1MN2/ZnGhHToVC8Js3veh
	 zT2jwfONpWuo/BemoJkMtuiyw+grp/SdY1t6FrJgnj90cG3nmbRQHHHp2gn5jeMpm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834345;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RR3yjdaJgIdd4CGVtBbCqKG6w24xVr9FXnig/GJExvw=;
	b=J8B5Liuve/5BZWafj+GS1HIQNTjwfGvkqz1gBhfszH0lK75E0mrgbNBgn+4tMS0ugwZh
	 StqciZU2CRd9Ld4OBzn5vEOtozbxjGB3eJlVxdQTm3ckCPDgoiF7gLz7eqrclwtIfUr2p
	 FsTZCW1RMDciAJimItvI46Yl1a0ZIf1UtU7W3J2uPn+rw9+6EPrJbwBtwbfUCGY6sT4j1
	 fiY4WizywIEa0fkstlSjKFqfAd0t/91dDKyJ7nvUq/9UbjDbMNKDd0G/hRobYx3PkF31L
	 UCp9ThBT1Y6VpuinOOLDIt05zlkxeYaXyTWmQJ8oaUUFgBFTyv+0k0KH5oTGr+0frjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=q7v5iJLj;
	arc=none smtp.remote-ip=80.12.242.19
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA43606A31B;
	Sat, 24 Oct 2026 09:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=q7v5iJLj
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id KY6oxMvXfVN4wKY6oxnW7u; Sat, 24 Oct 2026 11:32:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1792834336;
	bh=RR3yjdaJgIdd4CGVtBbCqKG6w24xVr9FXnig/GJExvw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=q7v5iJLjDkIWa/05wPUav1ROWVXZjhkg2Z8feFI5F9xZKbTH407mu8tMIGVK+OLC8
	 jNSvWwTcq/ZI77LubVkYPDs8seAhtfbvOI+Lq3BHGsMTu5Mm5U/0Yk8R5Gn/22mmVj
	 AYGj2VXPQ4eA5N8QtWZ/oaiE5DIDCpP5f1nXcRfcu2i2Kc0VX+BmkDG/hJvTA3O1Ow
	 ESLVxLzD29CexgTIYlzKzxh2okuuXZQvfrlr069nipOqtnukwIxRrnFRadnvp6Kr0I
	 qTNPj13Bwk0qmvE+DRKPWCGSTfelyaPHpA5QMGRN9fEJlGA+thQCPrnDanDPzKJwNB
	 DYKpMMIx+oLFA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 Oct 2026 11:32:16 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3] ASoC: qcom: qdsp6: Add an error handling path in q6usb_component_probe()
Date: Sat, 24 Oct 2026 11:32:09 +0200
Message-ID: <68e28df174c8524bef54cb437e568afcb8a82e1e.1792834312.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful q6usb_dai_add_aux_device() call,
some resources should be released as already done in the remove function.

Re-order the code to avoid unnecessarily destruction of devices in the
probe path and add an error handling path with the missing clean-up.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v3:
  - Reorder code to avoid unnecessarily destroy devices in the probe path
    [Dmitry Baryshkov]

Changes in v2:
  - Propagate the error code returned by snd_soc_usb_allocate_port()
    instead of an explicit -ENOMEM.   [Dan Carpenter]

v2: https://lore.kernel.org/lkml/1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr/
v1: https://lore.kernel.org/lkml/7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr/
---
 sound/soc/qcom/qdsp6/q6usb.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c55c..e226dd126364 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -322,22 +322,26 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 	struct snd_soc_usb *usb;
 	int ret;
 
-	/* Add the QC USB SND aux device */
-	ret = q6usb_dai_add_aux_device(data, &data->uauxdev);
-	if (ret < 0)
-		return ret;
-
 	usb = snd_soc_usb_allocate_port(component, &data->priv);
 	if (IS_ERR(usb))
-		return -ENOMEM;
+		return PTR_ERR(usb);
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
 	usb->update_offload_route_info = q6usb_update_offload_route;
 
+	/* Add the QC USB SND aux device */
+	ret = q6usb_dai_add_aux_device(data, &data->uauxdev);
+	if (ret < 0)
+		goto free_usb_port;
+
 	snd_soc_usb_add_port(usb);
 	data->usb = usb;
 
 	return 0;
+
+free_usb_port:
+	snd_soc_usb_free_port(usb);
+	return ret;
 }
 
 static void q6usb_component_remove(struct snd_soc_component *component)
-- 
2.56.0

