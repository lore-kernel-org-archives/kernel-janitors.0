Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4431F428F
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Aug 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754125362; cv=none; b=cwnfXLdG1EZ8XAqwHaDQzTo+Tc52PGifu4acRSZg8cAtNgnfrx9uaGhIZhOzm78MrZ4ziSvjGvOVxzmyqKBm1735XqydvTob7bSZQWPOU+zrCGTW8tHFajSPxWmPJGAMnOYf/qiE3Ay+AeY+JZ9dog3IVkDUugk3+rDYFVfuenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754125362; c=relaxed/simple;
	bh=tE/ycKV78Xqu6awmy1vGaYwLfvEhozTkRG8Leg5kafA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M70YB0kSTynJalj08J9m4k1FTmu/ZiFsBlUTVz95VF/awKbbEXpTnJBDm/Qb1bO21rbmrb/Yv3w3x0GocgPsNp85Xy3uW+xA3uR3qArTGCDXmVEf4ccjSNItRc3+Zh+c9wh9CJmhtF4OZ/alMqrqWoSqH4DcfWonXRvdvaZzBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fjeg2Ipm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fjeg2Ipm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso16873055e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Aug 2025 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754125359; x=1754730159; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/dnL5CfASf7BSwg8zUGgo87QSvNoaNIJBZuuBOd20Y=;
        b=Fjeg2Ipm1nAlUTzjt1e5NiFfCrabjd3DsGqN1oUa0hD+0spmCClkG+MZBoLSSDrhJo
         eubaZlnwsB7qt9nRxG4eQ2fGG/eDRG/D709GNjZ8SC+8Pu80szPf+jyBbVt1/uTZJAYp
         pfES1rgdIy+iTJZi5pbw/D1qfzRdKJJ+C3dcKQTnjl+e0n5ysDsIVaAxPYEBn0XSseVS
         0jgEBV6+p+uqBtQ0Z6CPbgU8QCE6rZT9pK4xCdjVIq1Iidno2AlBfeK+78UyZ/H1v3AH
         JqiJPGhBDMDCm4vmyvWpFvpEZk79csXEvKd50q0wpgPwj/9YDXP/XIc3ev8etpadDkqu
         IA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754125359; x=1754730159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/dnL5CfASf7BSwg8zUGgo87QSvNoaNIJBZuuBOd20Y=;
        b=JlD04m2H6jl3W+l76sKtpZiQD0utWGjWukIGxVIMc+Er2Nd4u/Bk66JE4Y7SGK0/xP
         OWWhFAWBEfFOxsNCvQQyBUg5nvxxIcW1DBDunMD6h718NpdJ0jzgmWL+y2gL6SCSa9fl
         I438SCE58u46pspC9PzJL+hsGQ4FP6Js0V28YgxrGsJ1GySjYDVJ4WSS1MzezJCGYz8+
         rPa29FnTdh5jQFA1yPtE/00L0K/by+6g3BkCYG3IfA0BzriHC3uTUBK+aMmWqcebkABM
         mVWpOBfevDiOOW8R6Mqi5D+zxkwIe74qdHV7n69ws2YDbAiZy5VX3tkBDnP1ugqM5vRI
         0K6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHWJBlDBqYfmvvjmyBIHbiYm6FqZsUgmpWEs8umpDQ5kVzXm5RjspM4TPhuOkmQOLafCKUYXfLS5VzNmDs2rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAE6k2HvLmELslybpWARN35GjvipQMJ4LmVb8h8AqfAwvQRZR
	vUE6OlJjhGVI6P5QNgppYb7lptoMbq+uHLcImXi1tCvS2OAlSilDBfHQI93+lA/pe4o=
X-Gm-Gg: ASbGncs42KdQGGgPCdW4je67nLDQat++ZnOfH+SaYLWQucOJJ/vXKQLPtV5SgOyLOy7
	urq0iugY5vozT+ayOR5HIdRrvtC/sbxrHPtN/lXJyRF9Rb4Pl2K8Sz3o0TUzaag/CPAdJGnSjKN
	GMqScLtNnyVX59MDnE66EasNwM5dPsV4DDRSoZim0uZQey1spIvRc8EUogpezUj90cDli1drfJF
	bV/F4NvVPtPne1HqIqJ7pETGvN9nho4o90U4EtfAVLnq2HTVXkZFUOf2HSDwppGY3Ih8v58wNUS
	zJJrjO3aQoNR1pVY3U1JMDj9UxSKPc9WjEveyx7CDXSk6dL1/7F8bquzcZpQgxOTpJzFRTEQLq1
	oVuGIFSsdFiz6+UGgrtU4aVxssBQ=
X-Google-Smtp-Source: AGHT+IGD1hqwEMqQ7r+1+t1Ud4D2Xaj0ub7nD4dO+TqiU68vja/VuwOkDoIJFNO3HEop6/QEYJVv+w==
X-Received: by 2002:a05:600c:a46:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-458b6b30363mr15584125e9.18.1754125358709;
        Sat, 02 Aug 2025 02:02:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bd5a1148sm6429065e9.0.2025.08.02.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 02:02:38 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:02:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
Message-ID: <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
 <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
 <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>

On Sat, Aug 02, 2025 at 10:45:49AM +0200, Andy Shevchenko wrote:
> On Sat, Aug 2, 2025 at 9:32 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > > On Fri, Aug 1, 2025 at 6:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> > > >
> > > > There are incorrect %u format specifiers being used to for signed integers,
> > > > fix this by using %d instead.
> > >
> > > Both of them sound to me like the fix of the symptom and not the
> > > cause. Can we simply make types of the iterators to be unsigned
> > > instead?
> >
> > Making iterator unsigned by default only increases the rate of bugs.
> 
> How? Please, make sure this is relevant to this case.

You're suggesting that he should change:

-	int i, j;
+	unsigned int i, j;

It's just bad advice.  Making iterators unsigned makes the code less
safe.  It leads underflow bugs when we do subtraction:

	for (i = num - 1; i < limit; i++) {

Now i starts at UINT_MAX.  Which I guess is fine in this example...

But it also leads to endless loops in the error handling:

	while (i-- >= 0) {

Making iterators unsigned is a bad habbit and it's bad advice in terms
of the data that we have with regards to bugs.

regards,
dan carpenter

