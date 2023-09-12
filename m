Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80924CA0EF1
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Sep 2023 16:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236802AbjILQfw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Sep 2023 12:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjILQfw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Sep 2023 12:35:52 -0400
X-Greylist: delayed 466 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Sep 2023 09:35:48 PDT
Received: from out-219.mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A9A115
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Sep 2023 09:35:47 -0700 (PDT)
Date:   Tue, 12 Sep 2023 12:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1694536078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xAKCqRDHW+lPEAd+hDQsFbTfpENfjf47jiZ8XYV5zrE=;
        b=KkZIjbyxLo4mrQcQZ+yfNImzrOmyAmeWTxmkeOtqZ6g1y20pydPw8WtEmB941odcOulUf0
        RyXYi7uYbc+PyyaQyKpMukySB5KIrS1WkbbqyUos/M0VoV+ps/e1X+8fce90AhFRqHSqsT
        WYvZk+UostgNdQg1KWcmTHAUFv2TAbs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5][next] bcachefs: clean up some redundant assignments
Message-ID: <20230912162754.jcavjd7ezhsaeycl@moria.home.lan>
References: <20230912123744.3929609-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912123744.3929609-1-colin.i.king@gmail.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 12, 2023 at 01:37:39PM +0100, Colin Ian King wrote:
> Clean up some redundant assignments and variables based on warnings
> found by clang scan build static analysis.
> 
> Colin Ian King (5):
>   bcachefs: remove redundant initialization of pointer d
>   bcachefs: remove redundant initialization of pointer dst
>   bcachefs: remove redundant initializations of variables start_offset
>     and end_offset
>   bcachefs: remove duplicated assignment to variable offset_into_extent
>   bcachefs: remove redundant pointer q
> 
>  fs/bcachefs/btree_update_interior.c | 2 +-
>  fs/bcachefs/buckets.c               | 2 +-
>  fs/bcachefs/disk_groups.c           | 3 +--
>  fs/bcachefs/fs-io.c                 | 4 ++--
>  fs/bcachefs/io.c                    | 1 -
>  fs/bcachefs/quota.c                 | 3 ---
>  6 files changed, 5 insertions(+), 10 deletions(-)

Applied - thanks
