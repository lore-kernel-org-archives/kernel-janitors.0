Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30118053
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPwSMjcm"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF59121;
	Wed, 15 Nov 2023 04:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700052601; x=1731588601;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=17IQzIyHeOleBFfI3fNPQ5d6+A7WndaMjwIptCNyBm8=;
  b=hPwSMjcmi6taOPqLIywzfHmdo+QJwG6uzrMm+ruYt4Pq8CnAsXs/Luc2
   8wwIyDSt9N7pBwZBag3Kjhx/BvjZXvb/mIEi8aqVc5sbN3YgtE8/pOVLY
   tOYSFrzSPp2uPBkB6nEpigdod5uvSudvxsmpjL1lxxufj7vF5CXuY0sJs
   Rn+/jZI5NL0unH/CrmH4LY9pXoeULyMnITAEir2Jp/TUcGuiI1NKvopQc
   x4g8m17/eQyrV05YaMfCpcXm7qzoVmTT/ByCebjPsbSFC+cGJr+qbt3av
   tk72z8hJcG2SGffDjdXUCmDiVegRc5HI3/oT9cAv+F064d11r6TCx6J7b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="12417953"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="12417953"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="12776941"
Received: from rkhristx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.217])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 04:49:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Thomas Weißschuh <linux@weissschuh.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com, vegard.nossum@oracle.com
In-Reply-To: <20231113200742.3593548-1-harshit.m.mogalapalli@oracle.com>
References: <20231113200742.3593548-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH v4 1/4] platform/x86: hp-bioscfg: Simplify return check in hp_add_other_attributes()
Message-Id: <170005255094.3255.4578937371871843438.b4-ty@linux.intel.com>
Date: Wed, 15 Nov 2023 14:49:10 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 13 Nov 2023 12:07:37 -0800, Harshit Mogalapalli wrote:

> All cases in switch-case have a same goto on error, move the return
> check out of the switch. This is a cleanup.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: hp-bioscfg: Simplify return check in hp_add_other_attributes()
      commit: c5dbf04160005e07e8ca7232a7faa77ab1547ae0
[2/4] platform/x86: hp-bioscfg: move mutex_lock() down in hp_add_other_attributes()
      commit: 5736aa9537c9b8927dec32d3d47c8c31fe560f62
[3/4] platform/x86: hp-bioscfg: Fix error handling in hp_add_other_attributes()
      commit: f40f939917b2b4cbf18450096c0ce1c58ed59fae
[4/4] platform/x86: hp-bioscfg: Remove unused obj in hp_add_other_attributes()
      commit: 92c47597db7d8fb500a4b04ebd457ec7360279cc

--
 i.
