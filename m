Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C13C433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Oct 2021 22:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B15560F93
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Oct 2021 22:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244705AbhJPWOB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 16 Oct 2021 18:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244700AbhJPWOA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 Oct 2021 18:14:00 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DFEC061765
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Oct 2021 15:11:51 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id r134so11896228iod.11
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Oct 2021 15:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K1DUr2Vv+e3D9ICDm8sVHntHqzYK21EAKMX4oyspO+Q=;
        b=s2vu/Zt3UnZWMolqxnQ2vOI2UzxnPcFYisYajfA17vIiFXPGsvSajRxt7QGRFtIXlP
         uD5gu1x1/SBagyK+SIIegNlIBPxwCUdziuxO2P21lXG/AAG4KlornwO5n9x0fK3ODfdQ
         Qv147i+pIMaWa5MkJWlo0ngdDBRNCCMdEDcGKXMW8q8+5OyvaFXSs5VBbAIM2NmvvM9h
         q1RqBza1BW4PqutWVSt0M2kDoqc4+HA3mEeG3MnDAgROZorOk0LIXB/IWUfFe2ReIIuU
         Fp/mT6oc5jHT9qRznsy1t2jJBFaCFevSEeX/cC2GqK19sLDxu0W4mLc2Lhl2TvAt/xfq
         Qy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1DUr2Vv+e3D9ICDm8sVHntHqzYK21EAKMX4oyspO+Q=;
        b=bFQ2TYsI32eHNmmoj148JCcRtLC64f1wntcwbPPgq1V6dxJaH36hEetti3exdPK/u2
         wOpLw6V74NMaKz0ssbQKBcY1Uay9jqQ77fL/Y7wD8H88mKBK3LxtlSospHepOM7nTz2I
         LalRTr4Zc8CMDVvBi81O9+2yJugHPgB74LITVixUFzrIG6rwEoTjY119mL05Vd47p7R/
         Fxw8qbQtdyy7KiTVI1OYTOh9qIwrOgisSS6zClT2ALRao0lau9CyURwsz4WaGMrtdpYh
         0rc683m0L8Ni33YJieRo4KrbyDGyT/iQcaLgJJ8SbqWrMIcyHAvx+TM5NPKRRx8gLEg8
         AVjw==
X-Gm-Message-State: AOAM5332Q9OiEyuWdDUBeEDUJnWV4oe3CePor+dD7uUp+J3hSPlgq/rL
        JdFzVdbDO0ah9VTSqJqhrkyFTQ==
X-Google-Smtp-Source: ABdhPJziVmCPDZaLqkBbywtXEI3IDl9l+FK9GjbHk+l+sGmiPpi4P97ftHAw/zT2TiSuoF30XahsAg==
X-Received: by 2002:a6b:ee0d:: with SMTP id i13mr9034379ioh.166.1634422311233;
        Sat, 16 Oct 2021 15:11:51 -0700 (PDT)
Received: from localhost.localdomain ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id o1sm4662484ilj.41.2021.10.16.15.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 15:11:50 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        bhelgaas@google.com, liushixin2@huawei.com
Cc:     Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtip32xx: Remove redundant 'flush_workqueue()' calls
Date:   Sat, 16 Oct 2021 16:11:48 -0600
Message-Id: <163442230544.1142120.13380062320331204869.b4-ty@kernel.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <0fea349c808c6cfbf549b0e33701320c7860c8b7.1634234221.git.christophe.jaillet@wanadoo.fr>
References: <0fea349c808c6cfbf549b0e33701320c7860c8b7.1634234221.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 14 Oct 2021 20:07:50 +0200, Christophe JAILLET wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> [...]

Applied, thanks!

[1/1] mtip32xx: Remove redundant 'flush_workqueue()' calls
      commit: 82c2ecfce69bb758faf81779e28e0ea1a342f1a7

Best regards,
-- 
Jens Axboe


