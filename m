Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F2EC7EE29
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 May 2023 10:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjE2J75 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 May 2023 05:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjE2J7u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 May 2023 05:59:50 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB942A7
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 02:59:48 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30959c0dfd6so3006259f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685354387; x=1687946387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0RbtsRS6lbAOQy47hVSuc0QHPvxMe8cs0M24teto58A=;
        b=Ar8P7xtKnNKUt0knv8le9zAvdKRj27Cvtv7ZwbskI179t5uZMfOQhHuk592athm+ri
         ZdTuvunZryKu+Qpew7V2uBzZ1FpW+DpOJEVFHoc1hvyVz5uraOqDf4EtY0pciNcEWx8u
         8wF20n7Ea78TOuKaYZMa/v3q4/sc/0wofWPzeBqIe5kULcrKSy7OnWbyLw9MA514QeIB
         rjrNsUlNbnDOu92a7M5CxVt/z+k6uZDWcjPErmwFK+riwoOhk7O23NW4CT6abtK6SKSX
         IcusyAGkO/jI1UIidgzZbHYwLU53fjoDaSQk4VFtpuRjNW00fiFWLujq8yA9Ex+tBnF/
         eevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685354387; x=1687946387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RbtsRS6lbAOQy47hVSuc0QHPvxMe8cs0M24teto58A=;
        b=SfZpOf6DhkHAQofgAtgbmAJINRZsjj07zXBhzxTOnilsK+kxHGHkLPQyByhBm4uEXS
         p2iWSVb/juE8WjTkxqpc7/YLI4RmGRB7U/llgUMz98Ug2FW6K9COkLwQR//qMYeNldn1
         TF1018FKvrMEjuQJnlz9U6vgRGvQ9pHEjJWQIamAqM+QCy/jZ5oFMEElhEueWKV/fmFs
         RCcHhmVNa2c/ZTss7IJzi1QWHqfji7nyQW63Bvg0sYCR8iXdFa7CKRcyW8Sqr7cf2VUx
         o+F/HjP4MbZjYHkqL5JmBaKfRtAek8jwFfCluuJ8iI/NO6WMbhFMIgrSlZdPU2ko+YBF
         rfug==
X-Gm-Message-State: AC+VfDzyKQghgPwEF6ooqPm2LmjLFGz31zNkYM9x0pH2FEJmL0DKchUu
        Z6Ynj3cVLLZHPzjmEAWF41P9H5hc6lH3y43t3JQ=
X-Google-Smtp-Source: ACHHUZ6Fxfkt4PsVueAZ/VALeISHrqvtKqFYDfSWj7GtiFgGIcrwnSSR9flweNKYso6Ajst40PL9Qg==
X-Received: by 2002:a05:6000:1a43:b0:30a:dcba:2d81 with SMTP id t3-20020a0560001a4300b0030adcba2d81mr7785541wry.38.1685354387450;
        Mon, 29 May 2023 02:59:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d6781000000b002fae7408544sm13150275wru.108.2023.05.29.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 02:59:45 -0700 (PDT)
Date:   Mon, 29 May 2023 12:59:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Michal Simek <michal.simek@amd.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Tejas Patel <tejas.patel@xilinx.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: xilinx: Fix a memory leak in zynqmp_pm_remove()
Message-ID: <8355a10b-e365-485f-810f-0c3001a0406a@kili.mountain>
References: <93ef923496b6c45a0baa59458099aed3a20b771a.1685346792.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93ef923496b6c45a0baa59458099aed3a20b771a.1685346792.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 29, 2023 at 09:53:24AM +0200, Christophe JAILLET wrote:
> 'rx_chan' is known to be NULL here.
> Reverse the logic to free the mbox if it has been allocated.
> 
> Fixes: ffdbae28d9d1 ("drivers: soc: xilinx: Use mailbox IPI callback")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> 'rx_chan' may be NULL, but mbox_free_channel() handles it.
> Maybe it is more informative to keep a (useless) "if (rx_chan)" to tell
> that it may not be allocated.
> 
> 
> On my machine, compilation fails with gcc (Ubuntu 12.1.0-2ubuntu1~22.04):
> 
>   CC      drivers/soc/xilinx/zynqmp_power.o
> drivers/soc/xilinx/zynqmp_power.c: In function ‘zynqmp_pm_probe’:
> drivers/soc/xilinx/zynqmp_power.c:193:12: error: ‘pm_api_version’ is used uninitialized [-Werror=uninitialized]
>   193 |         if (pm_api_version < ZYNQMP_PM_VERSION)
>       |            ^
> drivers/soc/xilinx/zynqmp_power.c:187:13: note: ‘pm_api_version’ was declared here
>   187 |         u32 pm_api_version;
>       |             ^~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> I think that this warning is bogus and gcc is wrong.
> 
> But I don't know what to do with it :/
> Anyway, it is un-realated to this patch.

I bet GCC is correct.

Do you have CONFIG_ZYNQMP_FIRMWARE enabled in your .config?  This driver
can only be compiled with that enabled, but I've seen some of your
other patches depend on CONFIG_BROKEN so I think you're going outside of
the Kconfig rules.

regards,
dan carpenter

