Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068B378D8E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Apr 2026 21:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250761; cv=none; b=S3bf0WJb+SHQ/2uCvY4rBPHFHnCm+FeheDgkJHttROGpItyMR1lG9iPE6ugZ1Eg26j2bs/TVHtmk7irEiHzVYPDfCUA91AaMQDuZYJwQnkqSPsrEsrkWIu9fg0wCRB7OKA+8l+w3HFOc6CM8XzgOEVPAsmvFtwLyiIAzChgRGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250761; c=relaxed/simple;
	bh=zn2OJLZJSavhuHzn17IoQTPlAJhTtFRPasbZbTeaRIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dGx1nU0Y6DRvc1k894jOtDk2MrvadwiuqFQ81SMmZkiuGmPukRWPM7SOi7FbPGj0/sQ1fnGJUc+VhQQYc6z7dtbqWKB/AyFu7LDA8dDrDcrWQMi2wD6hmBjN8rl/KQ2xjpHFbdGukB9DSGZZRxqXH1uxuyBZA7gpr5utmvuogjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ9zhq/R; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ9zhq/R"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a3cd6f0447so902859e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Apr 2026 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775250758; x=1775855558; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO9+h7lKs5EgvpVjIg2OrLXhRHzKoOX+aOS9FreDcJc=;
        b=ZQ9zhq/RKEQA5Hhspc2kENeE7wAlcGncWT2d3wRh8PVNdwdzzZQDCP8tqpci7olMOi
         BC894Jn4EDXxIYYzcj1Tzv3NQdPa6QEViyNfRlXyAcpgSPOVv4ORwrcVEI4Wu8sGTns7
         3pfY8coMnHUEYV0l68ttVnPt1dEnt8KCABb9NYs9SJiByW9/aK2zFM++Rez92JZPGavW
         GF6c7jfbx+lH0vwxHHGXcFVCKS0hcvF4EEHe1ydOQeODTUbsDq3u+7D2Id314ZvJpnBQ
         OBWcXe087ucjTIfC/a5MdHjKm3Xq8zypmCY3Hf+whUebM4/1iy5sZ7n9urCZ2AGY6fy8
         6ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775250758; x=1775855558;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vO9+h7lKs5EgvpVjIg2OrLXhRHzKoOX+aOS9FreDcJc=;
        b=T1/NJcHmyYBGfymY5KO+b6Mr0FOrTu6KiiqlpgtPALGI0SL5mkc8qBwiwx21xKTzvc
         zPlET309+cNbtdRfg+9tI/hAYA+NQz9sYoFPzzoQELPpwhHUFIVTqqp6LVSMM03ymQSr
         ZDxmzXSJh1c7J9HJkK1VHD77EvSgIT12WBLAvnWrM4bUXx/9Gm8TZ9dKhy3+72WIXAFx
         SBRFrF9TFjOIzipYKomViAqUDw9qhtcAUaRqOPwR8kTEJkVZ21It7/j1kS5GEbtBfyfC
         LHil2AKfIw4oAkelw2JsAWOKRU/yDIxQ3SF9lvukXCYadNX/Ab5M5//WMYAeJG8kmZBI
         bMvg==
X-Forwarded-Encrypted: i=1; AJvYcCWbWIcP4BHqKiOYxqZZ2W1/vPvlr6S5oTf+URzvFgJtPaT2qqN9sYNqmG+XiBPCnJCX2We8gOveeOqveEv0tvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHgCAd5HI5zP3BjjfrLzkfM2Gn2AKApiNo91lNkjNzwElqyU5R
	VKVNUNtt9Jl/LZ/Q7aaQ8s5XakVp0yHyTN99K7GCk7X/FrB2w49/IAnd
X-Gm-Gg: AeBDieuK+aCu9yYggqSD5MMQv3kk5NJmOanji/IxBdLqtcIyzYWxlgKNm8j4KrDiQ/R
	PjWyU26jdGYJRFvZvsPDtYNwotxa+SNIscbhED594s8V+WeK+2qHXsMOa3EZTCm9facrhTWRSw4
	lBLFfGdI9eI8RW/Ga1dXrVy/m9nD/0TSbkiS8JS+fzHd4BZDhsmWelP3YFI+GIZa5GbGhupmQRF
	5RM4LtQFJhOe+Gdm6bVXWvvsXVRAzwngUlYX4F5MH1wUdKMu73v+Kv66zE8bk65x9P3DfQywHWg
	QUgyPIQup8AG/TAVhQ83Xb+qvNlAf8XXCKAz/esj+D2L7QRkleMaU1hZ1ybVY6Wm0LC/oCAVoON
	9t6TAN9kHOowm12E6iAO+q1EKkUioedtOxQ763o5lnw/KznQ6F1FJVwG9R7KucdOvlar4P7XYps
	CulhFPjcftGU/PwlYzzacQOBVVS938hwTv8WGaVF5wnO0QZKEB0RQn
X-Received: by 2002:a05:6512:10d6:b0:5a1:64ff:a6f4 with SMTP id 2adb3069b0e04-5a3375597fcmr1631577e87.5.1775250758081;
        Fri, 03 Apr 2026 14:12:38 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32ccsm1693990e87.37.2026.04.03.14.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 14:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 23:12:36 +0200
Message-Id: <DHJTVEP7FY8Y.1L1C3P9RYRR0L@gmail.com>
From: "Linus Probert" <linus.probert@gmail.com>
To: "Julia Lawall" <julia.lawall@inria.fr>, "Linus Probert"
 <linus.probert@gmail.com>
Cc: "Dan Carpenter" <error27@gmail.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>, <kernel-janitors@vger.kernel.org>
Subject: Re: Status of kernel-janitors?
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
 <acrhsqvXp4R-egW4@stanley.mountain> <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
 <245d14b-6f1b-1ece-a73-2021fabecd6@inria.fr>
In-Reply-To: <245d14b-6f1b-1ece-a73-2021fabecd6@inria.fr>

On Fri Apr 3, 2026 at 2:01 AM CEST, Julia Lawall wrote:

[...]

> You can use the get_maintainer.pl script to find out who could be
> interested.  You could use the following options to avoid getting too man=
y
> people:
>
> --nokeywords --nogit --nogit-fallback --norolestats

Thanks. That's the command I've been using.

I submitted it to the listed emails and it got merged. My concern was
that the patch being written on staging-testing might not merge with
whatever branch it now got applied to.

I guess it was fine.

Br,
Linus
