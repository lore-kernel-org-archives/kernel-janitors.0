From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Mon, 08 May 2017 09:14:06 +0000
Subject: Re: [PATCH] regulator: max8997/8966: fix charger cv voltage set bug
Message-Id: <2225534.LTs3WEvGn7@amdc3058>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170428141103.llm5t44o2vf46y5c@mwanda>
        <CGME20170428141118epcas2p42c864cf574cc6fa3ffedbef22029e3ef@epcms1p6>
        <20170508054544epcms1p6d3d429e6f062e987adf72fc2c04ed159@epcms1p6>
In-Reply-To: <20170508054544epcms1p6d3d429e6f062e987adf72fc2c04ed159@epcms1p6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: myungjoo.ham@samsung.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, "krzk@kernel.org" <krzk@kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday, May 08, 2017 05:45:44 AM MyungJoo Ham wrote:
> 
> When min charger-CV is <= 4.0V and max charger-CV is >= 4.0V,
> we can use 4.00V as CV (register value = 0x1).`
> 
> The original code had a typo that wrote ">=" (max_uV >= 4000000),
> which should've been "<", which is not necessary anyway
> as mentioned by Dan Carpenter.
> 
> Reported-By: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

