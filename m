Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF3528D837
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300868; cv=none; b=uMHMYNlUpgMUi2P7vX3kxHqj/bvg0Gi0OUOyUb1OMR3ncmlDA0NPbsTly+2cJN+MnSED5CRGYiRKhfeQPvWiuSlZZy1Y2M/rzfmEMmIMfyynDiFBRKaw4BH0S4mIRLzIyTr1cQV0gQ02wbSfVyjlgAHPqwwQxt7bXkmP4XkoebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300868; c=relaxed/simple;
	bh=YcQjGk3+SuEAzD1iqH8hWQiNKLwTlh5rrguNFMOSE0w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CQZNXpdgTgMWmJVA6kMu2CmPxKwwBCD0IgnZk6lZxKQ6cLI/KJgRbluO9Uk0hq/CHRxdIix69O2+ERrYbqUx6QdGPcgGNyWBUime0zjm+RnjCwXJ/M93Y/DRahb1cnQ7TChSctGVfpT2eG6FebDs2kh6RlwYrBO8Q0NNSuLcbOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=CUTXmFvt; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="CUTXmFvt"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 640F4240103
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 18:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1751300858;
	bh=YcQjGk3+SuEAzD1iqH8hWQiNKLwTlh5rrguNFMOSE0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=CUTXmFvtOUS6ON7nznJvlKQcBAwDAJgyPKo0npIgFwkoJ/I46iGHKXHXzYnU0VJiN
	 /xA31W7S076iC8fQB8CrddCAjkVt38qOtIpuGTNxFtzMZkqGLh3LXMnkJabkVeAV33
	 wuPI6LCoMFKWlhO98x6n6XXopSTSB09aSW0zsr+b5VomIOh5Gmmo6iCmqBF2d/I7mC
	 ynyO9MLKUejALg/+8rR2rX+NAcAMDldE4Oh1a5Bjo2pBR4yKQpqkLrE4vaef0O1Ja3
	 bvBI7G2A6ZR1DxfhPioc8QsmxksNvWRkesiMzcNxnDoCsStdPN901fURmrCslzgpBx
	 WisvZot2NTBRrvF3ByL7/qNcClyYf3WAfRosL9IqPaJX7tjkJoso9APp444j3nRUmJ
	 4ULfN1VLZ3w9i5D1Xv9esJLJ/bk5/m6FAT03v3yK5IQgtMaHBA5Ilkes9ww4MtqD+v
	 UlMOtfZc7rSLF2dH5JjCgZmNqO9XhXkA5kvNoPZjJg6Luw0MfCZ
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bWBQd2rFfz6tw1;
	Mon, 30 Jun 2025 18:27:37 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Ruben Wauters <rubenru09@aol.com>,  Kernel Janitors List
 <kernel-janitors@vger.kernel.org>
Subject: Re: I have a pile of potential janitorial work for interested parties
In-Reply-To: <84115bf4-bb53-3ebc-4076-5dae087fa4be@crashcourse.ca>
References: <ebfb23a6-def8-24a8-8958-28213a3c0da5@crashcourse.ca>
	<62bf7393f9314ff875e5eebf6575b72997a6fd2e.camel@aol.com>
	<84115bf4-bb53-3ebc-4076-5dae087fa4be@crashcourse.ca>
Date: Mon, 30 Jun 2025 16:27:36 +0000
Message-ID: <87sejhyz2f.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Robert P. J. Day" <rpjday@crashcourse.ca> writes:

> On Mon, 30 Jun 2025, Ruben Wauters wrote:
>
> ... snip ...
>
>> Hello,
>>
>> Thank you for highlighting this, I believe this is a good target for
>> cleanup, and I would be interested in any other scripts you have
>> that provide similar information.
>>
>> I am fairly new to linux kernel development in general, not having a
>> large amount of patches to my name, however, opportunities for
>> cleanup and janitorial work, while often neglected by other
>> programmers for larger features, still are important in my opinion,
>> as it creates a more maintainable and cleaner codebase, as such I
>> would be very much interested in any cleanup opportunities.
>
> I started documenting these potential cleanups here:
>
> https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
>
> so anyone who's interested can start processing whatever parts of the
> kernel source tree that interests them.

Hi Robert,

This is going to be very helpful to newcomers that are looking forward
to contributing to the Linux kernel.

Looking at your list, the tools are awesome and well-thought. But I
believe some guidelines can be put in-place for some, so folks can get
their patches upstream easily, and of course, have some confidence in
it.

One guideline that came to mind almost immediately is regarding the
tools "Calculating the length of an array" is that people should pick a
subsystem and send a patchset, i.e. do not send a massive change that
changes code under more than one Kernel subsystem.

This approach respects maintainer, and simplifies the review process.

--
C. Mitrodimas

>
> There will be more cleanup scripts coming over the next few days.
>
> rday
