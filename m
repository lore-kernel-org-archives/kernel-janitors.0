Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14B1292CF
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Feb 2024 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708088423; cv=none; b=I3ZUzNHYzG7XS7tl7AU5qO/E0vgr3iMNqgR6xu411ZSiWA15ez8GgdeLGnItAXp4yVJaDb3KY9EV7jHU5DnfgXzSuZty7TDtgzGfGJOEng6dTXCvBCvUUddH3aP9/K7nL+eMSkBzpjutCciODN1bwLvxI04BiZ69K9zKzpO5xas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708088423; c=relaxed/simple;
	bh=Q9FiHqnCHL3E9ZvpPaMJlycI3lYQXhzRD9PL8gpGn8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW4ldxOGpxhd1po6ESKfEC5i9sX/yxZ/IJ+a66IHFRN24lXG7FB3yGk7jWAEd3aRuzy6ojAZeiae8neBgVZLIsctSJ9oEx7tgiJyCeWowpo+Gn1zlycmmMvUiL/AQidMg+b0y90BLh4Rz/8zysU7YhJRHb+4REVE1tBhQmXkUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PXlgCRLx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PXlgCRLx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-561f0f116ecso7503a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Feb 2024 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708088419; x=1708693219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj9qHpnR2tZ5jt/5wBKldh4E6F0wiDuhfNceA+AIwtM=;
        b=PXlgCRLxxS/FGlYm89xP7uMKPvWqH+M1p3ZP8ZMWF46ULy7hA0GhUT38lVg+j2pMn2
         kJn8UWHcuBcm1/nD4UGjCjfIKvsHkQpDh4kNkKhCu2eeBejlM9ZIXijxfyGgRp2OBGJf
         HaKHXLehSdttdDs5Ppt9LwR6Pq9WLgAEDcC/R3BwMGgNzVJxP6fMwfFGN8/QSbmL83+a
         67BoT+Q4Zm3pnBe6ZAHb0y4fyyWJwZzx/LWfvrCQ2Rfbz+401LXH/z6APb2rahajrAta
         CFsWH5YbXvC+j2Q8LnLEc4LE1dFgGwCNkUwyXKWCm7xJ5yintfQTVAdHEq6HW1xTymfK
         KD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708088419; x=1708693219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cj9qHpnR2tZ5jt/5wBKldh4E6F0wiDuhfNceA+AIwtM=;
        b=b2gOSv2p79lz7f1+yxpQnmY7B5G32MnZ1XWTZrHjtsWuqVuFgdPSFzQBcUwFyy9RcT
         ZK6WlXXC6ZvGHOKKS2kW8/8dLlC0jsnh/e4ksmfdRE+vhkOfHcyav9aEkStRiMzd04Ho
         vPSTtA5VqQatoIxOO76tvg/RZ03utC8pLiUWEom5qDlRFVZRCEew5495btVA2ApuJB//
         VWeF4zUhpzX0oiNOqZC3rAkIdfYb1Ght8d2drBbsjdx4YASuoWnMjma542lFho5yw3kZ
         /Xw0jXFDydTefmPp0/7Nf6Ix4XrHyiPCUNTltDGWZDEKeEWRxuWEQ/i8TU2ZZSec+ye5
         UoFg==
X-Forwarded-Encrypted: i=1; AJvYcCWHTEhBmegJRzjtXlKU3mLz9bTL+yhnOZBU/5rdDEGM9FWGQP+KP4lTfpSIpgC00i8iYp/LXMKx47W2aJLLtpCxW9viP++4gJJE2dAbmLDh
X-Gm-Message-State: AOJu0YyXb2HQh9Ru7XZliX8fbwjg5t9VV513Gir9KpfRq3pjLOpiNOVC
	uxVijhv8bNB1y8di0c2jXrO72i7WHKvPu3JNgg4PryFBzvchqYvjiR1ycismVJ9NKiMUCRWXats
	5UBulmkwUCco7xOygP60IZijkQdRk1qN2atmw
X-Google-Smtp-Source: AGHT+IH6t+rDZIwMBeUCKDrzESqhamtknUSblj4Qf/L6XceYjvRS/fJdntgggy1qv/Xtpgu1kSWQXxNC+O2zfyJrCdY=
X-Received: by 2002:a50:d65a:0:b0:560:e82e:2cc4 with SMTP id
 c26-20020a50d65a000000b00560e82e2cc4mr188151edj.3.1708088418945; Fri, 16 Feb
 2024 05:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216125443.2107244-1-colin.i.king@gmail.com>
In-Reply-To: <20240216125443.2107244-1-colin.i.king@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 16 Feb 2024 14:00:04 +0100
Message-ID: <CANn89iJM=fVSkzz9HRU+HXYm+R+owKqah0TT8sY-soEXf2HiNA@mail.gmail.com>
Subject: Re: [PATCH][next] net: tcp: Remove redundant initialization of
 variable len
To: Colin Ian King <colin.i.king@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 1:54=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The variable len being initialized with a value that is never read, an
> if statement is initializing it in both paths of the if statement.
> The initialization is redundant and can be removed.
>
> Cleans up clang scan build warning:
> net/ipv4/tcp_ao.c:512:11: warning: Value stored to 'len' during its
> initialization is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  net/ipv4/tcp_ao.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
> index 87db432c6bb4..3afeeb68e8a7 100644
> --- a/net/ipv4/tcp_ao.c
> +++ b/net/ipv4/tcp_ao.c
> @@ -509,9 +509,9 @@ static int tcp_ao_hash_header(struct tcp_sigpool *hp,
>                               bool exclude_options, u8 *hash,
>                               int hash_offset, int hash_len)
>  {
> -       int err, len =3D th->doff << 2;
>         struct scatterlist sg;
>         u8 *hdr =3D hp->scratch;
> +       int err, len;
>
>         /* We are not allowed to change tcphdr, make a local copy */
>         if (exclude_options) {
> --
> 2.39.2
>

Cc Dmitry Safonov

Dmitry, can you take a look ?

Thanks !
