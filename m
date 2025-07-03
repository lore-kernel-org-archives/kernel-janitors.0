Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF9D25A2AE
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Jul 2025 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560989; cv=none; b=JSnBXPNNRuz9HBDjA9N03GaJxDTt9YUkn2fm1nMbPbnqgQRKiVZCrNnGCwjwOrbq0b2WrfxOiDTJFy/9fsMtmI77sd09ZUfbDRTO72Txrc+MH1cKXtYaXZDdeR7G7HmO5KyL+r65CA5WGBhm6ODL09ZLwoHpB/f7YVmblK+NSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560989; c=relaxed/simple;
	bh=IJmvC1WE65wDra6Mxg60BHj9jq/Xqmbig6giqMnxNlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLHB6jy9SLt9O6WFF8+QeSXqz8GqZguWFd5hvuGUBa6tvo/EUe04rJ0+PXiwirv+/PZn4/gRTGcUyRTFWG5PqQxsbfMC3EMCeMzNWZp2mLUKnAfPrqqi7mGP8798RVxEjVN3I0YtuYh4YanGP3YNbDIABgkN5/n9Na3mepmwEJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ZMwz6rbk; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZMwz6rbk"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XN1Vuww888jLiXN1VuSjhE; Thu, 03 Jul 2025 18:42:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751560978;
	bh=5sCmq3La2lku2rpcqaSbKvRAxAH71sKkQ6WwhLQt5aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZMwz6rbk+dLLS3c1nj0WU6AaZwS5OL3luePtxELt00iOoQGuS2tPGtLWuxUJtNQh1
	 GCKVgVbKlpyGLI0zKh4mABSAWC7WDx8fGIouVQMF7/E4MrSn++VfIXjf9ID+7D/KpW
	 EhEVea8vBObzJ6O44A7KZ+JjHHzj38QsW73lIZbXlrg7Y3wpPGXgNoAG/4rFAPoVbx
	 egOZHSCbeo6cULu90TvjZZgECt6U0y2bws+NVxEuH83CNg3YQ7k/hfvyZCmj/JTeBy
	 KXIZZToJRvPKyKMr8cHPYienwpWksd3j50CdUnjt+pKni4H7odzKCMYT9aiGRkaU+H
	 8gj509XcTij2g==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 03 Jul 2025 18:42:58 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <d29b54e1-b31b-4f8c-8c8d-8b3df8ebe2e7@wanadoo.fr>
Date: Thu, 3 Jul 2025 18:42:57 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Janitor resources/organisation
To: Ruben Wauters <rubenru09@aol.com>, kernel-janitors@vger.kernel.org
Cc: "Robert P.J. Day" <rpjday@crashcourse.ca>
References: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel.ref@aol.com>
 <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/07/2025 à 19:13, Ruben Wauters a écrit :
> Hello
> 
> With the introduction of Robert P.J. Day's janitor scripts, the kernel
> janitor mailing list seems to be receiving more activity now.
> 
> I wanted to ask about resources. I know there is a page for kernel
> janitors on the kernel newbies project page located here:
> https://kernelnewbies.org/KernelJanitors
> However, the above page appears to be quite out of date, and I'm unsure
> how relevant the listed todo items still are.

Hi,

This is mostly dead, but would fine it useful for new-comers if kept 
up-to-date.

> 
> There also seems to be a google code page? Google code of course no
> longer exists, so I am unsure what the relevance of it is.
> 
> Overall based on activity of the mailing list it doesn't seem like the
> kernel janitor project is pretty active. I personally think it is
> important however to keep the codebase maintainable, and I do also
> think that common resources, techniques etc should be documented
> *somewhere*.
> 
> As such, I wanted to ask if there is a common point of documentation
> that I do not know of, or whether the newbies page is still the best
> resource for it.

https://github.com/coccinelle/coccinellery is not active at all, but 
most of scripts still work and may spot interesting things.

Great source of inspiration for someone wanting to learn/use coccinelle.

CJ

> 
> I do think the recent scripts (as well as any other relevant scripts)
> should be linked somewhere "official", as they seem incredibly useful
> (I've already sent a patch replacing a removed Kconfig option with the
> proper one that was missed when the original one was removed).
> 
> I guess in a way I'm wondering as well on the organisation of the
> janitor's project. Is there a leader of the project? maintainers? It's
> not exactly a subsystem so it may not make sense, but it does also seem
> like it'd be good for newbies if there were people to flag what should
> be done or what might be worth investing time into.
> 
> Sorry if this is a bit incoherent, it's a bunch of thoughts I had, I
> think for me the janitor project is probably worth a lot of my time so
> I wish to get involved a lot more.
> 
> Ruben Wauters
> 
> 

