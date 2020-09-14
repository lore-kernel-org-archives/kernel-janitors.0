From: Dmitry Osipenko <digetx@gmail.com>
Date: Mon, 14 Sep 2020 14:28:11 +0000
Subject: Re: [PATCH] PM / devfreq: tegra30: disable clock on error in probe
Message-Id: <c0621c79-00e4-0fec-c98e-b46e231b30ef@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200908072627epcas1p41f2c8c2730d42bd8935a40b0ab8122f7@epcas1p4.samsung.com>
 <20200908072557.GC294938@mwanda>
 <2ceb045a-ebac-58d7-0250-4ea39d711ce8@samsung.com>
 <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
 <20200914141754.GB18329@kadam>
In-Reply-To: <20200914141754.GB18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

14.09.2020 17:17, Dan Carpenter пишет:
...
>>> Is it doesn't need to reset with reset_contrl_reset()?
>>
>> Hello, Chanwoo!
>>
>> It's reset just before the clk_round_rate() invocation, hence there
>> shouldn't be a need to reset it second time.
> 
> Ah...  I was looking the wrong code.  Plus I don't really know this code
> very well.
> 
> If clk_prepare_enable() fails, then I would have assumed we need to call
> reset_control_deassert().  I would have assumed the
> reset_control_assert() and _deassert() functions were paired.  So what
> I'm suggesting is something like the following:  (I'll resend this if
> it's correct).

The reset shouldn't be deasserted if clk-enable fails.

Reset deassertion should be done only with enabled clock because reset
happens synchronously with a clock tick, otherwise it makes no much
sense to deassert the reset.

Yours current v1 variant is already good to me.
