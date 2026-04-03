Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1827B340
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Apr 2026 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254825; cv=none; b=odvvBm3MfAFKxY6SGJPt3h+Lt3tOWHJpMbclzp5HJEmNNj2yEouwKgoN7HrUmElnUBtxjjdB4nxIsp+OhiN0Jlo/jVheUM/ktYBGakpe7XrKVn/sO+4ojW7NUqIlrSRdIUnSfsKOjNpNcA8id2kJXTULIbdWq9xLzUvGebSND3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254825; c=relaxed/simple;
	bh=IjOZ0e2IPBWr6i8fkTEEbMSjslGjpRBm+WEwoe2B688=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lA+MdOP22GaTFF0yoz5kUsCauOp05R5Uhg6G+Pdoxr98XTEmeb+theKMdBEAhiDcgDtQhyJeUvB61eiB7h7kjO52V8I+xNY0Zr981K0yo5tbsPlwxVfolnNzJlC9AzZ7aSTXTuhZjFN+U3ucDXRWgYkb3Kezth4lnVjFLLhujHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=rolf.reintjes@web.de header.b=lNDV1eFB; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=rolf.reintjes@web.de header.b="lNDV1eFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1775254815; x=1775859615; i=rolf.reintjes@web.de;
	bh=wGCfcOqtJQU7B5WsFSBUd+45WxBQgnZXlTVcQYQhA18=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lNDV1eFBCf6pQ2aY1ncCF01FxFSrlW+KUy7lHELw1o56+xHfEMk5g8x41v7KoUI1
	 8+1agh4QXaWfbJTW3wgZqCF6caoin5fO9ecuwo8mIYic60Tnh0MlOVtsZPAq5sLlL
	 GuRszbJqyg86REzrZrHuBtdGkWxS7uGKaftL/97UQVCu9MqkP5npLHJc+0wcfH3fZ
	 1v4muDfb+qQeG2BfjHjskGjQKeSUdrfv3UaEaIMV8JgvvQyy8rNBt2irjiHTrXSDq
	 89ZzAWp7JIRHNuCs4VQ8oOEDYX+8Ror0jBUbiV9SJM0KVZ4r28/kXkYx8jJwYBC+h
	 LJANAnRT1J57QqY+lA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBB86-1wLOKX3BwE-009lFi for
 <kernel-janitors@vger.kernel.org>; Sat, 04 Apr 2026 00:20:15 +0200
Message-ID: <5f2579aa-324f-4ba6-a737-381ea22cfddd@web.de>
Date: Sat, 4 Apr 2026 00:20:15 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Status of kernel-janitors?
To: kernel-janitors@vger.kernel.org
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
 <acrhsqvXp4R-egW4@stanley.mountain> <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
 <245d14b-6f1b-1ece-a73-2021fabecd6@inria.fr>
 <DHJTVEP7FY8Y.1L1C3P9RYRR0L@gmail.com>
From: Rolf Reintjes <rolf.reintjes@web.de>
In-Reply-To: <DHJTVEP7FY8Y.1L1C3P9RYRR0L@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N3gSOcR4W8WQIN1NCe4RLmOiuqdWPip+Ua+vzn9VVMwYrZqK1ke
 U2CjFrWyJl4NY7n1N3XWRGjGOSUesfgPDdspDUQcZeLK4wLZO8CplqA1D1lUjHk6en1IIqd
 OLcAUBYVWv+tS91sZ6OFY7ETx2CWP+iwk7ytPF38Tw/elLoCs2JpzdVX2U4w2Vj2qWisGi6
 iTKRW6Nl+2qFWEWBH8p2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xwdnqWiIwak=;QMtQUNeIVNCUG6ZIc9UjEbD9Loy
 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
 pZW3yOcHUyw0ruRtuWvqAXs/rAILJ

Am 03.04.2026 um 23:12 schrieb Linus Probert:
> On Fri Apr 3, 2026 at 2:01 AM CEST, Julia Lawall wrote:
>=20
> [...]
>=20
>> You can use the get_maintainer.pl script to find out who could be
>> interested.  You could use the following options to avoid getting too m=
any
>> people:
>>
>> --nokeywords --nogit --nogit-fallback --norolestats
>=20
> Thanks. That's the command I've been using.
>=20
> I submitted it to the listed emails and it got merged.

Why did you not CC kernel-janitors-mailinglist?

Rolf


