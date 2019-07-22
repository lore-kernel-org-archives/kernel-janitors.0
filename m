From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Mon, 22 Jul 2019 20:13:17 +0000
Subject: Re: [PATCH] leds: an30259a: Fix typo
Message-Id: <eb0e69dc-3257-3337-2558-d5faa0a1416f@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721205955.25317-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721205955.25317-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, pavel@ucw.cz, dmurphy@ti.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On 7/21/19 10:59 PM, Christophe JAILLET wrote:
> All this file is about an30259a, including the reference to the datasheet
> at the top of the file.
> 
> So change the 2 places where an32059a is used instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> an32059a is another chip from panasonic
> ---
>  drivers/leds/leds-an30259a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
> index 1c1f0c8c56f4..37e7c7998972 100644
> --- a/drivers/leds/leds-an30259a.c
> +++ b/drivers/leds/leds-an30259a.c
> @@ -353,7 +353,7 @@ MODULE_DEVICE_TABLE(i2c, an30259a_id);
>  
>  static struct i2c_driver an30259a_driver = {
>  	.driver = {
> -		.name = "leds-an32059a",
> +		.name = "leds-an30259a",
>  		.of_match_table = of_match_ptr(an30259a_match_table),
>  	},
>  	.probe_new = an30259a_probe,
> @@ -364,5 +364,5 @@ static struct i2c_driver an30259a_driver = {
>  module_i2c_driver(an30259a_driver);
>  
>  MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
> -MODULE_DESCRIPTION("AN32059A LED driver");
> +MODULE_DESCRIPTION("AN30259A LED driver");
>  MODULE_LICENSE("GPL v2");
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
