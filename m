From: Mike Isely <isely@isely.net>
Date: Sat, 26 Mar 2011 04:33:36 +0000
Subject: Re: [PATCH 3/6] [media] pvrusb2: check for allocation failures
Message-Id: <alpine.DEB.1.10.1103252333150.12072@ivanova.isely.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110326015221.GH2008@bicker>
In-Reply-To: <20110326015221.GH2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Mike Isely <isely@isely.net>


Acked-By: Mike Isely <isely@pobox.com>

On Sat, 26 Mar 2011, Dan Carpenter wrote:

> This function returns NULL on failure so lets do that if kzalloc()
> fails.  There is a separate problem that the caller for this function
> doesn't check for errors...
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/media/video/pvrusb2/pvrusb2-std.c b/drivers/media/video/pvrusb2/pvrusb2-std.c
> index 370a9ab..b214f77 100644
> --- a/drivers/media/video/pvrusb2/pvrusb2-std.c
> +++ b/drivers/media/video/pvrusb2/pvrusb2-std.c
> @@ -388,6 +388,9 @@ struct v4l2_standard *pvr2_std_create_enum(unsigned int *countptr,
>  
>  	stddefs = kzalloc(sizeof(struct v4l2_standard) * std_cnt,
>  			  GFP_KERNEL);
> +	if (!stddefs)
> +		return NULL;
> +
>  	for (idx = 0; idx < std_cnt; idx++)
>  		stddefs[idx].index = idx;
>  
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
