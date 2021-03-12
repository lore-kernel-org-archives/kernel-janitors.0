Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E980C433E9
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 12:57:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5A8A64FC3
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 12:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhCLM5J (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 07:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbhCLM44 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 07:56:56 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD7BC061574
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 04:56:56 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id h18so2478010ils.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ptt1ZviVjRookWBmN9wyKm8kAReltF9QZo1UH5l1xA=;
        b=Az0fnxBqN4OQUfZBdvcHexAtzwgo8vDwa6oAdgbW9hu/E6x8YyNG0uic3cWbEORWSK
         oyRoIns8izNyO6LcjGafkCueV4E79nf7bqVW3MV9q3XyLZPj/KTrw8rOIwC7TbIsmJUT
         M9M65txwo/PQu9mDsKdVLDrCeOkNOP/7CuEiqsuIoWx0vrvl5pg7+4DbS5GfjQyFjwdM
         DMpnCCWCgD5WqseIsSB0RVpJpDTECuGsEkvZe338TKFKAKagbP23JRnwNfN0Tis4TLiY
         DCUT2hrEcsisjRfzGdUNULUtIa0LB/Z4aIlwwgNTgojMgK8jymUisxcq/EDdAeg31ldl
         Cn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ptt1ZviVjRookWBmN9wyKm8kAReltF9QZo1UH5l1xA=;
        b=l98yqt5GU5t/kgMZCBlzmpxl30Xh57UJx+Z3c9CU1yBtWjZ3PpfsnvGNYMKpOTou+d
         I0GAYTvEHt3GFOLSJXQqBU/7I1cs316LdeqDwoWRUSWClCUmhc9w451ubkwoOtP1RChe
         iZtlB6SyrIxwvAP8GinyxU7nFiwBTQKu8bMZy8e+OuLF8/Ns2blMTgykc9LtXMETz/Y7
         KtvrwZ1JFSvMKjgT9YJ8uCQLqYAkE9xRzCF8ucyCyB38DH8otAN24ssc4vN9AM7ZAqsg
         iS5U3AHtdeCoGISeLd1Fy6E3QfpwkrMbFVvKgRd+hMS9X9t91ChESFLz+bXPBxx4+txI
         i9LQ==
X-Gm-Message-State: AOAM530SMB4rbcIKGZFOI829qmS+CQn3S0bkqtW3IKj8kuQIty7KOONe
        ssxJ78AhSrLr+1ATrZX9NRANa4Y8DS55OxkybaGZaFmGqYtamw==
X-Google-Smtp-Source: ABdhPJyz59xHS6/1z6P/zXqunMSGkCQoQzBPo6z00F71YxvhSJQfc8pRYgGPDoZ51F8lFtztkhvP038baq+FQ3BVCk4=
X-Received: by 2002:a05:6e02:156e:: with SMTP id k14mr2645809ilu.200.1615553815882;
 Fri, 12 Mar 2021 04:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20210312054325.1706332-1-eantoranz@gmail.com> <CAOc6etaN0XZhXT7Dji0+aWHsQL5C10YO1RnnDHSjP=_eUTOT8A@mail.gmail.com>
 <CAK8P3a15Af-Ncit0g2bGFzPS9fyxgHv9=LE_=ioHOYwBTxhkhA@mail.gmail.com>
In-Reply-To: <CAK8P3a15Af-Ncit0g2bGFzPS9fyxgHv9=LE_=ioHOYwBTxhkhA@mail.gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Fri, 12 Mar 2021 06:56:44 -0600
Message-ID: <CAOc6etYJR+UzRLwkVYcvg-U3nStO1RNAu8XhGCc-UJTqQzDWCA@mail.gmail.com>
Subject: Re: [PATCH] staging: vt665x: fix alignment constraints
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 12, 2021 at 3:19 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
>
> I think the patch description is clear enough, but it would help to include
> a reference to my earlier patch that tried to fix the problem before. I don't

Great! I did mention it in the preceding line to the section I replied
to, though. It has it in the patch:

"""
This patch is related to 2faf12c57ef (staging: vt665x: fix alignment
constraints, 2021-02-04)

The root cause seems to be that _because_ struct ieee80211_cts is
marked as __aligned(2),
this requires any encapsulating struct to also have an alignment of 2.
"""

Maybe it needs to be formatted in a different fashion? Should I use a
longer (like 11 chars, maybe) ID?
