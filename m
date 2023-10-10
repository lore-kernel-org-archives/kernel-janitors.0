Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FB7CD68F9
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Oct 2023 07:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442618AbjJJHvm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Oct 2023 03:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442609AbjJJHvk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Oct 2023 03:51:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED534A9
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 00:51:37 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50444e756deso7173473e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924296; x=1697529096; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJcWNo/8KJ51ax88QJfvPgCGs+4edXiaLsPmHPPvA7A=;
        b=rxzLlnzdrOcrTACjsMQJyAj7l6DvY/sEcCTADMfB/lU2ew2mcYnLeLwBad7E6zT2Jp
         PVwP55Wbp6vUac0W65EDo2dmYjbDz19oS26XHOgpSkDblNChOG8vq4943vjhv7sjMxnA
         ELxihkV1YlyV0bDdPx4r3bJPIALJ2GDikshC7iTqLnhUbkkyeZwGsvsnWeeTj/96G2Xm
         vQ26hO0Q558ut4GZs4dkvzqgZvQzTj0Om36p88jEmZzV+rxRzBixAT8N2/nMW4+pw/fL
         4fwiHEhSzcW5cZSeXGeCDC/fUzCzIrvSNo+s54quaHVTsKRNCMjOhaOWsADbBJi3/eSm
         UR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924296; x=1697529096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJcWNo/8KJ51ax88QJfvPgCGs+4edXiaLsPmHPPvA7A=;
        b=DhaFTyUVdmT8YE4gr1l6aq80RPjWYESe1QSK6I01OAHW3vx4gE2exZvt7i653gdjEj
         8u8sacK9bwOI9vQeR/8HwH0yqpLhbgNBNg8o37ZuxSDZdvwEzztHPOIpgFzdJFQkPHPx
         y/VqszV1kuGfE4gGF+ocsGvYs0bkQ3HwmEwVSsBBekqAGmB30wmENFVsJk8uwjryN/vr
         /XMXPPMdkwWxOiHD8TWw4a6wj2iTm3FonY/Pxn5xvT/G+31vdJxJWkTmhuFDi9pxFy47
         7LbBuUM4JsUoz1+JjDdeosX3qZud+VWc2RMcq0MqxBYDeQJi67LDQ8nzIYqRjfrjNuXC
         MPFw==
X-Gm-Message-State: AOJu0Yyx5QJgjpGX3Pv7Dx2iLrhYXwQLYpN41A44zpnR+hkqaZa1qh7E
        Zpuj5kY1RYIujvUV0vLMr2u3Ag==
X-Google-Smtp-Source: AGHT+IHtqLHYfIcwgaVbaqexLs+zoWCH5Qmn/1pLpFUPQWX4ZuHxth1Fvpbhs5GXKf1ycBqkA3XEvg==
X-Received: by 2002:a05:6512:60f:b0:4fe:94a1:da84 with SMTP id b15-20020a056512060f00b004fe94a1da84mr13917473lfe.5.1696924296104;
        Tue, 10 Oct 2023 00:51:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c3b9000b0040684abb623sm15716967wms.24.2023.10.10.00.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:51:35 -0700 (PDT)
Date:   Tue, 10 Oct 2023 10:51:32 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org,
        linux_oss@crudebyte.com, v9fs@lists.linux.dev,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/9p/xattr.c: avoid format-overflow warning
Message-ID: <56aa4f09-8f61-48f3-9836-687bf852b03a@kadam.mountain>
References: <20231008060138.517057-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231008060138.517057-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 08, 2023 at 02:01:39PM +0800, Su Hui wrote:
> with gcc and W=1 option, there's a warning like this:
> 
> In file included from fs/9p/xattr.c:12:
> In function ‘v9fs_xattr_get’,
>     inlined from ‘v9fs_listxattr’ at fs/9p/xattr.c:142:9:
> include/net/9p/9p.h:55:2: error: ‘%s’ directive argument is null
> [-Werror=format-overflow=]
>    55 |  _p9_debug(level, __func__, fmt, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> use "" replace NULL to silence this warning.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/9p/xattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
> index e00cf8109b3f..d995ee080835 100644
> --- a/fs/9p/xattr.c
> +++ b/fs/9p/xattr.c
> @@ -139,7 +139,7 @@ int v9fs_fid_xattr_set(struct p9_fid *fid, const char *name,
>  
>  ssize_t v9fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  {
> -	return v9fs_xattr_get(dentry, NULL, buffer, buffer_size);
> +	return v9fs_xattr_get(dentry, "", buffer, buffer_size);

I'm pretty uncomfortable with this patch...  This code is 13 years old
so it can't be too huge of a problem.  We're doing this for the printks,
but now they're going to look weird first of all.

Old: "file = (null)"
New: "file = "

But also this must have some other effects on runtime right?

regards,
dan carpenter

