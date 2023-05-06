Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EA3C77B7C
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 May 2023 01:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjEFB53 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 21:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjEFB52 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 21:57:28 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C204C05
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 18:57:25 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc394919cso3702222a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 05 May 2023 18:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683338243; x=1685930243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEWaeK4UyXB7rn8ZKDm/RsGKdWKXNNR3xA3d9AaLO1U=;
        b=GmfPET2O+02898hXe2z1+kP7Igio9e43DX+g6z2VKvEdB2Mcc1VjCtYFtdnS+tg6P9
         ZdmPQx9xoD8oPhoKZtl2DqDcJd5B14p8d6bRYRBU3z7lF+/nFIXHx/LlKM2a37aqtCyX
         Dl+aNmjn98L/CFOHghjNrTuSBcmz+oCJwVh/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683338243; x=1685930243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEWaeK4UyXB7rn8ZKDm/RsGKdWKXNNR3xA3d9AaLO1U=;
        b=E3pcnLqbAB3FIRf1U7D5Ihikk6/L8hoPYexZnFOT5jZr2Yk79HnMlvh/4cj2ubn+oh
         V/p2dDuZkpEgQkbVdBQCgjF7tTA/R7Hz1IOrCQQt3UvsOxVok3aeHMbIGgqTTfnFlxP6
         2MhgQKSNBvP5tvl5k8Jhib9wqNC4Y32BmbCeVB/Bvc42aq0z5pWaHDz1pESkpfmezgVz
         FomuSjjT2R8LVF834Z8okN/qjf49zRe1pQlRXH0zRvXv59DdTXhm83kGgLlJDV5Y7p2C
         FstGElzwdj8pYrnCwMfCACgRfHG1GdqKX/r+gmZ9sCWfA79MRTp7wEOjZ33Ft/gyNqJb
         yW5A==
X-Gm-Message-State: AC+VfDxK1y2WkuEfFL2eugufG2KktKdL3PJ4BuYjUkCtuihzzHjJOVD3
        rSzrzrut/mJyGrnUysnZDn+/rqpTZ/T+5ZNLUsvVJw==
X-Google-Smtp-Source: ACHHUZ6x4gm4A4q2hlK1s1w4iX2XtisHXbimS+lG9dU2s0e7beM/Dw9oYYm+2H6iPQM/XSBq5HWnbg==
X-Received: by 2002:aa7:c719:0:b0:504:b228:878d with SMTP id i25-20020aa7c719000000b00504b228878dmr3192383edq.25.1683338243463;
        Fri, 05 May 2023 18:57:23 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id i5-20020aa7c705000000b0050673b13b58sm3447404edq.56.2023.05.05.18.57.22
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 18:57:22 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bc456cc39so3711447a12.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 May 2023 18:57:22 -0700 (PDT)
X-Received: by 2002:a17:907:6eaa:b0:94a:9ae2:1642 with SMTP id
 sh42-20020a1709076eaa00b0094a9ae21642mr3442159ejc.46.1683338242456; Fri, 05
 May 2023 18:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230505223909.29150-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230505223909.29150-1-lukas.bulwahn@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 5 May 2023 18:57:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiX6xj9ck9u7_iN6HRFbLtpXSGfHtidUZSHfddx87FLdg@mail.gmail.com>
Message-ID: <CAHk-=wiX6xj9ck9u7_iN6HRFbLtpXSGfHtidUZSHfddx87FLdg@mail.gmail.com>
Subject: Re: [PATCH] s390: remove the unneeded select GCC12_NO_ARRAY_BOUNDS
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 5, 2023 at 3:39=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmail.c=
om> wrote:
>
> Linus, as this is just a quick clean-up improvement to your commit
> "gcc: disable '-Warray-bounds' for gcc-13 too", this can probably just
> go directly to your tree.

Done.

               Linus
