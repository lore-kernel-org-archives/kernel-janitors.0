Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D16E2F0C48
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136008; cv=none; b=WBRz1lueTjwQuvAICmc0wOV9nCeyUT48R+0l04YTU1nMMZXsPN/nUl/BZ/0QyVxHTC/y6UjqpF3/0Zzo9dFxVkI3e/ny0FRhpj2kXEhjUFoIh+AYr2O7/o+yGdvMDpAapH6bRuWp6tqPe8AUztvGkBqcCPg+nU5GFYNnNYZ5m3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136008; c=relaxed/simple;
	bh=y8m8HEfMgBzkldepBhmhfW3Emsfa0U8/3v7py8oBx3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=vF9v5i3MH9O/rh32BZK6keFvusmN1QU6+GfYIotwdGE216lX3pE33Lyk23f28rjmjXoHIdPLAKIOLGXEV2GAVLWM0OyUdmnGojr8olVgTzaYldO5FRYlHzGkPKNBYZRQ39y3TyQd+VhEAc76zbRS1PTeBH3tOPP9X5AR5vkxhU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=rV3uM3oL; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="rV3uM3oL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tbymz+XWuF8kEVjJt2hfW5h0j2f5diz5r2Ye/M8PHRM=; b=rV3uM3oLAr5F9An/Tg/MGYO6Ts
	1UbfpGxRyBQ5dONRxxjbzH9L8Pj7Zep0nRfEvlDUu6lzlq3lCA5XCuioa5WUevRi5e1PwfItVRIXX
	DuWIoy9wTBaB/qYvT0K7IU9HO+K0iQhlNRAG2RDAztyctvZeaS346MYvmWc273e3NxhPEqNE/KqPg
	+2ZJCfSvf8AOj4cpMJ6M3wtRli7fY81Thvjpg6c2eoeR874EJocDqnUzPjWbqOvRuWZXg4YIsbOhJ
	d4YEzkZHZr/LYxmyl59wBZDqcMS1A3qO4IO9gvTci3cqhrgzn9T43BWCNCuU8/2XmLvvn+H8q3Ha8
	9w7hpDaA==;
Received: from [147.129.179.166] (port=56220 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w8Hxr-0000000CTUg-3mt2;
	Thu, 02 Apr 2026 09:20:05 -0400
Date: Thu, 2 Apr 2026 09:21:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Linus Probert <linus@probert.se>
cc: Linus Probert <linus.probert@gmail.com>, 
    Julia Lawall <julia.lawall@inria.fr>, 
    Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: more potential janitor work: simplifying test for power of 2
In-Reply-To: <DHIOV1XVG37A.11HWRSCG0AD3G@probert.se>
Message-ID: <cbd3de85-f50b-7380-20c3-5c25476f06fc@crashcourse.ca>
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca> <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com> <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com> <d048659a-e668-98f8-46e7-ae870c8c917@inria.fr> <DHINFSQNG4ZT.JNZO5ZPRUMW5@gmail.com> <bcd30f78-7cbb-4284-dc18-302b549a00e2@crashcourse.ca>
 <DHIOV1XVG37A.11HWRSCG0AD3G@probert.se>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On Thu, 2 Apr 2026, Linus Probert wrote:

... snip ...

> I was asking and appreciate the suggestions. If you have more stuff
> knocking about I'm certain it will be appreciated by some of us
> neophytes.

  IMHO, i'll repeat that simplifying code that manually determines the
length of an array could be simplified based on
include/linux/array_size.h:

/**
 * ARRAY_SIZE - get the number of elements in array @arr
 * @arr: array to be sized
 */
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))

/**
 * ARRAY_END - get a pointer to one past the last element in array @arr
 * @arr: array
 */
#define ARRAY_END(arr)  (&(arr)[ARRAY_SIZE(arr)])


  there's *tons* of that all over the place.

rday
