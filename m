Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793F420472
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121147; cv=none; b=lQpmaEf2STarSkg5SE8q+q7MpBQRraWyHI8Xkp7uX1gI34Bh1xWbmFw5o8qyrlL0j9dJ1Vq0ftmasrxTFx0/TDT9iwp6vQNwaNWZ1QdY3xXMiOWZN7CgEMzKnV5F4De0vubB3ISJ90gngdGpuJY0wBZ9kxKty8ttmu6024P4Ags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121147; c=relaxed/simple;
	bh=cg3RdC+8r06kFIso1ksJ5pziwGTKdb20qOL/6Jpy/xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSPz4Jeq2eTEsqa/uUQSsKRbkitoeekLugfv3npTT1ryI3ZTwu939h89FntlMB3n/Y4hCkisTBA++YAkcrf7IHZurpV06BTa0xDN/pQWsYYz1AxQP4crcCZBV4RyXyIgR87wljokjtQUH+0q1aGOh9J3WO6+xXByF9+TPxaqN7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WHO+EdBF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WHO+EdBF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso37198415e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784121144; x=1784725944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juQNkQzcMB1WeyX2ItASwvvn19gapwKTqhQHKKAeewQ=;
        b=WHO+EdBFljAjkjKDGMreM1Ifi23akFSJUKch6utuOILInpkguUZKUfeZxscud6rt5h
         8wPM4fXLCHB/21nCVfrnEVTfUAOyoPk+DFrqXQvDOk1gYRZ42herZsMI/m0dtVz2irk7
         6Cdq2iXNgW8T7LE7DSICg0h8WHbFSUAMr7S8Tp8XktDEPdlxLuMqINtRsWiwanZgCzr4
         v4QniQIYpQBswfW14h4UnDF1BBqH5hFg3HyAEi15ICWfRwSCtHM0Z2uoAzOafNKME46B
         yQYYg7z0CsmqcxYGNRKMNWaug/lhTDU2Owxt8GGGitHAXCYN8861aGbK+zwT+/42pYQf
         8DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121144; x=1784725944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juQNkQzcMB1WeyX2ItASwvvn19gapwKTqhQHKKAeewQ=;
        b=aa5PdluXJh3gJHumO2argYqkXGSg2h3yXeT9+C8XMXNDVZkn7joa5mBSpBb0azaos/
         lnoKTCjjBFZy+IPuhJODZsF/cfSlFqpcNuWsKJI6ysGrTxtSScUaPKSeK5iqQBQ1f7DB
         gl92UqyQBO8sW/rm1b6pgExS4hSCGk2aio7grwzoBTXpBpeVtd8NJ2KVjo4/xBu/olsH
         JQL6VqHynCb+jDzvX9q6Sh470TfHLjfdJW9gvJ/8llXiAJ8Q4YZdYMR2eQ3bvz5n4ZEU
         RJbFk5OP8Cv3HReJPOxDEiAHO2JATFUmGk5XwqYqYhOGyWTjuF26nD8gkVsjxlc+9kYt
         fXnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoehpycMWpRDSRN3ZslhwrSSOUvwfh5SCHsr4MZw1juj1CPjS0zeblUs24Tw7gfjEOz5z95c6rLEoUqR61K6Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/C3j9XwSqb3crA0to27bdh6J8dufo+2Dcb573H8ez4ziRKKF
	huWcNZAET1BQ3GUNFZ8uav5f3zJBco3IBb0WDd4EFBSCOM04usS9mFngSBm3jCZPtOE=
X-Gm-Gg: AfdE7ckqJJPOpffDMjv2FSzRulJQRprSLnEqASXYTBP9+qcYneSm+3/KyQVidpC/Ef0
	V2mPEvs9wJo8uDZlDUOI9Ha/G9V3I2bzPZHVjesmOuaB5/GyEQ5/ov0uTy+0BtMJcpTTqI9+fZf
	m4fIaMeUAR1IZRbElMp3Js1C5KpgG7W6lZM+xq98ldj6u3XIxn2hrFTxjoqBMqOzJbJXfwpIAAe
	X6Ht7fwK6+JVG7n7mebo053yyDEOJWClPEY3UPa2NuRvMPqm1XCcvdJwsp3ayGUovbMf/FADH9p
	6iJm7pnUFhHIh1XG+hnBj7ag+8+JUQRReVqntC6PJDxNp18O5Ic9wfd392WE39qkvVvAnNtVPdM
	jjtYP5PA51C2LniJRXuxQZs6AlwYqrStHI9nbjAF9HBPeMXNXWLGszw0VITt0dFNbPVEazPLf3T
	IyqzEI9vu6LMdnVdl9x5EUPMMgWp/zQj9Kz4eriuMlCDLPeCLY7/j3yshkPNdczfRqG7jLD6YyY
	00=
X-Received: by 2002:a7b:c344:0:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-4953c1474famr22547365e9.5.1784121143660;
        Wed, 15 Jul 2026 06:12:23 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635aa34sm15038952f8f.15.2026.07.15.06.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:12:22 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:12:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dan Carpenter <error27@gmail.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	MD Danish Anwar <danishanwar@ti.com>, Michael Grzeschik <mgr@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Yibo Dong <dong100@mucse.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: rnpgbe: Pass an expression directly in
 rnpgbe_rm_adapter()
