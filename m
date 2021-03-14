Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056FFC433DB
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 00:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9D7464ECE
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 00:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhCNAY4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 13 Mar 2021 19:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhCNAYW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 13 Mar 2021 19:24:22 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCE4C061574
        for <kernel-janitors@vger.kernel.org>; Sat, 13 Mar 2021 16:24:22 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id g27so29774456iox.2
        for <kernel-janitors@vger.kernel.org>; Sat, 13 Mar 2021 16:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ReIXOI7ID+5dMLHOOwSqWVS3vQ7siH5vvy0MxuD5RWk=;
        b=l538CwIVdDwscAwwEmimocGw5hoqgkSjmhP1ZAknG4D0D0EefJ0J+SYzLYivtils4s
         WX6H1Xzh5M8xRm0e9F37OpAP72S2NVUJY9nQp47tGPzoY5seMcUpT7BuY1EEbftk6Lsu
         zJysUf5hmIEjq42mx1/llzwuFgCKTdK+6f02K02nw6CNZh1PGrEGzH011j1ZS60pMu06
         K3HoPfjfFU9QfKxcALnwd/x+KcHwNYUtrzTo6rGiLKC/3MaMmPsjPtvm/Qs1CbTef6Je
         n70IVchD2luozwOFdIgCuP21B1ABcWlOFlwVtfJnl5jZFK3l8zHECcFxsmjc1bj4tCTj
         Rqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ReIXOI7ID+5dMLHOOwSqWVS3vQ7siH5vvy0MxuD5RWk=;
        b=GlFPUTyrIYNiKcquGWslkKhWSl8uV0VFmpOqa5EpeDZyMeO6oje2/l+Qjcj6LCFrNM
         /4J0JvK1KFx/njWMYSGLfT6l9MC6byBueQcoNZ+AOztyif0Yi892fcJpERL5UqYMKrNw
         36IzNaP39FuSMLdJRmqTOLc0LR+r8ceB3SN2nfiAhgYG0jt1/QFu0eZcuC+z8DsecfXz
         DKxRbkSOK4p/JH9xmIZDMyTT6PWVyjXv+wNJbxjjFIe1VRs0c9xpji3woCT0BebdkaJR
         OXAI+PY/whJAyE4Ky18P2BfYDURY9R8cQgZCXKXIlNgHb7ChoTJRO4LOMGNlkCaJ84jT
         45Ig==
X-Gm-Message-State: AOAM530Bz1SkKUNxJ8K2PiT/1KbisZYGGqMu23I1QZhJ6FFNKw3AX2y4
        pSt5gkqDXRP9tzg+Dvq0atxLD/k8Efa4w/91cnQAWZEx4j8=
X-Google-Smtp-Source: ABdhPJx9re2ndBzmYho0pIsbroBg+zD4QAQ+o7ZyNZrxj8/zyW5INYzFI3kMSj/3LVCrH9/JiyC/1+/oaxbps1t5Gfc=
X-Received: by 2002:a6b:5c0d:: with SMTP id z13mr3581859ioh.6.1615681461873;
 Sat, 13 Mar 2021 16:24:21 -0800 (PST)
MIME-Version: 1.0
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 13 Mar 2021 18:24:11 -0600
Message-ID: <CAOc6etbXM7rCSovO0A0Ye+ZQ8=JUkNM_p=L_3HL2k9UASNfHkg@mail.gmail.com>
Subject: Is it ok to propose more complex code changes?
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello!

I just found a piece of code that I think can be improved somewhat (in
drivers/staging/vt6655/channel.c)

switch (priv->byRFType) {
case RF_AIROHA7230:
case RF_UW2452:
case RF_NOTHING:
default:
       ch = vnt_channels_5ghz;

       for (i = 0; i < ARRAY_SIZE(vnt_channels_5ghz); i++) {
               ch[i].max_power = 0x3f;
               ch[i].flags = IEEE80211_CHAN_NO_HT40;
       }

       priv->hw->wiphy->bands[NL80211_BAND_5GHZ] =
                                       &vnt_supported_5ghz_band;
       fallthrough;
case RF_RFMD2959:
case RF_AIROHA:
case RF_AL2230S:
case RF_UW2451:
case RF_VT3226:
       ch = vnt_channels_2ghz;

       for (i = 0; i < ARRAY_SIZE(vnt_channels_2ghz); i++) {
               ch[i].max_power = 0x3f;
               ch[i].flags = IEEE80211_CHAN_NO_HT40;
       }

       priv->hw->wiphy->bands[NL80211_BAND_2GHZ] =
                                       &vnt_supported_2ghz_band;
       break;
}

There are two sections of code that could be turned into a function or
macro so that duplication can be avoided. Is it within our "Scope of
Work" as janitors to make this kind of proposal or it's better if we
avoid it and start easy at first?

Thanks!
