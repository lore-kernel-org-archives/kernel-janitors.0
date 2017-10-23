From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 05:45:31 +0000
Subject: Re: [PATCH 1/2] extcon: max14577: Use common error handling code in max14577_muic_set_path()
Message-Id: <dda9c1c2-79ec-398e-40ed-a11e894e138b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d08cbbf6-015a-ab76-6491-126901d1dda6@users.sourceforge.net>
 <CGME20171022175126epcas2p1a0b5b09f6294470b5c3f6c23c2a0f7e4@epcas2p1.samsung.com>
 <5cdefd84-066d-5379-43c8-76f5d3b8f7c4@users.sourceforge.net>
 <59ED3E72.7010401@samsung.com>
In-Reply-To: <59ED3E72.7010401@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>, kernel-janitors@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, LKML <linux-kernel@vger.kernel.org>

> As you commented, this patch might remove the redundant error message.
> But, it makes the code more complicated in side of readability.

Do you try to avoid duplicated code any more in other circumstances?

Regards,
Markus
