Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F547EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 17:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjGRRhX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 13:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjGRRhT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 13:37:19 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4620B19A8
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 10:37:13 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8AxuerHzbZk2uAGAA--.8098S3;
        Wed, 19 Jul 2023 01:37:11 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxX8+5zbZkMY0zAA--.10465S3;
        Wed, 19 Jul 2023 01:37:10 +0800 (CST)
Message-ID: <19d4b8a1-bbfe-c887-2edf-7fa57f4370a1@loongson.cn>
Date:   Wed, 19 Jul 2023 01:36:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>, conduct@kernel.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
 <90d22f14-c912-42f0-bf33-eb4297fe9fa8@kadam.mountain>
From:   suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <90d22f14-c912-42f0-bf33-eb4297fe9fa8@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxX8+5zbZkMY0zAA--.10465S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1fGr4fGw13Gw45Kw48uFX_yoW8XrWfpF
        s3Gay5tFZ8Jw40vr1DtrW2yFWSqw4DAFWjgF1xKw1ruF4qqryvqF4Sgw4ruFy7urs3uw1j
        qrWrua4Iv3WvyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
        Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
        Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
        Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
        CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
        6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
        v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
        xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uuWJUUUUU==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,


I still remember you are helps to review the drm/lsdc patch one years 
ago, see [1].

  drm/lsdc is the former version of drm/loongson,  originally drm/lsdc 
are embedded SoCs of Loongson.

[1] https://patchwork.freedesktop.org/patch/471997/?series=99512&rev=5

I haven't forget about you.


On 2023/7/18 21:59, Dan Carpenter wrote:
>>> Even if the fail happened, your patch is not fixing the root problem.
> What is the correct fix then?


lsdc_bo_create_kernel_pinned() is intend to be used when you do the self 
test (cat benchmark)

which is using to testing the hardware bandwidth via debugfs.

Another potential usage is to implement built in fbdev emulation.


I admit the error handling is necessary, but it's a kind of costuming.

To be honest, I have also post similar patches to other DRM drivers.:-)

So, that is okay.


But let's back to the technique, when the kzalloc() fails, who will 
survives?

If the the kzalloc() fail, then I think the implement of kzalloc() 
should be blamed first.

while developing this driver nearly about two years, it rare happens.


For my drivers, kzalloc() fails is one sort of error,

lsdc_bo_create() could fail when no enough VRAM is another.

The  dumb_buffer test if IGT would helps to probe such failures.

But this is a kind of limitation of the hardware itself.

Its a resource limitation, even the drm/radeon could probably fail.

So, How does your patch could resolve the root problems that caused by 
no enough resource available?

