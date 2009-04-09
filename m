From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 09:42:57 +0000
Subject: Re: [PATCH 03/56] atm: Remove void casts
Message-Id: <49DDC321.60509@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, chas@cmf.nrl.navy.mil

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/atm/lanai.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
> index cf97c34..2c9d0da 100644
> --- a/drivers/atm/lanai.c
> +++ b/drivers/atm/lanai.c
> @@ -1459,7 +1459,7 @@ static int __devinit vcc_table_allocate(struct lanai_dev *lanai)
>  	return (lanai->vccs = NULL) ? -ENOMEM : 0;
>  #else
>  	int bytes = (lanai->num_vci) * sizeof(struct lanai_vcc *);
> -	lanai->vccs = (struct lanai_vcc **) vmalloc(bytes);
> +	lanai->vccs = vmalloc(bytes);
>  	if (unlikely(lanai->vccs = NULL))
>  		return -ENOMEM;
>  	memset(lanai->vccs, 0, bytes);
>   

