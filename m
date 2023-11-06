Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F912F41
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b="kRDUmg35"
X-Greylist: delayed 1246 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Nov 2023 11:27:13 PST
Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8BFD42
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 11:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1699297562; bh=pzVzu7Dwdig5Mo/00pVBUyLbnDBjl3/CZmR2am+Mu8o=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=kRDUmg35yCD+ztLKkQP0yqOJ9ngRorV5sLLfHHqO6WMr7hECpArm3ukXSZRQgxXhM
	 5ByRylBptMWhkSVZsb/gGGXgS+UVh0s+jpt8z009pQrmY6J719RM4QYU8y+s2xxNkU
	 z1q+Nclonvs1Azc4+StlxH31SD4YbCKMDh6prp1w=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Mon,  6 Nov 2023 20:06:02 +0100 (CET)
X-EA-Auth: kusI/K9/2vFZbosj6opuFTlRppRhSIp15kRkBtBWy8fzX1PimYFwzRDoiBSGEgsIv0QosBXzI+09K53Li6tVmwhnDuFWAptn
Date: Tue, 7 Nov 2023 00:35:55 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/damon/sysfs: eliminate potential uninitialized
 variable warning
Message-ID: <ZUk5E7WSgHCpSteb@runicha.com>
References: <739e6aaf-a634-4e33-98a8-16546379ec9f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <739e6aaf-a634-4e33-98a8-16546379ec9f@moroto.mountain>

On Mon, Nov 06, 2023 at 05:07:40PM +0300, Dan Carpenter wrote:
> The "err" variable is not initialized if damon_target_has_pid(ctx) is
> false and sys_target->regions->nr is zero.
>
> Fixes: 0bcd216c4741 ("mm/damon/sysfs: update monitoring target regions for online input commit")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Should this be a void function instead as the caller is not checking the return
value.

regards,
deepak.

>
>


