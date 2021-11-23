Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CE6C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Nov 2021 05:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhKWFPe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Nov 2021 00:15:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:54960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhKWFPe (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Nov 2021 00:15:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 984C660187;
        Tue, 23 Nov 2021 05:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637644346;
        bh=IOi3LpYHRx+AqFlelm4zkAj9U2aMtP9t0FQcAPywn+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tzR368KGl1G3gWucr/5fTG+kd4RDR9xLo2ES2QH912nA7iHqmBcT/6EfS7PWeYwRN
         LSLjRDLQ+tr8wHy4WH7znt9+BKaxuGprIlj00m1rD0u53dTVKenKgVETSsmhEvbuaq
         RuLmdjHTl6y/N5PCRTjbNcXLD4wpsjKX3249WPlUDmpFDarAfgoRLsglh1ey1UV9KK
         xQuc3rtFixNgNSE/fRPgpdfVzCQVSQO8xAGwPnotEsbrm5nIILl1dLzKYmq7D0nKkT
         qLl/RR6JL1m8uKB+jCsudRqK9ZFomOzvq796/Kdd2lIVqmxra983SF4kHdqgF26UyS
         6hB5xDNJiTOqw==
Date:   Tue, 23 Nov 2021 10:42:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: HiSilicon: Fix copy and paste bug in error handling
Message-ID: <YZx4NYCB7o9yYXkY@matsya>
References: <20211117074843.GE5237@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117074843.GE5237@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 17-11-21, 10:48, Dan Carpenter wrote:
> This should check ">pmctrl" instead of "->sysctrl".  This bug could
> potentially lead to a crash if we dereference the error pointer.

Applied, thanks

-- 
~Vinod
