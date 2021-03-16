Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB33C433E9
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 14:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90BA66507E
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 14:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbhCPOaj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 10:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhCPOah (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 10:30:37 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB2BC06174A
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 07:30:37 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id a7so37329034iok.12
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q0QJ2/lWzvsthGjnqqujS5232ILelKGJuIZ07Rt2ZfM=;
        b=cNNo621hO2MfojmW6mZrxD5wjgLQchkge+942Pp5x1BapJPonUNyXWB6ENW2PKd6jp
         zTAh+n/yVTlee8UsQeOAOxN2HVsUrGoGOJ/F0AOwIgAm/17ugoCzyMYEthhD88DBNKkt
         w/wHfhZVy++tFPfepK9fB5olXva/Ycer/jITVTxAhL6VHiRiYEAxyFeN9sgTzugagBMf
         HoIH+h8a8k5uHOmBMGKhkcr4Nvg1pBD0VcYlP9kHUgW/YkahvtjjFkngLeVd4CtznGDO
         Rt+0bXcq+42FQ7O5CMrUVaClpDFWmx4RbcYz3LmP4mZ6CJHuxtpt7q8G1utVFxxMG7yT
         1IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0QJ2/lWzvsthGjnqqujS5232ILelKGJuIZ07Rt2ZfM=;
        b=Z8pdRoEuBK4SrLqKw6IgI8oX98cROfjU6+8lOMjJrOHvxNYaRriLuAP1rwUMoZXIjD
         2Y8ce5202hqRwG7aYZy7fVrLJ7XEILnI+7CvzZfT2BuJUI9EW0RAeMcYLsO0HkyptN4O
         xWLofAEV2lh0ZoO5oqfNhp9MFYCrxBIl+WLY0EBAqBGGf5u5nJtkx6u4yKUhLZYKazSm
         HOfqksObWmCHNW3cx2ej9eIPyWrw1L3Oxj5wJfYGy3L0A6NUQkk6dxdWsPI0TpFykCAE
         LC87DJaEsctBfPd0p15LVHbnUE33+s+o7OTMC6o8fmWeVlcRH++/pAb4t4LV83oj2qAX
         hAlw==
X-Gm-Message-State: AOAM531uXbPEQjexZm1CJ34pG7MSx1GlfsPIFr6Mx0E+Wdf31nnZdvoU
        Q6OWc28+oghxc7Fz+Oaq4167w0AZ62UwEsNu4SnKQTqxjBXRnQ==
X-Google-Smtp-Source: ABdhPJz+Jan3ejAZlVUrjMY5Mc2q+o1KCSvxQ0uPPNx+A6fShpC/E0KB8SVRNDi5B1dHXLA5AnAdL0fgGVkWb/NIB+c=
X-Received: by 2002:a6b:5c0d:: with SMTP id z13mr3499064ioh.6.1615905036916;
 Tue, 16 Mar 2021 07:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210312145941.1721627-1-eantoranz@gmail.com>
In-Reply-To: <20210312145941.1721627-1-eantoranz@gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Tue, 16 Mar 2021 08:30:26 -0600
Message-ID: <CAOc6etaLJdGJHk7F6Vm3iCVW=OzKiWZ2vCFAc_sZn7VAGM4Dyg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vt665x: fix alignment constraints
To:     kernel-janitors@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 12, 2021 at 9:00 AM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>

I wonder if this patch will be picked up if I don't include Greg in
the conversation. Should I send the patch again looping him in?

> --
> 2.30.1
>
