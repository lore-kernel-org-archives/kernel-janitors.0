Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAB9EB64DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 14:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjFSOIE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjFSOIC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 10:08:02 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAD4AB
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687183681; x=1718719681;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Z7JmNa7DLBrcbACOjFLzyo65LFtQS2huhGOQYnvrURI=;
  b=Z95Tks9mtg9QZrP+KyQG91IEmz5Gg7kJ0NU34uNMo69utI9uzlinQ2fc
   A5G4w3V7Gz82v3LJyiv4toYdwpxm1qSyNw9I7Nr+JEoqOXDxrdVjCwRcn
   YheInu1UBMxNap5bV+FWKFlQYkNCV1w59SoMIPCEZHN7LONv9wrNFTby2
   6YDJtwZ2FpwhqDq1y76jlws1ix4//deR1vpSKUgRm6DQ0SvkUngSb3RnY
   rULIgwRwIOAWj6fICZF33DExsw+l09jK2tWDErkz8JYqJcmCzR4mPlUIH
   G6WXlQN83ej5XaJkCMyFg5YUkdLiWTj/kB40tl8bF1v9l9+FVYqsI4cAI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339979211"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="339979211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 07:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="826590563"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="826590563"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.45.73]) ([10.249.45.73])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 07:06:24 -0700
Message-ID: <d8764556-b4d2-6896-9699-25abfe444f69@linux.intel.com>
Date:   Mon, 19 Jun 2023 16:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix a NULL vs IS_ERR() bug
To:     Andi Shyti <andi.shyti@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>,
        Nirmoy Das <nirmoy.das@intel.com>
References: <ZH7tHLRZ9oBjedjN@moroto> <ZH760GjGM+7XdTa5@ashyti-mobl2.lan>
Content-Language: en-US
From:   Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZH760GjGM+7XdTa5@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pushed to gt-next.


Thanks,

Nirmoy

On 6/6/2023 11:22 AM, Andi Shyti wrote:
> Hi Dan,
>
> On Tue, Jun 06, 2023 at 11:23:56AM +0300, Dan Carpenter wrote:
>> The mmap_offset_attach() function returns error pointers, it doesn't
>> return NULL.
>>
>> Fixes: eaee1c085863 ("drm/i915: Add a function to mmap framebuffer obj")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Thanks for this series of fixes!
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Andi
