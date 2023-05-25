Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04499C77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 20:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbjEYUIe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 16:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240928AbjEYUId (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 16:08:33 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BE3BC
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 13:08:28 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-19a5831610dso122891fac.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 13:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685045307; x=1687637307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5bw5FEUQf9zpYJ2CuVxnYu5kgESmPOsJcyv6u9Z4KI=;
        b=b9RPGwzD+6sZyUhZgx5VS9Fs++v/NsvzvmOXZvbQBUyXr3pAubOp/zop/bCDmZ4njZ
         eZnIrbw7j6vRZPPLyqCjISOKra4oY2FOgNF1Ou8Hv2WuRge3Erner1TCOzFyHNKgN8Dj
         XjFJr4XbbpXQFDMX2rlnYEHykTu2RbCt++25GMuJRhjiiS5Xq2bQDYxQ7vtRwo1Wvg9j
         jwcsk74AtPc2ajibQLEBSfsDnr9b5ivzAemgRBPry/irwAbWL1z40vLc4RJmmFWXkPgA
         1GqT6Z4EMv3CHOxV2rdsA/ibPJAYw5dirLekgY/nAFWSn+YwEmvYJNJre1gSTJER0Hne
         DQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045307; x=1687637307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5bw5FEUQf9zpYJ2CuVxnYu5kgESmPOsJcyv6u9Z4KI=;
        b=X+GXX61I0fpqInSS3lFl5ey19Ot3HeQOoK7gy3h2v729O7pIpztZVY95MghQr4FTR8
         WC7xaO5CUw1cSNVC0pn5nl50bYBNyqgRX41ktYc50jhCidk+0Zth2eJuQqcwG1DoRWZA
         GfdcdnEQDgxnEdPM/7QKligbpxHy6Q0qWzwY4SAfPDhVOHYmmv/SULZF3q9+ctHNCA5p
         EyTMwiH6I0bj0GU31coK8YAfbiQ124CEbGr6Nt3d1+iS9LOP3tLq6mmLPxhMTDalibOP
         eUnxyBYAy9bxfwjeVgMl+7yyQN6rXlkfo0HiHE+jymMht3KoMNdnvJ8Z290chFg5Nu0v
         2FNg==
X-Gm-Message-State: AC+VfDwjg1OMkPL8cg6Du63MonnXoKFMOCK55oQsaebbQ1UY8ff2ZcxS
        GAj8YfcodjYC2Apxq5GKbTHaaRgs36ETkLvbsOw=
X-Google-Smtp-Source: ACHHUZ6KgN36WvvpoxW6luV8USGj7stU14tUHlrBarEMrI7gwIem5gyo6OO6qBJ+uFNZLg1aXwUR7ZpqotXD39Ckt74=
X-Received: by 2002:aca:d909:0:b0:398:5b90:710b with SMTP id
 q9-20020acad909000000b003985b90710bmr422149oig.13.1685045307206; Thu, 25 May
 2023 13:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <bd6a37e2-438d-4292-81e8-5a8f0b10d647@kili.mountain>
In-Reply-To: <bd6a37e2-438d-4292-81e8-5a8f0b10d647@kili.mountain>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 25 May 2023 16:08:14 -0400
Message-ID: <CADnq5_PD6wj_c+zXDDkN2HWvb+h9=gXk-06o5-h6dwJLPU1jNA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix up locking etc in amdgpu_debugfs_gprwave_ioctl()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Tom St Denis <tom.stdenis@amd.com>,
        Victor Zhao <Victor.Zhao@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
        kernel-janitors@vger.kernel.org,
        Sebin Sebastian <mailmesebin00@gmail.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
        amd-gfx@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
        Le Ma <le.ma@amd.com>, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Thu, May 25, 2023 at 4:05=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> There are two bugs here.
> 1) Drop the lock if copy_from_user() fails.
> 2) If the copy fails then the correct error code is -EFAULT instead of
>    -EINVAL.
>
> I also broke up the long line and changed "sizeof rd->id" to
> "sizeof(rd->id)".
>
> Fixes: 164fb2940933 ("drm/amd/amdgpu: Update debugfs for XCC support (v3)=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index c657bed350ac..56e89e76ff17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -478,15 +478,16 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct f=
ile *f, char __user *buf, siz
>  static long amdgpu_debugfs_gprwave_ioctl(struct file *f, unsigned int cm=
d, unsigned long data)
>  {
>         struct amdgpu_debugfs_gprwave_data *rd =3D f->private_data;
> -       int r;
> +       int r =3D 0;
>
>         mutex_lock(&rd->lock);
>
>         switch (cmd) {
>         case AMDGPU_DEBUGFS_GPRWAVE_IOC_SET_STATE:
> -               r =3D copy_from_user(&rd->id, (struct amdgpu_debugfs_gprw=
ave_iocdata *)data, sizeof rd->id);
> -               if (r)
> -                       return r ? -EINVAL : 0;
> +               if (copy_from_user(&rd->id,
> +                                  (struct amdgpu_debugfs_gprwave_iocdata=
 *)data,
> +                                  sizeof(rd->id)))
> +                       r =3D -EFAULT;
>                 goto done;
>         default:
>                 r =3D -EINVAL;
> --
> 2.39.2
>
