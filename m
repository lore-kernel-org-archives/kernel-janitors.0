Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F010EC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Nov 2021 18:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239896AbhKWSus (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Nov 2021 13:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239889AbhKWSur (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Nov 2021 13:50:47 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A3DC061574
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Nov 2021 10:47:39 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id g14so96274825edb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Nov 2021 10:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKJrDfQmwKaC53bj2iHawRUpVnad+wbaQMjhFO5RDyA=;
        b=BtRqghgRFhUtoNOS+OOnBF8RzAgbmUSpkNjprtb4qFgZVgl8RJKGI4sW5b7Svcsb3k
         2IDgBK9w+bUYEkOcy2U4dO0mL865Er+SgF1I3ppCRoEFtvCk93SbYAfMXpJ1nxh0FIlM
         mKXCwU3D5yufMN1Y7gMYvt8RKB128jBlnsXu9qjzSC4/soJLngUtBe95Scl7vFjf0DrK
         A3nlIgRa7/+Jqmzp8tKbbiW4EN/MDwg+3sjQr0RgBt8aRQ/s8/92NskDPJpSz6NPdseW
         iR3QjDgMa4V7K2x/EIB05RrcwpXIPFjBiCZX72oigvKNo8Q/oVFOtWrnLEYS6qir+RQX
         Ty8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKJrDfQmwKaC53bj2iHawRUpVnad+wbaQMjhFO5RDyA=;
        b=XGeAiUG04hb1NWcYfe15PEdDXJeqMkkNeSCqv5/lBoRyWXtEslPIW9qyZY8iBdjhwi
         mAEqwJPip2d1oHoAlQc1yi3wfN7hfnUPhocxtsKTJZxpiDPPOq4/t3VrQ2ZmKYoy+Y3S
         yHhrvPcC30GIupGelaCDUMwt98PkE3fFPpmrcVBH9yghV67qWaO2OimgmpOJuYm0GMEA
         tIBZn/nP4WEAcb+Mrd+l1B2Yc8sxMzGUZLEUQvhIBUcajbBqIEaK+G057M62JZW0HIyh
         IgrKbG3oYGlup0mg82/7h5GSksFB2si0IGqf85JOJzfx0WVM2nC2rnWvk6QNH7W93Tn5
         w0ZA==
X-Gm-Message-State: AOAM530qxXfb9w5G91t+DO5Io5jKqfoLBbH2/GyY4u7DBhQ4lVpNzDJq
        oe7JKDiPyDXzBCEnIQb/VUQv8s2VzhyTmAt4DIpRzD2cblM=
X-Google-Smtp-Source: ABdhPJxDgvQbGh55arMTMvVVtGGMagNZkVz0+HZG7Jro3W6BzwdGTZ5kJmTH/FQ23iQpqvxdZHZroQyzUbbdqNziWiY=
X-Received: by 2002:a17:907:6d05:: with SMTP id sa5mr10579024ejc.246.1637693257678;
 Tue, 23 Nov 2021 10:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20211118111632.GE1147@kili>
In-Reply-To: <20211118111632.GE1147@kili>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Tue, 23 Nov 2021 10:47:26 -0800
Message-ID: <CAPaKu7RKuHNfy4ANqfCCVGMhrTd7y-kMpJvz+UP7U2o=i4OJbg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Fix an NULL vs IS_ERR() bug in virtio_gpu_object_shmem_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET AND BLOCK DRIVERS" 
        <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Nov 18, 2021 at 3:16 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The drm_gem_shmem_get_sg_table() function never returns NULL.  It returns
> error pointers on error.
>
> Fixes: c66df701e783 ("drm/virtio: switch from ttm to gem shmem helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I originally sent this patch on 19 Jun 2020 but it was somehow
>     not applied.  As I review it now, I see that the bug is actually
>     older than I originally thought and so I have updated the Fixes
>     tag.
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
