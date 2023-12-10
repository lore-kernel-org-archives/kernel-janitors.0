Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mk/pk7j2"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDF2F1
	for <kernel-janitors@vger.kernel.org>; Sun, 10 Dec 2023 11:46:46 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d747dbf81eso30751727b3.1
        for <kernel-janitors@vger.kernel.org>; Sun, 10 Dec 2023 11:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702237606; x=1702842406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfL3WzEuDXRtc2Yx9DpKvEpshQljhBnqTFJily+P2J4=;
        b=mk/pk7j2XNoWRptCydmxvtQoifeIfk5lXV8i3x87X7XPcTt2Zv629mUAWoA4hCow0L
         ZmpXSeKsB9jLwcg/cHVVVxmZv1XoolzR3ga6ZWdhX313iIsDB4GlFqEH5Ou8sH2oZGGz
         lFbNvdlf3NuTL2Lt9Xdo0GdYQcv4AAcGYg6NHPiWm/l6aXUSifM/N++7Px6yAG8KcnZd
         IUzc0O4VGJd1OhHxrSDXqzNGhhBelmRY3L+kmepjvh6Oi3sq4uPpqX+gwKBV3oqpRpBD
         c34uogyu1H/Gshum5NDM58PhgY9Ns7EVvtYDquF+fiVdq+P26vIoQFAhtIE11z7LeeP+
         Qr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237606; x=1702842406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfL3WzEuDXRtc2Yx9DpKvEpshQljhBnqTFJily+P2J4=;
        b=Ps9Bi0iw9XjTlz/hGnsrLYDRLCMsN/p64XjLw2qWwKRqMNfVEdX5jO2lMBDu18UO/F
         W8SRBFkXTQepe7W8YnM87YKy+rgqqA8z9Zp3Xy54vlyGZZwdtECD1+pmyQTlB3xjAmSJ
         pgVKdSZnUFheCfbmTiXseDtOgtpNcWMz09/PtOd4zVZrnxm5xm8WruRCE+6+9FVjvayi
         63+77Hr2Hur4talV3Kn9M80eMQQCqJRNSQUtvM0gC/jh2ItnX2UCD4oC23ZHyR0r06jT
         eR3g+aCjd47lGostbRrTgpA+2GYtaA+VnlRb0g/AgXeXMr7a+J1rhH+fXvLCKanq0B3J
         ZIIQ==
X-Gm-Message-State: AOJu0YwkKc9kberfkMr1SF52aoXEvItUd/YmmkqF8pgMZJGhQv1bQ+0/
	WmSc0y250bRZMal0Iev58uQ54ZQeeLqkacKyV9iFPA==
X-Google-Smtp-Source: AGHT+IGkSafvzKSd9XrQiQnLAXp/AYZlAzkqTQNLQinImuLSVyYAumPVpSBhPCumrQMH+fplSJPGlMdPFGDW4+HPe5g=
X-Received: by 2002:a81:4fc7:0:b0:5d7:1941:abb with SMTP id
 d190-20020a814fc7000000b005d719410abbmr2574429ywb.86.1702237605793; Sun, 10
 Dec 2023 11:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87dfa523-1882-417d-97b5-f606ff0099f9@moroto.mountain>
In-Reply-To: <87dfa523-1882-417d-97b5-f606ff0099f9@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Dec 2023 20:46:34 +0100
Message-ID: <CACRpkdbu=pkACc+gmBa_nCrYOwhXi77FzHwwUfd8A0sREPaM9w@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210-hcd: delete an incorrect bounds test
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

thanks for your patch!

On Fri, Dec 8, 2023 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Here "temp" is the number of characters that we have written and "size"
> is the size of the buffer.  The intent was clearly to say that if we have
> written to the end of the buffer then stop.
>
> However, for that to work the comparison should have been done on the
> original "size" value instead of the "size -=3D temp" value.  Not only
> will that not trigger when we want to, but there is a small chance that
> it will trigger incorrectly before we want it to and we break from the
> loop slightly earlier than intended.
>
> This code was recently changed from using snprintf() to scnprintf().  Wit=
h
> snprintf() we likely would have continued looping and passed a negative
> size parameter to snprintf().  This would have triggered an annoying
> WARN().  Now that we have converted to scnprintf() "size" will never
> drop below 1 and there is no real need for this test.  We could change
> the condition to "if (temp <=3D 1) goto done;" but just deleting the test
> is cleanest.

This is a great fix! Thanks for going the extra mile and fix this
when looking at the code.

> Fixes: 1dd33a9f1b95 ("usb: fotg210: Collect pieces of dual mode controlle=
r")

That's the wrong commit.
This commit just brings stuff together from old code...

I believe it should be:
Fixes: 7d50195f6c50 ("usb: host: Faraday fotg210-hcd driver")

It won't backport cleanly but it's the right commit.

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

With the right Fixes:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
