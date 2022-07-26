Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D75C00140
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Jul 2022 15:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239359AbiGZPG3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Jul 2022 11:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbiGZPG2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jul 2022 11:06:28 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89386657E
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 08:06:27 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h9so20607442wrm.0
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GLLH6w9D8wsHcfdHvvpiix3mL8VIdF8TFktJ27/NMUY=;
        b=Smm9QaZGjpFwQNWcUlfZoLjKFt08N9MuY4yd/90yMpwd895Gpb3JNDFB8z6u7pJ80z
         JPTBgKAFQQYBNpgL42qQstI1dwE/T/LzEVQ3Ehe3EM3duA5FQCJvEzJjSMKvJVed+8K3
         eBG37HwXJWkvqgcy17y+CwtSe8V0PPJyKQF6cZmtbXfxe/OmsbkYj1a70d352Fwya8KJ
         pCj/yQbYlLs+a2u6sQGGAH83JsbIAhWgUCoZDMVNNJs3oSseo+IFSSFyAjx5OICX7fov
         Am6pQpSKDMKWZcPul1Uktyq4n/ahyITen0FK/27OLxLWqRFsRzzOpmZFLFmmxC4+liZu
         A2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLLH6w9D8wsHcfdHvvpiix3mL8VIdF8TFktJ27/NMUY=;
        b=mkx+gRhu4tXQ3n2GJkayGzvfCxOzSrLtMRu2Wm8kR4noDcasUvosji3xmLV8MzXheC
         EEVMYFRQBOhQm++DOuiNrYCkGyKdn+dB5VIBj1ZosdBf8tBRlC3txYq66T6sOXuWwZEl
         PHeDeKLZuhxszfP6QhASwO7zsj27eU4iuxBg5dOxoBbZNlWgNaxZrvCcuwx4miBGQ9rQ
         x5IWedoaluJ/xjfHfMJPwXiSQnT+2avzn0dr5cTY+SevlOVBvzyEiEPolo5YnK5GNsJh
         wJTAxAnWnJD8Sf+odvc+BcHjBDwIdcAFOqew+ZYkD48zCOx0SDv9pr5rQZR31DvwD7XT
         DS2A==
X-Gm-Message-State: AJIora/KRd1fO9Usp83vslfgJq22y6oLvgMfDDWpvaMEm/+xpeM0ceQ1
        NnLek4pdfwDuqw9XwyO692X0t424mqrNUlT7TnByRg==
X-Google-Smtp-Source: AGRyM1vmrDRnI3xdenHDvM2KzQr+JHjWzLzR2MnzKSq9cS5fts5wIL9cxMvQpMDK6xWREDr3Bo585Ho+vvLFpvOyFpk=
X-Received: by 2002:adf:f705:0:b0:21e:a2f6:2fbd with SMTP id
 r5-20020adff705000000b0021ea2f62fbdmr2496376wrp.375.1658847985740; Tue, 26
 Jul 2022 08:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220721124528.20997-1-colin.i.king@gmail.com>
In-Reply-To: <20220721124528.20997-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Tue, 26 Jul 2022 08:06:12 -0700
Message-ID: <CAP-5=fWkw7a_EQj8ZZEjJTS-Fi+27_mLcCziJUZw_GAjBMEc=g@mail.gmail.com>
Subject: Re: [PATCH][next] perf inject: Fix spelling mistake "theads" -> "threads"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 21, 2022 at 5:46 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a pr_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-inject.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
> index fd4547bb75f7..2a0f992ca0be 100644
> --- a/tools/perf/builtin-inject.c
> +++ b/tools/perf/builtin-inject.c
> @@ -1501,7 +1501,7 @@ static int host__finished_init(struct perf_session *session, union perf_event *e
>                 return ret;
>
>         if (!gs->vcpu_cnt) {
> -               pr_err("No VCPU theads found for pid %u\n", gs->machine_pid);
> +               pr_err("No VCPU threads found for pid %u\n", gs->machine_pid);
>                 return -EINVAL;
>         }
>
> --
> 2.35.3
>
