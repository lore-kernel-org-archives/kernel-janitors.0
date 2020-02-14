From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Fri, 14 Feb 2020 07:55:07 +0000
Subject: Re: [PATCH] PM / devfreq: Fix a typo in a comment
Message-Id: <7dd67d22-7fe6-ddfd-0752-a0771365d60d@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200214060524epcas1p41d689fc376fa4f59d74f66147ce9f1d2@epcas1p4.samsung.com>
        <20200214060506.29500-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200214060506.29500-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, myungjoo.ham@samsung.com, kyungmin.park@samsung.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/14/20 3:05 PM, Christophe JAILLET wrote:
> 'govenror' was used in place of 'governor'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/devfreq/governor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/governor.h b/drivers/devfreq/governor.h
> index c07ce77c253d..ae4d0cc18359 100644
> --- a/drivers/devfreq/governor.h
> +++ b/drivers/devfreq/governor.h
> @@ -30,7 +30,7 @@
>   * @node:		list node - contains registered devfreq governors
>   * @name:		Governor's name
>   * @immutable:		Immutable flag for governor. If the value is 1,
> - *			this govenror is never changeable to other governor.
> + *			this governor is never changeable to other governor.
>   * @interrupt_driven:	Devfreq core won't schedule polling work for this
>   *			governor if value is set to 1.
>   * @get_target_freq:	Returns desired operating frequency for the device.
> 

Applied it.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
