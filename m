Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhS1JyuN"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC1F19B6
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 05:41:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so21373725e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 05:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701697260; x=1702302060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tkw2bjWoirxYHVj2RHbsloAnbXBs8BUbrEGT22Wx998=;
        b=QhS1JyuNL3THfR0kskPbenvaIRQCj6zAAnbNVfkgO3BjjJyRTIM1EVU9KvC+KPfwwk
         dId0tHfknfmDPoJfnPJvfoHmU33RUb54XtMOIXekP4H9LgM6j/9l5cHPHE5Gsnwjfzkz
         3i40XwXNeI41EkEXKfm8KlqYu//Sv1hTAHpB1bdmkXkleVvvf+cWw6L0DPsXIW9PQnrL
         +FcJJTn7dBio20J1fWrBY0q3B0fRXpJAKdbi1tUndSLK3+Qz6asbxVKLARauOEGv9LKz
         XGw91aJ0gEdfku3BJ6M45iGLz+CyuHkxBrdp7fMU8wVMJ2WLPVA6CNbUGEfe+VbfN5u5
         rCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697260; x=1702302060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkw2bjWoirxYHVj2RHbsloAnbXBs8BUbrEGT22Wx998=;
        b=jyXj4OEmu5g89VtfrsbbXEjkgDEBUqbZZ8Pw8H2fGmhmLES7n3yvoa+yT8kPj9QR7P
         M/94egQXONHjP6v5LmcpIcrtCJelXWHFhaimd96XfjLwVDwY8BeWoaFgncF6xIp8Z84R
         AT13L90REhpEcufETX4t6UwGKhyVjdxum2n/c8eY/3XmURGXaAQJ7R5u1kinRFuiGq2Y
         Wq9nfd5xXZJyiXUBtGaAzOK6YIJgP/a8UhrQXnEkk8XrwZnULCoOrR93XozSoYOhtpu6
         PdDHUKuYQcwqRD+Tt1rcdC15YVw4v2IV6gYFoJuKe5WiWgKqF3GRBZ1WGUcZ0dVqdBln
         SDAA==
X-Gm-Message-State: AOJu0Yx18mZHPwyucjBTI9rY0UL/L8cby2I7jLfKfAPbzf12MuBm7nwM
	TgpMgI5+Vcg6v7o4spS6O3BtzQ==
X-Google-Smtp-Source: AGHT+IFeUTIxCnbn7I9UIkxnYw/cQJD/HiU8CnnrXuzKTzsyMqPZ2UHJxMHVwgwuqFxUFaaoW3YzFw==
X-Received: by 2002:a05:600c:1d27:b0:40b:5f03:b3a3 with SMTP id l39-20020a05600c1d2700b0040b5f03b3a3mr1274537wms.197.1701697259733;
        Mon, 04 Dec 2023 05:40:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c511200b004064e3b94afsm18664655wms.4.2023.12.04.05.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:40:59 -0800 (PST)
Date: Mon, 4 Dec 2023 16:40:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Shuming Fan <shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5650: add a missing unlock in
 rt5645_jack_detect_work()
Message-ID: <b3229768-7b13-4d40-a6ea-2fde3ad2eefe@suswa.mountain>
References: <0d18b8b3-562f-468e-991e-d82d40451f9a@moroto.mountain>
 <40947cc0-2dd0-45b8-9527-0ffe5a113f6e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40947cc0-2dd0-45b8-9527-0ffe5a113f6e@sirena.org.uk>

On Mon, Dec 04, 2023 at 12:59:52PM +0000, Mark Brown wrote:
> On Mon, Dec 04, 2023 at 03:29:47PM +0300, Dan Carpenter wrote:
> > We recently added new locking to the rt5645_jack_detect_work() function
> > but this return path was accidentally overlooked.
> 
> This breaks the build for me:
> 
> /build/stage/linux/sound/soc/codecs/rt5645.c: In function ‘rt5645_jack_detect_wo
> rk’:
> /build/stage/linux/sound/soc/codecs/rt5645.c:3312:37: error: ‘struct rt5645_priv
> ’ has no member named ‘jd_mutex’
>  3312 |                 mutex_unlock(&rt5645->jd_mutex);
>       |                                     ^~

I'm so puzzled by this.  I'm on linux-next for Dec 4.  I don't see
anything which would affect this on lore...

regards,
dan carpenter

