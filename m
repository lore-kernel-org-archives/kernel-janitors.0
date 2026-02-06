Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7563D903F
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Feb 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385312; cv=none; b=eHGbT3jIjF2a+zE9AmLUL++9nj5xK0fD6poim+F+97fBWH4vNj6MpPeE5PAA4bqxEKy6UbR3JXP6MdqNCNOeHqi02AnQrdrXbbyhd60qoBcuer3yHgHP765KeNjyk18oeCXZT43q7cjxcEKHEXbJkZBct84J5ocIdWCIFHCgDgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385312; c=relaxed/simple;
	bh=wm+AbAD/OUh3v7Xv1DEHbPwpasL4lhsjO1KXmiB15S4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grJU2qfs0Qb+1i0Vz5fEhDOnMR/3QwhAoD9WrmqHQzrSNsmMsVzTm/ooPUgPvKPPOd5Zf8Y4RHQc4gUzf6UzCJ461Oyb7IqhpqA1jjkXRo7nBX5V6Sc4S1TGNXX8SKePDizTNxOr5TPyh5V0XVNgOlLRJSAvWkLN14DadWy5jz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXodLrFF; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXodLrFF"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so24821905e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Feb 2026 05:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385310; x=1770990110; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWXO9hygv8TJht16X4K5FTKGWCSFK8mS2WBoiikearA=;
        b=bXodLrFFrLEBuGuEHkZsMrU4CLInVA7+VWz/WC0cdn0RSFSjAYT7LzfJ9Y4RW27pTf
         4GpIWVU1+wWkXwBgM2/k4ZCUQ91o/Ub7bjzImVPCJa7Nz+rI2qWqqndHaXm+1GftEZtf
         GMfkNNMxzgHj32Fr6/AbygIIh6fxIl2r8Tm4MnREWxXhyJbfyCLwokOEq+Nba1/TXn/s
         bY66ZQpK/I4vrzwy2H4JG9m+z3CUYfFo+oBS1vuwP2jV93V3F1Gi40c5COLXxLCzmXCu
         kJoduvuRUv9AqoOlJV2GWbb7ldySuV14aviej6jt1R/h831H3kYn2wahWxlILul7HDAm
         LYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385310; x=1770990110;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWXO9hygv8TJht16X4K5FTKGWCSFK8mS2WBoiikearA=;
        b=s2NiKycDqvlGxxvzxx9r3nFUVxecYP6vhDI+l9yvPSjqhD601v3c2hi7Ma60bvmCJ9
         PT+UZv3vYnrATITiCOFGDQFuqXPxcYcv6/IFXz8o15/i4L1fU1uaFI8SLlk/Ty0dxzwH
         C0Erm6Hs9zlinssTaLdvXhtHrUK/4d9LVfMMATsS9FLA2kx+QL89UoBhjNYKNan0TqM5
         sBzIznIqmN6RmalrcpriyPC58jvRmpaLdSQIHEuYnstbWrBzcbF74k1k4MzItGotIRHi
         Yy4ONwZ/76Xr1aSNbP92lx23uwvz4ITk6P6FXdfLgGxnTkYUhfKOjJSa6jUKeTFnmsJu
         5sNg==
X-Forwarded-Encrypted: i=1; AJvYcCX72Bab6p5EBORzKKlQAhHh9csWcI6jMYrp7Dlg+PDaDH4LJrzTY2bkoX4cVZT8F8hhIS3hjtRbZc3q5E+OAg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6HsHci036aF5rfmd9/o/EE2DsYYrMWoHRpH7DhSYEDXKjiR2
	c5drg1BVlg3ibnBeH2mVZ91S7A8BnC16Wx1S4I0AXKKUeLTSIHZgbvZg8D35QdJ0HdQ=
X-Gm-Gg: AZuq6aIyM3u8lt+DbTkJDgaxET+H2Xf8zGxoAwBNsUu0//gyZBRdNJDh3zrkXcSicSb
	3cTcNzsPxvG9YwbWeHahuuUgjKG3TKqyIEnOYl3n3saMH1LHZ8WQgA9Lo1Fs237v8frLhMFzKzV
	v7aeLl9cicjiQXAG76f97PtKECocVr3tnsivGAyeko3EfWQcjOUJU7njWmgUNrhuMJPDVQ2ccai
	SaN+8rJ+O4QwNVtl3PriQ1oQwZlRQioBMReDK3i0Vsnb6WHHraZl+VUc5sQl/bwDz/ZSBZqbsJ2
	+Luac23whJXwzwp+HoTwJ6vk6CnQgrcREWGtN1/fKYqTBzVMTyWg/P/akbh3U0YIJge83acSDFZ
	YTk0zly3yoy4vS1KOxKJT18nmU9I+rxvK/84cXVcNeLjJl0YKc/hGlM7VqsfPxvYDIOWQ6rh/EV
	n+emMXqqGCj9NmFfZ2FT96cz61VrxQ
X-Received: by 2002:a05:600c:3e1b:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-483201ef97amr43561275e9.16.1770385310385;
        Fri, 06 Feb 2026 05:41:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8341csm123379965e9.13.2026.02.06.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:50 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: oss: delete self assignment
Message-ID: <aYXvm2YoV2yRimhk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

No need to assign "uctl" to itself.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/core/oss/mixer_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 69422ab2d808..8d2d46d03301 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -792,7 +792,7 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	struct snd_ctl_elem_info *uinfo __free(kfree) =
 		kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	struct snd_ctl_elem_value *uctl __free(kfree) =
-		uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
 	guard(rwsem_read)(&card->controls_rwsem);
-- 
2.51.0

