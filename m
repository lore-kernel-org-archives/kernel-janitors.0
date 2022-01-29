Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2F6C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 29 Jan 2022 16:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352204AbiA2QWU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 29 Jan 2022 11:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352165AbiA2QWT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 29 Jan 2022 11:22:19 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EAFC06173B
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Jan 2022 08:22:19 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id z19so17784413lfq.13
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Jan 2022 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=5rb2bYUGOsznXSQW2SbmZuAdFHz29bFHdL1+tYXBjRE=;
        b=xyjzk67oTRcgtPhJGd7tLSYTTLRfEbpi//R7oE1aHRWfa1QgcQp/WV7AJ/R9C5TMKT
         XJ/LwSs94kqzWcdAJaL9ukFL3gYOLRt3IxqwmcvrBdhGf75VQhuMYtNW8QKUU+gAkm5M
         j180E8WNi414CAKfHgyjOkQqLM9wgnpxMFDcYix7Smx23fet/qFzudGUEwyqYRky0bbn
         pWF6X8CLsVb4TmjrT7DJ5Q3ZiVJT96nlnZgzU1dVgQTinmFACr5f05rX3PQDJV1e3f+u
         6l/Y8Be9t4F/OFstrmIrgjdYmERfTEUnPhp9I9ZWlJq5vso8lJeq/WUHkLh5u1IqCsPq
         maWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=5rb2bYUGOsznXSQW2SbmZuAdFHz29bFHdL1+tYXBjRE=;
        b=MxE3v0Hbw0oMSN26Qsd4YhLKwnwDfzrxW6wm0GvfXGrFoVM2ZB2S/nTws5KSYQnrUx
         +y0U7Gl+W5HN4qJCjjlwnYdlPTnp1bbsB1jgyHIDgLDAVHAs5cToKhyM1Cw5cs+7JqKP
         dFU3dB2E+0rUfQQFcA6XllYYmj2HML94fDsGnch12NhYR9zelQhiuGcdtoTDe9IzeBQF
         PmRXXPHHlfDyiXmTMoz3S+MSsTKbGy5eahIvdlevOUU5lSjMSA3UdzzjEVdceXmaS0HF
         orkc1BLCa0eV2A9SOMeBbEBcIzCdbMz/LCDfPpgFhY6JzFY7DbhYi9ymBUmrUDpQRN5D
         P9pQ==
X-Gm-Message-State: AOAM530TXM5Vs4UIa7og4hOBCme2LQ8XtzolPbcYpQGo9IjHAF+YcThG
        MMB0zuBkcrSC1Ptupu+H9AOc0Q==
X-Google-Smtp-Source: ABdhPJzIZNvcLjZkozB6mcFfZUdLmxqeYij3PD8XD5vhpivDm86V/WTKy69WAarSKYUO8136NCRbww==
X-Received: by 2002:a05:6512:e87:: with SMTP id bi7mr9946776lfb.550.1643473337320;
        Sat, 29 Jan 2022 08:22:17 -0800 (PST)
Received: from wkz-x280 (h-212-85-90-115.A259.priv.bahnhof.se. [212.85.90.115])
        by smtp.gmail.com with ESMTPSA id bq7sm2928931lfb.210.2022.01.29.08.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:22:16 -0800 (PST)
From:   Tobias Waldekranz <tobias@waldekranz.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>, weiyongjun1@huawei.com,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Marcin Wojtas <mw@semihalf.com>,
        Calvin Johnson <calvin.johnson@oss.nxp.com>,
        Markus Koch <markus@notsyncing.net>
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH net-next] net/fsl: xgmac_mdio: fix return value check in
 xgmac_mdio_probe()
In-Reply-To: <20220129012702.3220704-1-weiyongjun1@huawei.com>
References: <20220129012702.3220704-1-weiyongjun1@huawei.com>
Date:   Sat, 29 Jan 2022 17:22:15 +0100
Message-ID: <87czkabjgo.fsf@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jan 29, 2022 at 01:27, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
>
> Fixes: 1d14eb15dc2c ("net/fsl: xgmac_mdio: Use managed device resources")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Tobias Waldekranz <tobias@waldekranz.com>

Sorry about that. I started out by using devm_ioremap_resource, which
uses the in-band error signaling, and forgot to match the guard when I
changed it.

I see that this was reported by your CI, do you mind me asking what it
is running in the back-end? At least my version of sparse does not seem
to catch this.
