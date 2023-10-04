Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104ADE7B611
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 13:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242632AbjJDNWq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Oct 2023 09:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242582AbjJDNWp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Oct 2023 09:22:45 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 53FCF9E;
        Wed,  4 Oct 2023 06:22:42 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B50DA7;
        Wed,  4 Oct 2023 06:23:20 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71DC73F59C;
        Wed,  4 Oct 2023 06:22:41 -0700 (PDT)
Date:   Wed, 4 Oct 2023 14:22:39 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] firmware: arm_ffa: Fix spelling mistake
 "notifcation" -> "notification"
Message-ID: <ZR1mUM_nI8VDdnst@bogus>
References: <20231004080544.271040-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004080544.271040-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 04, 2023 at 09:05:44AM +0100, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
>

Thanks for the patch. The series is not yet finalise and I may have to fix
more things, so will fixup this as well as part of more changes to the series
before merging.

-- 
Regards,
Sudeep
