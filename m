Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A39CEB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 14:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbjGKOMw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 10:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjGKOMv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 10:12:51 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4433BC
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 07:12:50 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8ad356f6fso61951905ad.3
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689084770; x=1691676770;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKmedfgd+4jxvzKfHiDgc5mFmW2U0cgt9mxgBtCMeQU=;
        b=jQEYS4cWMvSpAE60WURba81hHYw9L68nNA4P8uyOv4r4C/Cc32KDCJgdeT8sfaqmEt
         WGG+cOZWeHAYiU/MI1l15/+sIqBCdts+B6D53RbyeuoDGbt+HDViBapsAwWUHBi0Zk3/
         dxE8vgj6BHzixqyqY41R59IXNsvVJ3+GC7JnyQ29gV4AHD4btjbaPTfVtBtkhKG3hJfK
         2ZhSnd8NQV1n/6LtnGYL1FtePvKrA3Kf/GqrqY/Rx34aITmRMSzsDa++4VtNkBpT+rpV
         ZteK8e1HHtO+jrNS9wFkdzKgKYULF8ijqfxAjJG6yuv8qcFyEuA9ZGT+WurAks53i7l5
         GhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084770; x=1691676770;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DKmedfgd+4jxvzKfHiDgc5mFmW2U0cgt9mxgBtCMeQU=;
        b=gnQXKAH/TEdarwIRhwz7wdKb9TVyhbm2TY/EUTEZkhSdE8iX1m3Y2vq8JCanRQku/V
         LygwwaWjaAkrNmAvX4mT8npESDZuGGr4KNeQ/fYfdiB3W5smgeXWz9EE3rgLh95wwBcn
         hwmzzxzKb/8Ddgo9vlz/wZ6T0zemKFkDtoi5xxgSbM1EofOk2IC09221eZgf3vb4Q3H2
         Ae0bJxEcuGbt96xicTQkZl1k9v5AJ2LHarOExzVpDLKZgiOYLtspl4IjyD2iSZnl4IDm
         4savNNSVOD9JCKSPIjRWnJGalO/8Mw6nABOGIIMliP1taSjmeboS59cs74KO0AAtQj/L
         34Ag==
X-Gm-Message-State: ABy/qLZNqjTTFWaL9NEHCURiL14ONUFogTHWxJRpmImmwHWC3KurCBD7
        ltWhLTU17KgHN2OatgGQJ6I7SJskDhM=
X-Google-Smtp-Source: APBJJlE8y6yedrUFAfVOuSm3aMTvdZrtcnPSOCAlg5L1LYZDN+BCXVDzZfkatvUWj3oc0M7vuOjwXa/J5GA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ba8c:b0:1ae:6895:cb96 with SMTP id
 k12-20020a170902ba8c00b001ae6895cb96mr11931957pls.5.1689084770417; Tue, 11
 Jul 2023 07:12:50 -0700 (PDT)
Date:   Tue, 11 Jul 2023 07:12:48 -0700
In-Reply-To: <a1679697-827b-0e3a-0948-c84510fcbecc@web.de>
Mime-Version: 1.0
References: <20230710170652.473788-1-seanjc@google.com> <a1679697-827b-0e3a-0948-c84510fcbecc@web.de>
Message-ID: <ZK1jYI/wyaxWnXrz@google.com>
Subject: Re: [cocci] [PATCH] Revert "debugfs, coccinelle: check for obsolete
 DEFINE_SIMPLE_ATTRIBUTE() usage"
From:   Sean Christopherson <seanjc@google.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2023, Markus Elfring wrote:
> > Remove coccinelle's recommendation to use DEFINE_SIMPLE_ATTRIBUTE()
> > instead of DEFINE_SIMPLE_ATTRIBUTE().
>=20
> I find this wording inappropriate for a change request
> because of an undesirable term duplication.
> Would you like to refer to the identifier =E2=80=9CDEFINE_DEBUGFS_ATTRIBU=
TE=E2=80=9D here?

Doh, copy+paste fail on my part.

> >                                        Regardless of whether or not the
> > "significant overhead" incurred by debugfs_create_file() is actually
> > meaningful, warnings from the script have led to a rash of low-quality
> > patches that have sowed confusion and consumed maintainer time for litt=
le
> > to no benefit.  There have been no less than four attempts to "fix" KVM=
,
> > and a quick search on lore shows that KVM is not alone.
>=20
> Will such information trigger any further clarification?

I don't quite follow the question.  What information, and what clarificatio=
n?
