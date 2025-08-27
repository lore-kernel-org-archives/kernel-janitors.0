Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805D30C637
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756337938; cv=none; b=J/wQ5xx0KuaA80qkrrgUKpDDSRNGs1wZwcYy5ui2mr34nYLyfAT3D8l3Qr3eWJNjWsptSD7cO6PajEACtxuELAGsagNmX4J0bgLZ8J6nuJBEgHareFulbeJDEB+PYZgjDnitJEYtV/ZMJ4iiHv5gfX7gcXEauOVy1kbdgLtD6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756337938; c=relaxed/simple;
	bh=MNeQOS0pzr3dprcINe5o9nkq6nNaZGCx++2bS8YcTKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kL23wjFd6xWMd+3Ey2ARL8x0KJUV9RuAs8OEpmacmvSPTmwFS2DCP4hYjfJU9EXWQLGrjiYFww3NhJbF2bNJEZj1jRG6o/1PKipYJC8CnyhVzwCEuTPqQr8ef6VZu/isyT9UeaKIOUfED34vx/2caHQbAcoyNnnirAIpjMp+Ncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aHuclbnn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aHuclbnn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-771e4378263so356032b3a.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 16:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756337931; x=1756942731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4COsJov1R6T5+fEFFn1/lYQvnIbPTGcTpVNB4EmSuqU=;
        b=aHuclbnn5a8gZebPt1zWX/2qqIQzQpnexgouymDJ1Nu6UamXjImIjaQXRi7/A3oIec
         zoeTBu2Y/ZRWnLT5Nb/Nq3sag14pYhiOJiegFojNrnc6Rq7CEy7jrg3vvGzDBUyBBsOr
         dijs+WlC5ODkeERJc8UVWyrNLhyN1s5Wrms6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756337931; x=1756942731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4COsJov1R6T5+fEFFn1/lYQvnIbPTGcTpVNB4EmSuqU=;
        b=QgfVtPmRy6Dvlgyl0BhlNeL7s3kYr7pf/gZHxU43h96T1Dlh6JKYOSb1y+ntVLpGpN
         9MLYMLJMSMZllqNHqTAn0mywNO17pLFLXX9ardVa4J7Hf6Q7mk0TvWbUqXJ+vLKOmI6T
         8Pcbky1wwi6VufUMrDjlToNpQbDVoKko61PMnFy8+m1XQZwHgt8qhv2I7/o54+rG5BIA
         MfeG7fZq74MmitDh5EwDrSv9SUIWsxEioTnKu7rvodCqUj30w/lug5vpfC5qi/9I/k+t
         r6uONY3jE6AUZ5ZcJTP7Y/iPr0D7CEvEH3Ix8bsMLibNOT7qA/yUbwGvnDuSrLpN4Yo6
         fQAw==
X-Forwarded-Encrypted: i=1; AJvYcCVnefanF1rPf0d82T+GYC1ycYwQda8SySZ/aegtPyG7Zwx1MntFu3QCrPDq2QloC696JiaYM7xGrdIW3TqPVNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzApV5oLhmKrlu4IUh4nLeqo/XckYXgZHcw3RNTGxIkZ9WfMqqO
	ev2EAcxil4pP7dmxdZd3laDaKzzfDeIXnauTWM4reXWhEkLpVATZWNVzRMXYvWDqRuPga06focz
	4NsE=
X-Gm-Gg: ASbGncsr/0CywdXMqykJRNudXTa/Z4sxtBYu8mPjSvzJj0qJZizMYaYg0TXChA6krlV
	Q55l40Zn2XWhJNqacqwE5T+pewwzIcjrWNfATozRqnf+q1fuPWxlWlyLsLxHIobpsorX+NWJ0vN
	hhya7kCFY01WFNKQoO1lJkCCmJs1cmHPEzU7qlP+SdAKF16Y0RlytNtwA7ZWz5qRp/AwPNF94+V
	LaIWlv/Wwe1l6eBKb51uYnIF+4lIP3QKMf1jKNTuUDHM3O24DO1wv5yvdrgwSlzjEh370kkOMl0
	yT048Iw2vDUnXXsvkSdC0kNP0DmNyPpWJ4SnT9LleNX49XCGkp1l/nVfSk3ZuXCvkXsrhLCkD9b
	kKtHl2aQibGnEIJIhQlIY6O2uPIjd2mMRnyt80nNN0wYnkp5FIijg8QGTDsqTpwZaew==
X-Google-Smtp-Source: AGHT+IFQMIVdzseARBNuGmZsISDm2U6pNqbVVlEhVoQIIE0qtoTfnEyln7a4+1Vnz86LEnRiSUuLig==
X-Received: by 2002:a05:6a00:b45:b0:770:556d:32e8 with SMTP id d2e1a72fcca58-770556d5e86mr18234913b3a.24.1756337930933;
        Wed, 27 Aug 2025 16:38:50 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7705708b42fsm11154914b3a.80.2025.08.27.16.38.49
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 16:38:49 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77057c4d88bso400952b3a.2
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 16:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK7rlGuJIrOA8ZY8E++5rjclmtld8s0EvWWuG9kq/CcHwarnKKQQeXQqiD/gYRAeV1aOg3nK81nyewzzfCy9M=@vger.kernel.org
X-Received: by 2002:a17:902:cec2:b0:245:fe27:fe80 with SMTP id
 d9443c01a7336-2462eeb004cmr295833995ad.26.1756337928476; Wed, 27 Aug 2025
 16:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aK8Au3CgZSTvfEJ6@stanley.mountain> <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
 <r6q738p1-53o9-273q-0198-327s56qpqn61@xreary.bet>
In-Reply-To: <r6q738p1-53o9-273q-0198-327s56qpqn61@xreary.bet>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Aug 2025 16:38:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vqp7zDi=xGmy+gq+jSr1Tq=bRAUbkOVuVcz7C9zFbWXQ@mail.gmail.com>
X-Gm-Features: Ac12FXyRfmac0GCbxwA7Nta6zibOiKLyJotJFxyDjgBD9G3VZ9lGRLVwg_SFw9Q
Message-ID: <CAD=FV=Vqp7zDi=xGmy+gq+jSr1Tq=bRAUbkOVuVcz7C9zFbWXQ@mail.gmail.com>
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
To: Jiri Kosina <jikos@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Pin-yen Lin <treapking@chromium.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
	Wentao Guan <guanwentao@uniontech.com>, 
	=?UTF-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 27, 2025 at 8:39=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Wed, 27 Aug 2025, Doug Anderson wrote:
>
> > > Bitwise AND was intended instead of OR.  With the current code the
> > > condition is always true.
> > >
> > > Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power=
 on after panel is enabled")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org
>
> This seems to be missing closing bracket :)

Fixed. The tools would probably have caught it, but better to be safe.
...actually, "b4" fixed it for me. :-P

> > Jiri / Benjamin: if one of you can give this a quick Ack then I'll
> > throw it into drm-misc-next with the patch it's fixing.
>
> Acked-by: Jiri Kosina <jkosina@suse.com>

Pushed to drm-misc-next.

[1/1] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
      commit: 5c76c794bf29399394ebacaa5af8436b8bed0d46
