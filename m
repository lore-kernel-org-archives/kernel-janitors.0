Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92FCC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Nov 2021 08:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhKVIzq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Nov 2021 03:55:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:59390 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238906AbhKVIzp (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Nov 2021 03:55:45 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234983988"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="234983988"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 00:52:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="739117842"
Received: from djcarton-mobl.ger.corp.intel.com (HELO [10.252.21.92]) ([10.252.21.92])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 00:52:36 -0800
Message-ID: <e0825c0c-1db1-7043-fdd7-9a7cc96d8db9@intel.com>
Date:   Mon, 22 Nov 2021 08:52:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915/ttm: Fix error code in
 i915_ttm_eviction_valuable()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Oak Zeng <oak.zeng@intel.com>, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211122061438.GA2492@kili>
From:   Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211122061438.GA2492@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22/11/2021 07:41, Dan Carpenter wrote:
> This function returns a bool type so returning -EBUSY is equivalent to
> returning true.  It should return false instead.
> 
> Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
