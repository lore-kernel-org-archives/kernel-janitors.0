Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0B51118F;
	Mon, 31 Aug 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188487; cv=none; b=PQYKKPQar989OgX0GLhjpdlUNK1B7HFYcZHKfNrVmUbeIev7yrVXTaY7XYHxruilm6iVOxohNbAHNFJ3t4D1EIT1Y0SwNTgyRW1nDAGSKYTpiLepiHXtmC8QpksH/JHxYZESxB5aGHkWeBfr7bW/0jLc22L/2Uen3M42VXwchlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188487; c=relaxed/simple;
	bh=WRuUoeUVB4Rydh1LiXRs0OHDPOaeNhDHjOf3eYuLi78=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Z2DU9Hcgz3PBfP5Jt3uSfBfoPguqXchD9GmBIHEN0o7TmAP6QjTckYxmz1TIutn3aMB3D4A5/wjd5dZiTkdxxBPZppEOIgpTwyIZ56itJa6+chl3dj0Kp4SYpzuv2ca5EcDHx3TdsoJl54eW+ZLtjzMImjxqMAaIV5GpcmhwWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QuywI5Hu; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QuywI5Hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788188472; x=1788793272; i=markus.elfring@web.de;
	bh=/pzw525+D4VJWQk6fmzSRvqpfOscgH2mqRm1ah9EcW8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QuywI5Hua3libVSC4bEL6BEQorufoJPxCTiBtFHosuPlnY3DYvUWwOQnpXnsH0M5
	 xX1R6MmX3PlCy/U6z+lE4wTROfIEuXIlF+4GCbMJH3iHMYpvx/87bFyKraVB5kFRQ
	 m9sWTfj0Oqd2Pl+YlCGfOJegTwARqP8fQP5XZKMLXiJzIWL99/HJVJprw3X7R2PeV
	 Yyi9WY0sLSdMapAjNghM2GCFTRUbQWDVzP1dE8FfWGY6m0BQ77euPKllvrzIUbvA6
	 ZQnd6QdpPXSi2Is/Bj/yf2H7/bBO2Lup4Tlu2HNAemsP+XBVk0cyE1UKVt5gDg+qb
	 pPDInHLRDCkg8xGmng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7Nig-1wxk7I0Pa0-00C4Nz; Mon, 31
 Aug 2026 17:01:12 +0200
Message-ID: <4209f4bf-48eb-4856-81c7-9332b491b65c@web.de>
Date: Mon, 31 Aug 2026 17:01:10 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] coccinelle: free: add a checker for
 `__cleanup(kfree)` usage
To: Ella Ma <alansnape3058@gmail.com>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20260831134336.45540-1-alansnape3058@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <20260831134336.45540-1-alansnape3058@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DYwFphAQ7pM40khQ5cyUph3jXKadQetuhgFud7mUWGkxObJL3ht
 UsfTICK/xf9NcagnFL7aXgSIyOuzpYrCs4dd/m1olT0PbXgNgxWhR4ihTea/NswfKrV04TM
 AOu9x0TD7NrOpY+AnN6PD2Ul0FSGHMVjNH1DVckCY2r1V3qLRfuJ0DpT+dX+qoBvLl9mCAx
 ulwsCfFMzs9oW3rxCOFHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KsCBtJ/Uogs=;gFX8E022u/SetacfWO7Lat48cLa
 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
 =

> Using __cleanup(kfree) will pass the stack address of the annotated
> local variable to kfree functions.

I got the impression that this wording approach is improvable.
This attribute probably needs a pointer to an object which was
dynamically allocated.

How do you think about to handle an attribute parameter?


Would you like to support operation modes for coccicheck scripts
in a consistent way?


>                                    This will lead to invalid
> deallocation issues. Inspired by CVE-2026-45959 and similar bugs
> recently detected.

Thanks for such background information.


=E2=80=A6
> +++ b/scripts/coccinelle/free/cleanup-free.cocci
> @@ -0,0 +1,94 @@
=E2=80=A6
> +/// Find __cleanup(kfree)
> +/// Using __cleanup(kfree) will pass the stack address of the annotated
> +/// local variable to kfree, causing an invalid free.

Would an other wording variant become more helpful?


> +/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
> +/// Such usage is impossible to be correct.
=E2=80=A6
> +// Suggesting using __free for the functions with a DEFINE_FREE definit=
ion.
> +// Update this list when new DEFINE_FREE definitions are added.
> +@free@
> +attribute name __cleanup;
> +symbol kfree, kfree_sensitive, kvfree, kvfree_atomic;
> +type T;
> +identifier v, n;
> +position p;
> +@@
> +
> +(
> +  T v __cleanup@p(
> +(
> +  n
> +&
> +(
> +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic
> +)

How do you think about to specify relevant function names
on separate lines for such an SmPL conjunction?

Can symbol lists be converted into corresponding case distinctions?

Regards,
Markus
