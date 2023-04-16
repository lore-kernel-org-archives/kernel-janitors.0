Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B760C77B76
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 Apr 2023 19:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjDPTCi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 Apr 2023 15:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDPTCh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 Apr 2023 15:02:37 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8631FC3
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Apr 2023 12:02:35 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b875d0027so322664b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Apr 2023 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1681671755; x=1684263755;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sz194YkTjiHWHU6EwyUZFw+SUiZ9p2+4bs7KVCWW2A=;
        b=YsXwiRJP0NXEjK+RH7+/TXmJTwfxsPnrrZbXOPSmesB18YcDroRhIOFx6C/ps+8Mnc
         q+iCq5t5dVYp9Guj6BJW+jAPv5f1kw5yhqlWxZMV8UblOVUZSjOfk7uyhz7l84q5Fr9D
         UJgrABdzODvM4SFCQ2FlKAd9oZ5WkL2E9IN+ADeqmftZ9XAEsB6J9tfWpM83R2Nwqii6
         2RTlZlvl6iOdcDePuc1V51e1hxb9F+tN6gR1JhqcSMkPhVFKBwBovJojs2iRAfs+xHAE
         iDUMYjMiA5g3DEUtGDGH1DTL6uG6F2xCtpsxW/ejixTfGz955R6CQvCJTx2/p1QZ4IK7
         G2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681671755; x=1684263755;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Sz194YkTjiHWHU6EwyUZFw+SUiZ9p2+4bs7KVCWW2A=;
        b=FP7llsln3j4qy6fdomaiKAgQw/OPntwqqeK40xY1o3Ct2Q8C11scxgAPsJaFrOkuLg
         sS5QS3XfMs5waI11IpPhvFgX4D6wnuYfmnH4VJE1h8OpCcWCHq/8htIEBSj4Uspcmxcc
         /n514wkMR9EcEBO2HSQ+OzcqBuQMfC7iTiqYKfSfkVIqfPW7DbrUz3TJ1FpkhptR5elt
         oPMPc6Ia9kVdLihwTxTzDwF+d0RFhXNmZ7TrszoZDHeQCy1VVxopFXifdEqwxPiVvJP8
         7jAkrt8CprQcR4V/mQ1lhI6ydaoRndx2FoRUdiyqzbn5xI/eIJMZXU0f+tX7gEYcfbQs
         /rsw==
X-Gm-Message-State: AAQBX9fzOgkOF7zVIreVfQFQu8me0bW3AorQZ9mXMU7ZAVOLOIwv/5S6
        rO5mSB9tPMe+mMX3RDvvkCnpLA==
X-Google-Smtp-Source: AKy350av93xStztFUdvK3AKtRPAN1wDAeuFEmHUyxnhHxhRekskUPRnXfV1z9OQ8cQfmr6+qWUv67Q==
X-Received: by 2002:a05:6a00:8018:b0:63b:61cc:5aaa with SMTP id eg24-20020a056a00801800b0063b61cc5aaamr9432015pfb.1.1681671755034;
        Sun, 16 Apr 2023 12:02:35 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 12-20020aa7924c000000b006258dd63a3fsm6176156pfp.56.2023.04.16.12.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 12:02:34 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Paolo Valente <paolo.valente@linaro.org>,
        linux-block@vger.kernel.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230413133009.1605335-1-colin.i.king@gmail.com>
References: <20230413133009.1605335-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] block, bfq: Fix division by zero error on zero wsum
Message-Id: <168167175425.156307.13715193817993910123.b4-ty@kernel.dk>
Date:   Sun, 16 Apr 2023 13:02:34 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Thu, 13 Apr 2023 14:30:09 +0100, Colin Ian King wrote:
> When the weighted sum is zero the calculation of limit causes
> a division by zero error. Fix this by continuing to the next level.
> 
> This was discovered by running as root:
> 
> stress-ng --ioprio 0
> 
> [...]

Applied, thanks!

[1/1] block, bfq: Fix division by zero error on zero wsum
      commit: e53413f8deedf738a6782cc14cc00bd5852ccf18

Best regards,
-- 
Jens Axboe



