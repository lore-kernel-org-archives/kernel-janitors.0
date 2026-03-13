Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85BA3876B5
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Mar 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403821; cv=none; b=UztqGJMRCWGiFID0h7hPtLjfAARmGkNsScGCYFdj7XoJLHpdtPAW1bQ85j5xwVLBCzTnocRuAstPaZVkMf345GIioqy+rabvTIDOK672ZX6aFzC3+qR2WxCPTELw6rJdEogJjYSTrtPoxqY1BgpAuliYSptuhGFK1GpyIuV24Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403821; c=relaxed/simple;
	bh=iUY9fw00PMkW/aPYUqTQIW++JOgfh5OzeXtkQXqsTIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tCPuVo1JS1u34T2l+CCHZf3J50ADm5eZA16tt1bTp00YhULkcw6IFyUv7dsOrlh7rhCB4L/H7685HhbEm72sdZ5/81IODznc1Xaq7tIth4wCf4P38rIjJoCWphsfMymBXx4VTpVXfbPU26yyeKyll5Bv7FuNZdrdSLK/wl/LzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6jDwW5T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6jDwW5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB13C2BC86;
	Fri, 13 Mar 2026 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773403820;
	bh=iUY9fw00PMkW/aPYUqTQIW++JOgfh5OzeXtkQXqsTIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N6jDwW5T2OBMULne60rlIcPhVavQ1N9sydWI025O8fBjLcjHRWSLEuvPDza7bkiSe
	 jAkWcYMOvMJ7o43OCHr02Vku2lXdwHy3FWtu35Hh3n+mJrHjpm81bgaMhWNQcJ91dJ
	 wslCrXC72jdRIC/0/gTwAhou/ZxqZW603jV41QSVLkIwIiJEMk/hIa1mVjS+56k0dw
	 FPxDWI/Eu9Gk14BavgjpsvEgkG5FWOfD04vJZy4VLFB/bgTOX1u/A80Z2ZqClAWX5l
	 ZT7zH9scuCEbrkarQpzWXzEt864RG2S2GLhZ+5KaEk5/PSRv61fTkMI02TFQhdWIiI
	 MFb58696TqNtg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  kernel-janitors@vger.kernel.org
Subject: Re: [bug report] tests/liveupdate: add in-kernel liveupdate test
In-Reply-To: <aaLWBYzuFg3ZuVmP@stanley.mountain> (Dan Carpenter's message of
	"Sat, 28 Feb 2026 14:48:21 +0300")
References: <aaLWBYzuFg3ZuVmP@stanley.mountain>
Date: Fri, 13 Mar 2026 12:10:17 +0000
Message-ID: <2vxzcy18dj6e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Feb 28 2026, Dan Carpenter wrote:

> [ Smatch checking is paused while we raise funding. #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
>
> Hello Pasha Tatashin,
>
> Commit f653ff7af969 ("tests/liveupdate: add in-kernel liveupdate
> test") from Dec 18, 2025 (linux-next), leads to the following Smatch
> static checker warning:
>
> 	lib/tests/liveupdate.c:130 liveupdate_test_register()
> 	warn: passing zero to 'ERR_PTR'
>
> lib/tests/liveupdate.c
>     112 void liveupdate_test_register(struct liveupdate_file_handler *fh)
>     113 {
>     114         int err, i;
>     115 
>     116         liveupdate_test_init();
>     117 
>     118         for (i = 0; i < TEST_NFLBS; i++) {
>     119                 struct liveupdate_flb *flb = &test_flbs[i];
>     120 
>     121                 err = liveupdate_register_flb(fh, flb);
>     122                 if (err) {
>     123                         pr_err("Failed to register %s %pe\n",
>     124                                flb->compatible, ERR_PTR(err));
>     125                 }
>     126         }
>     127 
>     128         err = liveupdate_register_flb(fh, &test_flbs[0]);
>     129         if (!err || err != -EEXIST) {
>                          ^^
> || vs && bug.  This error messages will always be printed.

Seems like a legit complaint.

I suppose just print err directly in the next revision?

>
> --> 130                 pr_err("Failed: %s should be already registered, but got err: %pe\n",
>     131                        test_flbs[0].compatible, ERR_PTR(err));
>     132         }
>     133 
>     134         pr_info("Registered %d FLBs with file handler: [%s]\n",
>     135                 TEST_NFLBS, fh->compatible);
>     136 }
>
> regards,
> dan carpenter

-- 
Regards,
Pratyush Yadav
