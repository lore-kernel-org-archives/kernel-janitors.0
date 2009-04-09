From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:39:07 +0000
Subject: Re: [PATCH 55/56] xen: Remove void casts
Message-Id: <49DDD04B.90107@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-41-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-55-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-56-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-56-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, jeremy@xensource.com, chrisw@sous-sol.org

[Added maintainer CCs]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/xen/manage.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
> index 0d61db1..89310fb 100644
> --- a/drivers/xen/manage.c
> +++ b/drivers/xen/manage.c
> @@ -149,7 +149,7 @@ static void shutdown_handler(struct xenbus_watch *watch,
>  	if (err)
>  		return;
>  
> -	str = (char *)xenbus_read(xbt, "control", "shutdown", NULL);
> +	str = xenbus_read(xbt, "control", "shutdown", NULL);
>  	/* Ignore read errors and empty reads. */
>  	if (XENBUS_IS_ERR_READ(str)) {
>  		xenbus_transaction_end(xbt, 1);
>   

