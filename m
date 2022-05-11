Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D633C4332F
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 May 2022 16:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344970AbiEKQqv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 May 2022 12:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344955AbiEKQqs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 May 2022 12:46:48 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E749C48E46
        for <kernel-janitors@vger.kernel.org>; Wed, 11 May 2022 09:46:47 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-ed8a3962f8so3500565fac.4
        for <kernel-janitors@vger.kernel.org>; Wed, 11 May 2022 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mW0tZMhSaetyG4D+/2DPQZ0SVjaxvyIVnvfCsq7/P10=;
        b=nPnln1EM6IFKFYOjU2Gck+lGStnIUKlvR+OkEkTwXYJYcz07fJSnnI+xt33uLCuPjU
         WYGpBMLkYyjsBU3z2pINn/fMt9Lus3bsbv96/BQxSQZ5fEz9YIybVOHYbZPymqslkHDl
         qaxny3KOnp7Xdc6qfEMQoFA9IRvhAgJw/0pfQ4FaknDpE/WpvNd2bbG95usy1JqPMnd8
         2QN+QPOM+sNJTXVp3SJ8TA+hmp7TNBC3G9pA6l3wVWtvwlAC9R+K2psiwceQcQgl6n1e
         RdfFtdYGAPxN1ku4mLWwVq4ZDyj1YmZYKPvy45K7IdKg8yxqikpHsB/FsKFKSbPfLbEL
         hv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mW0tZMhSaetyG4D+/2DPQZ0SVjaxvyIVnvfCsq7/P10=;
        b=ts9ZQzygU7NTokt5pTfzoXgHjvXIMMxk8/ow6R1z8vkK/yc8YYKZLfh4Bjmubc8EuV
         sFaXYvTWxN8qWC2buiaTLgoJXceITZKdOK426rHwh9aHLo4U5BueYasWbYE8DhCSgM+y
         TcznCjL6qWa7G+dNHL1QAF1pAK6ri52K721IEX8StZ3CViN8KLJAtb0vyRPy9ywAxt7b
         EdfYUt1TupgawZ74Z3CLWp8zNMXWVip3rpFax9pvbQam0EHS0o3aZfN1eUYhf07ib9SC
         T3Go+nlkzGAluYgsZfZwjDAMTtVRhxxiVELKfEW8BC87ZHtkwZigilpO6icBn9+FcZxq
         xAnQ==
X-Gm-Message-State: AOAM530/fxFDDVzFfzPXUQoKKRyaFB3DMFb/XBQ3ATyRJ12RfOfhdtIn
        i2dyfVM2YpJTmGWlL5rXt8pmDXbJfXQxH9lNarjiL6KGhrI=
X-Google-Smtp-Source: ABdhPJzRj5A2cmCGUSIH06kXpMBYZbCT3UffjWY0qh676mZulcSqQOqyD4pfEIrkuMiQlQGkTeh5ImDkdVjVVMojL0A=
X-Received: by 2002:a05:6870:9725:b0:f1:1c3a:4a56 with SMTP id
 n37-20020a056870972500b000f11c3a4a56mr1039784oaq.112.1652287607142; Wed, 11
 May 2022 09:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <Ynu4CGiqiU4l2vdf@kili>
In-Reply-To: <Ynu4CGiqiU4l2vdf@kili>
From:   Daeho Jeong <daehojeong@google.com>
Date:   Wed, 11 May 2022 09:46:11 -0700
Message-ID: <CABdZyexoAEhiHF8aGZvfxjmRo7kFN7-ZPapEzd3zmKvUtm7KqA@mail.gmail.com>
Subject: Re: [PATCH] f2fs: fix error code in f2fs_ioc_start_atomic_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Oh, right. Thanks~!


On Wed, May 11, 2022 at 6:20 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Return an error code if f2fs_iget() fails.  Currently it returns
> success.
>
> Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/f2fs/file.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 79d1a20fbda9..cd768fadfd67 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>         pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>         if (IS_ERR(pinode)) {
>                 f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +               ret = PTR_ERR(pinode);
>                 goto out;
>         }
>
> --
> 2.35.1
>
