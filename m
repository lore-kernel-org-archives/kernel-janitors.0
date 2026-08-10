Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16343090E8;
	Mon, 10 Aug 2026 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371888; cv=none; b=iK/so83SzY8JcofGhbcQ/wgMCK94d5GmW8YN2Cu1e2aVP6MwE7JPhKFGVRswzeT9KMu4n20eRiJlG+M2gGFRl0Lmt5IoP43Cl3KDinxDwD8jhEFDgfI+g79wyoseOUi5Vux7bDEcuygnPc3bsDysA9dO8Z1kGNrZ7LM73B0j6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371888; c=relaxed/simple;
	bh=qJB0Diow9wH3GlpwZK1qVJBO7NZCGkYfOaiS8mzc0Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=mzNx/1g0D1M0pkZDe+/0ntwMB1I3Irw5XktgUtEBcgf0RG01g2dWslbTREbVBo7Ha6ibGKjyrhR5ol4LjhmvqGhly9tJIVXBpwD4XgYAppOysm/q8cRr+6WVPGszbLXCARt8VlCgorwkbq5TbF3cf7mOXSCkyD96ukYa2KHb9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IFs3+xp4; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IFs3+xp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786371877; x=1786976677; i=markus.elfring@web.de;
	bh=u4tO0uzxzCp//S3PxTJA83nIgHliUdWnzGfrBUugQxo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IFs3+xp4z6V8ug8sJZZzlRbZ/Y2YpMHEUu7sp7Tnsx+URljDz22nFD86HI9yHxER
	 hxqbX60nl9hsQa18YA8Fi/0acQyYu/KEW1EYiaDvMJqeEOWFGrfyyqQ/YtogRdMHT
	 X3sF14jE+zHRue5QKX86QY0YdPKaXRD3nvKWACF1a9KS1yHOjLXk6GQJ6JbXMwZXw
	 J90ml77eN0yOL//L6nF8HDX3wDnXo1L05ZUG3uc4ScA0pTbIZawPvhuQkiPMK09Q3
	 yYoSzJm9kG04KrLepbvQiV5ksjsaHzYhTm569rqv310U4s0YkreuNsTQTb6bOcijP
	 yIASoOehP9kTRnIMzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9qcr-1wpptg0mM1-00GUcE; Mon, 10
 Aug 2026 16:24:37 +0200
Message-ID: <daf22b4c-058f-4177-8075-895de78d9c5e@web.de>
Date: Mon, 10 Aug 2026 16:24:27 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] coccinelle: scripts: coccinelle: devm_free:
 reduce false positives
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
References: <20260809165340.1719736-1-Julia.Lawall@inria.fr>
 <ef5b5f36-a1a2-4723-bc34-4ec7a5350ef2@web.de>
 <27fd1773-a8ba-afe3-1cb6-51e4bc94d641@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Nicolas Palix <nicolas.palix@imag.fr>, Ricardo Ribalda <ribalda@chromium.org>
In-Reply-To: <27fd1773-a8ba-afe3-1cb6-51e4bc94d641@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VHWF+gy/ZzDORMNAAp+ZEQ8IoHj81abaHM5jHS2Zd1OP6ON1e6N
 Ju5cASmDd/jhihDF+XdnPmWQtigzHXJSU5hCuRASaSXA+hgi601TTHZuC843P1xl6feuNE6
 eJ5Ipa/3phxmNrQSEOjJ76SVn3J5owafZYsvWnbbiKbDGDDTT8f9/YFgbbNlh2e94hT1QyH
 gQMfC9haq3Ls+oLEi2fPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gVad1Awiwgw=;TM09AkuBeOJ7ZH7OI/XV8xw+lE5
 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
 e895ayReCN+dQsPYCWb1EM6zpCkI=

> Anyway, since I did take several minutes to go find the file and look at
> it,

https://elixir.bootlin.com/linux/v7.2-rc6/source/scripts/coccinelle/free/devm_free.cocci#L58-L105

Patch review might take another while.


>     I guess you want the disjunctions to be ordered by frequency in the
> code base.  But I'm not going to do that.

Which factors do hinder the clarification of further desirable improvements
also for related software areas so far?

Regards,
Markus
