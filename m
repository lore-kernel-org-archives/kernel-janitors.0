Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3D9EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 12:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjGRMcX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 08:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjGRMcU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 08:32:20 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 801DBE56
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 05:32:18 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8DxfetQhrZkwr4GAA--.14844S3;
        Tue, 18 Jul 2023 20:32:16 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx7yNChrZkt0ozAA--.35783S3;
        Tue, 18 Jul 2023 20:32:15 +0800 (CST)
Message-ID: <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
Date:   Tue, 18 Jul 2023 20:32:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
Content-Language: en-US
From:   suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx7yNChrZkt0ozAA--.35783S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7urWxuF1UZFW3uF4kXw13trc_yoW8GFWDpa
        1xA3WYkrWDJr47tasrJFW0k3WSv3s2gryjga9rJan8C39rZw1IkFy5uay5CFW7ua4Uuw42
        qFs3Kay3u3ZF9agCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
        xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
        AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
        XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
        8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
        Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
        14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4s2-UUUUU
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,


Thanks for the patch.


The commit title generally should be 'drm/looongson: Add a check for 
lsdc_bo_create() errors'

not 'drm: loongson: xxxx'


On 2023/7/18 15:01, Dan Carpenter wrote:
> The lsdc_bo_create() function can fail so add a check for that.
>
> Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")

Please drop this Fixes tag,  because you patch just add a error handling.

Yes,  the lsdc_bo_create() function can fail, but this is generally not 
happen.

Even if the fail happened,  your patch is not fixing the root problem.


I know that you create this patch with the bare brain,

I would like hear more practical usage or bugs of this driver.

And mention more in the commit message is preferred.


> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
> index bb0c8fd43a75..bf79dc55afa4 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
>   	int ret;
>   
>   	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
> +	if (IS_ERR(lbo))
> +		return ERR_CAST(lbo);
>   
>   	ret = lsdc_bo_reserve(lbo);
>   	if (unlikely(ret)) {

