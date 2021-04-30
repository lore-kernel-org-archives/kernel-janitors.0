Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B75C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Apr 2021 17:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D131613E8
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Apr 2021 17:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhD3RWs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Apr 2021 13:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhD3RWs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Apr 2021 13:22:48 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73DDC06138B
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Apr 2021 10:21:59 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id t17so42973609qkg.4
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Apr 2021 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+9rWhtzunmITNkfQzgdQCvmwXrSdrc+GU3FyMI5Hcyk=;
        b=EO7uIkj+DIIyYver4/uR9iKguEwe43MR0FbmUqyFoMGO9d2WeaJbu1oleFdgjXajqd
         6rXN5RjAcXefjtyDJBpDAxijTgOvGr5AqIwM+1+Ss4hYgCRmLwsNVd5UJ77uXKeBTCIy
         tIZ3hpUoCn9tnUvQILPwq+fYrqHYlFNSjZCUwAqvPUr/V9xDq75fMJnbt+V8iR0py5Ss
         c3zxEyg5OqDjaS7gmDGUK2/Ag3wCIrUpJzlS6CK1k64zKP9shiDXVlfJOunNCBVCwJTB
         rm6IMuy+BJkv2z8wfGmw153J1vZE25ijxlQ8ant3UDvOSm+owaN/C6mP3zoiBFQ903Ut
         40/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+9rWhtzunmITNkfQzgdQCvmwXrSdrc+GU3FyMI5Hcyk=;
        b=fcpJeSX9P7jvtgtNIe/Aoxh+4qKk1W7TnUFlPhyhI/nsc52xPbzxTcSe8fyiKbIlBe
         1fKBoA3m5XLSDNTpOpAyWyW0AV6AYkVCIPoII/k/McLTsf5Tndm8AZplzTFCMrdrT/Wf
         rxzOvFP4bdAGiNmNczJnNJJGEfLmPVTKhn0OnjEkhWt+PJVFr/h6+L+Q+uA4hfGrpowp
         Ae5wA2HFn8KqE/QlJsAmZCRIIzudeRaOEYFCQdEUJYMl3cVquKY+lYD8DqpiWntNW+X8
         eYFF4YkgDupEYlB1049f6iLm70lqVSGIQKntqtbf1sNERvnyeGANZn2lF71Kv5J9JddI
         FHqA==
X-Gm-Message-State: AOAM533pC4ml+/C3OwQ8dYoeziMlwW25r4XxgRGpsmT1M0m6N4yR83fc
        1+D+Jl/SthRbY8dRaOX5fJ/hLA==
X-Google-Smtp-Source: ABdhPJwkx9QpWa1xfdqzrQaKUH3PAUfZfzMWr5ByRllKLVC+0yrOcnaLbCpzYtDtGQbDKooEe+5HUg==
X-Received: by 2002:a37:a315:: with SMTP id m21mr6659955qke.106.1619803318922;
        Fri, 30 Apr 2021 10:21:58 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id o23sm1935582qka.16.2021.04.30.10.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 10:21:58 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lcWpx-00F0Op-9s; Fri, 30 Apr 2021 14:21:57 -0300
Date:   Fri, 30 Apr 2021 14:21:57 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kirti Wankhede <kwankhede@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] vfio/mdev: remove unnecessary NULL check in
 mbochs_create()
Message-ID: <20210430172157.GY2047089@ziepe.ca>
References: <20210429095327.GY1981@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429095327.GY1981@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 29, 2021 at 12:53:27PM +0300, Dan Carpenter wrote:
> Originally "type" could be NULL and these checks were required, but we
> recently changed how "type" is assigned and that's no longer the case.
> Now "type" points to an element in the middle of a non-NULL array.
> 
> Removing the checks does not affect runtime at all, but it makes the
> code a little bit simpler to read.
> 
> Fixes: 3d3a360e570616 ("vfio/mbochs: Use mdev_get_type_group_id()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Update the commit message
> 
>  samples/vfio-mdev/mbochs.c | 2 --
>  samples/vfio-mdev/mdpy.c | 3 +--
>  2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

There are problably several of these code removal oversights.

Thanks,
Jason
