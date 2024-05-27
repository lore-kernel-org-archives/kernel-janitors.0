Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA72169D31
	for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798164; cv=none; b=XhQcLxmOp/XzzT4dyH5HXTvjag6wUgeymgZp0LD9mkMdt1IKp7UWr20QRr7nRtaiY0Zw3rnm/FiN3eBRMMoDmeuJ18sFLPxkFNdCWLywsc+iFyk3L7eysl8rW3rqMdPXWJWcNp1u3/mncie/9Uuu9ed7+Cd+/ZKyvZ1g9KogSiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798164; c=relaxed/simple;
	bh=Gw6GplGBlHErMainbZV2yODa5V1658ZeFDKNXkuIgNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGA6Ul06AnL06mQo00b8gCAdm07nGutNxDUcC4E2EL33oQWSI46l17HFNWRgbvI64NKMP5Ks7Qo4tTWl7c7qifaLKbjFwAkhwDb6VLAb6HarX4K6TsscfE76CPzKQc/1vPN451oTtoTCOp3kRWohOSFUs1+Ba+K+TNMro0JDjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ba55Mkh9; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ba55Mkh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716798150; x=1717402950; i=markus.elfring@web.de;
	bh=4WqulsVYitokYPFU6nTMWplVI2Z0sKTb41EjmG9PPl8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ba55Mkh9GwocQ7REJXK6DQ8tDl4fT5dOKKsN80LM75h9TEQ1QSWFLRyAzK2WIj0Q
	 rTiKRsBSlTpJHn98OTzCeLw+AGbFpjPfR9MuOE6eTqnMbtQ40WLZNtMSHvAgqBgXe
	 LO1q0NsYrfNGBl9xTZNSbXD1TjJG7wOwmVbqexr2pCBZUwza3pOobvAFh94x4Z+Qv
	 nS+Nh3ZSLcC7Ufqxs8ztyaxSNhEPe9GvdLHG3LF75U7mWWwwIrgIfZxGYP0zsk9zH
	 BaxeAsi8Ug3K432z9f0lWL8c1qwhK9LZvXO82MseqKAesr08C4Hnr1379jmsj15Eh
	 b2vcZFa99FKeZqIniA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Madzi-1snbGW0e7u-00lSKk; Mon, 27
 May 2024 10:22:30 +0200
Message-ID: <5f48bbf9-f110-470d-8e3a-8b2316821bad@web.de>
Date: Mon, 27 May 2024 10:22:29 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Increasing usage of mutex guards (with SmPL)?
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <75137a20-aef6-4a40-85ce-879983decb83@moroto.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <75137a20-aef6-4a40-85ce-879983decb83@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lFwdxTKGmorAJlakl1Yseuk1sySIy903TjSnml1Op/cUiYb8Zme
 zp6h/bzHhtlaS6Lr3wsfh8VkkioVTa2K3WBR6VXhRDDzsYw+62Cva/6IpxyQwukwt9+MGkV
 loLJPDdXnKyM4aUsBTdaFsfGP47VV6II85y1G6rrFF/dKywvW3XmGNN7aRhLDraJ36wpdB4
 +yR5TSAnDj43zAFKMb14w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eiGxDlRacKM=;VnoAlMN4eKC71A0YmtPlxt8xDD7
 GYexmCXBLZs9UOyRfwl+lEuaqYQwg9FN5NrvR8DS7aPh8TBjazmYvpnz87dnzoIhYrl9fgKFa
 tzYRibmXRZFzl+ikbcD1tuyCsJZwNWdtb7vc8o9W1Ag/ANewcL4ZI9u5nPNZ1/5RHJPjkuUW3
 3CinC7BcHOVcDRIraKRTjXGBjHN86k0ib+3KRFPY8/JBWsCVWUAt3UHzHU7TcHsCrYPlh4dPd
 7+HQvLtprhZc0UUQwBD5OJcv7Gr//xeWnuYEaRLQ0jI/0nShQ4v2HjTviqPyqnheeIwuZYv7N
 9EZBmSEzH2s87muS8aJd3S7OSihDNf34udW2hre1qy8x8MpCuWu9rSeNh3ODLJQfjbilPHHmF
 9C9xBmEyTwt70yA+Qx/9oWJTJr3b84fRTTzmgqiuErz+jKSVcb0bu9ucauHloMNEie8FBFNOr
 PQUzOIboiLX0q6SiniENAS2W3TD3sUT3R6j/nlocQhRuPtY1P4gMmczS3mio2HBPqx14s/eUg
 GdtYLixM80VBFuHzNKiFWJ5Jo+yhQKzJgUzhCEi9eS/30nTwQ23pFCWRawI8ckRKpLs8S2wTe
 P4b5VonMCgr/Tg0q40n1lkW32WuIoCj844syhCHAX4fFXMmfj8h5eJ8gmXAPAiFLJwUxrNowo
 duo5m6wKD4ngky47aFSv9B4oNanWG4c/2pE8cUwBhxVAmcpFCdo5EnxiBazqOJoJVJnGytRyl
 bDWQ/fiuY7ODruQneLXpOzpYNWaiYEL+lp2Jwh+szHN3aIJYE09gDLjx4TNBfYxM8p0jmvdeS
 FiLZJTPvQyBkVbt1W4FaZUI4Xf+qHyID1LfauG+cfDQqk=

> Different subsystems are taking different approaches to the cleanup.h co=
de.
=E2=80=A6
> It really does change how you review code, so mass conversion patches
> probably aren't welcome.

* Can any contributors (with a better reputation) achieve corresponding
  tree-wide source code transformations?

* Would any software design =E2=80=9Cadvertisements=E2=80=9D help for adju=
stment chances?

* Will the support grow for the usage of SmPL script variants especially
  in combination with the tool =E2=80=9Ccoccicheck=E2=80=9D?


Regards,
Markus
