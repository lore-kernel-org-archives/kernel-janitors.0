Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C422F772
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Dec 2025 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220347; cv=none; b=fxbahC3dNDihcL8I6fc4mZmQewj1nMkKE98mR6Ee8EIspiGTxjGihyVK/km4IUJZBXfgLt7MuFWRzBnEOUKjAE3LAzHEx1fry1Cr9tK3rsUP8Vcu4CIrjYiUqr5kTLthSQ9JWjxTPNZDyhPdhngKdg6AbNsRVkyEPYNkcra/aao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220347; c=relaxed/simple;
	bh=+S85M7vZcdB2shypININVpHOd4FTUrPIPOTRXmCXQiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nxwy36O+UdIR8lvn9KiRfFv41e+XCdzaYcg2hSwA12hZjf00MvG7FyVm1EHkzrR9DSi27BHMm+ZT+07b3U8X9WV22ymr5IwCKs+F/01oEsqFnQNk4Qaw/3dckPofotCT+Yzl7o5FLbfTe3eh+zb7X9uoER9Bgb1qCamHq8ycA3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utvggR5z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utvggR5z"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1441963f8f.3
        for <kernel-janitors@vger.kernel.org>; Sat, 20 Dec 2025 00:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766220344; x=1766825144; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BUTU7KENszCvbPNcK9L3kbL2a9wKFYRCwPwVT9719s=;
        b=utvggR5zzuTIhNmN3WxghVSwaB4UHsm3dD6u0NQal46cN6AzPOnfts2gAHcYOrGxHf
         ACwnXzWtghQmt1+wupf1LC9pMOMxZr0sUb5aMZDWvkeynaOlHEe6yQl56E56eXq9wKtw
         7XmxHSJPiuJbEqU2hXAM6l2OeppY7WaQHIw/xCZs5gjIefIfHe6ZY8q35tpSibCg/Q4p
         ZpgSULygILRZsVcD/LP1TOumaHbv7vUv8aYErmgpzERUNcNrAHNIW0LuNpMzcXSfMLFz
         79Fk1Omx84nkWbfoJJZA8lNRoAgSgmgyZMC+m36JHkh1lEW8pCfmPbYaJEHghpDwkEkT
         ukIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766220344; x=1766825144;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BUTU7KENszCvbPNcK9L3kbL2a9wKFYRCwPwVT9719s=;
        b=AzVyJKWbDwnXV32Tw2YQsrRdGVVKGUYyys2nIc49RzgekzHS65G+XicYlWp0u/TknI
         kjKP/AUX8kfRTKdjZPdpfwANa2sN/YXHAj/+C11qqD6v/5HXujV+gGLcKPaL24xTs9IF
         re7awiGn+i9nD7tQCsfSy98AAbSEozTOl/iO1lNVDCEP5zVK8UjbI/wJHmXUFFWf68Zf
         jZPASQms9QAzOJTV/7gQ0/Zdsaay+xOPMaSGzfasdQL05koFYA7jw+RuF1eDSJP8CbyU
         NF+xc8hnNGqf8+rLZVvaAupsSyiHVTmjNoZbLdaliQBMn7AYmALh9WvH3cJAfa2BZILI
         BhLw==
X-Forwarded-Encrypted: i=1; AJvYcCXdrB+RAGqJo9DsiN1oELM8y+idik27ohIr31Up9wUxTakltbErBtZ9s5j36zw46whUsRy8jW1r9VDVnZlfXbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIScY52r4TkdAquFX6hpWBFe5cgb7izq5nMw0hD4GdqsDr7Pf
	eIZP1A/G6vy5UVDnYZimGjJg3jSbqPd5fquSvBtXvtiJHTD/ZiC66G4527Z4rzc2vIk=
X-Gm-Gg: AY/fxX6YlsL7AtDzzw4UO7maZckto0zJ0m/1snYnD29JoNxmDgYQt5hlWFvY5fOoELg
	sJ8q38iI5nvDZC8TXyRVqzVUF/LwJYj86vnhZv0tCZwPgcIHujrv6kKeLuiesQqRe1Kv2IZMfqn
	H7SQD3T++LqwCW0foKPR6AY5Bsztu0lVdCalRGVXd8MTw+zvY+PPXob0TX70uolvoNQB3NOY3DU
	t7VLtaEVjTuIF1aHX0+pVZUVSjYkdFxRFAEkN2JSk7Nkau3wOf7oL31YyXTRBNUjiRxlUx2IP98
	8Anz4imFG6/k7g11Xy0pDhfjSXj8U8PCHk0gI19naxU2XUJv2bn3lNFAHDpAOK1XIQKZIAiCpYx
	TEFXt+tC3uqakQxuhOcaP8+iOFd8r+SYAVIKszBZnPfuhTALZNx1i6lsjNcoJ67d+RosR2WUabC
	9TULG5+4tsQE+Yppym
X-Google-Smtp-Source: AGHT+IH2hmS7gnHrym6BlZDJPvms24FqDpXh/5usVOeYZs9oX/On+LAvByornqMlQyiobOiJjnzxJA==
X-Received: by 2002:a05:6000:400f:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-4324e4cc56amr5628044f8f.21.1766220343511;
        Sat, 20 Dec 2025 00:45:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab33f5sm9530459f8f.41.2025.12.20.00.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 00:45:43 -0800 (PST)
Date: Sat, 20 Dec 2025 11:45:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuming Fan <shumingf@realtek.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: rt1320: Fix retry checking in rt1320_rae_load()
Message-ID: <aUZiNJ7pzuahXFYE@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This loop iterates 200 times and then gives up.  The problem is that
currently the loop exits with "retry" set to -1 on the failure path but
the check for failure expects it to be 0.  Change from a post-op to a
pre-op so that it exits with "retry" set to 0.

Fixes: 22937af75abb ("ASoC: rt1320: support RAE parameters loading")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Technically now the loop only tries 199 times after my change, however
I am okay with that.

 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 9447e742c672..c0acb6ac462d 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1480,7 +1480,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 		/* RAE stop & CRC disable */
 		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
 
-		while (retry--) {
+		while (--retry) {
 			regmap_read(rt1320->regmap, 0xe83f, &value);
 			if (value & 0x40)
 				break;
-- 
2.51.0

