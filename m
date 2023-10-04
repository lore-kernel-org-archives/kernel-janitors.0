Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9366FE8FDBF
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 01:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbjJDBHS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Oct 2023 21:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjJDBHR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Oct 2023 21:07:17 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791FDB4
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Oct 2023 18:07:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50302e8fca8so2680e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Oct 2023 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696381632; x=1696986432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUHUZ6x4ov8yu95Mp1viV4yiZ0CaN+a8BIQnvZlj5oA=;
        b=ogBFDS8yYmbDw5yd6K1bzA3Op/+Oj9cEo6xPjDWZfZbZ9+wqhmpkoxG3jFtX1nmaKL
         myRfwEL2UpyUV63iCJEUymxQ7d75ovLPzJWcJlDAcEmcI2O12uKE1BmFSRGRjIew30fV
         5VdkC+ZDoj+FL0DtlEeS6tUarGbRrUWQcvnhUZg+k4dj8apTuPbl4XD8FFFyum2eYQty
         0K2HaLh4qbonp79DXv5SU5C657yTFn5K863APwUd8kd2qQ9eRmOCO23B5zOpcdre19gz
         S5SNV3KNyy7gLpMeE6Smw0t/xdz8C6jdUrF4Px7mkz1Q8efo3N84Qq9PY2XpCDPOrH1d
         r/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696381632; x=1696986432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUHUZ6x4ov8yu95Mp1viV4yiZ0CaN+a8BIQnvZlj5oA=;
        b=OHI94z0AiTBkwRLH5arG6cm/PhoYiU69WMWK8emw1owf6aWgs3QPtUXYFR25LwnaK0
         Vj7IiCMtQLiMZbmywwF5aN2+IEDKe0mOEp8wLvW/jtNSl2Ljg/2peIXUWO6Tl0ibxpQl
         7aUUuYv1DRcgxrqZaIvYt1bdNZp+4eWRis1YcPZOOCk+iiAV5Trpr7SvSqX+q4z6lzaw
         a6Yozci53FKXeQgI2PCCe8nvVrfcEne8l1dJZ02Cn18VKmUj0CFB3zWfmoUtGCQkj30E
         CM4vJj2PjQS1Evwoiwgeo1xF0Vbl8A6ka5Se3HwYGrx23LDocXOTdVXjeTAMgbsdt4BH
         Snfg==
X-Gm-Message-State: AOJu0YxG0X8zMzUPBRjDQ25kXmGI2vaQRUMDmrnpEZ7q1rHheGRcLqAF
        Q06JfMe0u061WOl4gvN6IJwntmvTJZ4GbCKCgzT+1A==
X-Google-Smtp-Source: AGHT+IEz/zu54LHG+PiNV8mvDcrbp/5O/EekAy8i4ZVup9/Gt4C8BlrCXvFTtbh5YT8+gU03K84mWnZxMvOHq3HRoX8=
X-Received: by 2002:ac2:4e6f:0:b0:505:715f:d36b with SMTP id
 y15-20020ac24e6f000000b00505715fd36bmr12175lfs.5.1696381631494; Tue, 03 Oct
 2023 18:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231003074911.220216-1-colin.i.king@gmail.com>
In-Reply-To: <20231003074911.220216-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Tue, 3 Oct 2023 18:07:00 -0700
Message-ID: <CAP-5=fXO6+Cgvo4BmC9fgL70FY+ciPjRVR5qghxYBR3VSB7WNQ@mail.gmail.com>
Subject: Re: [PATCH][next] perf: fix spelling mistake "parametrized" -> "parameterized"
To:     Colin Ian King <colin.i.king@gmail.com>,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, linux-perf-users@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 3, 2023 at 12:49=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are spelling mistakes in comments and a pr_debug message. Fix them.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

+ Athira Rajeev

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/parse-events.c        | 4 ++--
>  tools/perf/tests/shell/stat_all_pmu.sh | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-eve=
nts.c
> index f78be21a5999..e52f45c7c3d1 100644
> --- a/tools/perf/tests/parse-events.c
> +++ b/tools/perf/tests/parse-events.c
> @@ -2549,7 +2549,7 @@ static int test__pmu_events(struct test_suite *test=
 __maybe_unused, int subtest
>                         if (strchr(ent->d_name, '.'))
>                                 continue;
>
> -                       /* exclude parametrized ones (name contains '?') =
*/
> +                       /* exclude parameterized ones (name contains '?')=
 */
>                         n =3D snprintf(pmu_event, sizeof(pmu_event), "%s%=
s", path, ent->d_name);
>                         if (n >=3D PATH_MAX) {
>                                 pr_err("pmu event name crossed PATH_MAX(%=
d) size\n", PATH_MAX);
> @@ -2578,7 +2578,7 @@ static int test__pmu_events(struct test_suite *test=
 __maybe_unused, int subtest
>                         fclose(file);
>
>                         if (is_event_parameterized =3D=3D 1) {
> -                               pr_debug("skipping parametrized PMU event=
: %s which contains ?\n", pmu_event);
> +                               pr_debug("skipping parameterized PMU even=
t: %s which contains ?\n", pmu_event);
>                                 continue;
>                         }
>
> diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/sh=
ell/stat_all_pmu.sh
> index c77955419173..d2a3506e0d19 100755
> --- a/tools/perf/tests/shell/stat_all_pmu.sh
> +++ b/tools/perf/tests/shell/stat_all_pmu.sh
> @@ -4,7 +4,7 @@
>
>  set -e
>
> -# Test all PMU events; however exclude parametrized ones (name contains =
'?')
> +# Test all PMU events; however exclude parameterized ones (name contains=
 '?')
>  for p in $(perf list --raw-dump pmu | sed 's/[[:graph:]]\+?[[:graph:]]\+=
[[:space:]]//g'); do
>    echo "Testing $p"
>    result=3D$(perf stat -e "$p" true 2>&1)
> --
> 2.39.2
>
