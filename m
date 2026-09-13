Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4982D739C;
	Sun, 13 Sep 2026 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281225; cv=none; b=QoKvYp7UMdDf2aapd4s8A24stQeIKIu2dq4IsmKKh5VMkGlLBqMYxw/VQfQergFopUHOAT2v39VA2o6aslxwCoOpudHSdLW8Ktaaho5gpmoCrdc9VqhlzlZV8ZbCPQlbsWxJm7U6SUx+W8b4Tvr4a+TRcXLkITM1UBYq3uLtgjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281225; c=relaxed/simple;
	bh=0Dt53XtFgKftwYQjJZEpBgWN+oidBqcp5JqPrZWi3Ns=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=qrpoqfPBf9WdiNdHIsSZosfRonCfYuc48h4VStfuM28USc5JMhL5rd3VcSGug5+kA4sHiYOC7G0S+NfKfX6wq4glKnTIgKffPkUd3JnAoKZDKvk5tBFq0ZXRL1PIhDGYijCrHuYq0vwjMaLOnq8VVrbX/CkskjhQGBugsM63DFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dmy2j2/J; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dmy2j2/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1789281215; x=1789886015; i=markus.elfring@web.de;
	bh=0Dt53XtFgKftwYQjJZEpBgWN+oidBqcp5JqPrZWi3Ns=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 References:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dmy2j2/JCb6CD9KLCf4rDeSWoBeS7N7BDlkS2EZkHKRIyUSpGhdnrvCSxALjHO6V
	 tXt2CNosA92Snvt5OpE7DVDb2RRXx+8J2GJ6AMGOHMbwKHSFIozttOCqE25787Zm2
	 K3H8oP2e1IWzaZdW2TeceXoLTTKPjgtQgUWbOXJq8JAyG9NiM1mGXggrssiAFvFZP
	 TssklXuCzf2Ied2d2pXTa2Z+3oCM3nO815Xevgoq5He4JP3ja8CrgHkuaVBp2NSve
	 W/+wRz0uGMTIbdvbiqxm/6+Ktb06cOrduEKVLD/DosJDPD6eM5ZjSN0EOquEfZ3er
	 FmQ6gpOYND98xO7Y1Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7gbW-1wjD490I2k-00zXJl; Sun, 13
 Sep 2026 08:33:35 +0200
Message-ID: <f16640cb-8a67-4263-99e2-f04d4118c641@web.de>
Date: Sun, 13 Sep 2026 08:33:31 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Extending data processing resources for isomorphism rules?
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
References: <38ba026b-c6f9-4b23-9754-5fb61e9db85a@web.de>
 <bec1dd2-e991-3e92-f65e-d795ea98eeae@inria.fr>
 <5122da19-8a4c-413e-9374-997cb6442520@web.de>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <5122da19-8a4c-413e-9374-997cb6442520@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CR85zdYYRsqsa+b73NjXdV9EPXxkrebETjd2dFiPWSGDRzLocah
 iwkHjhDKH6bCQa8F0LRD3aDKlQLMhfTIXFOZ5IZvg0M6i81G3PTV8TaWQnQYNdMcwL956aF
 6MsuDuQS8gCxF9uy5Uj9PBrAnQqE7FQkWfJj5NDf5xSDy6+/8GLWT37aBBiyuqCg4foQq94
 71OSL3LEdas2TpSCmo65A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+y7Dr/K215c=;zPztL6fkJ3e5Z6Pq98VYyLYewHw
 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

> How can this data processing ever succeed?

It could be observed that parsing attempts did not finish in a reasonable time
frame for scripts of the semantic patch language on a single processor core
if detailed expressions were tried out.
Isomorphism rules triggered special consequences for the run time characteristics
of the Coccinelle software.
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/ea58efe355dea2184217954248a01f5dc5995d24/standard.iso#L5-12

It would eventually be helpful to use additional processor cores for improved
parallel data processing.
It might make sense to take distributed computing into account accordingly.
This desire depends on the parallelizability of involved algorithms.
https://en.wikipedia.org/wiki/Analysis_of_parallel_algorithms

How do you think about to clarify corresponding software development possibilities
with variations for computation tree logic?

Regards,
Markus
