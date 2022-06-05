Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBD0C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun,  5 Jun 2022 09:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350918AbiFEJ2T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 5 Jun 2022 05:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiFEJ2S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 5 Jun 2022 05:28:18 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41AE252BC
        for <kernel-janitors@vger.kernel.org>; Sun,  5 Jun 2022 02:28:15 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id e184so20913460ybf.8
        for <kernel-janitors@vger.kernel.org>; Sun, 05 Jun 2022 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJh7eAeTyEepHUjF+o8qLkBn+qnfxoHavWIpDTbWSw0=;
        b=AolG2yjW78mnNQ4SDucddB9ZTza8NrBHKiQXZ86Ddu/wkVpVR9IQ1xwnoST/aM/CAu
         FwpuMxqqBhsVYUTPhAjbD93mrBLXBUUWlh3Cux+oOpjXfi8cgLDMkGntrKT8HDNvzJ7b
         sW21PcQHdAmsv97YF/XrKlHvx4YsuI0iDIt470OmJEGdZ0RK2QeMMwPAmYl2fH5VlCu5
         8ujCZtSQaq6gEMLe0wN2t3yc7bxYyLYRBta1Daf0dCV8aEMOzHZdHYzxDB94raOgUagV
         577lYBcAmSBgOYKf3r6+I/MaOP7JLxxW3IMUhTnjYHCO8K0GHJAPMdRO5Gh0vsS+Q+pk
         XnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJh7eAeTyEepHUjF+o8qLkBn+qnfxoHavWIpDTbWSw0=;
        b=NJllxm2Gol9CjYgH9pDjX6pRTeuifbM33YH8qssat4lqDccXFeXmOM5Sv4ei0B1pC6
         6/NZbgTh+MKUnZlspit42tVLQL0CiHtiaN10Q/sNH09d+/IZXVHmdnx3qMZHdAMK2StF
         OvP4iVq/xYPW3XR6S5iDZru80fovK+2AwPmHzdBmxHalbaVDa8q0j/KOad2zgoyp3FrE
         wKMMT9XM0usEPRV3ezlpWBokkaM4YQflPTxYqaaRvium5RfaA9s9qexhleHl34aNVUbg
         g0fBp2jixUkCu8jpLwrVx2f+KgS9cNmm55T8X2bW4/bfPrVfFxR6pDHbiC0fGHqKlPin
         mflw==
X-Gm-Message-State: AOAM532AJix7InjqtSXDZhFD9zwJSA7BlDK68asausYVO0MhfaF+E32D
        W9oAmMvt2fVEqLRy9HewpAZu7cs1jnzzh68oewN1Ws19AfcAvA==
X-Google-Smtp-Source: ABdhPJxIpu+7nOnKCvQNuCGSo6KkrZDGKZH81SL5cAItz4zO8CGHm6Onr+mogj4WaKNEmJp49qMEM7j7/4rIaIpe4iI=
X-Received: by 2002:a05:6902:514:b0:65c:b28c:f9f8 with SMTP id
 x20-20020a056902051400b0065cb28cf9f8mr18824365ybs.403.1654421295079; Sun, 05
 Jun 2022 02:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <Yo9InUoXy3ISDQUd@kili>
