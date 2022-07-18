Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DBBCCA479
	for <kernel-janitors@archiver.kernel.org>; Mon, 18 Jul 2022 19:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbiGRTNP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 18 Jul 2022 15:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbiGRTNN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Jul 2022 15:13:13 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C5C2F662
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 12:13:12 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id z132so10113863iof.0
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Jul 2022 12:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=HZhWrFGJ/60u+arYGfm5slhhzNJ7cejuyjajN1Mdj4w=;
        b=jKusduWGP6hIWEpTg4Vx1MmpMKz3PJXf4JjUrMzeUhwyusH4jyR2vDphpzG3sDDCdh
         eMpxKCumpoHQJGizZmCT6gT5q3yElOy6JuXq4/eCuS0LyAdBL6KpwXGjG3GYhh2NBwRR
         u51EAaoZfek2kmBs7FF71rMPZlK53bU7ARxn/zr+rvO2z/+nlyp8JK1QvWU/g+JGh6gc
         aL0n3ov6bymEHsij4eG6KtcsS5ShnFio/nzra0vZ0Lw97hqTB4b4fCUT+jPKn8QGU0dZ
         uf8/A4euC94uErqv4Yvqi6SzwTBdtpu92sllaA97YooiBH8ZgbIKZBivaj2nMTcECAye
         Fk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=HZhWrFGJ/60u+arYGfm5slhhzNJ7cejuyjajN1Mdj4w=;
        b=w34tGcnfew5jSROf3zipTXPHf+0kG/Qr+PmdPxegOaDVcqTLmC7YSAixtDoWLvIyL6
         bAd1E3UfxCmhJFlNoHtTWxfiil/uRY5q47KtFZDRjVTazCqApzhuHOWKGj/nO8zYnuZQ
         og35Uk5QmXQlbJpAtY3o9tzfZIxyictwSqjgY3+0OYiXqAuSMxaDoekV3aSEdQBtF/yS
         WCdswFWn/KUFKJI9HjYRV8wDqFy5KuLdfxsFDG1D57qfJLFX9vBjbJlV3/bOnwSsnGMh
         Qn1sGhxbo4VOTHUa1xE235rR0vCB3wD00CPXu/SS+oLsPwo8HX3Q34VSSv0rhET+UGxz
         euCw==
X-Gm-Message-State: AJIora+vocbzynTnpyKgLTNSESNT8C7kEePw1tB31peKdWeZf9PZS53X
        tvMOaYHadD+TMu1pMsImXz22OA==
X-Google-Smtp-Source: AGRyM1s822w+3NlRMHNv2p+54NOtHEFOjsQYORLCx1GXCWLhF87bC27lCIYpxKZHjYHKNOuFX6ixGg==
X-Received: by 2002:a5d:9383:0:b0:67b:adc2:c053 with SMTP id c3-20020a5d9383000000b0067badc2c053mr13697774iol.102.1658171592442;
        Mon, 18 Jul 2022 12:13:12 -0700 (PDT)
Received: from [127.0.1.1] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id p123-20020a022981000000b0033eb2f2ccfasm5817730jap.43.2022.07.18.12.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 12:13:12 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     dan.carpenter@oracle.com, ming.lei@redhat.com
Cc:     linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <YtVAgedTsQVK1oTM@kili>
References: <YtVAgedTsQVK1oTM@kili>
Subject: Re: [PATCH 1/3] ublk_drv: fix an IS_ERR() vs NULL check
Message-Id: <165817159186.144718.1786091988428260978.b4-ty@kernel.dk>
Date:   Mon, 18 Jul 2022 13:13:11 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 18 Jul 2022 14:14:09 +0300, Dan Carpenter wrote:
> The blk_mq_alloc_disk_for_queue() doesn't return error pointers, it
> returns NULL on error.
> 
> 

Applied, thanks!

[1/3] ublk_drv: fix an IS_ERR() vs NULL check
      commit: fe3333f6953848f1c24e91a1cf70eed026dc3a86

Best regards,
-- 
Jens Axboe


