Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0AFC0015E
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 10:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbjGXKvB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 06:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjGXKu6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 06:50:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F5419C
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 03:50:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE84B61070
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 10:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4A7C433C8;
        Mon, 24 Jul 2023 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690195854;
        bh=Btwc0NpzjaS8ztCfC9e8CxhdBoIw+kynEpO2Ak41BCY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=qFNiYOSgbkNcdn316zBbT5+WGlnuYaY4yMEXiMQPeAQLBMrAc12Ks67bXSC2EJe4+
         PWDpRd+9m8tAi9EsPQHBhdSW71WoUGoHOV2x7RunRc1R1TpiPo1w3y1iPVsO8IN2wu
         Mn4pRF/ZDG5d9GO7fulGAWGJLaERMUyiFRFNh+psbi8Eh8Of/fhrD41jpTqkaUoDRM
         TVOmckxJDCYGLJj9CJgxGSPKlHGQDg327qj7iPJ+VemjAdDdp0OHJkq1LaUclm+N6O
         1npiO/FW636OQ6EWIn0CxwtJbYB+EGGE30spBGt5ipC8BVDCldV5L0/mFpfuz6YqF3
         cVDLrwUPAqD7w==
From:   Maxime Ripard <mripard@kernel.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
In-Reply-To: <ddf86b59-696a-45f0-96dd-b87aa7b9ab2e@moroto.mountain>
References: <ddf86b59-696a-45f0-96dd-b87aa7b9ab2e@moroto.mountain>
Subject: Re: (subset) [PATCH] drm/managed: Clean up GFP_ flag usage in
 drmm_kmalloc()
Message-Id: <169019585162.2211238.1816188334769406260.b4-ty@kernel.org>
Date:   Mon, 24 Jul 2023 12:50:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 21 Jul 2023 17:57:49 +0300, Dan Carpenter wrote:
> This code is not using the correct gfp flags which were passed in.
> However, this does not affect runtime because kstrdup_const() is a
> no-op in this context.  (It just returns the "kmalloc" string literal
> without doing an allocation.)
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

