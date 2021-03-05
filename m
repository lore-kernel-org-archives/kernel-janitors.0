Return-Path: <SRS0=g6hj=ID=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27589C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 16:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF7AB64F1E
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 16:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCEQ6o (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 11:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhCEQ62 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 11:58:28 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1169C061574
        for <kernel-janitors@vger.kernel.org>; Fri,  5 Mar 2021 08:58:28 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id e7so2606543ile.7
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Mar 2021 08:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4vO8xcvnT8HVccwtWoxEbb04shz3gXURd6cw0ZkJ788=;
        b=hQbCGTQacfSXl3aN6RY3VC17t4MdG4TXaf0bczaSMO22JPEn9FzTGlpKg/zW69AQ5C
         K0FvTMq4wqI1mlZTBD7VJL7cCAMwpsWIRc21mPo3nianED1W5dugh4H5aJnAOLK94LA8
         44nu+yVCxgKtkBV2MzjnXvWr0w6RTGhe+dN5jW9uFXoeTr8fLwiJeTQ7Ig6n3dejjQ0K
         yLFoPbOo29MewmEKmGcJzoiO4/SKcCD83ACY/MsXypaD6whmvciL6nSnf6QClIdMu/Za
         njsmnwqgvtmYpi9imPe3NzlLIpDfaByFYp5/9CIiSHjYiyKQDQwNmtDc9yP+ootROufV
         8kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4vO8xcvnT8HVccwtWoxEbb04shz3gXURd6cw0ZkJ788=;
        b=pbVYKpdcTTP/v/dbA3c9QKahtTvv5aY/pduCEfajcqAQceqia/evWU6UEgKPNbEqPs
         GpL9BTJaw50S8Fhb/6BGz/IhnWQuIlYV85wz3wmHY9JZnkOd0uLN68V9jGff0h4pzxj+
         +FOu111QJPOhUcvk+vuKKZwJ+O86y9SngihwqJE4tBPg7HpIrGn3+kPgkE9/MRBjCwMv
         +rVzM9LmS/L9izPwU4bH4UfAw55eONvA8AJGkqV6+IABDk1TSNZdCOiC2eEIWUaGCdB6
         k9S/7xfgwM2t2sO+zAqAHzL7LoVC9O5lyf1PcfydJHAy1Fn2DzvzNXxb7G5YLz5pMOph
         pP1Q==
X-Gm-Message-State: AOAM5328PVu8gbQzKS2wtgY4n3/afb4D68/fjXMP0uz+ojhCdHqf0pxj
        /W73OsT3ViQq1XTCKB9ES/HQpNIqxlcfIK5wFRg=
X-Google-Smtp-Source: ABdhPJx7YKHGgBlYVqsKix+XPludpapU2KTmL2rf1P3Jsg8009eu+E/Ed7Vdr2kjtcDCX+yYfsAdWX8R87INj+HVato=
X-Received: by 2002:a92:c5cf:: with SMTP id s15mr9624359ilt.149.1614963508365;
 Fri, 05 Mar 2021 08:58:28 -0800 (PST)
MIME-Version: 1.0
References: <YEHymwsnHewzoam7@mwanda>
In-Reply-To: <YEHymwsnHewzoam7@mwanda>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Fri, 5 Mar 2021 10:58:17 -0600
Message-ID: <CAOc6etYqu_SJPjZtZdp4xDX=MVB0XY67tJ-EYoDYWuLfEyjnrw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Ivan Safonov <insafonov@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Takashi Iwai <tiwai@suse.de>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 5, 2021 at 2:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> -                                       if (sec_len > 0 && sec_len <= len) {
> +                                       if (sec_len > 0 &&
> +                                           sec_len <= len &&
> +                                           sec_len <= 32) {

I wonder if this could be reduced to (sec_len > 0 && sec_len <=
min(len, 32)) from a stylistic POV?

First attempt at something kernel related so I know there's plenty of
things to learn (including patterns for problems like this and
etiquette).

BR
