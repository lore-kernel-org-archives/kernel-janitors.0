Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4FE4EB41
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Mar 2024 07:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709882525; cv=none; b=MewO872ooSe7V+5/RMWmCHsAEgKoHTtB9nSJ6OD4RPrL/vAyRX2hckF1iKroB2raMVDJHWmPuWvFQzasKZzrFBbPoQoKRXp5QR/Ko6ZY18lY84VIzFH8abiutAAfXfz+SQXc7GzUZ9lYThfYXIP5J+2zycwP3//iZqPaTelwlJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709882525; c=relaxed/simple;
	bh=g0/NPWk+5S0Jqg4RzXBFqg2bloI1tZ27Zk7zWwaUmdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=N2rUBphnjvu4BEDsa8IuXK/JUOOGV5w8PpAPO4V1SwS9dEOYIniaDLS/fnkx6H3bjzPLelmoUr9XB1j/445/UlGBvI0UhPnxjSBFMP3qqfjDZwEGUuO7Ngsxg9mk7blf5W4PJoaQRPjp4iORaz5fOJ5WKSyKrSIMKSTB7KUFQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IXZDx+Do; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IXZDx+Do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1709882511; x=1710487311; i=markus.elfring@web.de;
	bh=g0/NPWk+5S0Jqg4RzXBFqg2bloI1tZ27Zk7zWwaUmdE=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:Cc:
	 In-Reply-To;
	b=IXZDx+Dok2ctfm/WF32oWBTsMOHV28coK8KjCvV3HEyGL4TboUHqiuvTjfJOEBaD
	 yNzxS6ib12xtHHVc/vSunXHpW6G9jjhiv7wdsVIR4GgKrtBRqgABTheNGY3caByC7
	 tAer1Nq9u9lnpqIN8bmmJTfYMHTIrbT5O5s/GBnmw8w5NgAIsia/Ox3wdeHJqa7th
	 hv/Y78JJpvq+6lvOyZIPlOKLsoo/5fBJj3Gh/mCAfmlR9AThkOLDvRWvEc3/MkCed
	 8WnY/9lop2XskOD+otg1jZq75uDkH6SctNY7NsQd4TezIIEvDQp2Vo7xhisaAd8Bb
	 NyzPI9aBj6Ywfsj2BQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeUXu-1rAFf12CE0-00aNOI; Fri, 08
 Mar 2024 08:21:51 +0100
Message-ID: <154e99c9-fd57-476a-85df-800de64572b2@web.de>
Date: Fri, 8 Mar 2024 08:21:50 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] question about kernel cocci and cleanup.h
Content-Language: en-GB
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
References: <CO1PR11MB49149F1167679926A2917E0997202@CO1PR11MB4914.namprd11.prod.outlook.com>
 <alpine.DEB.2.22.394.2403072154550.3161@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Alan Brady <alan.brady@intel.com>,
 "Jacob E. Keller" <jacob.e.keller@intel.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Przemyslaw Kitszel <przemyslaw.kitszel@intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2403072154550.3161@hadrien>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ypw6qeuZwWksxRukzbZdV/o/z86DG5RkS0UsyXnQUhFqnrEJmxa
 L5wluWrm8p+AyPEGrIpREK4jXjusNmRzRxeG/wIia3vMpnkba92JCUJzOA8cDgdx5S0Ksqj
 5BUAxTSqRrDalG7pI9w9vlHl07bKSnt7w7aMa6/ehoY/PlOJp3KBCMkfNxUUfhFhidgCwXk
 5HAmj7Btdfwna/EbM6v6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HsdgQb1Fznk=;4ZhyazAZU2ren795gVbr8z8Qou3
 KnaSk1CaZOwdha2r8TBg+1bU0WvLX2igMf4qYK9YbpNry04vfW0i41MKIIzJHnWwqY1Ow2vOj
 Z2RXk7BZfTwmNLtrMOnPsATp5BcEtPgHtnEmlZMQ18qI4I3+VABP3sRs7PszB1bKVlLqO16In
 cH0kimhXnzbxvcDrkjPOAwv4ocKzQz8aMv7WRYPc+h2xK6gpxEOPCUL/ypVwUGXR+jVtkiOB7
 3sZo/fyuoaT0umiu+BkztIDk7ZydKG8Lu9Uo1tq+pAAGoFMhtStVEjBXD2aWpqB+VYrXq8lRW
 NGk3lyCBEKvf919b/Sp6rkkgmJj+wqZAJLIuaq84XQF/VM9n9if3Hq/6ftIy1/nJ56/ZBZoCu
 pN7sGDnbHALpJ3GbvflAicJVR2knzVbt6LiqV2QNlyAAYFq/YR22X3AJjmZw9trU7ECWGybaZ
 xLUNpkKZQtQNxkpTxLNYfpX6+47ERmPq57DMP3amPPVuz51DfASm4Yt5ASuzl4bOC2YG4yWDs
 IhOCVfY+yIZwBlXSBCAKclEhfQzAqSBoqvwBPSTQMZIuVsNPWJU3iJr3mFlZ+ExsW0+9xEuXF
 0fqPQzJ6B/4aekpiJ3UBW0KeS6XxkHVd8BRFsolBLeV9zcQInpP6YaRXK8zkJo6PSIbTqhFXR
 IKj9GmmUCiujQxLjHA7+wTOC4ly91WahHJSIHrwerDmU5rAod5c7Xx+dR5fKOXidqmvBrNmuZ
 zrTxirw1QXourmqJjvtyPm+DL0KXzj5Ep59DiK4vqUWx3H3v8/vxwYyDZnLm/i/eFIwcYgpt1
 fqfN8SCBVYA9qppsqcsGF6GGwy0WTI3xkT2MhBIArXfX4=

>                     For kmalloc etc, I see a lot more code that makes one
> wonder whether there is a dangling pointer somewhere, so in many examples,
> it would be necessary to check a number of other called functions.

Do you indicate known development challenges here also according to
intra- and inter-procedural source code analyses?
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/cd606526ca79e58c7a2af89ab8b7fed4316b7064/docs/manual/cocci_syntax.tex#L1771
https://github.com/coccinelle/coccinelle/blob/cd606526ca79e58c7a2af89ab8b7fed4316b7064/docs/manual/cocci_syntax.tex#L1771

Regards,
Markus
