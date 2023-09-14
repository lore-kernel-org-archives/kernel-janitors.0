Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38576EDE9A9
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Sep 2023 11:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbjINLvG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Sep 2023 07:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjINLvF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 07:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99D659B
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 04:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694692214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zqlm9iMBtNS1PjmHaJ9GqgopJ/ckxwBCFE8E9Iz3HQc=;
        b=UzkOzrOn21xhBD2p3oupSSRL5OGa0Xt6MZmbDJMNSpJI50tso+1GZ4si5CZMgx0JMtNMAH
        uVzVwnjbhMowBBgncjaxh+4d73gGy/1Nk01G5XnMafxhz2OZnm2QhdMBvEI343SZtRub/x
        3AR+vqbEWsA5TrFcAxC+x1yblclx3Z8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-GWs5hNsuOa6hg8r-4qZT_Q-1; Thu, 14 Sep 2023 07:50:13 -0400
X-MC-Unique: GWs5hNsuOa6hg8r-4qZT_Q-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4135f2b4d3fso8913491cf.3
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 04:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694692213; x=1695297013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqlm9iMBtNS1PjmHaJ9GqgopJ/ckxwBCFE8E9Iz3HQc=;
        b=aJYdnNP06xiEVpekQBOxdmjBUH3K+mk1kmkNUpxBEalluGBfR+WVWDU13ixEJcZBbQ
         1TI4DG/EtwJys295pT7VNiwv+V7czHV2mzsZzlRr10SsZ7eVWG5lWQ7l/U6lLPtLIOAt
         0QBx257BVyOQ0s3qOqV+7NFa2uUFrgxCxEfv7ylcBOscpPcL/EzZ0BHm+z3i+HkjdY3Q
         eLkaWX1tEboWpUkcDv/tzP02Rit8voButSRDML358Id5fLzoHJSDmU9zAeX6e9jejq63
         UQltFA6SHULyys5GghRZt0UlEwIA0KII7rtJhWq9fx/OxTP2X5kAcsYwUtL4OWvrvK7O
         HGNg==
X-Gm-Message-State: AOJu0YwD4Qy3dyCWZwgLKB3kRjOgGFuvuePLLC2RTO0hK63p9LqW+sKH
        Q7zfzyFCQ4NNrdwTxQGPY+ZcEfr911vwn7a8EURtQfRkVihM9J0v5IVFAVXpc4LCYpagjONlnpX
        TRktAQftvLeAoTMaVesPFQnpBe0L2
X-Received: by 2002:a05:622a:1206:b0:400:a2b8:1c97 with SMTP id y6-20020a05622a120600b00400a2b81c97mr6208633qtx.17.1694692213109;
        Thu, 14 Sep 2023 04:50:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIST+VWymPtjcyLzlckChTxGcmftCDlv+gr6HzDznFoMA4RzAxmotmJGW3yMqVA+frqaykSw==
X-Received: by 2002:a05:622a:1206:b0:400:a2b8:1c97 with SMTP id y6-20020a05622a120600b00400a2b81c97mr6208618qtx.17.1694692212804;
        Thu, 14 Sep 2023 04:50:12 -0700 (PDT)
Received: from bfoster (c-24-60-61-41.hsd1.ma.comcast.net. [24.60.61.41])
        by smtp.gmail.com with ESMTPSA id h5-20020ac87765000000b0041514d1da65sm400675qtu.20.2023.09.14.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:50:12 -0700 (PDT)
Date:   Thu, 14 Sep 2023 07:50:25 -0400
From:   Brian Foster <bfoster@redhat.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bcachefs: fix error checking in bch2_fs_alloc()
Message-ID: <ZQLzgaYY0pWX7y07@bfoster>
References: <a0032f97-333a-41ec-97b0-62f0b6135d54@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0032f97-333a-41ec-97b0-62f0b6135d54@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 14, 2023 at 12:47:44PM +0300, Dan Carpenter wrote:
> There is a typo here where it uses ";" instead of "?:".  The result is
> that bch2_fs_fs_io_direct_init() is called unconditionally and the errors
> from it are not checked.
> 
> Fixes: 0060c68159fc ("bcachefs: Split up fs-io.[ch]")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Brian Foster <bfoster@redhat.com>

>  fs/bcachefs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/super.c b/fs/bcachefs/super.c
> index 29cd71445a94..4831010c0dfd 100644
> --- a/fs/bcachefs/super.c
> +++ b/fs/bcachefs/super.c
> @@ -856,7 +856,7 @@ static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts opts)
>  	    bch2_fs_compress_init(c) ?:
>  	    bch2_fs_ec_init(c) ?:
>  	    bch2_fs_fsio_init(c) ?:
> -	    bch2_fs_fs_io_buffered_init(c);
> +	    bch2_fs_fs_io_buffered_init(c) ?:
>  	    bch2_fs_fs_io_direct_init(c);
>  	if (ret)
>  		goto err;
> -- 
> 2.39.2
> 

