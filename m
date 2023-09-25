Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEA4CE7A9B
	for <kernel-janitors@archiver.kernel.org>; Mon, 25 Sep 2023 16:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjIYQIi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 25 Sep 2023 12:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbjIYQIh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Sep 2023 12:08:37 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12346DF
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Sep 2023 09:08:31 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-418157e979eso867011cf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Sep 2023 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695658110; x=1696262910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T1sBdR6OeHgqVg4dg484hQ9QDIMGYEZTIFKkUFht1Y=;
        b=nqnMzs4+uEQiQyOaWz6ky7Qc9qtJlOW2rfuBk1DxPZh5bAFn6kaSl+aQXTkc6Ma5RO
         uq0ORfoRzrENYbh248ja6onnhcl1dD/wW0hoNTZx3F2oaSvZR2fcJT19W3ilvaosdhIp
         G0kZ46h9HtN4buXaye9hZab1qLTcQi3bMSC8BYdLPOV0QzjXNrYwTp8U6ln2TcoRIcTo
         v8lVWZExKqlejTQdrKlnNlx7GvAFv328Q+AxJ++pISBnuq3lLSmUvXxWPJwOBwRjwd0t
         Px/Lm+VE+Hi1cAEKn3NxAweBor6u+UC9mzDfYsmcYhuFw76Rla6CYSpeeistgY6OvsgG
         /RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695658110; x=1696262910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T1sBdR6OeHgqVg4dg484hQ9QDIMGYEZTIFKkUFht1Y=;
        b=fHMNqNr5eXycbz28zWTLromDPddiMuNvNfuT2PoVJUeT0UwEBi66iserb/PdbsO9eE
         uqfsBhMKGnEfSNfUfWOSdhriycv4dFBaFWVlJd/DCKB0ohnQVik+40eVthfpu6De+vbv
         /aSMiowuTO+r1ju2zoqH045JrHYxLrOMmVuXhclUWVNgtTSRew5iqw2N701AjWNALL3R
         LdEG99r5DBtCT2QBXPeMJrhX2u7BCEFSoSiPNllvTqunfOGctAugBhbIPoiuhqoRDhl+
         foZmxi/JnqE0yf6wc7QNiKVSQT0vYymHkOKbqkzzVM/p3JlkYI+zS5uYYGWXY70Ya4jy
         8ahQ==
X-Gm-Message-State: AOJu0Yy/fgao6ZfHYMrFlP2U5CfeC1dXtTkTCG8XyKylpR1iLlKB0IOL
        N83XU62GwUw7/9kmGAFNmLI12VReunSO2e/ob483ILwDgwpOq2nH1GLv/g==
X-Google-Smtp-Source: AGHT+IHf7UuFayo3F+VD205zs38dEtCVXb8YrCI5u2r3xxNxGUjqSV7Er5yoE7d0xht7EghGHRkMoXRMAHJAfAq4yu4=
X-Received: by 2002:a05:622a:1aa6:b0:3ef:5f97:258f with SMTP id
 s38-20020a05622a1aa600b003ef5f97258fmr450110qtc.16.1695658109976; Mon, 25 Sep
 2023 09:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230925055037.18089-1-colin.i.king@gmail.com>
In-Reply-To: <20230925055037.18089-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 25 Sep 2023 09:08:18 -0700
Message-ID: <CAP-5=fUht_JQKW8ekDCpHyRbdVe168nmLGrWU21aZDYSyDeMQQ@mail.gmail.com>
Subject: Re: [PATCH][next] perf kwork: Fix spelling mistake "Captuer" -> "Capture"
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

On Sun, Sep 24, 2023 at 10:50=E2=80=AFPM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> There is a spelling mistake in a pr_debug message. Fix it.
> (I didn't see this one in the first spell check scan I ran).
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-kwork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/builtin-kwork.c b/tools/perf/builtin-kwork.c
> index 7e8dd35d764b..f007a9b27065 100644
> --- a/tools/perf/builtin-kwork.c
> +++ b/tools/perf/builtin-kwork.c
> @@ -1866,7 +1866,7 @@ static void sig_handler(int sig)
>          * Simply capture termination signal so that
>          * the program can continue after pause returns
>          */
> -       pr_debug("Captuer signal %d\n", sig);
> +       pr_debug("Capture signal %d\n", sig);
>  }
>
>  static int perf_kwork__report_bpf(struct perf_kwork *kwork)
> --
> 2.39.2
>
