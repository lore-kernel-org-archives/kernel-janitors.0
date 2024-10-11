Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5AE19E998
	for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676550; cv=none; b=B1i1ySJgw47xitj9+mcbku0ndlQD5zpcrz1BJ2AYbGAtE23xId6QMYzL9qbrCZ4PdoLwisi8IdqRrldIRBeEF4I6WVZko2OmJ9BAc2nBnF8wmTH4sOCc8esWCviwRuqv+nqaQIpcA5AjwcAwTEKSxkOdAnmTIsjUVlCXG3KmP/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676550; c=relaxed/simple;
	bh=a5D6CRKK6FRSWd/adGyc0iCMDGRKCSw2V0dQAJdi94Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjwE8tLl8HnNPyopD5Goif0/bxr4aVQT8sHlETc2M1lUNMuGR7a0QpXDkZJo21X/YpK0KuVw/b5tlr/kCpkvo2FDTZTaUzMcWQJn5MmTQXgQVkOsb1jcMVvQefaJKqP6rEIu2xzOLnWB9FOZZ8LBI9kD5ejPibAoDHfxpxdckRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awnF2X1u; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awnF2X1u"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2346f164cso21246727b3.3
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676548; x=1729281348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkBoPVksNssq3kk3PRQvLrV5w199+kZDVbn+dDVtSPE=;
        b=awnF2X1u+JGwPCfYeQaZfeTDKaUYR3fh61rrprJM9QiweC9+dsMVCOFoVDjvs0DGX9
         Evai97b86I+IM+lRYGckAzIgyH1aWiHIiJ54snKQ8kNU5yDOjzcWyWeC0GqL7jVHbBgs
         tC7SHh2OqiAnSo/WWfXJUHKCanJmkJW/eQrXightxqbWm6ZCvFGPcYUGSN9yUl0BGA7p
         T3d5Vb0mkEIiGscz2YLm92RhuEaGzs7EHsdNu5DKrTMHl6CcB2+Fi75tzBD0TTwxHv0S
         GH+RIwd6KCMa7BEulMKO4I16X19sqKRZb/Ax5yXiFIoN+McS0+jaAMj+Y+ZlKNLsGR98
         gQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676548; x=1729281348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkBoPVksNssq3kk3PRQvLrV5w199+kZDVbn+dDVtSPE=;
        b=Ps4zAsJt0ikbcD2nkt0V1eSauQt86AP9s50Kr38G7wo6WhHgjUSy7M4y7/QRfNRfeq
         6azVWqg+yFHr3uBSm/4V9tziH0Ghvf128lqsGad19aYffe95VpZNilf2dXjyBpbD++4d
         FNubNf53hvymzK/m3Dtb4/i8lyjXI4LvBF0Vj+NlsYP4ugYF/wZO5QuSm57gloE8ctfa
         ec3bbRdDBLxsVnb4kjIfQVBxhRswSIVyhW5ApB0lXsDsJseag/bsqmBiSLNtz/1kS0wH
         U/C9r/9ESMM7XKZ458drBjyjmBNLmkmEh9mQUnHKZWU7QlmmN9sr1mLaB/Z06KHsjN89
         GCww==
X-Forwarded-Encrypted: i=1; AJvYcCV6GarawB1knwGxJGstYuDMv1Zf5C9qSNHyz5KPzLcghVrrT+/lj66fbOCt0CPRYfsmGDzN9rK6U2XUgC4RMog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCCbjegojhEhB960cGIpwgP5SFP3tpktkdV1dYRWPnhMKx53H
	te9KNDI1L3IVy/0H3QtlWbbJEPut8Dr3/UM9izsvTGn/66+aFYMgBRWg71B1ykWRZbatponldZ6
	SMjnweE9XBMsb3DxyGqtsbb8WwZdd2+a2FZKtgg==
X-Google-Smtp-Source: AGHT+IEm/NZLoO0B4BF4b0vFgq+5uRsH3TsYvJLQRrk7Qkb93mKDfqxwigJ4J2wXtENbFFnnkwnUAWOGHOtZzCq2V6I=
X-Received: by 2002:a05:690c:ecb:b0:6e2:ad08:490e with SMTP id
 00721157ae682-6e3477c014bmr38960987b3.5.1728676547975; Fri, 11 Oct 2024
 12:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010205237.1245318-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20241010205237.1245318-1-harshit.m.mogalapalli@oracle.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:55:36 +0200
Message-ID: <CACRpkdYy9JL_tE=N1=4aK7JG82usxGN6eteTxsopTbFsU0Vh_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: fix a double free in ma35_pinctrl_dt_node_to_map_func()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: christophe.jaillet@wanadoo.fr, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:52=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:

> 'new_map' is allocated using devm_* which takes care of freeing the
> allocated data on device removal, call to
>
>         .dt_free_map =3D pinconf_generic_dt_free_map
>
> double frees the map as pinconf_generic_dt_free_map() calls
> pinctrl_utils_free_map().
>
> Fix this by using kcalloc() instead of auto-managed devm_kcalloc().
>
> Cc: stable@vger.kernel.org
> Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij
