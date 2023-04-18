Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D92C7EE20
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Apr 2023 12:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbjDRMyI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Apr 2023 08:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbjDRMyA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Apr 2023 08:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D794015603
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Apr 2023 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681822280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+FQ5WvFSlNP/FSMCJFsRwFCN1W/qvxRj1T4AlLX107I=;
        b=i+GCli/ZYmZukfjQ+E/yZlXn7ABKIOQ+/8Mu09Y6CXeJclpIS8hrmltFsNhx98Gos1yspV
        PQ1NC5pzhW06rGEZA2kE3dHzG0EFayUiEvpgGPR7iqThEF2K54z3Zzc8Tx4UDgM9cW7oSb
        hAydF6k4IjyEW6qfYsFPmwG2uZFt3mk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-RjhAtvh7MwmsaGUcxc8n3g-1; Tue, 18 Apr 2023 08:51:19 -0400
X-MC-Unique: RjhAtvh7MwmsaGUcxc8n3g-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1a513f84690so16425225ad.0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Apr 2023 05:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681822278; x=1684414278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FQ5WvFSlNP/FSMCJFsRwFCN1W/qvxRj1T4AlLX107I=;
        b=OhFDoLskeyRUGmPqoC7OkKZDgYyHrJG4Av0xvHllG7qLcgQVR/JP62W4ty2l7R+DVp
         APflzp3BeDUZCzigNfsOenS838FF1hMjC+ntFqJ3w8Lnum+SPIN3DG+JqRvpSH2K/eyg
         j7rjKAEuc9o9sAPCJqAoTAyqpzDxxFnISpJ7DD445vtrtZOR2r9y7NKC/JjywSJxZK0d
         boS9Y9o1U1vVAY0LbtqKVvZmotKW/yUVYC3+6hHIkrnkIycB+SFG8l29caqAurDy00iX
         uyg5NzK5h9M+uCbpGjPhK8UR9ireQkgcTh2EuxJkuIqDhDGhZhhQQALOGfur9nOv1jdO
         4FHg==
X-Gm-Message-State: AAQBX9eXiwsnCjnjwYpM2qlclO2sWtfsuT8AJ/a2PUI/pwgrqfp+jO82
        xTR3v8MQvm63LvsA1DCj7ZOrkQwXFopQRne/OPBtnidmFG/4NLnPGF0Hjfijtn7aOr8f8diS79W
        LJmVvKsTQce2RD3oNn0Ddlu6hxINeDQnps5Ng+GjVxH4Q
X-Received: by 2002:a17:902:e1cd:b0:1a2:1fd0:226c with SMTP id t13-20020a170902e1cd00b001a21fd0226cmr719821pla.8.1681822278320;
        Tue, 18 Apr 2023 05:51:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqokUIE8shBPlXsyt52/Qsmk7T772mS5utILkVKfAaVUVlU/X2DsS4DP4/uPjlAIOFuF+rubUQ3cedwhC1UjM=
X-Received: by 2002:a17:902:e1cd:b0:1a2:1fd0:226c with SMTP id
 t13-20020a170902e1cd00b001a21fd0226cmr719813pla.8.1681822278011; Tue, 18 Apr
 2023 05:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <5800e1f5-8681-e140-fef0-8b2c3b4b6efa@web.de>
In-Reply-To: <5800e1f5-8681-e140-fef0-8b2c3b4b6efa@web.de>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Tue, 18 Apr 2023 14:51:05 +0200
Message-ID: <CAHc6FU4RekTwC9jH-H898PCyufrE59NYqZWy_V3p7R7dOCaTDA@mail.gmail.com>
Subject: Re: [PATCH] gfs2: Move a variable assignment behind a null pointer
 check in inode_go_dump()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, cluster-devel@redhat.com,
        Bob Peterson <rpeterso@redhat.com>, cocci@inria.fr,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Markus,

On Thu, Apr 13, 2023 at 9:23=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> Date: Thu, 13 Apr 2023 20:54:30 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function =E2=80=9Cinode_go_dump=E2=80=9D.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable =E2=80=9Cinode=E2=80=9D behind the null pointer check.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: 27a2660f1ef944724956d92e8a312b6da0936fae ("gfs2: Dump nrpages for =
inodes and their glocks")

Okay, that's a worthwhile cleanup. It doesn't actually fix a bug, so
I'm not going to add a Fixes tag, though.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/gfs2/glops.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index b65950e76be5..6e33c8058059 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -535,12 +535,13 @@ static void inode_go_dump(struct seq_file *seq, str=
uct gfs2_glock *gl,
>                           const char *fs_id_buf)
>  {
>         struct gfs2_inode *ip =3D gl->gl_object;
> -       struct inode *inode =3D &ip->i_inode;
> +       struct inode *inode;
>         unsigned long nrpages;
>
>         if (ip =3D=3D NULL)
>                 return;
>
> +       inode =3D &ip->i_inode;
>         xa_lock_irq(&inode->i_data.i_pages);
>         nrpages =3D inode->i_data.nrpages;
>         xa_unlock_irq(&inode->i_data.i_pages);
> --
> 2.40.0
>

Thanks,
Andreas

