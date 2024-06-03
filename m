Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195213BC12
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Jun 2024 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717449411; cv=none; b=Ir6A/0VfQ/qf7xQv4J2Wk9nXEppdxBUGaqlCu0N+Ptrv1HNaonFPM6CxJqEQfY2AZ0EuPuX+z6ladDPKHUq7tgEN0efK2cX1lA5IheGdeFe08GFMteq//J6v5YV0a+FD0I5h3DuIihAp4v0Lbm8sFED94vS/xudlFAKg8gDhZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717449411; c=relaxed/simple;
	bh=WITYCM7yB6wt66jzOxe27ujyhdxesh+6c58JyumhZ2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBk4vokSKLmXlhbSjhfsk8c2L7+XHe3T6MHTLISNSSgj1DQPxfG+/25Y9aMzomW6VcThr/QYoEkA7MiMBvsyU4FlLGuWS2C7rVYksDcV2WUpw6TLwHzIr+nIH6jMl2nBjra9YhY+qTga+oLqGXP2FnyQcyPijQRgAi8Mb9CW1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jFb4qDCj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jFb4qDCj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43dfe020675so100331cf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jun 2024 14:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717449409; x=1718054209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od+MxMb6EVINYwkiq6TT0IQbPtRsQ1o3OaovTgRN7ow=;
        b=jFb4qDCjpaBDNoNDkdkalEoQoOf8qQYPbGGMP09GPv/nhf5B2wMBdItEjaFAFC0rGP
         DqX4JVeCU68q1DRbx8ppJ2V2iqjN1gwY5WDjUQlzgPeOh3m/o1U6wTuDcE23qceFO8e3
         dCs4+zl1yQatDV7iBLyRanpfZDYuQBuVUBHBNSTcs3bZ44yQbFX1fFLi/rcrlGp+K3wI
         dtTjhSOYdA4gMQ7mdWwPCZn44MgKX4zZn55QNer9IyYD98giyUnCXConXvOcbc6K/RPX
         RHg5ooQmUWPRPg8EQYK7nYwFfS2o9WDwxmptUCyWnoCb/EGHJmQfsFAa7nPmxR1ZL6La
         IeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717449409; x=1718054209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od+MxMb6EVINYwkiq6TT0IQbPtRsQ1o3OaovTgRN7ow=;
        b=SEi2M56l73RrmE/vdaNtwaCTtM7bC+ga1uMtLBiGq8UDptVIcwzOqrgxdecF0wUFzB
         WDBmtuwjqw1fIq53iEHa8jkl/1pY8WM2U3tMkLGuoA9LA22SPZkz0me/wKUnddwhtfGr
         0ZNEjkk3ynt0PKQpIlcZ3/lSJdjTsbuGPtZk+DzdIK+J6dTTaOOeBU7hua2Erx/vfqL3
         JCBQ04MCdkjZY0975XVunaYyXtT6Ws0B30hTKLp8gRy0YH1X9Hxjs5jNcN13Yy0xn3Qm
         2V20OfgNGbu5Jmz895SJ1KyCLKEEzkXgwJ9gAyZIY3OV9CCvzmvcu161cWeHv2a2tkwU
         Lftg==
X-Forwarded-Encrypted: i=1; AJvYcCWyElg8rdihxSGgEvCgOPvB28URXb6z/fFFUV44s/cbSZREDAr9atzCaH0vDacaQzDO6FfI0NsWy9fsH3vGlYh8crJrIDb5C1dlHao+Pc9w
X-Gm-Message-State: AOJu0YxHLfc1etI4Mw2ajBbd1eaovyF3bFNNC8JXpYJoXGuqfou7povD
	9aGXG1OK4qmpgr/7/ocR9a2Pj2SAZRUnENizUMVLxSN6nqiVzgqlTXj8mYaB7yrkdn2idEhdvBr
	6M3zdidHtz7y5xByDTuSa4kJE1/+uzgFpLyPB
X-Google-Smtp-Source: AGHT+IEcsrAVzzmc+qH6B0IoKLj5w77fSLPOrSp9ofIi4cxw5XYWcbNn/KccMMnZCvtW+zkUiz7rgxELlrt/o7VtdWI=
X-Received: by 2002:a05:622a:2509:b0:43f:f192:c016 with SMTP id
 d75a77b69052e-4401e5f7e3fmr242281cf.5.1717449408638; Mon, 03 Jun 2024
 14:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601-md-lib-kunit-framework-v1-1-f406bb629bde@quicinc.com>
In-Reply-To: <20240601-md-lib-kunit-framework-v1-1-f406bb629bde@quicinc.com>
From: Rae Moar <rmoar@google.com>
Date: Mon, 3 Jun 2024 17:16:36 -0400
Message-ID: <CA+GJov7=tVUJeiLu_6Bqii8XcgDs3+5_4OJn=yCbF3ZR1YVjAw@mail.gmail.com>
Subject: Re: [PATCH] kunit: add missing MODULE_DESCRIPTION() macros to core modules
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 1:19=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc.=
com> wrote:
>
> make allmodconfig && make W=3D1 C=3D1 reports in lib/kunit:
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example=
-test.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Hello!

This looks good to me.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

> ---
>  lib/kunit/kunit-example-test.c | 1 +
>  lib/kunit/kunit-test.c         | 1 +
>  lib/kunit/test.c               | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-tes=
t.c
> index 798924f7cc86..3056d6bc705d 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -374,4 +374,5 @@ static struct kunit_suite example_init_test_suite =3D=
 {
>   */
>  kunit_test_init_section_suites(&example_init_test_suite);
>
> +MODULE_DESCRIPTION("Example KUnit test suite");
>  MODULE_LICENSE("GPL v2");
> diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
> index e3412e0ca399..37e02be1e710 100644
> --- a/lib/kunit/kunit-test.c
> +++ b/lib/kunit/kunit-test.c
> @@ -871,4 +871,5 @@ kunit_test_suites(&kunit_try_catch_test_suite, &kunit=
_resource_test_suite,
>                   &kunit_current_test_suite, &kunit_device_test_suite,
>                   &kunit_fault_test_suite);
>
> +MODULE_DESCRIPTION("KUnit test for core test infrastructure");
>  MODULE_LICENSE("GPL v2");
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index b8514dbb337c..e8b1b52a19ab 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -938,4 +938,5 @@ static void __exit kunit_exit(void)
>  }
>  module_exit(kunit_exit);
>
> +MODULE_DESCRIPTION("Base unit test (KUnit) API");
>  MODULE_LICENSE("GPL v2");
>
> ---
> base-commit: b050496579632f86ee1ef7e7501906db579f3457
> change-id: 20240601-md-lib-kunit-framework-ed2d8b6f5e76
>
