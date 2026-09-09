Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E59305677
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Sep 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928706; cv=pass; b=YBJdL3YK0T68ct1Pb/hHq5XbJBAVMrBpRegPtJ9Jw/EjyhYDYIWWgU0DIRtwUCJcot/83FHYqmfhZvqbWG1xCxLC9jiOErwQX3wZpD/z/5RgXAPAlbZiYve5FdlfOTZYOvwnmYgjZ+89BB3VkLoKWl+yMfV3XlKiwMWbwk0CFBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928706; c=relaxed/simple;
	bh=/+3eKYYz03dUBjHcHqHQIQKyut0iHUO9Sr1nrn4fiWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qORGfZch3ZRYLdGuHVPa93py/KSaBqbgmxMNX9hoKLdupbKHc+slfMMxZmEU7CF0ZyGyUsRHsgijzCneAPKzquQpjloty6YEeV2M+XvMGb708rcJ7zsrLyV/mCEf2eZW7svG64A2d5EUgGXgt9/ehBKPffoqmpkyC0MaKkIeUH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=G+slYNMJ; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="G+slYNMJ"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-857ff9fef54so50561147b3.1
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Sep 2026 21:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788928703; cv=none;
        d=google.com; s=arc-20260327;
        b=a2smL60kAmDf2eBNljKAdSUAJtCDeoAgrVA2xVPTfrARrj1m8IAgw974WWK8qi8Oyf
         k2OML9zIIm6mCuzxv0O21PTL0O3kyK8EV//qMLjnHBtxxwPhJBe9AFCV5BNWglSqoBmW
         pu+XwDHMlYLU8XBaa5X69y0SkZFMMbn3CN8diCZSWCvOHUg1mXZLJUJWEGxtPAR7W46d
         y1jE47TdOvYcsE98iEbty+iNk4e2sDniSD4VpzzrhZmjQ8Zd+1PstFujL5WJsjMtCJ5d
         4x0vGsMY8vu3YIjoEJ3dEsbNpHgumSscIK4mBBbclMTbkOWUjRK+/LlNmXioZXRS0eOd
         eTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        fh=dqsLJgFz8GllUh9UWDdPKstryXYQ46VICGxLvDRvueI=;
        b=komm7m1F/L5b8fEs3G+uOOJW61JEGGsnmNqkVY1zb1ahEVI6qayewos7KodCyfKnIH
         pWORmWxiyVDhTtdEBFd/VXFnPW+ZcfGCIgjxko5t7znVVEyhXFC5iXgV24oHL9F/chjH
         ZMX874hio1lJZw+CNzfi9dD1yYVA8evUTbmQ75FO4a+APnj0ggqqGbFq6dhDePgUwdYx
         k/IfSyzxdKHr+lo31/zELa5LNHvq7TCav+xqnqQbxlz6nlRZjEgm8bGBt/Ok8b8M/qYt
         Z+0WETbDbjeplrQbCDs9GIG1+tlmX2WR973yLYHTA1OKwCkIr492884t0TGfQ/cCFt1X
         PdSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788928703; x=1789533503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        b=G+slYNMJ4NeYNov1rDcn3MJkqULMh4eAK7gcukOQB6HThKx6bB05QZKrqxMyyNZDg6
         qQ7nlvJQp27dtcDujIxhQMxrNeKZLOKfUDGMeyKDpOoKLk+ad9bSIcI6ezlT7yHqihsk
         h0Z9SjcyRDJfbVk7Jgx28PATGsWAs51SmRg95r0crWFucxkJW8J1+uEaU+5sr50mvVGO
         BJnLvXTi9B1YqaxczK7sUZF1nJGRAh8x7jTDRAi4DLB9+sOju+Vx8XMcD7aVlcEZE98h
         u+qKtDkafzy077tmVLUxRqtWLbgCF/FbzhwTCAH6OaWKd9dYs3x7OqEmuwpwC+Df3YPo
         UjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928703; x=1789533503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        b=eSHK5baNv+UyFFjzmFx/JNoAKyvnS5pFm1u/i/u86zBg0lk2B0a0cL5ivQrmQ3nQJD
         j7cId9ZDcJEEYUJGR7N1/el33SO6Ro6D1Vx104b3hM0EnEa3+ATOqmxV0DHBCald9JTq
         RyV3vTulWMDWy1rHOrG0/1QYiqEUJJojy0TadX2qWt/NL/NcaOLQ9KOTWTlgIUplyeHo
         T/BfNIFuBOE04Go4DminKJjIVeCXbCnRpSrsXdGbX/TIpzn7Z6/q9la64qM3Q0pcXupe
         CZQwcIDuFphSeHyuo+IQjLQJXaLyzw75C25P1JPV8IvPFle2QalIE9M/WcKe8ZY3LiP+
         0KUw==
