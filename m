From: "Opensource [James Seong-Won Ban]" <James.Ban.opensource@diasemi.com>
Date: Mon, 14 Dec 2015 01:29:50 +0000
Subject: RE: [patch] regulator: pv88090: logical vs bitwise AND typo
Message-Id: <0ACAE736BB7A70499F1D8D5E6AC1854C01E0C43E07@NB-EX-MBX01.diasemi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151212123843.GB21408@mwanda>
In-Reply-To: <20151212123843.GB21408@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Saturday, December 12, 2015 9:39 PM Dan Carpenter wrote:

> To: Liam Girdwood; Opensource [James Seong-Won Ban]
> Cc: Mark Brown; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] regulator: pv88090: logical vs bitwise AND typo
> 
> These were supposed to be bitwise AND instead of logical.  Also kernel style is
> for the operator to be on the first line and I removed some extra parenthesis.
> 
> Fixes: c90456e36d9c ('regulator: pv88090: new regulator driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> At the end we use these values for:
> 
> 	index = ((range << 1) | conf2);
> 
> So, in theory, "index" is a number between 0-3.  The problem is that we use it
> as an index into the pv88090_buck_vol[] array which has only 3 elements so it's
> potentially reading one step beyond then end.  Possibly the hardware spec says
> that range and conf2 can not both be set at the same time.  I don't know.
> James, can you take a look at this?

Hi Dan,

Basically conf2 and range are defined in OTP and should not be changed by user.
As you pointed out, it is not feasible to set the register at active state  because
the value can not be set at the same time.

Regards,
James