Message-ID: <aleFN4Z2XT3NP3od@monoceros>
References: <7958e26e-a4f9-48ee-8d79-3797016944c5@web.de>
 <alScHkiC3EmGzOlI@stanley.mountain>
 <8110bb3f-70d9-4f0f-82f2-ffe1262b2962@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvg5qx7ygkch6d5n"
Content-Disposition: inline
In-Reply-To: <8110bb3f-70d9-4f0f-82f2-ffe1262b2962@web.de>


--jvg5qx7ygkch6d5n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net] net: rnpgbe: Pass an expression directly in
 rnpgbe_rm_adapter()
MIME-Version: 1.0

On Mon, Jul 13, 2026 at 10:22:06AM +0200, Markus Elfring wrote:
> >> The address of a data structure member was determined before
> >> a corresponding null pointer check in the implementation of
> >> the function =E2=80=9Crnpgbe_rm_adapter=E2=80=9D.
> >>
> >> Thus avoid the risk for undefined behaviour by omitting the variable =
=E2=80=9Chw=E2=80=9D.
> >> Pass the required address directly to a function call.
> >>
> >> This issue was detected by using the Coccinelle software.
> >>
> >> Fixes: 2ee95ec17e97c58b65e978a08b75fa8cb6424e4e ("net: rnpgbe: Add reg=
ister_netdev")
> >=20
> > There is no NULL dereference here.  It's just pointer math.
> > No need for a Fixes tag.
>=20
> How does your view fit to information in an article like =E2=80=9CFun with
> NULL pointers, part 1=E2=80=9D(by Jonathan Corbet from 2009-07-20)?
> https://lwn.net/Articles/342330/

It does fit, because the problematic code discussed in Jonathan Corbet's
article is of the type:

	int i =3D ptr->i;

	if (!ptr)
		do_something();

while here we have:

	int *i =3D &ptr->i;

	if (!ptr)
		do_something();

which at least in my test[1] is relevantly different. Note, I didn't
study the C standard if the compiler is free to optimize out
do_something() also in the 2nd case, but at least today gcc doesn't.

Best regards
Uwe

[1] Me knowing about ARM assembly, that's what I checked:

	$ cat test.c
	#include <stdio.h>
	#include <stdlib.h>

	struct mystruct {
		int i;
		char c;
	};

	int funcdirect(struct mystruct *ptr)
	{
		int i =3D ptr->i;

		if (!ptr)
			return -1;

		printf("i =3D %d\n", i);
		return 0;
	}

	int funcindirect(struct mystruct *ptr)
	{
		int *i =3D &ptr->i;

		if (!ptr)
			return -1;

		printf("i =3D %d\n", *i);
		return 0;
	}
	$ arm-linux-gnueabihf-gcc -O3 -c test.c
	$ objdump -D test.o

	test.o:     file format elf32-littlearm


	Disassembly of section .text:

	00000000 <funcdirect>:
	   0:	b508      	push	{r3, lr}
	   2:	4603      	mov	r3, r0
	   4:	4803      	ldr	r0, [pc, #12]	@ (14 <funcdirect+0x14>)
	   6:	6819      	ldr	r1, [r3, #0]
	   8:	4478      	add	r0, pc
	   a:	f7ff fffe 	bl	0 <printf>
	   e:	2000      	movs	r0, #0
	  10:	bd08      	pop	{r3, pc}
	  12:	bf00      	nop
	  14:	00000008 	andeq	r0, r0, r8

	00000018 <funcindirect>:
	  18:	b138      	cbz	r0, 2a <funcindirect+0x12>
	  1a:	6801      	ldr	r1, [r0, #0]
	  1c:	4804      	ldr	r0, [pc, #16]	@ (30 <funcindirect+0x18>)
	  1e:	b508      	push	{r3, lr}
	  20:	4478      	add	r0, pc
	  22:	f7ff fffe 	bl	0 <printf>
	  26:	2000      	movs	r0, #0
	  28:	bd08      	pop	{r3, pc}
	  2a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
	  2e:	4770      	bx	lr
	  30:	0000000c 	andeq	r0, r0, ip

So in funcdirect the check is not present, while it is in funcindirect.

--jvg5qx7ygkch6d5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpXhywACgkQj4D7WH0S
/k79awgAqpBASv+7f51qDle6yT4mmgAmQOxoRhY30/FRK6rnNe+P5pjQw6aPGYm8
rR9CXQDnj8dC1KTwbLAVezCqi3uLEHPjCz3wEwCgPyvdTWBGethtw9rDlpEtaTTg
+RilevanhOB1vEDMGHPkYjWs1LUdjAKLw+5AUASdQfoNUPFIYPGNq3W+x1Ih90uf
vaaYugKrrNRSqSTCwPjWJJnp2CXIW98veoXLlNtHscl2cc95kW4l8m1vjS5VPZyN
WnFo068hMRmphIJLxSDhvWOVoGfQxkFuS/lxOEXskJe4QEsXi/9hEr6dFkoFLVyr
bjPFJzzF7XtM0RI5fdNwFOxGWbWxIA==
=YJNG
-----END PGP SIGNATURE-----

--jvg5qx7ygkch6d5n--
