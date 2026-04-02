Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7F346766
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124537; cv=none; b=MrFpieOCfUdHwlTTEg/g6dpUSWeRbSFp3uUAKvLyO+q39CrgV9quQtrAYEIV1CMB7TVDQ4wQM9HXYtNoMUNutVhBwMMibMnypA7EtKMkOfvrqkgI5ak5sdZwxpMazBd7F9i5W4Zn7IB99glg6LjFYXs7GwYrH0PxoKu3VO0z7vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124537; c=relaxed/simple;
	bh=0UYuKRY1ek8hAHTFZsXRVO8foDiBEoAdPtTWVJpEntQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=daBJVgAh7H4ulZ21LV82cM6xL6NpdZW4BcC1jV7eWO2nIiX5mECnbfStgKo6tAN3tcpI4JO38sdQjfhwgfd1nJsNfmAshs9sTbnWFMyDdiq49tFdESM2ur+hfRyKP3aHsyBs4CiUmaaB2VXa6dAk9hX98Ypc4wvnD3G7YAgJQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=OSOKA0Tv; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="OSOKA0Tv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Vuddfobx3o4qAnT25aJNC5cTP+Z8jpw/55ze3WWwcVc=;
  b=OSOKA0Tv90Jx2QFeZuNlq0LQ1uKO6R/LyfPEczDsf7ohJ78sGpoGWxjp
   Rt4XW7qVxGHxKqmMdAsGV1O+8zMNaeFMhtk03LVggjrvVNfN7uJyinRxm
   qNoNSmnzZVxK05c07wmjik7lIiAIBMGEh418lV1GLlxVR+N1yCAf/4SlZ
   A=;
X-CSE-ConnectionGUID: d8k6qxFZRoK1c9y2R4+lMQ==
X-CSE-MsgGUID: zvFiLe4iQ52iuSQnm1l14Q==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,155,1770591600"; 
   d="scan'208";a="143053274"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 12:07:42 +0200
Date: Thu, 2 Apr 2026 06:07:39 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Linus Probert <linus.probert@gmail.com>
cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
    Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: more potential janitor work: simplifying test for power of 2
In-Reply-To: <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com>
Message-ID: <d048659a-e668-98f8-46e7-ae870c8c917@inria.fr>
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca> <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com> <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 2 Apr 2026, Linus Probert wrote:

> I took a closer look at this. Many of the occurences here are actually
> used to check if a binary flag has more then one bit set. This is quite
> a common pattern.
>
> Eg. 'if (a & (a - 1))' would pass if a = 0b100, not if a = 0b110. Since:
> 	0b100 - 0b001 = 0b011 -> (0b100 & 0b011) => false
> 	0b110 - 0b001 = 0b101 -> (0b100 & 0b101) => true

If it's common, maybe there should be a function for it that properly
reflects the intended behavior.

julia

>
> The power of two check would 'normally' use the negation:
> 	'if (!(a & (a - 1)))'
>
> Just a heads up so anyone else reading this doesn't go blindly swapping
> out this pattern for 'is_power_of_2()'.
>
> You need to apply some thinking. No 'sed' work.
>
> Br,
> Linus
>
>
