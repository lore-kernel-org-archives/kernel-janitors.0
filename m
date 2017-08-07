From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 07 Aug 2017 06:41:03 +0000
Subject: Re: [PATCH] extcon: cros-ec: Fix a potential NULL pointer dereference
Message-Id: <59880B7F.2020300@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20170807063041epcas1p24acf2ca9a0dc16bbf1a800ad0dbb3e01@epcas1p2.samsung.com>
        <20170807063033.8063-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170807063033.8063-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, myungjoo.ham@samsung.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 2017년 08월 07일 15:30, Christophe JAILLET wrote:
> Return -ENOMEM in case of memory allocation failure. This avoids a NULL
> pointer dereference.
> 
> Fixes: c69831666109 ("extcon: cros-ec: Add extcon-cros-ec driver to support display out")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/extcon/extcon-usbc-cros-ec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/extcon/extcon-usbc-cros-ec.c b/drivers/extcon/extcon-usbc-cros-ec.c
> index e759ed477735..598956f1dcae 100644
> --- a/drivers/extcon/extcon-usbc-cros-ec.c
> +++ b/drivers/extcon/extcon-usbc-cros-ec.c
> @@ -68,6 +68,8 @@ static int cros_ec_pd_command(struct cros_ec_extcon_info *info,
>  	int ret;
>  
>  	msg = kzalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
>  
>  	msg->version = version;
>  	msg->command = command;
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
