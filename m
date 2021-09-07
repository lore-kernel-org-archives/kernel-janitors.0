Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D02C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 08:02:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4C696108E
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 08:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241896AbhIGIDQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 04:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241848AbhIGIC2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 04:02:28 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0279CC061575
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 01:01:17 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id j16so7530874pfc.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7IDhp7jfxW98v1H50axBekjDR8YpqP2dPr8s2ARoy/A=;
        b=N7Jw8DWL0CZZrN1sOPtEOeXIy7FS3/PxTfgdw0fZ5ebxYZHDgYHhFB9eZBjhnzRQ2y
         pqPd6vt+M/ksb7aCjk/QhECBz9fnt/ogGaXXnXFMWYp3l/8IlymIeZLqMRQqO9Gf2Wvy
         Peoey6R5r5VqKYtjaMqGjxxwi5d6aa7EHlqVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7IDhp7jfxW98v1H50axBekjDR8YpqP2dPr8s2ARoy/A=;
        b=I1RSf1mJkMGzNxBvSPK12Tue5TGxXZ3bwNSeXULUMzFb5rubtbezo7rA9g+OjOB0Gd
         HUPM+r/t8/JZDiIEaQYAkpyqI8TFhz1AsTkgGwsrcLueDD398Hi6UlCWhuzeuQPe0f09
         eeM9q7QnE0auUY1flkFztanUoWzdbAAw9mLDspcveDtAoO5BUsp8YPfKbt85YehoB3/5
         0MQSQN0fNN/8hZY1lLMFFnBKimaAHGwZrxIQQ2vYQ0QCuoJL0fn8Mnkt2FZtmQ8nK/uQ
         pL+YkrOABnPTMdqycoc6QtLEBykSbCSS/4qfs9fh9g6QqAcSzIZQV5kNiqHt0BWsMqCw
         Xf3g==
X-Gm-Message-State: AOAM531kM98ssxDrCy/f0kupX539FSeBFBeUlLBIRsaMUy9R5t0TXMFK
        vZ+NxcBhMww0s74qeEZy6i3MJA==
X-Google-Smtp-Source: ABdhPJwNmtitZ76t5J7Bc3PuBxmEJFilWNhnXqLgWp2Habp3cbZT6H+xNf4tuVKwFkBDgjEPjWvVYw==
X-Received: by 2002:a65:400c:: with SMTP id f12mr15651190pgp.296.1631001676517;
        Tue, 07 Sep 2021 01:01:16 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4040:44a5:1453:e72c])
        by smtp.gmail.com with ESMTPSA id c4sm8137319pga.4.2021.09.07.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:01:15 -0700 (PDT)
Date:   Tue, 7 Sep 2021 17:01:11 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Namjae Jeon <linkinjeon@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steve French <sfrench@samba.org>,
        Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ksmbd: potential uninitialized error code in
 set_file_basic_info()
Message-ID: <YTccRzi/j+7t2eB9@google.com>
References: <20210907073340.GC18254@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907073340.GC18254@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On (21/09/07 10:33), Dan Carpenter wrote:
> 
> Smatch complains that there are some paths where "rc" is not set.
> 
> Fixes: eb5784f0c6ef ("ksmbd: ensure error is surfaced in set_file_basic_info()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/ksmbd/smb2pdu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ksmbd/smb2pdu.c b/fs/ksmbd/smb2pdu.c
> index a350e1cef7f4..c86164dc70bb 100644
> --- a/fs/ksmbd/smb2pdu.c
> +++ b/fs/ksmbd/smb2pdu.c
> @@ -5444,7 +5444,7 @@ static int set_file_basic_info(struct ksmbd_file *fp, char *buf,
>  	struct file *filp;
>  	struct inode *inode;
>  	struct user_namespace *user_ns;
> -	int rc;
> +	int rc = 0;
>  
>  	if (!(fp->daccess & FILE_WRITE_ATTRIBUTES_LE))
>  		return -EACCES;

It sort of feels like that `rc' is not needed there at all. It's being used in

               rc = ksmbd_vfs_set_dos_attrib_xattr(user_ns,
                                                   filp->f_path.dentry, &da);
               if (rc)
                      ksmbd_debug(SMB,
                                 "failed to restore file attribute in EA\n");

and in

               rc = setattr_prepare(user_ns, dentry, &attrs);
               if (rc)
                        return -EINVAL;

Either it should be used more, and probably be a return value, or we can
just remove it.
