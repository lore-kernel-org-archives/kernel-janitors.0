Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59483228CA3
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Jun 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647322; cv=none; b=iO2deCW5bxVLujLwoDnagZ3PE9V4J1sZ+cPh9oxcMKLF3/yqmQJDrw/f73w47mqrm5nE/2KB5MzJqan1rLYyTWsZ9AUCAIUJFaiuFlyr5LBcZcg9wQl//5Rj+59ZyB5jO6vn8OuHGlCAsdbVzGPQzYwSN8S/iIVNv2uDj3eCTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647322; c=relaxed/simple;
	bh=NpnlGS+RfAUP1yAlohXjTYdt1pVsFCAm4rXRoM0IsFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B58bQhNvP3Hs8oj4T2+3wmN3NAP6efURXJfKjvVSnPwGHu5a2WRa4c1mbSXhdWY6mtJvlMGvsMNGqSPNLkxGdMYiCy7j/yBjB4CRqgLabIGLd0tn6A1Cq4GavnUpEkh8h3R/nucUN8JE5yyGP4I/MWkiYmUy7F4eZ4xSQ3NZQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6e+Fxm5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6e+Fxm5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441ab63a415so69658245e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Jun 2025 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647318; x=1750252118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e22TsvH4RGJKGMMRWkswOq9iBPLvNBJezKH7Y1TV0R4=;
        b=R6e+Fxm5+wM6OmiD/CaTtNNLlGFv45YaG2ojzmWcHCqyFrnxZSmjjOyD6LzVFeu5J/
         3czBxOPGxE8NEeKS6DR5icsRNPQUrkWdH2yJnF00cJhzXowBfiKahTVYPLKWeMqtFj5V
         OnvutvLRenMolAQHnDSPvgW4k5kc+yUsYXBZly67q4zQvKj3IRd3UqSeLZ1/PU/M236Z
         l3MuF4eU18g4sThtGJctC8bAn1r45uZeDXOVNaSxBcIXj5I6PUuZFwHG9MVaFSYK8aVP
         9tExzKsY9k6wI9vNXXjo27UrmlWLhTaHrdyIPD29x21fizbGpwKocikYPvO2z2VY95k1
         VpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647318; x=1750252118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e22TsvH4RGJKGMMRWkswOq9iBPLvNBJezKH7Y1TV0R4=;
        b=FrDpRsEok3LStBHozP+RG5UH64lGjGiq2XicYb/E/oD4CB2SksDyFxUM4qvWfXTJQl
         6yrLNSUZ/AxTIJcTP9OVfTFKv3K1QMFu7boru1ixexHdlCOPufDr51CbZpEiLcCwWRxv
         k4i22M6Eo3V7BIPMGctIH3RjpAyRv9FHEQqlr+F6qbrSDpcVK4gFQ72PBZUZ2KlRXTvc
         Vt9iRMab0gRGin5VOmF3rZu5P3C0OZ3Bs755wKwxC7VUyqH7jzJZ2yw94tTfUFkjtN9u
         IRknB3Kj5Bfi1WL0Vm8p1j112MczRXbFel6A45TgeWFQTTSxu1BRgeHDfYe/szuO33a+
         Kyag==
X-Forwarded-Encrypted: i=1; AJvYcCUc4yEJPGDKKuuO63mgKee8lk7ggW63KY3PBop0qfeLDNXxtB4X/Amm6NjFxFx7DQc8mWqIAdEEQzw28paUbJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqq+c6V34pot/yKRdvBPuXD8kj6aQhkkaqHWL83TeCDF/mpBRZ
	qIUjg6i9bNRL0TlecxPbn/byv9yXvQ5xAaljZ1Xj1s1nnIv4/uJGf4KwLmfdnDn/Cw8=
X-Gm-Gg: ASbGncsTYx40nGtWRh8sBep3PsFTDKAR26IRSMoeop51RH2w8sb4d4d9KI9KUYATrR2
	dSrlXr8atUnVEYjfaKDhGVmWeg/zWRzBl2KepIq3pnu7tSMWStvreHPZj+i77d9qe3DQDJaI0Xa
	jGQLjstxXDfHEA8hHo9CVa2LjrcvlkrI/f6ZmtzcN4zpkJ72pTzLOTI907WnwgpASnCjXZPrsZx
	ttuN0UN+GtXrclIMeV6yawmwKbmHyLJD9QBEsBWEQp+7/uYP4C1vsbTLgttiP4rzCEhKOb0uKZo
	W1Hkbfaqf/nnytjB/wC3fxOnLiSRv0/9f/18HBRzl3qxktOZS73Tfp5F3Sy2iFRm9NQ=
X-Google-Smtp-Source: AGHT+IE9fPV/FMEdv4vx5pe2XHdcJaxNKNwxiFMcA9E0/Gzx11yqf9R5n4B9o6ccUjq2b0WV3jYKyw==
X-Received: by 2002:a05:600c:64c5:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-453248c3bdamr25114375e9.22.1749647317534;
        Wed, 11 Jun 2025 06:08:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532522669bsm20508125e9.35.2025.06.11.06.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:08:36 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:08:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: use snprintf() for kernel hardenning
Message-ID: <aEl_0XoK4Q__MOVU@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In this sprintf():

	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);

Then "namestr" and "name" buffer are both SNDRV_CTL_ELEM_ID_NAME_MAXLEN
(44) characters long.  We never actually use that full amount in real
life so everything works fine, but static checkers complain that if name
is 44 characters then when you combine that with the other strings it
will lead to a buffer overflow.  Using snprintf() silences the warning
and makes the code a little bit safer for the future.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index cfe422a79703..5815552cbf89 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4409,7 +4410,7 @@ static int add_tuning_control(struct hda_codec *codec,
 	}
 	knew.private_value =
 		HDA_COMPOSE_AMP_VAL(nid, 1, 0, type);
-	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);
+	snprintf(namestr, sizeof(namestr), "%s %s Volume", name, dirstr[dir]);
 	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
 }
 
-- 
2.47.2

