Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4089AEB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Jun 2023 16:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbjF3QrZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbjF3QrT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jun 2023 12:47:19 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829433C3D
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 09:47:13 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc244d3a8so15953455e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jun 2023 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688143632; x=1690735632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ios+3Nn79ERYy2I7//nEhHECme0jYurZDZTN9X/IgI=;
        b=gQv4gOw7Ae68lyrnQ4PXrVdIpdeLjtYIZk++7hoagMPVPjvVWewEc5UueEfrCzWxT0
         ntD3oQ96tYOAlzUZNPg1jA/Hw9QlKAbYQVXeQZyqEIUsq7lvzaFh01t8feRqbalXrDd8
         e9O0HYTDyjb7mpaPwtQ/zoWpKjwEWLo86+RvHxFvc/qDSxIu0qwZukO80Xyrh9pLVOcq
         gBoITt7fZE4gIphTs3h+slP3n9ZFAMZ3Ppl4+bo/N8sBi2kUZEwxHYMwaTTBDNXGpA+6
         btL/IHdRDk14jOkzYjVNMYGz5nx0F2veO9PJttH85yU6ufn0o6NqHi8UT2ZOCDPE9waH
         uggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688143632; x=1690735632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ios+3Nn79ERYy2I7//nEhHECme0jYurZDZTN9X/IgI=;
        b=MmgzXqIpbjVfVdBK5nFFxvL5O5XE4v+qVPYKOoYEaTLfKijlUXca3bOefmXEi3PlRS
         wK11rM4flrLmFYdzzcXbElCzhHPeNYmGlPoaN0k8VE9O8D+qTs51hJ1xwcTgQuyj/hB7
         48ThfvTA0NylRXMmBBMEQm4RFMQyc+2+CXi/BiLoM9h0+a2nAg0u+lZByJ75NEI2Qlql
         F9EnRr5ygPaPDBTsdwwFwpSs9Nljce1j0VWFwt8v5VyrOFHQqc0Tf+7YYTAyRezuMn5w
         XJfTx7jOtGYqXZyHjDECiMir6MlIXy3blLwlf/O7tuf0azWHNrXOjt+cueVCHFk+o3Fn
         i/eA==
X-Gm-Message-State: AC+VfDyAVDjIetA0GYYwTlgkaYP4+T9SH3cH25Tgiun1v2aePQJBEQlL
        wvHoYLum0yKqjsak/OCf+kOIg2NoXDEbZa34Zr4=
X-Google-Smtp-Source: ACHHUZ44cxgHBTt/POPvUadcU+quLT7JDtwap+73QAhVNPgots+m3nQvBczssExJUzeeuTozZSnqgA==
X-Received: by 2002:a7b:c5d7:0:b0:3f8:2777:15e with SMTP id n23-20020a7bc5d7000000b003f82777015emr2465477wmk.31.1688143631924;
        Fri, 30 Jun 2023 09:47:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c214400b003fa95890484sm14900345wml.20.2023.06.30.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:47:10 -0700 (PDT)
Date:   Fri, 30 Jun 2023 19:47:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ext2: remove redundant assignment to variable desc
Message-ID: <b12f7d11-4bfe-4e53-9a32-ce8db056d561@kadam.mountain>
References: <20230630163033.165326-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630163033.165326-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 30, 2023 at 05:30:33PM +0100, Colin Ian King wrote:
> Variable desc is being assigned a value that is never read, the exit
> via label found immeditely returns with no access to desc. The
> assignment is redundant and can be removed. Cleans up clang scan
> muild warning:
> 
> fs/ext2/ialloc.c:297:4: warning: Value stored to 'desc' is never
> read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/ext2/ialloc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
> index a4e1d7a9c544..f50beb77d6ba 100644
> --- a/fs/ext2/ialloc.c
> +++ b/fs/ext2/ialloc.c
> @@ -294,7 +294,6 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent)
>  			best_desc = desc;
>  		}
>  		if (best_group >= 0) {
> -			desc = best_desc;

You should get rid of the "best_desc" variable as well.

regards,
dan carpenter

