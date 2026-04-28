Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54539A04A
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388510; cv=none; b=a6eE1c0WRrg1fZPLMLI4sYSz7Ps0zbngS4aYHJRzkuYtgFBelw4YF14VYqUlYTW1oSOFrfg0zoC19LoHfiYUIXNMboK7GTCeqLxWSzyGEVKHbo2chqsIqmDJnuAWJy9jBzt7dEEwseCuT+RZ54X8BmqiY42GBseq2XBfLzFrGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388510; c=relaxed/simple;
	bh=qJer4Z07xwMH+A78Ib0ymUPGWZ+mNnYVbTFhj6WGO5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9f3xPqVMG+Bxh4iMDHyirnymSc2p2hjL8BEefQIa89TMcbVyh3b/UuhJ22blxQQtX35H3ND1L2HO2cfHu2dqkuVO6Z98HnjpIbsJnNsdtU1lXGBiB8UU758sEEF8KQa+a8mZvgvXYYc5WCaZdAQ/PpU/xWeLCLHNpXOcmUIJPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcxKsGoH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcxKsGoH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1534998966b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777388505; x=1777993305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TD3g81YgYyk+ev+8kkfCadZc9PhNHKB3ZIvkWb2+QeU=;
        b=rcxKsGoHWww5RWld30JP429/9DnmUPbPhP9s3JQMZUZMVmGUxjM5+KOSZe8QH5h0M4
         P40o5OfuXgNeYLZEkVFho1l9yOmpk/31nNo3IClkrFSrhUgxgQFGg+xmRat1Iuwiebsb
         VBEQ7+6vYiyimISXAd40q1kdaEebwMMLHLytbN4auGL8LvjJr/5WwROUA2n5CRzDqNHY
         LL1j1XF0aaZZRwtZ4zBw88k9YQQ/2/P4GO23nKyIkXsxDZ3AYJdEL7uuj9GbSCCyPMHp
         v91nKIaDFoe6xFXyV2khgNX9oQtsff0NGoQL3Wtg1suJS9PwP9S8ynjE/ULHdNJijLXc
         T8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388505; x=1777993305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD3g81YgYyk+ev+8kkfCadZc9PhNHKB3ZIvkWb2+QeU=;
        b=OjeBWcC3XGMhAI50ZeOuZTwwvlYXuxzKDp2QXoxQTvj10AjUvmfS9d2qp9kZ+/KZle
         N5Q5SQGcPDbqq31vfh7qfYC67iTun1r+vBxhoA7thoUDAoDOQANZCp6t/BMZ/5Pe/g7K
         WdSqwm9Xf0RsSl0oLpRwrMm9M9W6RHQJ5kZsL1Jnat8hc9xHitxy2QdIAZGAXpVz1GJe
         ZKY5y7AVrfgceV/nta0a97tZ4/4fUI2BsFU1241HQqO+ci+l9TodKIQqKkF/8CK+RQo/
         Ur3RSsKPB4lh+FQvi/t4ouosmirXvu6k8kcBkjDoMhQiAZ9lH+jM3c8TGRhEXxKy+kt7
         hyoA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZNhaUcYZECrfObueZ/o9NbS4dI0p83oKaYpyYvzsbLVB1bLALHvoiCa9/C3NeW2f3TJY1NL6Ii54/HqcV+/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWEIV8DW5BXXXhcg7sDtmIbjTYv3jM55vMjF10bV3koB8a5PRD
	yoGFDSwO2CAOInZaAYfP0dzaD1XvEOBnXJ545tRnod/SdsEZ0xRzCH8B
X-Gm-Gg: AeBDieukVc/g6OsVtxVTW4HA5zjTESySAgqg41j21U+xF5TDmir6fML15mIyiIFU1Ke
	3/xu2q+LZPdjZ4jE5f2CEroXLz6gJTfn5CY4m3uaq/sOl69NxDV6mU9m+T/v6avCq1dEFNVSliE
	/OV8H5HarQdC38rAZ63UDBf/KVfVDeIw6ipWJOCTHMvsFeRBGTdY+eyI30ulSsyLexldn0IBuyd
	1Xz/VbYP4oXDMWgFBkdj1vCBSftbhNAyiUGQGmbvp8TUoR/7zOC3B9XyAFJqUwhQ/RFePMtJ22n
	HUAr2SiqbOzB3y+cN7Yoqj5iboXnjVfefT1O400DM2DDfMVt+CR9M65uAXFvLvFvoGWfxPZ5BmR
	tQ8g5WqVOHJauY51pbfuzMZa/Pl4ehMksR30ZOhS4prHhO5RND18QYLU/G/kkq2xNJ5xqWFPPg0
	VnDxsTH3Kug6TPmDndgGNk/1lTvLBb9F//SJWuSBrv
X-Received: by 2002:a17:907:3d45:b0:bae:70db:91f5 with SMTP id a640c23a62f3a-bb803e5c931mr212259066b.35.1777388504521;
        Tue, 28 Apr 2026 08:01:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm110829466b.48.2026.04.28.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:01:43 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:01:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Jakub Raczynski <j.raczynski@samsung.com>, netdev@vger.kernel.org,
	kuba@kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3 net-next] net/intel: Replace manual array size
 calculation with ARRAY_SIZE
Message-ID: <afDL02Z4QV6G0UxF@stanley.mountain>
References: <CGME20260428103757eucas1p132f3f1123fae21d596a51cbdce72c931@eucas1p1.samsung.com>
 <20260428103653.3539239-1-j.raczynski@samsung.com>
 <ef61b770-ebf4-406a-90a0-8a49aba02aee@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef61b770-ebf4-406a-90a0-8a49aba02aee@intel.com>

On Tue, Apr 28, 2026 at 04:06:48PM +0200, Przemek Kitszel wrote:
> On 4/28/26 12:36, Jakub Raczynski wrote:
> > There are still places in the code where manual calculation of array size
> > exist, but it is good to enforce usage of single macro through the whole
> > code as it makes code bit more readable.
> > While at it, beautify condition surrounding it by reversing check and remove
> > unnecessary casting.
> > 
> > Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> > Reviewed-by: Dan Carpenter <error27@gmail.com>
> 
> thank you,
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> 
> (next time use "iwl-next" in the title, no need to repost just for that)
> 

Which sub directories go through iwl-next?  I was trying to update
my script

> > 
> >   drivers/net/ethernet/intel/i40e/i40e_adminq.h | 2 +-
> >   drivers/net/ethernet/intel/iavf/iavf_adminq.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)

but look at these file names. There is no "iwl" anywhere in
the names!  :(

regards,
dan carpenter

