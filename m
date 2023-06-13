Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EDFEB64D8
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Jun 2023 18:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbjFMSSO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjFMSSM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Jun 2023 14:18:12 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBA019A
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 11:18:11 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bd790f26791so83529276.1
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686680291; x=1689272291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3jeE7DVQL64/LAB0gEQ9aqldA64x4ArcQNWljKfFuo=;
        b=N9QOc3XQA+yTi24Iik91xssvIngenc6CeXLc050E5jJ8bxjxCGCB0d0NYgyixiqXjQ
         ZYkJjJAbX7djbP7DjNsdZFykL6Y291MLKoG86b0WyhxMEDVj7l6y0CyU6DSSW6VtQRRE
         a8cMZjgJgOyvGvfqN5WhHnkFgm1j+PkESZSErFspwfY8Q5jLciZrqDHp6Xsfhr1WLrqO
         O+RxfCFISy0qDCybu2afEro3HDy2+o9sOflLUsLdaOxUmxq4fAvbgzY4ZntKDUo+NSka
         /MfJ6GMKQDoLY+KIzRNm0SGvIklG5E6KY3oz874rOJok/6DvrVNcjExgINf7Z0TiJycF
         fTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686680291; x=1689272291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3jeE7DVQL64/LAB0gEQ9aqldA64x4ArcQNWljKfFuo=;
        b=J+WIGHbN3dSkuU18kjTe0rgxcf5RLururTKYKPInJ6iTxXST1TLMcLmn7w3FSwADwt
         v/v+Az04HlUBv6R8/BIMgrjLhXKbk9A9mXlnd2qj0uFHRwjFldn/cMIYnjJF2rGaixbB
         A0pujFDkm+26eJgeQ2M0ZVDikl/jlOS2siYzajm1JYspoSAQGEgZqWcpHe+YGFzrlGS9
         aHmV5yKjZ7ogWkAy9SKQZZy2zzs8GyPI+SGXwpmR2X6lRlCBPSk1Z5NQqQq3MYYDL+RO
         m+lXybNY2VWrnLtKm+8ZcDE37zIVxpJLKkyymwhxOz1mtYea2a9BWFu9trUX6RrcPjDA
         kefw==
X-Gm-Message-State: AC+VfDzhJYl2QoXaRs4jUMk36YoOuNIT2hLBGBEcDZUZPOfgOBgYVWkY
        49L50FNTdUJGJCMAJcwZS2KQVMfJqJa0J3tUReWMig==
X-Google-Smtp-Source: ACHHUZ5G5FB19PgvEirbHYRzs9fEquyZsRcFyH6tJsNMJ+2W1QyRyp+YzqBDfGDlfE5K76MTRccXsXNPjDkNhDdH4uI=
X-Received: by 2002:a25:da8e:0:b0:bab:badc:41c6 with SMTP id
 n136-20020a25da8e000000b00babbadc41c6mr2079962ybf.24.1686680290957; Tue, 13
 Jun 2023 11:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230604131215.78847-2-andriy.shevchenko@linux.intel.com> <24d8898b-1e3b-8180-e96b-a3296de178a9@web.de>
In-Reply-To: <24d8898b-1e3b-8180-e96b-a3296de178a9@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Jun 2023 20:17:59 +0200
Message-ID: <CACRpkdbE8RArEZUnRw_wpHHJh8BgUXGkN+kWkdrpk+aNrUVUdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Relax user input size in pinmux_select()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 13, 2023 at 4:38=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> > This is debugfs and there is no much sense to strict the user from
> > sending as much data as they can. The memdup_user_nul() will anyway
> > fail if there is not enough memory.
> >
> > Relax the user input size by removing an artificial limitaion.
>
> How are the chances to avoid typos also in such a change description?

I don't care much about typos, and when a patch is coming from Andy
it's certainly not a blocker for anything since his patches are
of high technical value.

Yours,
Linus Walleij
