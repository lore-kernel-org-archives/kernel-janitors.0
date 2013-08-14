From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 14 Aug 2013 16:28:33 +0000
Subject: Re: [patch] regulator: 88pm800: forever loop in pm800_regulator_probe()
Message-Id: <CAFRkauAL9v1AHW+M4JC4uFpf+Oo3LLTb7Rp80CaOP2AWED+nTg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814161403.GA13601@elgon.mountain>
In-Reply-To: <20130814161403.GA13601@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2013/8/15 Dan Carpenter <dan.carpenter@oracle.com>:
> This is supposed to be testing "i < ARRAY_SIZE()" instead of just
> "ARRAY_SIZE()".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/regulator/88pm800.c b/drivers/regulator/88pm800.c
> index 58e9b74..3459f60 100644
> --- a/drivers/regulator/88pm800.c
> +++ b/drivers/regulator/88pm800.c
> @@ -302,7 +302,7 @@ static int pm800_regulator_probe(struct platform_device *pdev)
>                 unsigned int count = 0;
>
>                 /* Check whether num_regulator is valid. */
> -               for (i = 0; ARRAY_SIZE(pdata->regulators); i++) {
> +               for (i = 0; i < ARRAY_SIZE(pdata->regulators); i++) {
>                         if (pdata->regulators[i])
>                                 count++;
>                 }
Oops. My bad. Thanks for the fix.
Reviewed-by: Axel Lin <axel.lin@ingics.com>
