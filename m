Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038275;
	b=WtNk6nvceL72wp7L/o+RwaZfz+73ICCcJz/mQrhdisFSJpBbx76FJRoRo0CDt8GshnOu
	 TXJc5tfjnPStV/uOZGD4OZgv7Ea5EKKqWJRWJoxQkd2/3162IRiMIewP6whtGdVyrZ2lJ
	 F7adPvPmZPNbEYOOsimOWOOCuHAR3HsuvtLyVJObaz6F6SX3C8n7Hr8s9au1bVeAXUOuS
	 aTLfiYw6nFH2dABfX6UmSEbk6i7BxUQWlADkXIz/um4dVo4KLXOexgkUi2M8A1h/BeTLf
	 2Slri4J2HFvQWgBD4D2KwSltkPIM0F+XNYFozC8V44g21/02HyXT6HTKfe/fJAMqUcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hsQZlrMZIUyRvpkJM4S3mwtOn0xcpvhVlSj+kTMn5mY=;
	b=Tov/yLodMqfbOMW2LzCnEGmAKbnloPMwtzkjrSJ+gBleSwyyoyws+oos1j2a9b1kyhXr
	 VT6vQbuF7rivvjBz5yC4pZf76rrbDTtPnmj9lSBdrCkrjz/IYLLr23Pzb/c+6cHdtjmKg
	 LdUHJNxg8ihzv3D8d8bnQgX/oORsAx4lGalxltV+NPyq9sSa+5Ean3HDnoWZO+rrdgW90
	 g272XByEk9WvGkItgchHvwxDDxiVea1pAitgZEStEql7in0qdFrh3i0WMdRB9hIN0twGj
	 pxbm4y7nNNWreiyHDOZUu+8GUxDCKqZ7AaVUOaFb+gUZz2Szpc02P0XUQsHo8EN4cUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fn8JAa7X;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B83606A320
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2026 21:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B83606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fn8JAa7X
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso16198415e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2026 13:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038273; x=1795643073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsQZlrMZIUyRvpkJM4S3mwtOn0xcpvhVlSj+kTMn5mY=;
        b=Fn8JAa7XGbmhzyQ1IqgD8bGNAqxoPiipsqrZH7hhCefKxW+4T/5jfF09kj3t5wYA/v
         I8WuSWhMqSSVEzNWSF03fns8QDErgWSvKqzPnbGUBp2M3ReN2weNoZPL2imuQ2lZChY7
         Pzsq/+I1JblQDmF1IwJM57hAYneiIyZHpxoZySl6MyNAb7b2r4fWFNPMD9dzfE50YEB+
         UnVtJS0QPcYihz3WxOqO9N2E1dWbVKVh6L2kqxAtYoaYIQgyaJTrpw855uAIVl7EGsXT
         LDvfcwMBiZvuAIouFUKH+g6140GvZQIKqxIacIeqUUPVOb942eE7aJ9pdj1YjPzpcNdq
         RWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038273; x=1795643073;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsQZlrMZIUyRvpkJM4S3mwtOn0xcpvhVlSj+kTMn5mY=;
        b=F6h/72sV6rv9dtwUmv6SHP8u7+C9pIg3i45YaxOQISW+Pgeamfa5p3/VhZXWW2XuBk
         rP8V9Sj/zAfGkVGoHjqFZNyzscL2ZqVkMLcVy4Cy0bm4EcXJ8+2p98ihU++p37qDf3HR
         Y/6B9jPVssjbDdC4lcD1SFh5UpEYGUUXd2+SHGu+PbNSMSqF0FMFOawJP5pixAAogJ+P
         cB8A6ZXHnkz+dws31ahRKuhvoIq1vQMWODvlW9iEkCe+26Wpyw1YhU9ac/oB2b9AzXyv
         4IWoaeuGCWEVTM2j2jGAsbtEiNH6/UqRaPPRQP3lvxO763aMruDja5fKBjvcnoq6dWfI
         0xrQ==
X-Gm-Message-State: APuU4Z83yon1pSXegAmaX0ra02m1z/ad2kT1tMDHKlZWQzKA/qRHGm/m
	9jUmhtziy7JuDZyOX2JWbZUn8Rc+CSVdVqwPNF9Z9sWW4Y3zo2HCrJWz
X-Gm-Gg: AYBFou0stykrvxEf+U6qgs7Csk8ZpDevS4/hxoCjcmUQ0rL0FIG2pJakaSpwhSmHf6O
	EJe/3TV6tlICCyMTz6150hYvR1I3kWOLirZG00MyxZi6jsxMLHB5QmaFpaXtzN9TUgedY1elUTt
	b9EZyU0eaeVMZkDTu0V/sgt/b5RNG8Y52HEVXYnk5+K69Xmc1uYj+mBtFmU/vps/tp35iEIlkqh
	J3O/x+oKHoJtA9TGyfMFwgfXbTsUINQjyNTXPrl6E9ARYlR3VBKUWarqKl/3GcFTzi5G7shZdh9
	nT+qwDzt8MD5UwPEdMhgZFtM0lXYzrvZ/KyRR36Uvj8gy9MKZlfrhHBMEzNoU0BBoNuKAsucEkQ
	Ia4VpNZm1MxxjObyB8Y/Ys6C0U2cz90/0LvnY+2BHlqohalDjImlzw87lOWxv5IUsQe2CAQV6Om
	/pKqjOEY3F1Thu23eyr5ippEUnqnzjJgaFXfoFQEbYoiQ6txZKT5eKGd9yt+MsG70CRz2/AYzLG
	5rRrKj/HqRWzqBgAB+wB5aVcfWXJsu2O40W56YVNDtBAvJnG7/t5H8HkB/lQLpGhyTkqMPH9Ump
	PjwYREBcTst1TpsP04fwGOjaVkg=
X-Received: by 2002:a05:600c:6708:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb7da37038mr76800185e9.24.1795038273529;
        Wed, 18 Nov 2026 13:44:33 -0800 (PST)
Received: from localhost ([5.83.201.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573bccb0sm7022247f8f.55.2026.11.18.13.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:44:33 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH][next] ASoC: cs35l45: Fix spelling mistake "indductor" -> "inductor"
Date: Wed, 18 Nov 2026 21:44:31 +0000
Message-ID: <20261118214431.2752768-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/cs35l45.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index c087f9db6ea7..602d9828eb6b 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1653,7 +1653,7 @@ static int cs35l45_bst_bpe_set_mode(struct cs35l45_private *cs35l45, u32 *output
 		if ((release_mode != CS35L45_BST_BPE_IL_RELEASE_MODE_INSTANT) &&
 		    (release_mode != CS35L45_BST_BPE_IL_RELEASE_MODE_COUNTER))
 			return dev_err_probe(cs35l45->dev, -EINVAL,
-					     "Invalid boost BPE indductor current release mode\n");
+					     "Invalid boost BPE inductor current release mode\n");
 
 		mask |= CS35L45_BST_BPE_IL_LIM_MODE_MASK;
 		packed |= FIELD_PREP(CS35L45_BST_BPE_IL_LIM_MODE_MASK, release_mode);
-- 
2.55.0

