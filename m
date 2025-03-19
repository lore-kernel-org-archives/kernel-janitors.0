Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621AC1DE89C
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401658; cv=none; b=bIOoYBvpXy05ZAWWg4h7F3TMLCdx+QexiC1PbvUVlBPf8VJQBs8hZGb2jp2VU1R0j4CuPtWAS8Ssn1HzuknjYh8/zedIcqBshC+0/r3RFpPuIY8g9A69ZxWcnsNs5eyv2xHw50icz8AyeNFRQdoNSO62hzyyEGXJS6CWVclw59U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401658; c=relaxed/simple;
	bh=861KZ/v/MNaCvdfgulmkMSG+2pyydvhoHYZdDNeaHVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEuFjItikHdc3v1BzFjcCIo/xYNR2egostgMSZCG2nAIvNvx7DOYfwRu9TPdbrQesSQ2LKLyr4KWD0Ns46c4dNEfFbPYyJrwTpXWm6if3Ea9W0ruUB7BmFxvpJZHTUfzDz96kYx3W+BPGG6qQCKpEcRahlYs+Vjpmb1werUUuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Q/JguylS; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Q/JguylS"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47686580529so59090601cf.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742401655; x=1743006455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZQzSC8a1gBcckIEyeBizPuOhyfX7HkjAwSrwZqw84Y=;
        b=Q/JguylStbewD2Mnb2WGx6pCH1LmogARij2+Fv071o/HqUrtjSKgTFcniXOJRVi0zm
         kfAQShYWxZxDqhQYUxf58cyr9Hqud2zxaeLsMAyxa8GpU/c8spJFiVtOljbfZs3JrRqP
         E2MJPkbNCp7G+gHOfp2nf3vQy8O26xnUXSD+JO8mhzMJp74P6tofMvn2ApHiaYvrBUwE
         BfmrMuJ5d32Imvm+mQWLwpEK5x4dcvzOsc/ffHvhJlmbPk1ZDRmsLHoChryZwJmo+VL8
         t30YAR2SYC0/8uCktd+1YP5iT2BMgpOS/X/a24LdIaWuDs4BrvNXI8LxDrO7RdVVnbMJ
         t5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401655; x=1743006455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZQzSC8a1gBcckIEyeBizPuOhyfX7HkjAwSrwZqw84Y=;
        b=RUPAOxF0OtXyCkPesCKg5qelgo25+dUbKc+5CooT5WjyU/57FKWsVZ5kcxSsULtPfr
         +gEicQaSBPx+AQlotFTrQkv9okX0d960kHA2w6dpO0OAopcPVLgnBYG0vkIDFNTo4u6c
         rRu1DhrfP8bCmKNNGD2qldq58DUsUoTueEZXMDYOdDJNz+sJCyEmilXuiPjZPCZA10Cn
         p581h1GGmrYOeUwgIBQ/sYau9VlvSUsiyCFFRbkDuhUpv3jK5mmk1xdGq8N3fJUEcv5A
         o8UObC/xCbrQ1rctsz20H69FZYa1ZL8PweMOPf6MOwpDcc+K0101sLju3iMRkAOzBlD/
         2wlA==
X-Forwarded-Encrypted: i=1; AJvYcCUdKBxd/rvJX8Te98wUeQvHf6aQUlIGsqBRJC+kXbEYc0i9eU/3yROkmqyNV60s1F2SnUr4DX0s+q4QEsWaNaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//873TxqoNEHmqAdnz1GNEImRRzvuu0nyimbtVM9ECRfXoRU9
	WVNVC2Cf3Oz8zf+oXddys6VwvEOqfo4JtnRxLuv+Kl56GfUqrAtG0tJYqf9VVKU=
X-Gm-Gg: ASbGncvbgpeFOlCzWJsFQOq+JM94X2/88c8lhbiJSz/KFfrnSEVC5+xfW0UKc6XrqsG
	jVRn7t9l0Ec6Zc0vDEWEfTRzH9z0E+9pi0NBqGwQCaAK3KYZeukDocWY7ulE74c1vVe8b3SxZAt
	XQ2cH1uY8cQkBpXUNFNOSxI0HO/JYP4G36ig0WsyccF15ILC6Q44bDcbXG7ZTaoKzE7uVjTk2u3
	pW2EnGDsRsEdfUyM/x85ANR6YAAdIlNVmWGJRFqG/Lq7c63lgZHtoHadwbQQQhdCc4Loc7Iw37X
	j+EwTzQZjl1VE6G9U2xEokbXIbcjM0GERcsdZzFLkbIN+vdYn2chfOc9kYu1eazEhvfNqAJk0U+
	dz8nB3sB0Wtln5b4VwA==
X-Google-Smtp-Source: AGHT+IHPt9cwLnClhhTzeAYHEY3JKm4ml3GTboDl8SFxdRoEZ9M5TgGWgwNpQwQACershsnWxLdGjA==
X-Received: by 2002:a05:622a:2b48:b0:476:8db0:8caf with SMTP id d75a77b69052e-47710ca8e23mr1951951cf.1.1742401655076;
        Wed, 19 Mar 2025 09:27:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb63baabsm82354151cf.28.2025.03.19.09.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:27:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tuwGU-00000000Vpp-03X3;
	Wed, 19 Mar 2025 13:27:34 -0300
Date: Wed, 19 Mar 2025 13:27:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Nelson, Shannon" <shannon.nelson@amd.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] pds_fwctl: Fix a NULL vs IS_ERR() check in
 pdsfc_validate_rpc()
Message-ID: <20250319162733.GE10600@ziepe.ca>
References: <925355aa-c98b-4fa7-8e49-b97f6d551a86@stanley.mountain>
 <b9f49f34-1a69-41bc-8324-2e969e53f9eb@amd.com>
 <f391dc76-946f-45c2-af81-a5cb107ec783@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f391dc76-946f-45c2-af81-a5cb107ec783@stanley.mountain>

On Wed, Mar 19, 2025 at 07:26:10PM +0300, Dan Carpenter wrote:
> On Wed, Mar 19, 2025 at 09:18:31AM -0700, Nelson, Shannon wrote:
> > On 3/19/2025 12:06 AM, Dan Carpenter wrote:
> > > 
> > > The pdsfc_get_operations() function returns error pointers, it doesn't
> > > return NULL.  However, the "ep_info->operations" pointer should be set
> > > to either a valid pointer or NULL because the rest of the driver checks
> > > for that.
> > > 
> > > Fixes: 804294d75ac5 ("pds_fwctl: add rpc and query support")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Hi Dan, thanks for this patch.  We also have this same fix in the patchset
> > update that I was expecting to push out today, but you beat me to it.
> > 
> > Shall I continue with our v4 patchset, or should I now be sending smaller
> > patches to update from earlier review comments?
> > 
> 
> I don't track how these things are merged.  If you were going to fix
> it in a v4 patchset then just ignore this patch.  Typically in that
> case you would fold the fix into the patchset anyway.

Right, please just send v4 and include a fix Dan's report.

Thanks,
Jason
