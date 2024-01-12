Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B035A5EE8E
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXXBYWI0"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed4b84667so5920994276.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jan 2024 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705055157; x=1705659957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrpYiiUZvW6/AnFbosBlfeKS3Uh1NSZM2E5hPQsUkps=;
        b=rXXBYWI0vGvvTKV6ygv88oM6VN6fXHHyZjLlGKMs/s3CbH5ci8S/ZMTvCYqPcVxfOb
         b/+PWxhNxncyKnZ2ZkHpqQOqBTe4gKaDV25oFWex16yfaOE64JSa4tp+TLnaaZsHp+gL
         oFC2MfirbpqhGs6e4AsAZfDwo1A3MsFZA/KR/pfITivpSG7AG/wdl6SxqjWLVznZgfJV
         ni4KSOTYAA0g7P63wJnFem26JwLAtTtDjDNoJ0WASue6Y4AJOdltlY1FMXp86bmziBQi
         gEWZ07W7emdb6aNONrB8+e+cxwvhZfV33DKXp1PQVpdNsnb6H1EV+T85vLkz/uCKh+T9
         A/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055157; x=1705659957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrpYiiUZvW6/AnFbosBlfeKS3Uh1NSZM2E5hPQsUkps=;
        b=Vp2WQNNlN2Ud1OipqhrWkT6Ii/5z9nc4yfoM1HBs+4jbPtoLZNbJ/QIGn6lM2gRqi/
         dnYlL/0/oJcycS+lRqKqtXlPBcJVPbzrdtvjVRVxGORbBd65m4hlU/X8xE6hJ5LRcB+v
         S0DptQaKp8xpzYmPi6FtPUwOBB/TCoWfQxyH0SYFGDtHhMPAZ4fqRl4/mzQ6dOMl5ox0
         8P8goDwdrvKAN0T/RV7aoJKEgdZP/1oGLTimpyqPHUIwV+vvdnHZuR4QPVsu8Cxa7sNY
         GZtrZJ1jus7q3I0WolwE1aq/bKDWpQPvV5gPEclhY7xTo4pdHVgyb1JfA2tA53MedtQH
         Gvqg==
X-Gm-Message-State: AOJu0Ywqk9Cp+mjgnOp2I8XJE4ASIYfNF9TUAuFp5SJYFDXfCbRUyJLD
	sOhyHoK0iloKx+KonFE/ODTyThwoCNDwSXFlFeEQcyEEPt1Czg==
X-Google-Smtp-Source: AGHT+IFlOE1GVKUUNrtrFdTNGJR3/eHT7lHMq9rhtkAS83Jo4rY6adUw6B7dW71bpZFr994d28Nl/vfiD5zAKqQ4GOw=
X-Received: by 2002:a25:ea44:0:b0:dbd:e651:a32f with SMTP id
 o4-20020a25ea44000000b00dbde651a32fmr439006ybe.114.1705055157730; Fri, 12 Jan
 2024 02:25:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
In-Reply-To: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Jan 2024 11:25:46 +0100
Message-ID: <CACRpkdafwsQugKzGFsAPsMNGGObSJEzJRah9qGTitah12Zf3Bg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rtd: Fix signedness bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tzuyi Chang <tychang@realtek.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 7:55=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The "data->irqs[]" array holds unsigned int so this error handling will
> not work correctly.
>
> Fixes: eee636bff0dc ("gpio: rtd: Add support for Realtek DHC(Digital Home=
 Center) RTD SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Looks right to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
