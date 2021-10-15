Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EECC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57B4160E97
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242330AbhJORZY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242342AbhJORZA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:00 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D048C061781
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Oct 2021 10:22:24 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id v77so9704905oie.1
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Oct 2021 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rzyEN2IKemEthFw0BhV4JmnKiL6LJx2wO9/bgd19Ox4=;
        b=M493+FP1Xy2KglJSyE0b3mrxkEeDorK3QcDt8nbhgmASBjTYSH4ElUGss0AaxmLdMq
         aSKRC1MxYuiOngTyM0o5zjs2fo2XVFAZOiAWWDwv3q+7niV1iOiuN+09r2k8gT0PMPHc
         kHieRShGPo6MA1/AFtYVnU++oaorAI6NIM2g4vgO8rXi4eRGZai8dCQUc9qTmGoWwni9
         AVOYtv1HR/iRoJ8U7aBmfidQA9VrCZzK7ANKrXdUmkmR8ZGMELU24+TuevtMOIJ5U9hF
         /JmSeOAYjgiX/OdNaqVNbnAYZxqRouj1kqYtcGYG9rdKdds88ya69iuNg5VFh3jCxHaA
         Dggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzyEN2IKemEthFw0BhV4JmnKiL6LJx2wO9/bgd19Ox4=;
        b=5dokJQtCAAu75fHBFWBrRhjSgk1ZpmFQltM0UsX1oDNXO6wtKqNTlsdGwqKdZJiYDN
         NE9YVMHPkEj1f67W4g67UsSydb2TX8MMoEdc3GRthpILuS2Ty9z46EGkBS7mT677u82I
         wejgowWVtIFjUH7bfnrl2YcPlNNMKeAkboRayErM9U0dVYL3/JWnNbDXIUlVCKpDJ4+p
         wZhqilEJvu8j7PGDKJfeE1qM3gsDF3KAPpof70Ut3bZBvLPFAU9drgDqPp4w4pPNkf1e
         gFgRB3ONXCTEGGUECPrSRbgXnT0IuMuPzWuKLL9FROVdMUHPkd5p5967OGkl/uMLNkUO
         GR3g==
X-Gm-Message-State: AOAM533sbdu5bQ1gT6/xHSCMf2gJVniyaA/gm7mfS2FXWHDW29ASHmp/
        20r4M5R1W8i/0aXdCIVbR5OmElSTFKr3Pg==
X-Google-Smtp-Source: ABdhPJz1rE34/rvD821RRnUmK8MzG4eBOu/mcVUiajrQWknwaD7hxsRnR2OCOahn7vdL+bbnp6zaZw==
X-Received: by 2002:aca:bd02:: with SMTP id n2mr18572809oif.113.1634318543564;
        Fri, 15 Oct 2021 10:22:23 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mathieu.poirier@linaro.org, james.quinlan@broadcom.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        ohad@wizery.com
Cc:     kernel-janitors@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: Fix a memory leak in an error handling path in 'rproc_handle_vdev()'
Date:   Fri, 15 Oct 2021 12:22:13 -0500
Message-Id: <163431847249.251657.11309404044031278395.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
References: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 4 Sep 2021 13:37:32 +0200, Christophe JAILLET wrote:
> If 'copy_dma_range_map() fails, the memory allocated for 'rvdev' will leak.
> Move the 'copy_dma_range_map()' call after the device registration so
> that 'rproc_rvdev_release()' can be called to free some resources.
> 
> Also, branch to the error handling path if 'copy_dma_range_map()' instead
> of a direct return to avoid some other leaks.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: Fix a memory leak in an error handling path in 'rproc_handle_vdev()'
      commit: 0374a4ea7269645c46c3eb288526ea072fa19e79

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
