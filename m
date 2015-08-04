From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Tue, 04 Aug 2015 10:56:18 +0000
Subject: Re: [patch] extcon: signedness bugs break error handling
Message-Id: <55C09A52.1090201@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150804074723.GC10867@mwanda>
In-Reply-To: <20150804074723.GC10867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/04/2015 04:47 PM, Dan Carpenter wrote:
> Unsigned is never less than zero so this error handling won't work.
> 
> Fixes: be052cc87745 ('extcon: Fix hang and extcon_get/set_cable_state().')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
> index 8301a72..da2fb6c 100644
> --- a/drivers/extcon/extcon.c
> +++ b/drivers/extcon/extcon.c
> @@ -143,7 +143,7 @@ static int find_cable_id_by_name(struct extcon_dev *edev, const char *name)
>  

Applied it. 

Thanks,
Chanwoo Choi

