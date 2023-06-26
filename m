Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73278EB64D7
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 14:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjFZOvk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 10:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjFZOvf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 10:51:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A745410D8
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 07:51:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb7acaa7a5so903923e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 07:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687791091; x=1690383091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gU1jNjcV6TD928B0r4atzgfh+TbbilOvGXXldqDgK0=;
        b=P4arqQv9iik6Y23luPjXnYhW+FqmKPWyPqapmmXGTxdsyuQB1RYBMkM594au8k4UUn
         tcf1MdtQFSssHm/+NapY9LqmBUhxi5vYlyek4p4UJ+W9W8gydaPoYfYX+wgdrIsSl+Kn
         IJ199GQu/s2g1BAdz8LLdFaVTmge05hmdPc4Lm7tlnvaNjldEtPt7rAIeIo1mGh9UkBs
         REojplSiwcdWHdAZosRvCZczNR4umvbTyeqqpE84zBtUL46ljXxF+nfj1tGBYVENGrla
         2pj0ui50zmvJhrVkoez2d+YVu5v4ZU2LdSN8mX9G94kflAdom8mVifhmhjq7E8OkPh7+
         jzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687791091; x=1690383091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gU1jNjcV6TD928B0r4atzgfh+TbbilOvGXXldqDgK0=;
        b=Iwe3EnQocHmDYELTkHvEe4yzolMy+xiJD72oEu4me4484M8Ck2kiYtStsM7Pw44gJx
         ZQ1m++r/fgZPhKIIbVP2rIq1OhczFnkO6uKjFz6lVI/xb7gjpKSPSMmlzmHISAtz0prc
         tTHqNRo+vdY8AJWMK90BbBV7bqZo0D6HAjCa+gMz6HnG3mOWwS5BfS+9WbEp/gt043GG
         6/ZNnrozMIOeWKhjR8kdO24STOLkeVXuetoINURmLjo+8FN1EtsnkoDp8e8F8kfb0Vqh
         br3bVKT4SaJvzf+X8zI/h4Vgyz5xvWToscTNGhqjrQXMECp9POgmRqFfjOISiJONoOXl
         ZoYA==
X-Gm-Message-State: AC+VfDzxmmFHqV/Xq7th/qSDGl4QEYTMNs9G3zPckJN3h3CXO2lBRxEc
        t6noBcv0TsIV3JeKYYc4bnx9PA==
X-Google-Smtp-Source: ACHHUZ6CgCGY0Hct7p+o+Enwx0beOYHQwNpJ6fFz/NAiG9n54W1RtKHH9zAN0ucOoL1tyevnuFlEkQ==
X-Received: by 2002:a05:6512:3b95:b0:4f9:5d2a:e0f5 with SMTP id g21-20020a0565123b9500b004f95d2ae0f5mr12257430lfv.19.1687791090735;
        Mon, 26 Jun 2023 07:51:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m8-20020adffe48000000b002c71b4d476asm7611864wrs.106.2023.06.26.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:51:29 -0700 (PDT)
Date:   Mon, 26 Jun 2023 17:51:26 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Demi Marie Obenour <demi@invisiblethingslab.com>,
        dm-devel@redhat.com, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>
Subject: Re: [v2 2/4] dm ioctl: Allow userspace to provide expected diskseq
Message-ID: <79fdecc7-138f-476f-bc40-3603aac408ad@kadam.mountain>
References: <20230624230950.2272-3-demi@invisiblethingslab.com>
 <3241078c-2318-fe1b-33cc-7c33db71b1a6@web.de>
 <ZJh73z2CsgHEJ4iv@itl-email>
 <e42e8115-6f75-447e-9955-ca4ad43ed406@kadam.mountain>
 <c1b84520-94d2-2c5c-6eed-2a0697c086a4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1b84520-94d2-2c5c-6eed-2a0697c086a4@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The reason why Markus was banned was because he doesn't listen to
feedback.  I've told him several times in the past week to stop
bothering people who are trying to work but he is not going to listen.

Meanwhile, I have seen Markus fix bugs so if he wanted to focus on
fixing bugs he probably could.

regards,
dan carpenter


