From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 23 Oct 2017 05:54:02 +0000
Subject: Re: [PATCH 1/2] extcon: max14577: Use common error handling code in max14577_muic_set_path()
Message-Id: <59ED83FA.5000701@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d08cbbf6-015a-ab76-6491-126901d1dda6@users.sourceforge.net>
        <CGME20171022175126epcas2p1a0b5b09f6294470b5c3f6c23c2a0f7e4@epcas2p1.samsung.com>
        <5cdefd84-066d-5379-43c8-76f5d3b8f7c4@users.sourceforge.net>
        <59ED3E72.7010401@samsung.com>
        <dda9c1c2-79ec-398e-40ed-a11e894e138b@users.sourceforge.net>
In-Reply-To: <dda9c1c2-79ec-398e-40ed-a11e894e138b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, LKML <linux-kernel@vger.kernel.org>

On 2017년 10월 23일 14:45, SF Markus Elfring wrote:
>> As you commented, this patch might remove the redundant error message.
>> But, it makes the code more complicated in side of readability.
> 
> Do you try to avoid duplicated code any more in other circumstances?

I usually used the goto statement on following cases:
- Return the value (error number if fail or 0 if success)
- Do free or unregister or remove operations when error happen.

I think that there is any benefit of this patch.
Also, as I commented, it make the code more complicated.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
