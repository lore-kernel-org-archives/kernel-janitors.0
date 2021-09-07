Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D2CC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 00:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 257516109F
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 00:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhIGAJO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Sep 2021 20:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236056AbhIGAJM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Sep 2021 20:09:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A78FC061575
        for <kernel-janitors@vger.kernel.org>; Mon,  6 Sep 2021 17:08:07 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id k17so4738095pls.0
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Sep 2021 17:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XqRu0z2Qhjs0mvuVTfdyLCxvW6UnsTdZLsaV7CaJajk=;
        b=THPVv3KV4fHAZh2jKOoVbmjvS6USvkg8tEoqpY5g9Ay7RDaDs8eVm3CzahyCyXiYCE
         dmioefCdKHamm8A6OzNKzXS5vWjfQQy+xE7Lwv5raZkRzyamp54HMrPnS0STdGg8bbQU
         Ucig9U2TvVdoi/I1y+jmnWbqFS1T4gJh6GDL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XqRu0z2Qhjs0mvuVTfdyLCxvW6UnsTdZLsaV7CaJajk=;
        b=ehZHvHFrSsivdDhJiJnWTRpuxVwO4BUH2dlDfB9jwjEyt4gh0Y5hYEW0e3rO9KXGBk
         sS+PgoxdzMV1VHJrqhEg3KiHwwQIJ8ifIqblG9LMwOi7AuQ0lexuPl7fPL9hvFjs0ErN
         BP9meowaRGQxmwIB7n5fsETo/YjhbOMd3U5PalNtloqmFxkYjgx1et8g6+nGMZtN/tnT
         oNrp/0rOO1VfBp1AZzYbsm4Q1NbNeOnqx5E9y0GnK8Cfi8XIlr/RfwuMkNRKTdM2lws4
         CzK7xX06txmIOBJXXbkQQc6FWPAS/0D1r8W+oItN8V2f5SwWbc1u6ODmEY1KC+vAHyfo
         zBvw==
X-Gm-Message-State: AOAM532nkzLWlWLY6oGROhBsVIGFXH974Xt5a8j880kVM9iNT5fUc8sd
        W0GHl1OH/f43zyQ7OXGMElnhlg==
X-Google-Smtp-Source: ABdhPJygBpZDHO0khjmYw+va4z4BztjolHbfaxw2Uf52dv0IQawbfJU1o5SPyVNemqlLGCKhb1LIcg==
X-Received: by 2002:a17:902:7145:b0:137:2e25:5bf0 with SMTP id u5-20020a170902714500b001372e255bf0mr12564988plm.10.1630973286689;
        Mon, 06 Sep 2021 17:08:06 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4040:44a5:1453:e72c])
        by smtp.gmail.com with ESMTPSA id 141sm11395031pgg.16.2021.09.06.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 17:08:06 -0700 (PDT)
Date:   Tue, 7 Sep 2021 09:08:01 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Namjae Jeon <linkinjeon@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steve French <sfrench@samba.org>,
        Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ksmbd: add missing assignments to ret on
 ndr_read_int64 read calls
Message-ID: <YTatYScZNOYHxruf@google.com>
References: <20210906134438.14250-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906134438.14250-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On (21/09/06 14:44), Colin King wrote:
[..]
> @@ -275,11 +275,11 @@ int ndr_decode_dos_attr(struct ndr *n, struct xattr_dos_attrib *da)
>  		if (ret)
>  			return ret;
>  
> -		ndr_read_int64(n, NULL);
> +		ret = ndr_read_int64(n, NULL);
>  		if (ret)
>  			return ret;
>  
> -		ndr_read_int64(n, NULL);
> +		ret = ndr_read_int64(n, NULL);
>  		if (ret)
>  			return ret;

A pretty nice catch by that static analyzer tool.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
