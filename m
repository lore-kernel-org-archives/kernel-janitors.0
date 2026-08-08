Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5F7BA3D;
	Sat,  8 Aug 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786173642; cv=none; b=rnp5Uc6d2oAHd446SIEsskROZ7OMDqPlOT9xMR3W627/eZ/T8ZOM3mFpU2MQ2Ow8a5R9/xe00uo3Vi7bjkQrX7nIxlI/QEiVZHDbq8+PPlK2Al3EcnSt02+Ye35yiR3F2SxXQRxhzmk0e4aDkVYbj1KHwWphGBIbvjhRSuaTMkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786173642; c=relaxed/simple;
	bh=BxgOHQ4aBzggKzb9zRxz7Qeb1x0FPSYQU3l6qXqSMQo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cj3foQOSzqJJa7zZgqUfnr9LafoBCxYrh03OsatnKvMUVGyuJ2LEQyUoFMWTixopLmG79ZsiO3gEhl5BEISdm9MjOFe+2HE5uWwmRs9zGjuqdoT9DEvD1DZWERZV5T8v/BTp3Pz0nq6McVdzpoTUWhMkckascPLilQ0CksLZjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mfD+WHyr; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mfD+WHyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786173631; x=1786778431; i=markus.elfring@web.de;
	bh=BxgOHQ4aBzggKzb9zRxz7Qeb1x0FPSYQU3l6qXqSMQo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mfD+WHyr2b0JJu+7yEjgHEI1vIl8q/DHhzX8Nrbc419IEZL3jHGM5b/6JbuyLWvl
	 k7Q7z91o1wpGpdEWUoIwQU/7Wd1T+cN8P+HGBI3Da3O0MHE18p3gXtnKGoYsNkCop
	 2irMrF+jtLTzhshG8Xm29UmqAR5V1dexfY4ceXD4qQVtJlo4hxJQfsl5nSV7readE
	 47T4dmldofzvj40kTg8dwiqFvGfhI6WHZC2VEiQWaqS0/1QgAZJ/5h4h9mzekIVG0
	 orWHOsc8vN4B4iiRqO0/VRM7vsRMUQm653fiAx7nhGqEltCgYtYQJoun/7AUlg508
	 joNGCsCAxSRHy3VNiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIL4Y-1weK8B0w9U-00CdBV; Sat, 08
 Aug 2026 09:20:31 +0200
Message-ID: <ba51339b-2939-43c5-a718-c4c6de2c4ebc@web.de>
Date: Sat, 8 Aug 2026 09:20:22 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [RFC] Collaboration with GStreamer interfaces?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:iBOtjHCi62UFW6fp18TK2LtJHJn3M+aNjrSP0O+iBGSQADDssev
 QbrsdLbnsbUYgyJPRXikCrrQc0xlJ6yF1jFhCErZFPM1teIohvz0Hexpns3nOWa6iGMYCZB
 3fvdfqaYu+m0m3Sr6Gja9vtpSfoXGLgYKxQjdfQPgOfE3yVp4iqqMxienb5/Zoq+OW9EpNg
 2Kde9XM90E2Vnl6kj7DnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jg9SbVc+ACg=;YXYTMOmqJ9x5Nqe3gtrh9W9MfFO
 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
 9Mtlhfz7+0hEGIQA==

Hello,

I got the impression that GStreamer can be a popular programming interface
for some data processing tasks.
Do you see chances that also the Coccinelle software can benefit any more from it?
https://gstreamer.freedesktop.org/

Regards,
Markus
