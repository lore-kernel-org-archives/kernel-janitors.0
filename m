Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AF3C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Mar 2022 05:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353618AbiCPF0x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Mar 2022 01:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353608AbiCPF0w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Mar 2022 01:26:52 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A60C4E39D
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Mar 2022 22:25:39 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso3760630pjb.0
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Mar 2022 22:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VXLa+bQza4asNsvRsBeTx6o89c2ufs9/OaL35zL23k=;
        b=uHN7xSsgP880Hr638C0NbhmgBDr1CfM1yG6kEOD+6lzRYu+6Ng8zeZ/y7ulSUSyuKv
         L8LhSZoLFNbvyfpYx5ZKy6xLGdk73K/VxduAug+WgAfKdgmQCiy4+j7atUrgzFw/wlcn
         7KVvh1AA0dsoiXhbO1yMiLBcu4P6+AKxWLMnFwJFyHUb8BHN3QSYiI+MPW5zXHfhaVDq
         uekLzQBhIjaEx7Pjxt7Lz0JEIgw1Rj0JYw00lmqdUT25AtDtJNhBzRgOk8Wf2IVuH6AA
         Q0KwikoxBc9tmB0j8WPdAL6aUoKishHwicXPdYL16oMwfUE7LoHwojUiSkCz/1xQsULi
         9Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VXLa+bQza4asNsvRsBeTx6o89c2ufs9/OaL35zL23k=;
        b=zQbTzuwJRVWxOS1XZ+b/XwEnw0otqbqYEc6RtslYFqW87k1UtKPj2ykrppUM0kE0kf
         64dDioQGXGuPTuKYc0ZKvHrrxK2+Vi1I/J5Yd1PAC0D2Y9QvhLFThkwi66vyYJ9Zr6ry
         IqVAR2W6qnHB86IeIId/mGx9wyLrt8lVcYHqguKko07zaxR5HgeOxrizYHcOMNqeWvsc
         TAEc7EmlsbyeNsXRVKZ+m1LiVObclnB044Asv8PVRk/IvQLvQ+VWSf0b2/xH3MgU4nQ2
         VJzT0AExGGAvAMAKW7csGGh1Qlt9j0H7lCBWvOsirEr2t05ZINYEKzI0vdmFXFDjmFTC
         XPBA==
X-Gm-Message-State: AOAM5332SeT3XRl3vixKFmwvxq4jLip2P3HzYXh+FU0ft/uEuLRKAPDR
        agThPKXpQG8o63CzUvSisFWglfITMNBIVZr+Cz65RQ==
X-Google-Smtp-Source: ABdhPJxWKW3AaOJQwkC6iKr2VdTaQ4Ug/eP67T3DupZkrcyYpkyTp8r3JNUSmK2Jgs3wQY4zwJEVb1iDQXK9NFiaXik=
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr31522519pll.132.1647408339183; Tue, 15
 Mar 2022 22:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220316052133.26212-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220316052133.26212-1-lukas.bulwahn@gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 15 Mar 2022 22:25:28 -0700
Message-ID: <CAPcyv4ita5JmK4noL0euebNgLDYYb6fmnDQZfksTr=FOqtqe+g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove section LIBNVDIMM BLK: MMIO-APERTURE DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linux NVDIMM <nvdimm@lists.linux.dev>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 15, 2022 at 10:21 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit f8669f1d6a86 ("nvdimm/blk: Delete the block-aperture window driver")
> removes the file drivers/nvdimm/blk.c, but misses to adjust MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> The section LIBNVDIMM BLK: MMIO-APERTURE DRIVER refers to the driver in
> blk.c, and some more generic nvdimm code in region_devs.c.
>
> As the driver is deleted, delete the section LIBNVDIMM BLK: MMIO-APERTURE
> DRIVER in MAINTAINERS as well.
>
> The remaining file region_devs.c is still covered by the section LIBNVDIMM:
> NON-VOLATILE MEMORY DEVICE SUBSYSTEM, and all patches to region_devs.c will
> still reach the same developers as before.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Dan, please pick this minor clean-up patch in your -next tree on top of
> the commit above.

Ah yes, looks good. Thank you for the fix up.
