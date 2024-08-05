Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3F1509AF
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Aug 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722847206; cv=none; b=P+McVFYEjwY97o+codYFjQOHwqJFazznHefDEvSisnnag62gVygXywP84Wjeu3hnESz9/lWzbJH49f/7tmV6vwNr0l4clxhBZOwmY/yPtkZX04RXwlJbQoCA3NBOQ0bjI11zJjbjcgkKwmBrNZWrkPq/NW2xiwl8iOUNqO8AjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722847206; c=relaxed/simple;
	bh=+QeAcYgwZWfrituWGwqVmeQsadpHXzGektiodHZjf84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khZVki7LJHm3C8b3Zcv8+UhinvjKxs4JQjVIUxchca8htEriinxxuJMOmy9Fc8yEWBb62YCZN9pwdaE+LwKTmgqHXSRinUMHgz1hQr6qDZAr26gc0dxElC45qcAdeJRXyj9xfcXEbjdDvzmL1SCDuJ0m0L8oOH6Se+hG9SYduZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nFcFYrmy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nFcFYrmy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso77188a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Aug 2024 01:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722847203; x=1723452003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=entCZfiVHBFVDEWOeIthEZ96rKxsZnXZCzUJ55LPSZs=;
        b=nFcFYrmyqSFGntClCMY3XY0jvB4Tt/f1vGDgbxSa1S+bXPXik9gEdUcQVpWEXKn2pn
         wSWBN0hMe9jMYOjIj4gHnImpAgjDOz5yzGDZtPRGuvIQw/s3Et0eC4w9rsUw0v/P60iC
         Tigfsd6ErP+NpMKqG2GoSflq46YI9Qvj/C1vhSH4MwHBDGJdG18rB+c00eCHn+2sjQaV
         ca7Wp6wq9atkZeUzWoRlri3UhEZ25c5Jx5RyXv9d5dvU5jDIzPQDbsBTFbU31E/3v6+0
         51bhxWK1f2Tl8dxFunJoUwkkeEB12wu0EbcsoTNHcGN5/pLJUkUpr8ChChWJOkHCjs6R
         Sjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722847203; x=1723452003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=entCZfiVHBFVDEWOeIthEZ96rKxsZnXZCzUJ55LPSZs=;
        b=weeQ44rcmoPIjbti5tItp3+aBb0u1lYtOMUxAfpIqVCr84s08h8mkZHRXKXYmYwWMs
         IdXHmGKonS0i+FRtsC5/TE74jU0kUyAgw/rmModcP+eA4Yuk4OPMzZqhCVeCyM5H0Osa
         ZW4Mt/MoTOixttPoFvSnzKP88OKU7pmQPparOGrViceld5uPUtW7Mz1BZxElzFOoBAwO
         ZPEPZSDCgjND0QYgX8E1I5L6/5iyfmInriEJvfkczEuaKNZPJS7eJyK+POhcEdn3gv5g
         2NnFy0GKKmozJbMuntG8CnvsTFynRvZNku9wa7s/GT5u20Sz5TsT17FMxf/pyAC+/xsg
         i36Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNNUs4DSsobyJJD4NrM4qVNCufewTaRl/AwROwNKAfR0veIKuJD3WWxqsWZg7IWH0XSHFUpjm2Eiip//EFRp4HqTbMuEORZV206ItjjWkO
X-Gm-Message-State: AOJu0Ywah+LZv3sGT2XijeFmRZkEvOCc0TxjYh7KdLX/ZPINO9ouwxJT
	mnH0Dpz7kWm242fEtQ83VMPZiR57rDzEjiWy3hNX0ytL4S+f8c674oc0do09kECCGj/xaUwGHyK
	gq/4b9/MnWa10e6KLWd2G5ajUzuBR1q2yMlIIkSUxUoZP1A/g6Q==
X-Google-Smtp-Source: AGHT+IFdJr10J60UQVpdLncVN9PxgFluZr8MnNc+pMVhjD4N1bAEOas0ed5HkbYf/F1Ugm/6XTXOS9gIYlX+9dp/Zc0=
X-Received: by 2002:a05:6402:26cb:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-5b9caf072d4mr183817a12.7.1722847202752; Mon, 05 Aug 2024
 01:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <561bb4974499a328ac39aff31858465d9bd12b1c.1722752370.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <561bb4974499a328ac39aff31858465d9bd12b1c.1722752370.git.christophe.jaillet@wanadoo.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 5 Aug 2024 10:39:49 +0200
Message-ID: <CANn89iLaPXXNv1NC3+XyVLfX+0VVX5XQB0xobf8zAY2b95HX+g@mail.gmail.com>
Subject: Re: [PATCH net-next v2] tcp: Use clamp() in htcp_alpha_update()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 8:20=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Using clamp instead of min(max()) is easier to read and it matches even
> better the comment just above it.
>
> It also reduces the size of the preprocessed files by ~ 2.5 ko.
> (see [1] for a discussion about it)
>
> $ ls -l net/ipv4/tcp_htcp*.i
>  5576024 27 juil. 10:19 net/ipv4/tcp_htcp.old.i
>  5573550 27 juil. 10:21 net/ipv4/tcp_htcp.new.i
>
> [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.a=
culab.com/
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Eric Dumazet <edumazet@google.com>
