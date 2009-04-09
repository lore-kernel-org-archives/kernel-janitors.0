From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:23:34 +0000
Subject: Re: [PATCH 42/56] drivers/s390: Remove void casts
Message-Id: <49DDCCA6.5080605@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-38-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-39-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-40-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-41-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com

[Added maintainer CCs]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/s390/net/qeth_core_main.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
> index c827d69..454e181 100644
> --- a/drivers/s390/net/qeth_core_main.c
> +++ b/drivers/s390/net/qeth_core_main.c
> @@ -1037,7 +1037,7 @@ static int qeth_is_1920_device(struct qeth_card *card)
>  	QETH_DBF_TEXT(SETUP, 2, "chk_1920");
>  
>  	ccwdev = card->data.ccwdev;
> -	chp_dsc = (struct channelPath_dsc *)ccw_device_get_chp_desc(ccwdev, 0);
> +	chp_dsc = ccw_device_get_chp_desc(ccwdev, 0);
>  	if (chp_dsc != NULL) {
>  		/* CHPP field bit 6 = 1 -> single queue */
>  		single_queue = ((chp_dsc->chpp & 0x02) = 0x02);
>   

