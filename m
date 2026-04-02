Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF113BF664
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131055; cv=none; b=BMomFjcROMjuiKuZoWGnUSmjfERlCOyaJ7IYNPpEWG2dUj02EYHYVjA9G62/FLns3y6vPoDyYIb8c21NOfpV5SOcT88hHFv5kftXN4XIkqmxX3g6hIwaP5EfdYWjjovP6NLuIWZ9nM62wSUScXsHg5fXy9QRX8PHKsWpBv4AaKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131055; c=relaxed/simple;
	bh=79HrJJ0cbGlsodz/7D/XnDMHE4p2yFJho2+agDQ2X9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LHj+3gdhQRI7/dxti/p/YVTk1nMpdejhRVVjeJOyA754PqsKHAY6YD3o767Hk8cX80xGGWczOVeNKQOv0dKm1LA0b9je3SZtA6NkczGyXs05ax69EYGCIQTdpl4k01Al3iT/kWznzCk4XUPTRIjB+j91QdtbZA5Qffje8Q/6UI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Felie5kb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Felie5kb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a10d130b37so732540e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Apr 2026 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775131048; x=1775735848; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuhrOvYmQt+LILVsY2/o/apKV3O3N9vWN+MBwZTLdiw=;
        b=Felie5kb//iNxOjwfelak/WEl06xF+AriUeDUHd9WQymrBdTBVJqg6jpQb6QN0j8EM
         PnVHyf9kvbsVipBW2HKAzMCmdEugCqr/3LfEP3lpQY3PTtEBrTLtzY8GVT8urk9npknQ
         NkoqhpYc+eI3yLkP0pCGJr+lftjyKP8PBAJsTB0srzy2lnPe/RSbb9LvNBDBJBtFjbPR
         r8ZwcjH02sKcvw6B+eEFrdfCDIi4rcNjGDrgNkyGf7moLRzf9ovxTcphp3xdIJ9mkuA9
         Qc89R/XDOU44rh+LxWQcyXEMGNuhK2NU80UVO8frzRkgcNKP9EhqZJs3Oa8tI948xzMt
         smsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131048; x=1775735848;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuhrOvYmQt+LILVsY2/o/apKV3O3N9vWN+MBwZTLdiw=;
        b=pXEis5ZUTbOne9YBtHZyJ0BTAM3egF9CbZTNhIX0CjxVtrik9cvA5TGNtQ0Uj404DQ
         kIbJZTcJ/fN0acxLL0nUx9BdRol3611N5/Oy8ghMnN2yFPR0uB94BmGiGSjrLFovLNgf
         KHBYiXUzokwth/Xn7KjBFizf50fLheTqhJqvP48io+CYBx7ThGpqP+hBNm5X59V5D9Pr
         fpOcoSf1cuhWCgkk1nbcd4mwwcl3jjYAy6sgO65o86tICQAMySWLnWkYk1uEBGaFinQL
         zeLrslk5GDc+6jwigd59Gs4mDsRKWgjuNsr/wlLNRp+n1lRZM7l4JDiLht8Wp9+PC6BS
         H7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVVwrYiRepSBQPtfB20o1XE6Try9uk1ycTCTLNJM5v5qNbfUUazsfFRP3BP7zNJD9l1oQwLdKThux+SaAUp/g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHEj4XG4/1nreWsDMy3JKQSo6djen7sTddZnfPUegz8cC5vbz
	Yf/EYnn+6XWYN8oPtpRUuhVAzCXblXQEWIZRlJ3P5Jnd1NPrgdlZKCQr
X-Gm-Gg: ATEYQzy1xUi3ccC5R/cvTchH2WBdIGBlJtIfPfM3OLTdbmZDHHu8qTUBVCwZ47QJFEJ
	MUsgly/sdj1mnro4RzCFDLaJL0BLyNolflTSf4imp8Y7gPpHSlfNhQt3JsSjjNE9T1NqL+yoVsU
	bNWZj9QCzl0vhMhEW5SxC47hNyOnd2/sSLoGWPfI696UEmvGMOdeeJWQa23hYgTHwDgoez/OTFm
	HfKkREN4FK7VB8F7Pces2MA7xzXA0XYYlNNzuqEd9YC9R2a+oemOISQ+7UdCaWbncGLUXMB3USe
	b+ncRytDjBX3hIlnYzZ8Vtb/yhnbwIoaynYet5RfrOnNkTX5oqdcEddEvw8BXtjRqK46mext7aN
	7ULAu75PqQEpezoU6UxnDXJEpkyJEc2JoDDzHZqIqj+gJkEql/1qAWv1+8dDlmFW7+qoCJlzZHM
	4A3lIDVoBkldDIn/Vjf5vrByJBv1Z5iwh87Wi4Pro4bCf5FkE0hkWK
X-Received: by 2002:a05:6512:3e16:b0:5a1:5994:2773 with SMTP id 2adb3069b0e04-5a2c8d84c7dmr770475e87.14.1775131047529;
        Thu, 02 Apr 2026 04:57:27 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm637826e87.60.2026.04.02.04.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 04:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 13:57:26 +0200
Message-Id: <DHINFSQNG4ZT.JNZO5ZPRUMW5@gmail.com>
From: "Linus Probert" <linus.probert@gmail.com>
To: "Julia Lawall" <julia.lawall@inria.fr>, "Linus Probert"
 <linus.probert@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Kernel Janitors List"
 <kernel-janitors@vger.kernel.org>
Subject: Re: more potential janitor work: simplifying test for power of 2
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca>
 <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com>
 <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com>
 <d048659a-e668-98f8-46e7-ae870c8c917@inria.fr>
In-Reply-To: <d048659a-e668-98f8-46e7-ae870c8c917@inria.fr>

On Thu Apr 2, 2026 at 12:07 PM CEST, Julia Lawall wrote:
>
>
> On Thu, 2 Apr 2026, Linus Probert wrote:
>
>> I took a closer look at this. Many of the occurences here are actually
>> used to check if a binary flag has more then one bit set. This is quite
>> a common pattern.
>>
>> Eg. 'if (a & (a - 1))' would pass if a =3D 0b100, not if a =3D 0b110. Si=
nce:
>> 	0b100 - 0b001 =3D 0b011 -> (0b100 & 0b011) =3D> false
>> 	0b110 - 0b001 =3D 0b101 -> (0b100 & 0b101) =3D> true
>
> If it's common, maybe there should be a function for it that properly
> reflects the intended behavior.
>

Not my decision but I would guess that the general consensus is that we
don't want to obscure bit manipulation in helper functions.

These patterns are often considered base knowledge and since it doesn't tak=
e
up any space a "helper" function only obscures what's happening. In
particular from a review perspective.

So unless there exists a function for this pattern already I don't think
it's something that merits replacing.

That's my 2c on that subject.

That said, there are certainly places where swapping in the
is_power_of_2() function is applicable. It uses a fancy bit trick which
wasn't as obvious to me. Generally the right side of the expression
below is the one I would use and no helper function existed.

	(n - 1 < (n ^ (n - 1))) =3D=3D (n && !(n & (n - 1)))

So if you are looking into doing some janitor work in this area you
should keep in mind that, without that zero guard 'n &&' swapping the
function might be altering the logic.

So, a heads up is all.

Br,
Linus
