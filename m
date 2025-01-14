Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CE44360;
	Tue, 14 Jan 2025 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864043; cv=none; b=U1w/nOzY7d/R+4ixG++D9cfCVCQT1cgLurTZtaQ7kqJo3RoQ/44jw8uQZmA4mq3Xw9/gDNqvxobY9B0IHf6aQpVeFlV/MEEi0XEXtpLgIys4MfY7EDSU0e6VtWBKgmR/gmjwJXTWUTkfSc8fRrO/Y8NR0gVtFawlPGlVCrlCdfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864043; c=relaxed/simple;
	bh=oPLxYVFgMqBoMZEC4nDdIGfzLwYnmn9Rt055dg3XOsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyfVv8qakJ9m00YcmriYt8b9pZrvzNB57g0QI+83wNIAsgjakowUHnN3tKDm7W+yRCKdeg3R2S7NjH0vhAZF6lLBHnEakJzmQlho0QRmtd8i0XEKeyo7HXqjql59QGpogjIasyTBft2wbPykByg5UiPBfpnrJwYTyYtrpZu5YwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fd+THPGe; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fd+THPGe"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so9548033a12.2;
        Tue, 14 Jan 2025 06:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736864040; x=1737468840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq/Rw+S9lv/LYyE3ZquC93DcWY1bKMQz9/XVHbWsV8E=;
        b=fd+THPGeQ55JSEYY4fsXhX+oGMcrXMbaBQ0tbVvIUUd52krokRkOIt6HcK5fOlwqSk
         ajHrdrBBhI4HEJEUeLROupRlnvw5P29X+TLNuRDkWKazp/5AkXuUKxz4yGWHKxw4kxit
         arttrfdIIHHddAieNfAu1jfQ4nVSSx53If7JSfFMQ5tc99udalMCXx/gSeuf/YYjZ9Jb
         VxoF3ComwUVa4vECov5Is7/OcyxxG5E6yUtWELkqrw05nV/bvg7KwAo9gmd5qfIcH5zt
         EjjBoH9T8HTr+7YsemW4Du2tn/I8mfvGoOuw6cYuZF2wEkrIA8v/lM44PaqwfQE/cDOE
         Kr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864040; x=1737468840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq/Rw+S9lv/LYyE3ZquC93DcWY1bKMQz9/XVHbWsV8E=;
        b=BCoRpSIlatfPD9+6wbNzXfe65Zm7pTLqPzaS9TWVl2xL7rk9d5IqDrrdRnBvz8XrIx
         QqkJW7P+CDTEpdkAD3mIZKDixwrzMq4eWAsvJ1r/BJ/oMeZh39MIkwRmK3+W7eXIozNU
         e+fpDXnTeqM05P3nCbXkuSo/QJe2l1zUvIWkvntG0bcDC/OG1eBsJUlIg/QfQAMng0Mi
         +DCaPvn9M8e9p/g730zUMdfym9CR/ZChGzqLcWQkd5JPmvuQApLK/zwUzJ0VCIp1rtDD
         CYVyHgD/BJ64AAsMEfkjNBaI0tfbJdLX5nfS1DdqvqdcFmpk5fhW9CWRGn56WoiDicRT
         f8PA==
X-Forwarded-Encrypted: i=1; AJvYcCWLPOf9/xvdgGms/uijvnzpPdhawCTHpUVvoIEse/n2k6DwtOGx2OIKHHHYpq5rwnhjifDRUmzKdUsxsTALAfM=@vger.kernel.org, AJvYcCWmZOo4NDtU8brjufkjQZ8u0AXmgRbIZWlV2irOo5INlS20bnfE+4RfbsStswgT7nK/POvBF4lTw04fY4ke@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+Rsy0RMCpUo/D8+9TfHip75zYSThQ2swF4q0xw74g0AHadNY
	albkh6r8FsOzfWKZ0qJPlV+mEJ6MesBkZlAy3sXrse5B+B1xS1XI4hR9+3+Otkl4Z2mz+CW8HLF
	gMN9hCHlkxkGerV3HyA2LgZhDTuI=
X-Gm-Gg: ASbGncu+19Wol24V53dZWDmJ1AfsVPW0IbYU5t93CYcH+V2sDBim3H3A6dRXYFDgv1y
	zM+L7zJEpUm68QNK4SUAbqcTVLEUoSPqqK6HHnhDlyl2riRl0fhAFJ38D90f4uPIBAirgNS6V
X-Google-Smtp-Source: AGHT+IHZW2SKYJrAv7pV6GuqxUX4ozUmcVlb/S9pdxoitWdJD5a3iByLC6lxC4FR/LWy0pgtKfmr1ZvL8omKLmU0QUw=
X-Received: by 2002:a17:907:944f:b0:ab3:3184:6890 with SMTP id
 a640c23a62f3a-ab3318469b2mr377395866b.33.1736864040264; Tue, 14 Jan 2025
 06:14:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104184951.3481-1-tanyaagarwal25699@gmail.com> <Z4Xdvxsnezp-tLUn@gondor.apana.org.au>
In-Reply-To: <Z4Xdvxsnezp-tLUn@gondor.apana.org.au>
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Date: Tue, 14 Jan 2025 19:43:47 +0530
X-Gm-Features: AbW1kvZ8GT5Y42MlHrd453qy1cxvuL_Rl8m0KzoOTlYyPDz33kBsxftgdZ4-E44
Message-ID: <CAPdGtUx4KShKZiYqX7K89h3RPQpuJuiz1b-dBUf9c17rntjDcA@mail.gmail.com>
Subject: Re: [PATCH V3] lib: 842: Improve error handling in sw842_compress()
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: haren@us.ibm.com, ddstreet@ieee.org, Markus.Elfring@web.de, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, anupnewsmail@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 9:15=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Sun, Jan 05, 2025 at 12:19:54AM +0530, Tanya Agarwal wrote:
> > From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

>
> Please resend via linux-crypto@vger.kernel.org.  The MAINTAINERS
> entry should be updated to include the mailing list.

Done. Thanks for pointing it out.
https://lore.kernel.org/all/20250114141203.1421-1-tanyaagarwal25699@gmail.c=
om/

>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
