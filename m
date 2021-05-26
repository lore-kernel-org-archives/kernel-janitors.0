Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2F2C47082
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 14:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CABFF613F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 14:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbhEZOVi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 10:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46507 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234537AbhEZOVh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 10:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622038804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Tw3kDFX/e5vI26qc+xYDQKOURNEBK6wDgxbcgNjQMwo=;
        b=IpL0I0DLDAw+nq6A8djgn+5eJ1TGiYkfqBitPWKLT45ecM2b7qJ8m4nkZu6kGDHC7nZS+X
        p2efP45/IGRkwKXL7y9mGZ3sT9NS/N5cGs2sWWgjwQ6WZZbJEl9d+wZmh6b1XVBZVBzBFN
        eFtx1LVXiEvsB/T6ZFpGvzGTj4DiIao=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-fsL20CluNoiszWYx7ktv7w-1; Wed, 26 May 2021 10:20:01 -0400
X-MC-Unique: fsL20CluNoiszWYx7ktv7w-1
Received: by mail-io1-f72.google.com with SMTP id i15-20020a6bee0f0000b029043af67da217so807216ioh.3
        for <kernel-janitors@vger.kernel.org>; Wed, 26 May 2021 07:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tw3kDFX/e5vI26qc+xYDQKOURNEBK6wDgxbcgNjQMwo=;
        b=En1C4NNIrKppasyWZ/+Rap3MupV/QykmT+5US0wHf+VRRvcwISue8yuUte9PuijSCB
         eQGvVfBhQQXnN+Uj2G7DpkBM/Ekzf+KWSSaOVwRQCaTnVqdK1axb7uIW+mgcxBi3m0yQ
         crfQGkAKVgVmsXTeHsGcsJlhG4AlNG8QFXSARLZQ2JdvzorP7hO78UJezYyM+mvF5Gl/
         YpWIK7HPy+ShJK+x5SxPp+MRkU4HWayhKoK9swb5Ciui6om4/ga1l79sDyNy4jQKrCdC
         ut/IBUJTAzIT/yHKu2MvREgnhEiMyx+lVs56eDb7yVuR+lnfi1dGhLOahO3NNlvRj9E4
         SHJQ==
X-Gm-Message-State: AOAM53388F3EbDlegn3CvmXi3wTAzsWQBxKCaackhzgnnTKl5F5jD9sK
        BgRMN8/LoTwaBXI0/tImUWiC8QTWro1oGb9b5O1tv1jrDipyFlKj190eFq7i0x702SEopP+ygWC
        2lCYONU6D0uo2Ji13QWCLuTnD04xL0rPKn1/XVy3wFTqR
X-Received: by 2002:a6b:8b58:: with SMTP id n85mr25868916iod.196.1622038801213;
        Wed, 26 May 2021 07:20:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6/xvJNSWX0KtrZyJUfd0teZL7cTFZvv9eEhh/QHbQfAh7gs/CemXpahHhE+Ltl8yqoScZYBgb4bH1K8GexEw=
X-Received: by 2002:a6b:8b58:: with SMTP id n85mr25868903iod.196.1622038801001;
 Wed, 26 May 2021 07:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210526134039.3448305-1-colin.king@canonical.com>
In-Reply-To: <20210526134039.3448305-1-colin.king@canonical.com>
From:   Alexander Ahring Oder Aring <aahringo@redhat.com>
Date:   Wed, 26 May 2021 10:19:49 -0400
Message-ID: <CAK-6q+jXZ2MGUw3QPKHwoNDMLdTookO7rq9LpGNx=ZGAn1pqOQ@mail.gmail.com>
Subject: Re: [PATCH][next] fs: dlm: Fix memory leak of object mh
To:     Colin King <colin.king@canonical.com>
Cc:     Christine Caulfield <ccaulfie@redhat.com>,
        David Teigland <teigland@redhat.com>, cluster-devel@redhat.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Wed, May 26, 2021 at 9:40 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is an error return path that is not kfree'ing mh after
> it has been successfully allocates.  Fix this by free'ing it.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/dlm/rcom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
> index 085f21966c72..19298edc1573 100644
> --- a/fs/dlm/rcom.c
> +++ b/fs/dlm/rcom.c
> @@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
>         if (rc_in->rc_id == 0xFFFFFFFF) {
>                 log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
>                 dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
> +               kfree(mh);
>                 return;

This seems to be a bigger issue, we cannot revert the buffer
allocation with a kfree, we cannot revert it at all. We should avoid
any error handling between create_rcom() and send_rcom(). In general
between get_buffer/commit_buffer.

I don't see a problem with moving the error handling before
create_rcom(). That should fix the issue.

- Alex

