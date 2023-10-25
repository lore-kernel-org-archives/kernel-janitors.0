Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80099C07545
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 16:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjJYQlw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 12:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYQlv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 12:41:51 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Oct 2023 09:41:49 PDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A78129
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698252110; x=1729788110;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=n1EgBmf+lXleYrrXsvueB3LRxOHeYf0SL1x84vpv0LQ=;
  b=a/koTpAzRukPygAy7e4K7X6MoXk6JHiRe96ZAo3a0K8xV4c6GZ2RXoY1
   q/3JPSZc4zjiu8/AMPW72DQ3m5FEbzANMVFNqrTmFnsL4NjKV2yRLlhgW
   v0qgTf35ul4NSA/olfGm7L4irE3md83CwYTWX7wAhW9hX9wL5RBM5rgF1
   zzwGi+8KYDKtyF0xhoUDzkUCynxlKgEL12WQh6+oTTwnIKYtFp7rTXlkg
   6SgOYc2j1+YzgysG6ZyyHJU/GhOJ0TwQlrj+WXkgNBYS/UZ4WAWclCqFt
   PzUbUJq26msbQjEAPz6s9EcKEacw/hPap8PqU2YbJvGcrzCi+X5uruyxL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="130854"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="130854"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762511557"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="762511557"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.33.83])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 09:40:44 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-Reply-To: <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Date:   Wed, 25 Oct 2023 19:40:42 +0300
Message-ID: <87fs1y8xkl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Oct 2023, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
>> Here we all are, brilliantly talented computer programmers who spend
>> our days making amazing fast digital devices do amazingly clever and
>> subtle things, inventing time-saving tools and processing vast
>> amounts of data without blinking, but for some reason we think the
>> task of skipping over a few thousand lines that all start with '> "
>> is too hard for us and that we should, in stead, complain to some
>> other human to convince them to make our life easier for us.
>> 
>> Does anyone else see the irony?
>
> So if I'm a brilliantly talented driver, it's OK for other people to
> drive on the wrong side of the road because I should be able to avoid
> them?

Nah, we're all brilliant car manufacturers that could have our cars deal
with the situation. ;)

The notmuch emacs interface has collapsed citations since at least
2010. I think Neil's point is, if we're all using open source MUAs, why
don't we scratch that particular itch and move on, instead of getting
frustrated by it year after year?


BR,
Jani.


-- 
Jani Nikula, Intel