In-Reply-To: <Yo9InUoXy3ISDQUd@kili>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Sun, 5 Jun 2022 12:27:48 +0300
Message-ID: <CAFCwf10n4N_BQVngXeL4eb-SHxXSmbnxfKOQTLUsb62DdS=2cA@mail.gmail.com>
Subject: Re: [bug report] habanalabs: add gaudi asic-dependent code
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 26, 2022 at 12:30 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Oded Gabbay,
>
> The patch ac0ae6a96aa5: "habanalabs: add gaudi asic-dependent code"
> from May 11, 2020, leads to the following Smatch static checker
> warning:
>
>         drivers/misc/habanalabs/gaudi/gaudi.c:5568 gaudi_parse_cb_mmu()
>         error: 'parser->user_cb_size' from user is not capped properly
>
> drivers/misc/habanalabs/gaudi/gaudi.c
>     5526 static int gaudi_parse_cb_mmu(struct hl_device *hdev,
>     5527                 struct hl_cs_parser *parser)
>     5528 {
>     5529         u64 handle;
>     5530         u32 patched_cb_size;
>     5531         struct hl_cb *user_cb;
>     5532         int rc;
>     5533
>     5534         /*
>     5535          * The new CB should have space at the end for two MSG_PROT pkt:
>     5536          * 1. A packet that will act as a completion packet
>     5537          * 2. A packet that will generate MSI interrupt
>     5538          */
>     5539         if (parser->completion)
>     5540                 parser->patched_cb_size = parser->user_cb_size +
>     5541                                 sizeof(struct packet_msg_prot) * 2;
>     5542         else
>     5543                 parser->patched_cb_size = parser->user_cb_size;
>     5544
>     5545         rc = hl_cb_create(hdev, &hdev->kernel_mem_mgr, hdev->kernel_ctx,
>     5546                                 parser->patched_cb_size, false, false,
>     5547                                 &handle);
>     5548
>     5549         if (rc) {
>     5550                 dev_err(hdev->dev,
>     5551                         "Failed to allocate patched CB for DMA CS %d\n",
>     5552                         rc);
>     5553                 return rc;
>     5554         }
>     5555
>     5556         parser->patched_cb = hl_cb_get(&hdev->kernel_mem_mgr, handle);
>     5557         /* hl_cb_get should never fail */
>     5558         if (!parser->patched_cb) {
>     5559                 dev_crit(hdev->dev, "DMA CB handle invalid 0x%llx\n", handle);
>     5560                 rc = -EFAULT;
>     5561                 goto out;
>     5562         }
>     5563
>     5564         /*
>     5565          * The check that parser->user_cb_size <= parser->user_cb->size was done
>     5566          * in validate_queue_index().
>
> We are looking at cs_ioctl_default().
>
> This comment is wrong.  There is no check for this in validate_queue_index().
> There is a check in get_cb_from_cs_chunk() but that function is only
> called when is_kernel_allocated_cb is true.
>
> I feel like we should check if "chunk->cb_size > cb->size" on all user
> input.  I think it is required.  But even if it's not, it would make the
> code easier for Smatch to understand.

Hi Dan,
The code is indeed confusing due to the move between common and
asic-specific code.
But actually we are protected, because you will never reach gaudi_parse_cb_mmu()
if the CB was not allocated by the kernel.

The reason is because for Gaudi, we only parse CBs that go to what we
call "External Queues",
which are assigned the queue type QUEUE_TYPE_EXT.

If you will look at validate_queue_index(), it assigns the
is_kernel_allocated_cb property based
on the queue type. The logic there is a bit complex because it is
dependent on the queue
properties, but what happens is that if the user submitted a work for
an external queue in Gaudi,
is_kernel_allocated_cb will be assigned "true" in this function.

And that will cause the get_cb_from_cs_chunk() to check the size. And
in gaudi_cs_parser(),
we only call gaudi_parse_cb_mmu() if it is an external queue (In Gaudi
a queue is either
QUEUE_TYPE_EXT or QUEUE_TYPE_INT).

So the comment is wrong and I will fix it. But because this is the
data-plane, I prefer not
to add an additional check. I hope this makes sense.

Thanks,
Oded

>
>     5567          */
> --> 5568         memcpy(parser->patched_cb->kernel_address,
>     5569                 parser->user_cb->kernel_address,
>     5570                 parser->user_cb_size);
>                          ^^^^^^^^^^^^^^^^^^^^
> Otherwise *boom* user controlled buffer overflow.
>
>     5571
>     5572         patched_cb_size = parser->patched_cb_size;
>     5573
>     5574         /* Validate patched CB instead of user CB */
>     5575         user_cb = parser->user_cb;
>     5576         parser->user_cb = parser->patched_cb;
>     5577         rc = gaudi_validate_cb(hdev, parser, true);
>     5578         parser->user_cb = user_cb;
>     5579
>     5580         if (rc) {
>     5581                 hl_cb_put(parser->patched_cb);
>     5582                 goto out;
>     5583         }
>     5584
>     5585         if (patched_cb_size != parser->patched_cb_size) {
>     5586                 dev_err(hdev->dev, "user CB size mismatch\n");
>     5587                 hl_cb_put(parser->patched_cb);
>     5588                 rc = -EINVAL;
>     5589                 goto out;
>     5590         }
>     5591
>     5592 out:
>     5593         /*
>     5594          * Always call cb destroy here because we still have 1 reference
>     5595          * to it by calling cb_get earlier. After the job will be completed,
>     5596          * cb_put will release it, but here we want to remove it from the
>     5597          * idr
>     5598          */
>     5599         hl_cb_destroy(&hdev->kernel_mem_mgr, handle);
>     5600
>     5601         return rc;
>     5602 }
>
> regards,
> dan carpenter
