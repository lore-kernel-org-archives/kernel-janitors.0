Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987D5C00A8F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 08:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbjJXIms (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 04:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbjJXImn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 04:42:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342C810E3
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698136957; x=1729672957;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=UQdiKYKyo2nBA32v5OcQxzYIjrGmDvDUl+R4fWYg4ng=;
  b=BLWuN6/Am2mdNu6cqrCvf7M4OItwZ4CGFRhA3GkI5IJH+FHxyXDoAF9G
   FUxgPJUAX++7TLD8ATR/sDHJKdH6pSzcRNyRFR8sm6EeUvYgl6cYIDFBO
   AH1ujlNeiA+W18SNOVugCLqiG3PlW0O492ibABMB1rZ7DnqnLTYQktLl3
   ejOA/JtiaXlhc5mlNtuauRGRaGzpBa+A7goiRD0csuIGQD+T7RwPz4MZG
   Mr6PHGKsO+o8YiXdE/dpN6O3JSo6LBaGLMRe1MaCOSDdDKNwhipI4hih4
   Tl++ZTZqkS++qtWahJ+p+T8NNbb+NEshr3U7/HcapabhyKwbDv/eYuAxr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5636992"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="5636992"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793413970"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="793413970"
Received: from goepfrim-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.48.28])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:42:29 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     NeilBrown <neilb@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-Reply-To: <20231024072506.GC31956@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <169809755184.20306.3698252725424588550@noble.neil.brown.name>
 <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
 <20231024072506.GC31956@pendragon.ideasonboard.com>
Date:   Tue, 24 Oct 2023 11:42:26 +0300
Message-ID: <875y2wbedp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 24 Oct 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Get a better e-mail client ? ;-) At least with e-mail you have a choice
> between different clients.

Yup. What I see is excessive quotes collapsed, replaced with something
like this:

[ 18 more citation lines. Click/Enter to show. ]

All the actual replies stand out, regardless of the length of
quoting. Now it's just the Outlook style "quoting" without >'s that bugs
me...


BR,
Jani.


-- 
Jani Nikula, Intel
