Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D050156C6A;
	Mon, 16 Mar 2026 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645547; cv=none; b=e1f0TfCSltDrxiejrvJvRhavG02l3l6XJ4+LC0YXlxYkTmD45k5DFimJvX3iFew+orY3TVO5Je+Upzq7jZCyDXTtV3v4DoCr4uN7hkHm/mCCvOrQXSyM3d2MUmWEvbPdtdwEXunbG3qwNd/JaY9iot2ETyCunjSryivCILAQhdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645547; c=relaxed/simple;
	bh=AWZCWEvjinHw7Yde8tNlno9s0yHkyJVeJwghWegtjsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CH4r6wDhYwRWJ/kk620tSeH8jrfaoE9uvKDi5kWWdjJmQmd5LtiirXjSHgX2LIroGkne/5PaaQaUeLFBAxkBzOGbTssOFEkA7IalZxi7e4jGT9oYU64Z2eg95TPg/1wKSfUhfDsB06l163MR4eaVPWxNp6u+5HqvhN2KJvQ48jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RXYLE8AO; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RXYLE8AO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773645537; x=1774250337; i=markus.elfring@web.de;
	bh=WKGR5raHbHUpKKTFsl7i/XXyOJ/Q7ZGDUNid58baSv8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RXYLE8AOWRMSTyisFTc4Gh5lOMUEJJDXy+faKYzQhipiieZctF7QhudBvvjeRNEA
	 3uMUFY7CFxcBTqWlcDlyDKenVFDRbDNW8/d6aFwSrX/zMXitY+/noiWi99S13dmlj
	 xHR8USgUkc+TbarnVzM/TyuidYHB33D8NLnATVmo7wQedyM0ID9f8MKcnnjVcZzgQ
	 JRYanr4+OEzwv2Z7SuttQ3vdeCsv6PI6MRHJfT3iVAD6ckfPteVyI/XaJuEckyTkZ
	 vpAe/XK7pJm6wHtz6dyKZrdSzoYayAoyxXwHKOF3VigqFsELUfJE6bvCufIfJIU5w
	 2XaL4WoaMkERuNzA/Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdwNW-1vR2iV33he-00iRE8; Mon, 16
 Mar 2026 08:18:57 +0100
Message-ID: <0c5eded9-f56a-434c-a04f-b229945ae4c5@web.de>
Date: Mon, 16 Mar 2026 08:18:17 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] scripts/coccinelle: Add script for using ARRAY_END()
To: Alejandro Colomar <alx@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 cocci@inria.fr
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de> <aa7XD-rk_KWQvTQX@devuan>
 <abblv3nCut5aRk7q@devuan>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <abblv3nCut5aRk7q@devuan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s8sk/QIMxfjWshwAUv1tDXuyOp59kxbBz0zlGbiEymGRSGOdBxH
 lhCWWjiHOi0kDdjEA3a9F2cCV/n5xYzCeJdlS+D4hluQksY9ueOouXCEq9ZvYu3267pSojx
 FQj/R19kImmIVs2ADVemagQNjyHCGMf0pcs5a8JUdzHwK7/uz6NGLN/p6EM1I8z5zh0kDK/
 zaSYi1MpzkEDx6uRw63sQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4RocGfUYtWY=;+1PkbcZ9Pj+1P2vy+L25TxkRbSO
 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

> Here are more false negatives that I found manually.  The semantic patch
> didn't find them.

Thanks for your clarification approach.


>                    Does anyone know how we could improve it

The corresponding knowledge is evolving.


>                                                             or why it
> didn't find them?

I suggest to refine case distinctions.
Can further test cases help to achieve a better understanding for the affe=
cted data processing?


=E2=80=A6
> 	+++ b/arch/powerpc/kernel/rtas.c
> 	@@ -555,10 +555,8 @@ static struct rtas_function rtas_function_table[] =
__ro_after_init =3D {
> 		},
> 	 };
> 	=20
> 	-#define for_each_rtas_function(funcp)                                 =
      \
> 	-       for (funcp =3D &rtas_function_table[0];                        =
       \
> 	-            funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_tabl=
e)]; \
> 	-            ++funcp)
> 	+#define for_each_rtas_function(f)                                     =
\
> 	+       for (f =3D rtas_function_table; f < ARRAY_END(rtas_function_tab=
le); ++f)

Are there development challenges to reconsider for macro definitions?


=E2=80=A6
> 	+++ b/drivers/net/wireless/intel/iwlwifi/mei/net.c
> 	@@ -43,7 +43,7 @@ static bool iwl_mei_rx_filter_eth(const struct ethhdr=
 *ethhdr,
> 			return false;
> 	=20
> 		for (filt =3D &filters->eth_filters[0];
> 	-            filt < &filters->eth_filters[0] + ARRAY_SIZE(filters->eth_=
filters);
> 	+            filt < ARRAY_END(filters->eth_filters);
> 		     filt++) {
> 			/* Assume there are no enabled filter after a disabled one */
> 			if (!(filt->flags & SAP_ETH_FILTER_ENABLED))

Will any loops become better supported?

Regards,
Markus
