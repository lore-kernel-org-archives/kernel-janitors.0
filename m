Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74136495A
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135083; cv=none; b=tmlLhLWiROAv47zeAZB7ZXW3PNGkOb0nH1Ng+edYWu3r2ybpGECwFFz8XoYBm3CfkGP2gMI1j7zLlvePSA9pGwhIR3jwpDlxAUMDhj8lO+GDfGCttwiaN/o1GshnAkSutDTNv39H0dylipvJZTEqsGBPWq2Mid1jjKAQ84qp7/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135083; c=relaxed/simple;
	bh=WLCRWLhY5YEcvDSyKbxU9qTXlTRzeU5oITtPKgrf5Io=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Gx8YIxr3CuqiVPXVVt5Jq15YKrF30vsmRxJ1Dz2+AiVWSvenEzabyLGf1ed5dInu4qOf+jo/T2CaeZanUysLbt4zshsg7f8vMT7cAQgUKknj5w6wpBHReOYynkfDSS3Rdytk4/b9j9ObqVF9LTzNlPxoN/UlOsYhKYeJzgMY/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=probert.se; spf=pass smtp.mailfrom=probert.se; dkim=pass (2048-bit key) header.d=probert.se header.i=@probert.se header.b=TK4rxmdA; arc=none smtp.client-ip=93.188.3.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=probert.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=probert.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=probert.se header.i=@probert.se header.b="TK4rxmdA"
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id B1AEF559067
	for <kernel-janitors@vger.kernel.org>; Thu, 02 Apr 2026 15:04:33 +0200 (CEST)
Received: from s981.loopia.se (unknown [172.22.191.5])
	by s807.loopia.se (Postfix) with ESMTP id A14445598D5;
	Thu, 02 Apr 2026 15:04:33 +0200 (CEST)
Received: from localhost (unknown [172.22.191.5])
	by s981.loopia.se (Postfix) with ESMTP id 9E8CC22B17DF;
	Thu, 02 Apr 2026 15:04:33 +0200 (CEST)
X-Virus-Scanned: amavis at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s473.loopia.se (amavis); dkim=pass (2048-bit key)
 header.d=probert.se
Received: from s980.loopia.se ([172.22.191.6])
 by localhost (s473.loopia.se [172.22.190.13]) (amavis, port 10024)
 with UTF8LMTP id 3mwRvq04uGqF; Thu,  2 Apr 2026 15:04:33 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: linus@probert.se
X-Loopia-Originating-IP: 94.191.136.33
Received: from localhost (94.191.136.33.mobile.tre.se [94.191.136.33])
	(Authenticated sender: linus@probert.se)
	by s980.loopia.se (Postfix) with ESMTPSA id DDC8722016D2;
	Thu, 02 Apr 2026 15:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=probert.se;
	s=loopiadkim1707418081; t=1775135073;
	bh=J1WYDNty3yyt3Rb7/WyRST1MJyB7gyqlrUpoiBTWn9U=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=TK4rxmdAHWX9Etp8zL2auGTgqpSbvyiqivbNvL09wU1QbaagJuM4ysvdjIBiU1EO9
	 msx6BGwTtGhGpH9/bttH+8WtungMzxWmeHRua2V2tf7aNLJVSJNwhyolb3BKM6eISU
	 OuCAkEOBikMSv1PzhK1qM5MzIqi3QFr3rLnjIKhwjp/ALrUC4/J47FkI/Yh5HQyfac
	 s/ksp4AZD9UB6wJxu1TDwXsFXnswhWRnPJk18NfYeOvdHERA01R3km3QW95BmT0SVP
	 8wPTQ/mYhUCkvtlqKipcNO2qdW0Db1oZKEEjINEzH5uO1VFs+JxMxvVJNzYY8hc0AK
	 puo9jsh3aIXQg==
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 15:04:22 +0200
Message-Id: <DHIOV1XVG37A.11HWRSCG0AD3G@probert.se>
Cc: "Julia Lawall" <julia.lawall@inria.fr>, "Kernel Janitors List"
 <kernel-janitors@vger.kernel.org>
Subject: Re: more potential janitor work: simplifying test for power of 2
From: "Linus Probert" <linus@probert.se>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Linus Probert"
 <linus.probert@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca>
 <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com>
 <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com>
 <d048659a-e668-98f8-46e7-ae870c8c917@inria.fr>
 <DHINFSQNG4ZT.JNZO5ZPRUMW5@gmail.com>
 <bcd30f78-7cbb-4284-dc18-302b549a00e2@crashcourse.ca>
In-Reply-To: <bcd30f78-7cbb-4284-dc18-302b549a00e2@crashcourse.ca>

On Thu Apr 2, 2026 at 2:40 PM CEST, Robert P. J. Day wrote:
> On Thu, 2 Apr 2026, Linus Probert wrote:
>
>> On Thu Apr 2, 2026 at 12:07 PM CEST, Julia Lawall wrote:
>> >
>> >
>> > On Thu, 2 Apr 2026, Linus Probert wrote:
>> >

[...]

>
>   Not to toot my own horn but if you go back through history, I was
> the one who kicked off the introduction of the first "is power of 2"
> helper function many, many years ago:

Totally worth a toot, it's a neat piece of bit operation.

[...]

>   And, no, a lot of that content was not immediately obvious as a
> candidate for simplification; when I wrote my regex searching scripts,
> I deliberately made them overly general *knowing* I would get false
> positives, then I manually checked whether they should be simplified.
> It never occurred to me that some of those checks were actually asking
> whether more than one bit flag was set, which semantically is asking a
> different question.

Throwing a wide net makes sense. I first noted this alternate 'question'
pattern after some scrolling. Didn't consider that case at first.

Just wanted to share that finding since others might have picked up on
this opportunity to contribute and perhaps not noticed the "semantic
difference".

>   Anyway, people were asking about janitorial work so I threw out a
> couple of ideas. Whether they're worth pursing ... not my call.

I was asking and appreciate the suggestions. If you have more stuff
knocking about I'm certain it will be appreciated by some of us
neophytes.

I'm learning that the hard part isn't immediately the code change. The
whole email patch cycle and high standards on commit message subject and
content takes some getting used to.

I doubt the kernel project is a large contributor to
https://latenightcommits.com/ :)

Br,
Linus