X-Forwarded-Encrypted: i=1; AKwUvBwMfhqwJy5/hGcbeND0snFp6duV9pzEeJXXUUbVKMoHXJuVRQs6ibx0Q8Tl7blvJVNk4F/1vDtq/MOJGx6kwp4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYYgG69kVu50iGJVj8QTy/icYZWbMwcyTjGEiEtsUA0iOs1Ijo
	+6IPr+mqmCy5gag3z+2YKgQY+eHogVP6OdQwL/0JytEBugNBvGPkBdr/aOvv5lcf74ZQDIggOvy
	5e5oIGdLP8emP2ZdXoiQmroF95AdndRFcBL67kDCazw==
X-Gm-Gg: AYBFou1RNTpkyssLgkY8MlqDK7PKAa6ZgAEMWWBSc1209KYevZrsVPMOTgBItiw+SQO
	RwOe1Fj8WqKTt7mYytZKfAQt0d56XCh9RCUiOhnXYORjIz+mXjAJ8EOrce0nGJSATzJWtDB+/pg
	cIC9etIAsKr/i/atgU3YKcV70pTyz/SYCHjeAWUqdoyhybRhkY4w0NZm4AMA0fQXn8XlNvkKoly
	kwgTqGcCIs0ZXuHEvo7c5ds1Bx8tQ/aqeXTF/gEXIEe5yOAGQQVLxyCsSyCjbHp5GIslOrnT+m0
	JDpI+ToI99gl/omSbkATrwxQGdVPrjYUtTfluT8dDse3WmZL3MzUiCo=
X-Received: by 2002:a05:690c:e3e9:b0:870:820e:da66 with SMTP id
 00721157ae682-87127d2ca36mr124113977b3.23.1788928703258; Tue, 08 Sep 2026
 21:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903150351.12725-1-colin.i.king@gmail.com>
In-Reply-To: <20260903150351.12725-1-colin.i.king@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 9 Sep 2026 00:38:11 -0400
X-Gm-Features: AcwNN1WAFyR_AVCv1IXGTjGY0PGid8q5kgFayEO3Y82fm5jIlHk6g71DHjJvDXg
Message-ID: <CABFh=a7YTi2U2-cx4b5zejWv6MXE-VG-u7K410pPbtJiw6qbWQ@mail.gmail.com>
Subject: Re: [PATCH][next] selftests/bpf: test_xsk: Fix spelling mistake
 "conigure" -> "configure"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:05=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in an assert message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/xsk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/xsk.c b/tools/testing=
/selftests/bpf/prog_tests/xsk.c
> index 6e2f63ee2a6c..772f3dd7ce64 100644
> --- a/tools/testing/selftests/bpf/prog_tests/xsk.c
> +++ b/tools/testing/selftests/bpf/prog_tests/xsk.c
> @@ -75,7 +75,7 @@ static void test_xsk(const struct test_spec *test_to_ru=
n, enum test_mode mode)
>         if (!ASSERT_OK_PTR(ifobj_rx, "create ifobj_rx"))
>                 goto delete_tx;
>
> -       if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "conigure ifo=
bj"))
> +       if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "configure if=
obj"))
>                 goto delete_rx;
>
>         ret =3D get_hw_ring_size(ifobj_tx->ifname, &ifobj_tx->ring);
> --
> 2.55.0
>
