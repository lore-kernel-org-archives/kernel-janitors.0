Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195ECC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3C89610E9
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243373AbhIGJF3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 05:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245484AbhIGJFP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 05:05:15 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFE9C0613C1
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 02:04:09 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x19so7645352pfu.4
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JT40h1sqFKOXqQynjb32P0gwjUjlNSTVOulfaGgY9SY=;
        b=e+/yuG0NefU01Sn/0N6reRSzg64hFOX0e2EOZgQwHA/fJX9drVd8IEnz0/6hZ6TSUY
         iyZgb5WGpFSrKlJdxUwLChOZgef4Er8kh7A8HlrsCud6emMcaZZZAZC0BaV6489eCW73
         BtnctBXpzDC8Y186iUxsEuvAt03Sq+R8Xa/YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JT40h1sqFKOXqQynjb32P0gwjUjlNSTVOulfaGgY9SY=;
        b=Eu3mx2ZolG4Qs4GKrqK22vsIgDRw4T4Kkw1Y9O5ZdU3OgQVdfnt+Gf21ZNk2XIml1p
         m0FjMqlA3LwdFbsxfaYPChAG/tjXHwGD9cIl9tp9Ti1Q7L1grJVYgoUWYpOE89DaLwVP
         vwNIBQ8QiIbMkzg3kmDA36znGs6+7u0f6R63AY0IpdGREdXWA8dOzpmdP2j7LXOyGanA
         /cvC8H2j0EDndk1931wUzMC26XhlfC2Iw6ldmue7Fmz5QFklDgZO21u/ZFL8IzpnSLbg
         eeMdl6YaaKyZOYWLhq0wsGOAG+he+NlfVSxM5I1KZr6Klhm0J6+7MWOCl7ghw/dJQq7x
         f/GA==
X-Gm-Message-State: AOAM531CGfg2FYZ6A1W2/eJ7B3lL3rBEHtY8bBkmPe18tK7DNsn2K2Ke
        sWfQgf80ocHwt9rGhnSFqCX4mw==
X-Google-Smtp-Source: ABdhPJwm31KByBnVlIs7w8AhfNmb0SVtrFTViZTx/Z2vDwUsInRHv7kDRMPZxQRCnuti15RgLOsTmQ==
X-Received: by 2002:a63:1b60:: with SMTP id b32mr16009500pgm.422.1631005449064;
        Tue, 07 Sep 2021 02:04:09 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4040:44a5:1453:e72c])
        by smtp.gmail.com with ESMTPSA id f10sm143297pfd.53.2021.09.07.02.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 02:04:08 -0700 (PDT)
Date:   Tue, 7 Sep 2021 18:04:03 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Steve French <sfrench@samba.org>,
        Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ksmbd: remove unnecessary conditions
Message-ID: <YTcrA2U2n5QAUkt5@google.com>
References: <20210907073428.GD18254@kili>
 <YTcdbOgmB7758K+/@google.com>
 <20210907085430.GM1957@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907085430.GM1957@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On (21/09/07 11:54), Dan Carpenter wrote:
> On Tue, Sep 07, 2021 at 05:06:04PM +0900, Sergey Senozhatsky wrote:
> > On (21/09/07 10:34), Dan Carpenter wrote:
> > >  
> > >  		id = le32_to_cpu(psid->sub_auth[psid->num_subauth - 1]);
> > > -		if (id >= 0) {
> > > -			/*
> > > -			 * Translate raw sid into kuid in the server's user
> > > -			 * namespace.
> > > -			 */
> > > -			uid = make_kuid(&init_user_ns, id);
> > > -
> > > -			/* If this is an idmapped mount, apply the idmapping. */
> > > -			uid = kuid_from_mnt(user_ns, uid);
> > > -			if (uid_valid(uid)) {
> > > -				fattr->cf_uid = uid;
> > > -				rc = 0;
> > > -			}
> > > +		/*
> > > +		 * Translate raw sid into kuid in the server's user
> > > +		 * namespace.
> > > +		 */
> > > +		uid = make_kuid(&init_user_ns, id);
> > 
> > Can make_kuid() return INVALID_UID? IOW, uid_valid(uid) here as well?
> 
> No need to check twice.  We're going to check at the end.
> 
> > 
> > > +
> > > +		/* If this is an idmapped mount, apply the idmapping. */
> > > +		uid = kuid_from_mnt(user_ns, uid);
> > > +		if (uid_valid(uid)) {
>                     ^^^^^^^^^^^^^^
> The check here is sufficient.

My point was more that a potentially invalid UID is passed to kuid_from_mnt()
and kgid_from_mnt(). I don't see map_id_up(), for example, checking that
passed UID is valid. So decided to double check.
