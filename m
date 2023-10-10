Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3530CD68F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Oct 2023 06:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442336AbjJJGyu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Oct 2023 02:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442333AbjJJGyt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Oct 2023 02:54:49 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3909E
        for <kernel-janitors@vger.kernel.org>; Mon,  9 Oct 2023 23:54:47 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32799639a2aso5202332f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Oct 2023 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696920885; x=1697525685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4x0xIZwr3jhrzVpmAQCKGmfXuwKxBT7JmHqjTV/OFI=;
        b=rbH4BosXd7slFXULTyz0wJe1cKkfCg6Qkij3XYyAKFOVz2TULrcTiEVc003zjG6AU2
         vN5ympq6/fU4WL7uncrPvafJzQnJ4+ZzuyJx2c8Ta4rezwjBtlr2ECL2H+WwUI/ViCxY
         7cZTCKbK63RgWRuxxTHCYahITSoV5e3Eh+BNVWPxNGM042mjmAxYF28DTY6nn7PdKNDF
         8IPziPxpYEvVb3xW75Oh/Gk3/0IyXB4DlNqZ0NqPHfzxJpB6Yu4FrtgWsWLaI6XM2LYM
         tvo1pZrxI7e8k0IEr8GUq/8Hi3i2CY4eW5I8tnyviRk3SkP/vrvi6JoSh1WGDaDagtGc
         QVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696920885; x=1697525685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4x0xIZwr3jhrzVpmAQCKGmfXuwKxBT7JmHqjTV/OFI=;
        b=tg/WS2xBbc+GLebPRIVda7nCHsCsFMTT+3mxuYuQDiUvoRPTPMkrFKshseTB/rDgzc
         C6cgE5Jyjl/nm4ZIld5VxJ0aP+EssdcrhJP0Hvl08SfWHgL2X4fMYkMt+h4pzY9hD0Od
         pTWh31/Ds0CPkSTiyO6G4jSjFWcWt0O4L8jOIXVF4INQ1OlYDj5RBX/SFnWbIwzABbYA
         LuL2KDfAKgxtD7I10PmTjgAt25cDN3lsci5hzgtqOiEx3S1+qjrd6o9/INgNngO9P/ge
         A8u0RuoEpnhN6+2KC+a36owwj5GNBpSRA5J06LG1tMnld/gKqnhoFTksTfCYtocmHEF5
         5Edw==
X-Gm-Message-State: AOJu0YxaoK8A9NHppX5A7bShWjsReFFgfBJwDzLDsyBria+drcn2bAEB
        8z5il0Nxj1QxBa9ufpc3b4YPCQ==
X-Google-Smtp-Source: AGHT+IGN2DnOlVWZoJPWJxqrfU8w1f6HxOrf+8zqn6ByS4itubT3HOboZVsS/ErAU9A8dh9u8f4UAQ==
X-Received: by 2002:a5d:40c6:0:b0:31f:dcbb:f81c with SMTP id b6-20020a5d40c6000000b0031fdcbbf81cmr13980686wrq.10.1696920885410;
        Mon, 09 Oct 2023 23:54:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e14-20020adffd0e000000b00315af025098sm11795758wrr.46.2023.10.09.23.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 23:54:45 -0700 (PDT)
Date:   Tue, 10 Oct 2023 09:54:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Xiubo Li <xiubli@redhat.com>
Cc:     Luis Henriques <lhenriques@suse.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ceph: fix type promotion bug on 32bit systems
Message-ID: <6381caf2-f5e1-4279-bf62-a87bc8c5f023@kadam.mountain>
References: <5e0418d3-a31b-4231-80bf-99adca6bcbe5@moroto.mountain>
 <a86080f4-3a40-8ae2-9bc5-9859298b7cbb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a86080f4-3a40-8ae2-9bc5-9859298b7cbb@redhat.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 08, 2023 at 08:21:45AM +0800, Xiubo Li wrote:
> 
> On 10/7/23 16:52, Dan Carpenter wrote:
> > In this code "ret" is type long and "src_objlen" is unsigned int.  The
> > problem is that on 32bit systems, when we do the comparison signed longs
> > are type promoted to unsigned int.  So negative error codes from
> > do_splice_direct() are treated as success instead of failure.
> > 
> > Fixes: 1b0c3b9f91f0 ("ceph: re-org copy_file_range and fix some error paths")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > 32bit is so weird and ancient.  It's strange to think that unsigned int
> > has more positive bits than signed long.
> > 
> >   fs/ceph/file.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> > index b1da02f5dbe3..b5f8038065d7 100644
> > --- a/fs/ceph/file.c
> > +++ b/fs/ceph/file.c
> > @@ -2969,7 +2969,7 @@ static ssize_t __ceph_copy_file_range(struct file *src_file, loff_t src_off,
> >   		ret = do_splice_direct(src_file, &src_off, dst_file,
> >   				       &dst_off, src_objlen, flags);
> >   		/* Abort on short copies or on error */
> > -		if (ret < src_objlen) {
> > +		if (ret < (long)src_objlen) {
> >   			dout("Failed partial copy (%zd)\n", ret);
> >   			goto out;
> >   		}
> 
> Good catch and makes sense to me.
> 

Thanks.

> I also ran a test in 64bit system, the output is the same too:
> 
> int x = -1
> unsigned int y = 2
> x > y

Here none of the types are int.  It's long and unsigned int.  So how
type promotion works (normally, there are also weird exceptions like ?:
and <<) is when you have two variables then you by default at least type
promote both sides to int.  But if one side is larger than int, then you
type promote it to which ever has more positive bits.

regards,
dan carpenter

