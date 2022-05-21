Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B9FC4332F
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 May 2022 12:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243287AbiEUMcs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 21 May 2022 08:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240930AbiEUMcq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 May 2022 08:32:46 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3819C2FC
        for <kernel-janitors@vger.kernel.org>; Sat, 21 May 2022 05:32:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id i24so9810171pfa.7
        for <kernel-janitors@vger.kernel.org>; Sat, 21 May 2022 05:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=JgECGUYQPfzQccxjQJUi8fr2KJeySrPf4gVLNaVPy0U=;
        b=WXY1ugt3fKDzvhExzkLtPKfAnoaTleIm5nLQSD1VDR4y9vBVjrL0twjYEe0rHhtMV6
         1RyA3k/9mC8X7ckdY1XjXshHVglKqwrEMD2ZwIElo41MmucmJlUFkiMHR61XvU+Zf/6Z
         mylPQ6yvSzXb3yoRzuFcEw3dgwcJJ/uKKF355S7fw325qu/3dGuDPXD/sxL2KlkTWXcL
         spDpLa6rx2va0TFSjedicNGQH+fWRBMhIG0Zpx2uNTcJpO2y63MXlYsCKf0O5dCyLf/D
         8FLzBK1swN4AFRFmYptHnjLmAke3cowmC+hgzlRSKMV260ru/V6fjelTbufXtI8ZVVWU
         P/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=JgECGUYQPfzQccxjQJUi8fr2KJeySrPf4gVLNaVPy0U=;
        b=ouB3fGHxnBGdA8loPZB4TUUF/hqBDc1lblUVs77pyOX4M+Br+UQ8Egtk5uquCXxZWs
         J4rBlSUTtoNxN28VlvGF47MKGWCnCPi78BZFw5yWhC0cdGIcnEX6vWSIGKsw5jaiape5
         2V7DeNCspBlonddBJ6ajlhizSuUu7BrZ/Lmhjik+z5y21JWILhTCu/yV5tD49RzxrXLa
         hMQmxJYdDbtQ8BPnDab+mSlmdS0AWodqTnfxB7D2y1rY6g9kjKJLvTVbyhQLUry7HXIN
         9XSMa3PAzeUUhjyccQkNbfZkbNR3gf8EDmSjZWxLjB5LXhzhRkAZga7JAVnDRMWNr9J+
         +1Ng==
X-Gm-Message-State: AOAM531cHNe2sMvq82IzfkqU3vE49l4Jt83YuwtYlBhHOO++8ApXGaqf
        4MDwRbj4EnQube2F9Pp2WVE52MrImRpfow==
X-Google-Smtp-Source: ABdhPJyywiQeka0cL1QIQ52HrCa75B117/TtMloSmZELBFW0UPcqBV4nCigEW/gs58JskI9ne6BDZg==
X-Received: by 2002:a63:4765:0:b0:3ab:812a:ded2 with SMTP id w37-20020a634765000000b003ab812aded2mr12851246pgk.214.1653136365061;
        Sat, 21 May 2022 05:32:45 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e20-20020a170902ed9400b0015e8d4eb1f5sm1506394plj.63.2022.05.21.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 05:32:44 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Julia.Lawall@inria.fr
Cc:     linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20220521111145.81697-28-Julia.Lawall@inria.fr>
References: <20220521111145.81697-28-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] mtip32xx: fix typo in comment
Message-Id: <165313636386.19482.14816930857839555999.b4-ty@kernel.dk>
Date:   Sat, 21 May 2022 06:32:43 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 21 May 2022 13:10:38 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied, thanks!

[1/1] mtip32xx: fix typo in comment
      commit: 537b9f2bf60f4bbd8ab89cea16aaab70f0c1560d

Best regards,
-- 
Jens Axboe


