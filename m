Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926D95CDF1;
	Mon, 16 Mar 2026 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657976; cv=none; b=R+ThFXgd0hvC+JdqUMBJIwChzPgfc1ybrUxqVhHLMsBvPiCex7/HaNNucyUi8HNg84w2l4YvUJBAm1ehdmlxVExpGldcs9UBtW5mPDHxYRf39DPX/cktk13IJsvQzLhLrPIFU66tcekaAnuZ4vtiBn0DmpVl4442B2TGKSohyoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657976; c=relaxed/simple;
	bh=ItnIhc/ZRVZr/XO3cNqCMKiUdGxtolfwETHwEZ30vEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjfDvS7H5oyEuuouAa1TyrNViads9pSq7cIB+MKHdAmnKLuttrtBTdwxochidb9VnBFMh11TKOJ9Ny0NNxVC5oLMxXzp6dmlEvWxH77nmLURYAZW9G7TkxMGIwWiwo/ATa/nAChl/he4VTU4TGCX6xKqMzslhqxSX0XiaPNamos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=eeS0mvdN; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="eeS0mvdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773657967; x=1774262767; i=markus.elfring@web.de;
	bh=ItnIhc/ZRVZr/XO3cNqCMKiUdGxtolfwETHwEZ30vEk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eeS0mvdNW88uqT0ElOig3fQvc0BHwwkBSf2kEUft/06bJJlI4h/YjniPt8LpdtvV
	 +0XyY/z6jBGKfFgrUvd2g4s/5mm4PfdnbdDApYeDrQYBROzzZGIfn+s7g8i0JX8on
	 A/DpCTzksIAFkWLfZqfhIa9KfHbmEkEYWvA+uZaF2q0kRhBA0UvynkHjxyTlMbsRe
	 kMiRS699QQGDbuu6cL1GkhSYhQZeSamXs5Vdgdd4mIJFklG2DclRmCrxNyMQka91G
	 aoppd8lxZPdswVDimNZaY1bWopEYDqiut7SLNsTkd8Ep2Ldc81A6JzvVaBTl/LpCr
	 5yIcnlSKTJchL/Kw3Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MREzA-1wE60J1LCW-00SQYt; Mon, 16
 Mar 2026 11:46:07 +0100
Message-ID: <202abb30-1e4a-47bb-a1c9-898d3779880e@web.de>
Date: Mon, 16 Mar 2026 11:46:06 +0100
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
 <abblv3nCut5aRk7q@devuan> <0c5eded9-f56a-434c-a04f-b229945ae4c5@web.de>
 <abfdDqYbRWZ6UNjB@devuan>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <abfdDqYbRWZ6UNjB@devuan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:m9nRV56Xw9nR+aIkzNCOcQk7L3QlwyUAdyeSpFRnjqhEW9hJXbu
 nH0Xj9Sy9RRUhPVUaSC4QDAHNWHJUIncRC17FBdlUCuAL7DqVdXeyolSy03mK9UK9Njp4XL
 6vS9dtUtv1AQ4Ht2NFsFgTiZHrkjCxy+XZRac4p1PMJDpc08op43u4lz0Dp5O/FpxJ2Y6Sf
 ZUDlxakPWwiwzGXrVUhnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GSyc0HB8NOo=;qvF4wXITxIKBycJ/KX7gbG305TU
 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
 ZIZekyUm81g+x0IHYLLX

> There's nothing we can do to improve the patch.

Can we influence the evolution any further also for components
of the Coccinelle software?

Regards,
Markus
