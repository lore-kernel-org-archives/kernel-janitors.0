Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E05147C9B
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891736; cv=none; b=Lv3rqqp5vj6ID8vlHeWPJv20614GXqLYggovfvw9UZ4vwRqyrws+5rdukC9DTaPYyR5BT/bhIkJSgH9ntwYYaAQO/ncOCj0FdChXsxVxXKAKCKjSXm0iI64LWC00B3AvNOSXGzrcBlVsLYFOSpyCh7u4BBkgO3hLux54HALNAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891736; c=relaxed/simple;
	bh=Tr8ZUfI7WuIJqS+Kbyv89NZrMjAzQlMLbG0EsH6Gg/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdMY/Nac1/6fEJ268tQ21/47q8WnhmxPingMTIX1yvzujRyvvNdAo7bsj1Q0ggoZA0iZSZ4dQFa9OsUbgKWj5PQJTQot6WCKtNBFgcXuF5c6DkfINsJLPW5Pl1fu0LUFfrTeXjrgO85qLaznB0B7ZtOKGmK2e7vQVW7H5AKJA6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X90ynpFM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X90ynpFM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d58377339so2773654f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728891732; x=1729496532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr8ZUfI7WuIJqS+Kbyv89NZrMjAzQlMLbG0EsH6Gg/8=;
        b=X90ynpFM9KZZZCzmHuC+gXQZ3gPfsk+uu+miwK1ej6Af9ykeBDzB1yYHDgO/Ejfely
         JKnfEKu0bJW49cRShWk4Wc0FEa64Z5QBNPMD+vl+l9LfssG3Bn8N74LEWNClfhAWLKth
         dHzCxoCVa4QzvoA2IEKu1v/knUsUCJ82qgQA0GxkfdCrvkWG6Gc2Fa5iE1tQLfLFznLS
         QrzR0hQmwE3CS13Ct2Tb2/eSwp7eRsEv64DVtDHq0FNZ5rgd72vmNs380mwbK9JGF5eN
         IanCBhhnfzdyEftjR0l2fYio+IqEuLT2/85s07lZUs2xcqqv58YnNrcwgJnkYiCR6OoK
         2fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891732; x=1729496532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr8ZUfI7WuIJqS+Kbyv89NZrMjAzQlMLbG0EsH6Gg/8=;
        b=EbZJfV3+wGrRxmjPswuuJUoaA/jkOXea9vbtU/GgDxXtXwHqQEC/xClSBUEJGVd6gd
         UmDmtI/h4tdc2BlMHZLpGlXWTzkm4jMn0WqrJagVpFtPCMY+A33gmxItuEOH44WdXvnh
         qrB2xcBdOcaTXqJ75RPs1A6Nb8gNIBtv9Ml8gnPep6g4SskwNb5NAv8WDVbZQDZ2ukQT
         uo64Jj2KaSn9pjgd/HYMBcdBt20bBM2WGSlR7hTbaErkyKqZHfGsl/Yx44qwCbPZlazM
         HAh/RhSko+9qgCojC7QZAoW6RmbJ3sHhFgbJRPcGcaI1M5zjHnOK2f4egXIpKo3Sn+yM
         bNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFprLI+R0pL8V1AGJSNLLWWl82gIQEtUrCVayKGZaaa7pnk09QsWTQkDdyg/o8lwCTT7g8v5nw3zvzvKLfP2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJoaWqfL5AH1ABX2tKsHXPB0NQeqEJAWOdT1OxPCxyJJqbf3b
	JoXJefNEPYPQaiCpRcjEHpLg6EDDqdyOCxXUtYvLqSrvi+Feh6E+lfFgIkVXU1fv02Tugsicj7C
	hcI489/R7myr0q1cKky73KSmIr4tBesr3ZOxt
X-Google-Smtp-Source: AGHT+IFanHxngXEXoSruIGL7Lj9eBY0UNJQ4Ee/B1N1FU2RBHqVnBPNL966Bm6XUd1wbTeZ7KNEgYUSxxBXPLPfuRfM=
X-Received: by 2002:a05:6000:10cb:b0:37c:cdbf:2cc0 with SMTP id
 ffacd0b85a97d-37d601e9acfmr7383958f8f.53.1728891732017; Mon, 14 Oct 2024
 00:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241013201704.49576-1-Julia.Lawall@inria.fr> <20241013201704.49576-3-Julia.Lawall@inria.fr>
In-Reply-To: <20241013201704.49576-3-Julia.Lawall@inria.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Oct 2024 09:41:58 +0200
Message-ID: <CANn89iLQE6uFHpTXq-MGEX+Wnn-BtFnbpC-bUu=zHu0Pw2dKYA@mail.gmail.com>
Subject: Re: [PATCH 02/17] ipv4: replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, vbabka@suse.cz, 
	paulmck@kernel.org, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 10:18=E2=80=AFPM Julia Lawall <Julia.Lawall@inria.f=
r> wrote:
>
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache=
_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
>
> The changes were made using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Note that fn_alias_kmem is never destroyed, so commit 6c6c47b063b5
seems not relevant.

Reviewed-by: Eric Dumazet <edumazet@google.com>
