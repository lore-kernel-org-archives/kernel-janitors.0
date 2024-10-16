Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971821D27B1
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729114756; cv=none; b=DiQ2vGr9PsnzQft5nL6A3SqB54+EEdl2yTTJnA/rXJVRtiQCDn04vcLfeMQ+b471NMsUM2ly23FQNJV3yfqnj/MMAiMsdq4OJMBofIsLd+uZFnrOYodMWhk6bCiD+TG1w7KrXhDypM00REq7FMhlaZqcIshWMQlgs//tYokzuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729114756; c=relaxed/simple;
	bh=k7GxTv21vlnA+IKy5RrAYAcCA8X9XxHW0ySsY+Tvi3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnLcQn83OmZfgHrrOJ02cb+cbvdyBRAq+D+NG+HIBBJZ3ZuQ5rJGgzpp5aYt/zsIyb0LKvUFH3wpAcwDKOU+N1IPMdYIhRHi6iMo8j5n0u5qlStpg8E5WYfFLGjbxLGdEnB2ntYUWP0Yvszlw3x3tSN5lwKXY+ev5H4Fjf0U5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=ysyGKW3J; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="ysyGKW3J"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso356128a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729114752; x=1729719552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGbTpYZZEZP+mGuvzqT9GIg1Bljms7cSdFODzrCOUm4=;
        b=ysyGKW3JYSClX/KxZX/QZpz1IRfsZnUcsas9RzzdWZ6ZFg91cuyPMT5aofgZUDiiOu
         /+wXqwPFI86iSCNkxmdVpJe7f0Q41oSl6wK+UWHvsDAub4WWdZkh59G2GvC7WdBMTLan
         F3g/08Ly1V02LMhvGSlXnnq4OYnVAE29fL093cgB3D/yhRI4buWY2PvhSjid1n6RPyCm
         611Y/WcWOrhJVsguctvm2gA+QTDF6agjEzzRJ5dvhsMG3vj4BiKQ4PuxTJQzhLLagSgf
         bYEiG/ey4VyWTHOg+xgv2jFhCyxtjvqcqc8jDoJKSOoesdR6auhOgRWQeNUtWZn4FeKR
         tcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729114752; x=1729719552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGbTpYZZEZP+mGuvzqT9GIg1Bljms7cSdFODzrCOUm4=;
        b=iXEuiZkyFU71piqir0Y9Ag0tjjkZ0QvdG7zveBowYrcWvindHr/M6KTg/WQp1JLghb
         V0EReaaN4EpemVxlkxN91Ch9NeUKfP0BEePvDbrgvjmFNLhWXXgW8hB1dpOec01SwK/E
         1RO+26z3iKVVwIO9ZcJNrz/f0hLG7wwSXzZluJaAJ9Vi04i+Dj69GUnKq8iE3y69xK1r
         QOMklxMFE3VVzMvmmbP7oMbP8WAvw1O+rL0K956wtJ/kEBmzR5p5JM0zZRbtZMmZI74d
         hzQ7MvWAleaWOswFqpnurs9xwPZ+uRctU5Fhs2IzS2jfYG0hDUsYYpO10NPBSTMLPJ5h
         eCKA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5DTSkT+12bmqS4SngKf8tzt8QqphhFp+ZBZ6hUUNkJ29AQoUnsq4x05slkR53jDseq5bXyll/2AzlLQqCAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFqbWhLqQtX0ONMvcRCaQ8O+N+zrI5E52dlgLUeO5jbKw6ZLet
	6pGQGJR7uJ/4/dpSUEGEwbVAhK7lt1PSuHTONs9c/inOV0arWzf9oBJ0DRUESqGZH94MFntr4Zg
	fvvX1bJSQx3Lw4QpBWNnTd9Su8KOQgo2EBm62/w==
X-Google-Smtp-Source: AGHT+IGfXrUOPkq3mI2TubA4yiUF56RfE+/zlumUxASWgWuC+eB9Q8NPP8mccdlaABo7RMO5uJK/NoWjyHvR/RsH+kI=
X-Received: by 2002:a05:6402:5247:b0:5c9:6b39:d9e5 with SMTP id
 4fb4d7f45d1cf-5c96b39dad8mr13701812a12.20.1729114751823; Wed, 16 Oct 2024
 14:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015232212.19242-1-everestkc@everestkc.com.np> <e22aebb2-0961-459c-bc02-3165c364115b@stanley.mountain>
In-Reply-To: <e22aebb2-0961-459c-bc02-3165c364115b@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 15:39:00 -0600
Message-ID: <CAEO-vhGc9A5NfRDng1j43czdWo7=DO0wahC1Y5mQrF4w6kZRpg@mail.gmail.com>
Subject: Re: [PATCH V4][next] Bluetooth: btintel_pcie: Remove structrually deadcode
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, skhan@linuxfoundation.org, 
	kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:42=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Oct 15, 2024 at 05:22:05PM -0600, Everest K.C. wrote:
> > The switch case statement has a default branch. Thus, the return
> > statement at the end of the function can never be reached.
> > Fix it by removing the return statement at the end of the
> > function.
> >
> > This issue was reported by Coverity Scan.
> >
> > Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between dr=
iver and firmware")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> > ---
> > V3 -> V4: - Fixed typo in the subject
>
> I don't like to be the typo police but, no, you didn't fix the typo.  :P
No, using the correct spelling helps in searching the patches in lore.
Thank you, will send a V5.
> regards,
> dan carpenter
>
Thanks,
Everest K.C.
