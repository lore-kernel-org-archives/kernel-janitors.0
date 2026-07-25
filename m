Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA146B5;
	Sat, 25 Jul 2026 05:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784958444; cv=none; b=QhjA5UebiI2lcTvWQpkvvJ2xPQDBTufRonnGApDsZZDVpJeZpOZlFgvg/LabjKd1nolM0Q6sVJcCvYqFmtzjZKBNowcPopwLaMf8tqJldc6whqpizfr4AkfO0DCs6xmwm+bRuwhQZ66NBmpmJ3+8KmLxtYaiEENlygrfofhjTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784958444; c=relaxed/simple;
	bh=42BtZudjl+EWu1ddSGWwf9RmeBvz0UW2WC24AHjduJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvNmlxTFyI134hHVhf3c5yysaUzdaMw9dwSGIegMugmiXrGWh5VTp+O89UcypwL06hUvUlf8h49K908AFyUlu7TB4t6kui+krzpeA1hZUhL28rA3YqIsGJji+G8httYnhIVSLDJkvLz9rh9z6Hd5Wr+WFkHG3odl8vzh90CxbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WSntotzz; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WSntotzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784958440; x=1785563240; i=markus.elfring@web.de;
	bh=jnPUxJ0AmmOqmPOE5EeItdcvSPoTDJ6S3NY2CUHDNe8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WSntotzzXzd5p1is5UAHLO5j4bHUQqLlXse1DZmrBZMtqwpmHLxEGJoSJvM4OY9l
	 Kb9F+ZU+eB4Twtwy4mRZT5H4s5ldyxW3rSdjXR7QxrFN4AK2OB8QGrLL1Bob0F0Wc
	 l6ywes/VMVME7p7VXUIzE4sB92tfrn7aqG0q9LdMy9Eeielc/gw/F+wyZsUHhucp+
	 U1oBchXr+E9ewJu0nox8clcHctmFy0tbNnxkBm8kOecxjHc8QitI6rtz3cxOAtSyv
	 j418MTXjqCLIRkK1BrCUwr5BiT+/QtjsgQ4I5DLET64TKnf5uY6+VXNQCL9p9bbND
	 NN4WTKfcfFw4jHLTGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBB86-1wgNPi0TRm-004uAk; Sat, 25
 Jul 2026 07:47:20 +0200
Message-ID: <7a834d71-a9f9-4b12-b312-f7cffcd9fa8d@web.de>
Date: Sat, 25 Jul 2026 07:46:39 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [1/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <20260723184538.3888637-2-ekffu200098@gmail.com>
 <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
 <CABFDxMFYvuAZSGcPmhAj4H43dwYBG01P2-UQPGa=-M=yRE8YKg@mail.gmail.com>
 <73b974fc-971b-41bd-a039-7566442ccc63@web.de>
 <CABFDxMEsXs+kJ1utqQveP9NNi+dVN-2ReNt3zWvf_TU=xofohw@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CABFDxMEsXs+kJ1utqQveP9NNi+dVN-2ReNt3zWvf_TU=xofohw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8gfzfYTqMZ4W9XaFy9EFL31gbwigeVS9mAPAxEtT/IDk0Jr9JrS
 ONVtH1TAD4/4V0AGfUOuu56wuFmuRxY0cRrmmOTiijcLrXV2PRUgL11OFHVITnl8bQHRqG2
 oQ4ez5eiSX4+oJN8ATh2wOJ/lp7b93OuBn1e5jIo/5CcDrrO0lpBHn6m8FsKQR+eKgQfr8D
 HklRhyrJTrnrORwrfUrgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0x4QUeR4ICQ=;znW39sAbwtDRDRyBzp28G+0S10R
 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
 f8XGer0qa957jhCGcDYJc

> Are there impressive performance improvements from merging the rules?
> If so, could you share an example or numbers?

Would you become interested to measure adjustments better also for
more desirable software run time characteristics?

* --profile
  https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/bd41911b6d35eda4d9a03247043bd3879733fb3f/docs/manual/spatch_options.tex#L774-775

* Development activities
  https://gitlab.inria.fr/coccinelle/coccinelle/-/commits/master?ref_type=heads

* See also:
  Selection of benchmarks
  2018-04-34
  https://github.com/coccinelle/coccinelle/issues/133


Regards,
Markus
