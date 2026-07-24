Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762323507B;
	Fri, 24 Jul 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907144; cv=none; b=oyAxkaAdFxKn/xUV0Xi2jJ40PqMvPallThLuzuhwIOEqM1vZ/v3VREylZb3wZW6iZB04wj9vdbx9DT9mYJBSsdBJzNoBzcHgqYQVDAxwwLLX8jPcp0WNstFS2YR1FyiE9gUr+V6gtdABe0NvaFaPGbHO+0bLxi8YSfnLGRuWd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907144; c=relaxed/simple;
	bh=RAhabRWFlseYl+ccAW+O6YkSizn3nr62AKAqIN3SZsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1eoqcwk/NP/zRIOr4gG/cWSW3z9CRAZbFwFyKuNZegRa4u7/d8NY6wrq7UxH7Khus7+01hq8bOLtYOEu2AFdd/4tAyXvbJMuMvJV3koPXW3ROfwOCRKpg7S46XVY/q7w4v/0iLNIEIeBemd1WvmKQTgnI2AV7bX5vH8MWtEEgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EWj8V5JO; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EWj8V5JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784907134; x=1785511934; i=markus.elfring@web.de;
	bh=5G2l3hnwBrYcRZv1xJPwLAJHCbR/c6PYqIVbchArWwc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EWj8V5JOtouh4c9SQIvwj6LWViMx2QEcUI+FHTl2xFRJxJ4cqT72X4RTjGoxh4Zj
	 9iln57UF3VwbzwYo5ZSX393nePHLZCPygoj5xHgAnL4mW2yn447m2vj9XdNPTkYoQ
	 70c6HMLQKaoUvQKgxQiXjbUdMyKxl/9mvYL6Yv1qemm9mJTpw8jiOXSB8ys7ct+vY
	 DpczQgQRjqjc3KtstteNyJcETyBNyCFJOLWEUSwX+mJiAErcfE86Fen/VnbivTTs6
	 4I5yRDGozYgvgi+gi4vDYf/fgNVFoYetRzW93uv2ffKxss5q/s8mq6rul12rjT/1f
	 k3G57/nj6XdpZUS/qA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2BI2-1wyoD53xL4-010M5U; Fri, 24
 Jul 2026 17:32:14 +0200
Message-ID: <73b974fc-971b-41bd-a039-7566442ccc63@web.de>
Date: Fri, 24 Jul 2026 17:32:12 +0200
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
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CABFDxMFYvuAZSGcPmhAj4H43dwYBG01P2-UQPGa=-M=yRE8YKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5CylKaQn6ETw0rqlNml5E0ecg70y7p0+Lb47aNKIY5APAhRan0b
 RsJOwAV0pOcYJidsUbs90+rUOJb7T6/0k8VxS5++WqzWc/HQ8K/dlbNDRlV5pvFZuB0JhXy
 3sxcT7QElW1qXjHo07WEoIANm7tc16+Cc0G875MN3HK3ySNBgRWqOfVwVcLsjD4N9KkVJeN
 Xtgd6bkfPvVlAX2ubej0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KsALtB+J1vk=;WWR4iDq/LAZGJ77bcj/XbhcH2Ny
 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
 XEG5QuVoge5C6DLa+jcKkNsySeZ5afH+u/dYyGOs3b62z2/3kLdG4W8vsvGGpnKx0NhtZlG+A
 zL2AwYJ8bVKPpS7SeghVo/4ea2oigTVjjWJsvBp/FDvsSStyu6rlB9aW17PbVybARfUm+9GSp
 3einy5ODhOCWL4KNE0dDBH7Zq4diZ0r7jWci7mvpcL/ewgY/8OHOhBa4W7VIW91tS83MLd8+Z
 NaRHIFj3vmWR5cYucatzRofExyaUITYwOIHdE9vttA8wOknN5uuHPSy1LYdiFiBedxrw3vY3n
 uTA0wmJXEXpAoZ1a2ONGZs8ySnAZCNXM1yDYFrqDGcJMBfn+qv5avU8MRqizubJbdR8Yk01Rl
 PztfrjikoHm+k5h0NNG1oBF3ql/A+fRCZHn/RJSDLb7lIBO1bbrhOloMdSQbfIkIb9t/1JblD
 NdSUiznSqeHvXnF97R3I67hni5s/b0Wz6+7NGEt3KWGzlgASgy+9yzUqClkjDc7LjX8XzHQTk
 dHY8r2bU4L99uOiW+Yq3BCUCm8byw4i4qO7SMxbBwM3Z9ZYWkN13B416mJ8abyvkJ1MiPvQbg
 RKlQzNXGSqJ7GeYwMLpHK4wg5ONZ/pHKQsUWfFNGv0tIUfFCZpMXnUqw4crzV3NjO3nBNoozT
 oJKExrH1iwfFCEFjhTR4GgK7A3ZW5Rei7xHP4IBzcmS3BHi42xUEpj7I3sA5izrz0clx6RCxp
 GpSfl4xJ2Yq3JoNm9d8rQqzHY7QNrYyiXR6M1JpeW5m+zleXWiWttLUNz7+XQ==

>> =E2=80=A6
>>> +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
=E2=80=A6
> Combining them with two separate metavariables would be okay,

Thanks that you can think a bit more about such a design variant.


>                                                               but I
> don't see much benefit in that change.

Further metavariables can eventually be shared for an SmPL rule.

How do you think about to avoid repeated search efforts by separate SmPL r=
ules
(for the patch mode)?


>                                        So I'd prefer to stay existing
> form.
There are different SmPL coding style preferences involved.

Regards,
Markus
