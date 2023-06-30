Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB46C001B0
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Jun 2023 15:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbjF3PTa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Jun 2023 11:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjF3PTE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jun 2023 11:19:04 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CAC3C1E
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 08:19:02 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-401f4408955so251181cf.1
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688138341; x=1690730341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7y85+CsbEknGYolZq9ltwi/sLY28N+60rkHxxiN/96I=;
        b=aqlpp13fau6b/AMECgbtGX07mxMGSbx3NyWZWBzftVHNCu3uE+q78Vtq39Xt4+8IZx
         MY60D4oQIZPyEVwjOQPEVaJafMR80yvvUf6UiETAdxuBuqpUkqPHBkVDP3csWAj/nbri
         nwNxjXQl+VNWTqnkjebhwCJFPEQyWD0VTt6b1myZeq8g2FD1p4JjY+5Bt4tfS8XSRo6E
         ycBIFdW6u3BH5D3z/DXNEbhJ8zCDFr+0+SfmyS4xuIdmFLN6WB4v/GgrHsKkR2+S9KAi
         8LbeX1AT3eNYq1uyb1ix+EunI7NpPUUNaU5r5hr+QIKw52FHwnkuw0ELBgiqqAFvpIxg
         rWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688138341; x=1690730341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7y85+CsbEknGYolZq9ltwi/sLY28N+60rkHxxiN/96I=;
        b=S3Ys07+WQ58bD/pf8dopmnBC3/odMLbkY3DgfiUqs83Bhjshiq4WT1rpdUvptet9XK
         6rdLk1rHTWHCfXd94mbFWYPNUoKbKCH0WDef4wgbIapH6OY6SYkA4JUPnSCcHJnaALdE
         HB+a4x6VPGw3o9FWmXHEPPuuud0N5X3XQQbLG9fiAtPoC+rGL0zhRFK72ilBYX+HHPeE
         yrxw0z9hcI1E0v38AjJ1ACGAiVc7xb2uip3v7WhQhKq5qcPCv1N6gQ67djW6/1Y0wqgT
         TfRf8dHgGT1mq4wT/4Rbv0GvuTpULr84dTDimo46xVq0EG5q3usWQi//qveytBtC1nKN
         iBGA==
X-Gm-Message-State: AC+VfDw4C0sHwb6clQ1ijlvG+EmU2cP4xvDLxgMgYqrhW3tw86ehW299
        dNbr1sVm/qXYXJgWpEvOh6LWi/QA7WZcB8ZW0PaiCw==
X-Google-Smtp-Source: ACHHUZ7GoyWKFwgMIOb5nMpnMqBXPwzzWjgKhNo/zhlInr9v0vOCULYLICY2l91NepNXZAFa4macgqfs35shWJDihQ8=
X-Received: by 2002:a05:622a:110f:b0:3ef:302c:319e with SMTP id
 e15-20020a05622a110f00b003ef302c319emr832038qty.8.1688138340945; Fri, 30 Jun
 2023 08:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230630080029.15614-1-colin.i.king@gmail.com>
In-Reply-To: <20230630080029.15614-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Fri, 30 Jun 2023 08:18:49 -0700
Message-ID: <CAP-5=fUX_ktsmrrVGr9kwa3-C_4=yobTFgm5L+TpFNt8UZMZGg@mail.gmail.com>
Subject: Re: [PATCH][next] perf/benchmark: Fix spelling mistake "synchronious"
 -> "synchronous"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2023 at 1:00=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in an option description. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/bench/sched-seccomp-notify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/bench/sched-seccomp-notify.c b/tools/perf/bench/s=
ched-seccomp-notify.c
> index eac4ef60090f..2e8205c61141 100644
> --- a/tools/perf/bench/sched-seccomp-notify.c
> +++ b/tools/perf/bench/sched-seccomp-notify.c
> @@ -33,7 +33,7 @@ static bool sync_mode;
>  static const struct option options[] =3D {
>         OPT_U64('l', "loop",    &loops,         "Specify number of loops"=
),
>         OPT_BOOLEAN('s', "sync-mode", &sync_mode,
> -                   "Enable the synchronious mode for seccomp notificatio=
ns"),
> +                   "Enable the synchronous mode for seccomp notification=
s"),
>         OPT_END()
>  };
>
> --
> 2.39.2
>
