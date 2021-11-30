Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EDEC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Nov 2021 07:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238921AbhK3HDn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 Nov 2021 02:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbhK3HDm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Nov 2021 02:03:42 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E09FC061714
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Nov 2021 23:00:23 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a9so42103795wrr.8
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Nov 2021 23:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XZ/4ENmMvjAflNBR8pNkd02hWS14hM/fkQHUzECaOOE=;
        b=p0jz4q3it97sWyQ/VT4qDAe8G6Q2VNHJRVY+XNaDJ8aLtqPHVcGigU6J8b0ehCMZFG
         owXlHoSZmBMbeVQuihyRlSNOYQ1tZveQJ1VYn3oF3F0RgYhO9jlivMiZxFiMs6tHeQAV
         QY4G/lgRnc+BIAs9TgyhbycV1Z3rs93Q7gDgdUxUO5q5kAT+Q+uwyTVg3i8fA/cgnjH9
         0T9VPF4WnPNTJPmm0AcClulA+3p8NZsGBfM+ii60+OLWbHK6pRROuHqb3CK87bJKxQmZ
         iCgUjtMl9FxhRIIR1mr0Aa7jkaLbao0AQY4mwOScNV5GujMgQwG43jX2UGoisunF7Iwg
         3rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XZ/4ENmMvjAflNBR8pNkd02hWS14hM/fkQHUzECaOOE=;
        b=Vb8wCSvpBfhRGe/qzHVQJXl+6HolbJkjSYT7X9nMouqXEEQ9E9Cj4eiN8UyDBsJa4O
         Wp3Ejg7VUH/NOOv7VURFpH1yEjpbV7CmLh//YadgD7S4AscAFuPmBC/9OypYrqUH4dVq
         YS5pAc5reZvfcvirPmBxfQcfZJFrjty9ShtG8kfIiU7ph9SS9kNjn2Lcp/JAR9rIse0/
         zZXQImXzUSJdKO/beslGq0c/dvTcdneF0QctORAUErS35MB2hZI5PvOLnMwhgK+WP/wd
         Y2StlRAK4bi+qC+NFq/PjA3LBbDsZoo0ZqPROCIwFrl/mxN3gwh321bprpk1YnDHO0CE
         XNhA==
X-Gm-Message-State: AOAM533hFi+2H8xLudRUWRXtFYOJdtukj1CE/BcX88QKiiye0I4wgv9Y
        43ther1uNxAXOIcMn/nrKXPnrjOYgr/D3MvAduwBLA==
X-Google-Smtp-Source: ABdhPJzSdk2Ja7wkKFSkFyFRkizXaY2Vix9tpR/3DZT2SSIyPfyt0mZedPHRz5+eKWufzy05gyv42Ck4Qh8CebAQHwo=
X-Received: by 2002:adf:c146:: with SMTP id w6mr39757303wre.541.1638255622003;
 Mon, 29 Nov 2021 23:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20211124145404.GE13656@kili> <CH0PR12MB5346CA4DBE99A795A1B6CA48CF669@CH0PR12MB5346.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB5346CA4DBE99A795A1B6CA48CF669@CH0PR12MB5346.namprd12.prod.outlook.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 30 Nov 2021 08:00:11 +0100
Message-ID: <CAHUa44FzAgGJHDB39ZWz=g9-RFCetPApYtDoHqpB-bngSHWwvA@mail.gmail.com>
Subject: Re: [PATCH] tee: amdtee: fix an IS_ERR() vs NULL bug
To:     "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>,
        "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Nov 29, 2021 at 9:24 AM Thomas, Rijo-john
<Rijo-john.Thomas@amd.com> wrote:
>
> [Public]
>
> Acked-by: Rijo Thomas <Rijo-john.Thomas@amd.com>
>
> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Wednesday, November 24, 2021 8:24 PM
> To: Jens Wiklander <jens.wiklander@linaro.org>; Thomas, Rijo-john <Rijo-j=
ohn.Thomas@amd.com>
> Cc: Sumit Garg <sumit.garg@linaro.org>; Rangasamy, Devaraj <Devaraj.Ranga=
samy@amd.com>; Herbert Xu <herbert@gondor.apana.org.au>; Gary R Hook <gary.=
hook@amd.com>; op-tee@lists.trustedfirmware.org; linux-kernel@vger.kernel.o=
rg; kernel-janitors@vger.kernel.org
> Subject: [PATCH] tee: amdtee: fix an IS_ERR() vs NULL bug
>
> The __get_free_pages() function does not return error pointers it returns
> NULL so fix this condition to avoid a NULL dereference.
>
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/tee/amdtee/core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> index da6b88e80dc0..297dc62bca29 100644
> --- a/drivers/tee/amdtee/core.c
> +++ b/drivers/tee/amdtee/core.c
> @@ -203,9 +203,8 @@ static int copy_ta_binary(struct tee_context *ctx, vo=
id *ptr, void **ta,
>
>         *ta_size =3D roundup(fw->size, PAGE_SIZE);
>         *ta =3D (void *)__get_free_pages(GFP_KERNEL, get_order(*ta_size))=
;
> -       if (IS_ERR(*ta)) {
> -               pr_err("%s: get_free_pages failed 0x%llx\n", __func__,
> -                      (u64)*ta);
> +       if (!*ta) {
> +               pr_err("%s: get_free_pages failed\n", __func__);
>                 rc =3D -ENOMEM;
>                 goto rel_fw;
>         }

Looks good, I'm picking up this.

Thanks,
Jens
