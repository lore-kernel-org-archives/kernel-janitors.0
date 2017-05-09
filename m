From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Tue, 09 May 2017 23:33:31 +0000
Subject: Re: [PATCH] regulator: max8997/8966: fix charger cv voltage set bug
Message-Id: <591251CB.6000505@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170428141103.llm5t44o2vf46y5c@mwanda>
        <CGME20170428141118epcas2p42c864cf574cc6fa3ffedbef22029e3ef@epcms1p6>
        <20170508054544epcms1p6d3d429e6f062e987adf72fc2c04ed159@epcms1p6>
In-Reply-To: <20170508054544epcms1p6d3d429e6f062e987adf72fc2c04ed159@epcms1p6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: myungjoo.ham@samsung.com, Dan Carpenter <dan.carpenter@oracle.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On 2017년 05월 08일 14:45, MyungJoo Ham wrote:
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
> ---
>  drivers/regulator/max8997-regulator.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
> index efabc0e..559b9ac 100644
> --- a/drivers/regulator/max8997-regulator.c
> +++ b/drivers/regulator/max8997-regulator.c
> @@ -428,12 +428,9 @@ static int max8997_set_voltage_charger_cv(struct regulator_dev *rdev,
>  	if (max_uV < 4000000 || min_uV > 4350000)
>  		return -EINVAL;
>  
> -	if (min_uV <= 4000000) {
> -		if (max_uV >= 4000000)
> -			return -EINVAL;
> -		else
> -			val = 0x1;
> -	} else if (min_uV <= 4200000 && max_uV >= 4200000)
> +	if (min_uV <= 4000000)
> +		val = 0x1;
> +	else if (min_uV <= 4200000 && max_uV >= 4200000)
>  		val = 0x0;
>  	else {
>  		lb = (min_uV - 4000001) / 20000 + 2;
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
