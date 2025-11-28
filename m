Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD382D978C
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314435; cv=none; b=XdhjiX940BqRMr/fIiKiwhQfRWwxeHpoWWR2lXofkPW4ZRkqEf5QDNmdzOGkEBBsiYuEUp0WMzpKlFMniQJxZQ8SUmbOUtaEBlbv5p4UEYuC/P+QrdQyzZUMOlHGHnhU41rIZkXr0aRXfEMEm9kU4/XUby9WWsn/tPLHWnSf6DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314435; c=relaxed/simple;
	bh=f+aH6/K40DnBsB8l9bVVElGY3Gyi4O8l/slzikK0lyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2d8l59CUWgY/GxepnZ5CQNGzKQaD2yQrUKrxXY0oOvH3a63FE3X8WJ/Zs+KBLixXash9J7oBLuuQBFsAHE0Oxqbl+FRtD8oAJzdhW1TdJAq6BdQvXTY9nI6Z+BNIcyaTgg5y10B02zQzUbJ/Cq70VTjW5LqDM41PlyaCPQJjGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9g1XSkv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9g1XSkv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b379cd896so867785f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 23:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764314432; x=1764919232; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWoYgNWTWwhW5di9GDfBHQKaAPyH73xqzKRb3keNbIU=;
        b=Z9g1XSkvSFXpMPv4s9IGhfKLYeMJSiAJFZV7Jg6YEMyKyMzPRoJqtgldL/IsC8A6nP
         R/gEASpxg1G3qXUonjVHNUqnHPnVHqnk1iYvqrfvqDW+5SaP+b09aN9moKn4B0u/zz4M
         tsPhF7gWFfX74D3ilu6AtobDy4vaijcpJEeH5kEolYsb0xI/RUI+ePDMSb9bHA1uq8dZ
         fvmj0g5Au7sjD97Uq6U13lp0MsvUKQLdeOLcCUIhxZVIXV+sd1InRJOD/oFs3sXgXPaS
         NuwUcaVHzcOqCAAlHm5LfjlehAV2tOTPjo0vTytWbt+YaSqDfq8gwpj2WDwPQv2itNl2
         uQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314432; x=1764919232;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWoYgNWTWwhW5di9GDfBHQKaAPyH73xqzKRb3keNbIU=;
        b=LTJ6ZGO+3xaxkqGp5BvmoCwuSN7nLQZzDZtCqiT8CMW0yFhf9kd2vUNOt3ZHbBCaFs
         rzfsb8dpH4G8NIyJna3Jsq9RxytPmVhyyntCXS38NcZ7vlfJVoiqhc0Hs+ks8AYwm+fv
         Kec2c7S0dU9g9j4BB43TmscXmsvxIYVsFQUWBOPHLJEP7Pux/wWGYhywFNeGTbVaKByc
         UvJf9cpi5n1X2IGeOZBSVeghEARZLUcpIfO4bQKuhZ6KjgAGx6FtEzmUMmR78clXQMNd
         wCp9He51YD74R5GBb0Jgg6O9j13qUUY/MeuzKkCRYl76EgLBxH1l8P2oezR2XRw0T3M0
         FhWA==
X-Forwarded-Encrypted: i=1; AJvYcCWv/WR8tud1iTFohEBZe1D3g923CYXv1IQ9wxgMKSJyL4ZOC7Q/fEQDx6YLN+CEiDIEBUzD0TeWCeUwCTP6fkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+seflsZRscpaIjP+lrs7fsnXyzGpzIRWDnoJsPYQd3A/6azA
	7oH9OKp8k/Xw3HCh5X6QXZWXj5OTFcAxPLdtKAmEc2KGnOVkQZjdrpvQoCZq2/o8vzM=
X-Gm-Gg: ASbGncsKmDKPW7a0EFhAmi6DnxjlIMJKJh8l/uVjUBsu1Ldm8Z7sBdkiz+OBdGa37FR
	dBIrkuCxoXKJ3fOc4eAXGOLQI9vKRzfQ4nJEJWPKTSA5JwNi6D+/0Yye8WGDp90YikGMtHp5zyB
	CTYZ1FEnflM2BC+n4SziXRh3xoHFpvxVN4rXvMuDc+zUhbvy46a9URs3/EsW0V8tjPB22gEgvue
	FxPMj+bxivLiz5seaT7pbUzHeL4QYeCd0vWZXO2b8JJcgKWixiVg6Vo1i2Aos3awdBBqhwR+wwk
	//aRHYbtWQlGKP+z0nKt+5EzM0fkxHWVsOeu9l3YW3ocpi9P3pIYHnhrNLnC3A/NfhS7J1QyVhk
	hMIIEL7MRdH0s0SvmWWeVeOQmSX/a3Gs+MsnyqDq3tXoqqKaoltSk19z2il7TUDBejqgjpqFgSh
	ZtUxRhOKxjS8tDPEeO
X-Google-Smtp-Source: AGHT+IEwl1VX5SMVB/NlLIe8WMXW7eNL4IPTOuYm7xccuBWy0w64ollMoWFVscshbBfOrKGju1AW5A==
X-Received: by 2002:a05:6000:3113:b0:42b:3e0a:64af with SMTP id ffacd0b85a97d-42cc1ac9a88mr26602666f8f.11.1764314432265;
        Thu, 27 Nov 2025 23:20:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a396sm7760487f8f.22.2025.11.27.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:20:31 -0800 (PST)
Date: Fri, 28 Nov 2025 10:20:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: nau8325: Delete a stray tab
Message-ID: <aSlNO0sqQr2A4vzG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This line is indented too far.  Delete a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/nau8325.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 5b3115b0a7e5..3bfdb448f8bd 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -422,7 +422,7 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 				*n1_sel = i;
 				*mult_sel = j;
 				ratio_sel = ratio;
-					goto proc_done;
+				goto proc_done;
 			}
 		}
 	}
-- 
2.51.0

