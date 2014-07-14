From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Jul 2014 14:12:31 +0000
Subject: Re: [PATCH V2 1/4] staging: vt6556: Cleanup coding style issues
Message-Id: <20140714141231.GM25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405278681-3348-1-git-send-email-peter.senna@gmail.com>
 <20140713193647.GA31010@kroah.com>
 <20140714085932.GA2958@hp-peter.rsr.lip6.fr>
In-Reply-To: <20140714085932.GA2958@hp-peter.rsr.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, tvboxspy@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, forest@alittletooquiet.net

Since you're going to redo this patch anyway, I may as well give you
the normal feedback for these kinds of patches.

> >From 69cd87aca39730c0578592d1296b738f7f223f29 Mon Sep 17 00:00:00 2001
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> Date: Mon, 14 Jul 2014 10:28:42 +0200
> Subject: [PATCH V3] staging: vt6556: Cleanup coding style issues
> 
> This patch cleanup coding style issues reported by checkpatch.
> 
> This typedef, reported by checkpatch, was removed from card.h:
> typedef enum _CARD_PHY_TYPE {
>     PHY_TYPE_AUTO = 0,
>     PHY_TYPE_11B,
>     PHY_TYPE_11G,
>     PHY_TYPE_11A
> } CARD_PHY_TYPE, *PCARD_PHY_TYPE;
> 
> The following typedefs were removed, but enums were kept at device.h:
>  - typedef enum __device_msg_level
>  - typedef enum __DEVICE_NDIS_STATUS
> 

Break this kind of patch into patches which fix one type of mistake per
patch:
patch 1: fix whitespace stuff
patch 2: remove useless returns
patch 3: remove typedefs
etc.

> -//{{RobertYu:20060515, new BB setting for VT3226D0
> +/* {{RobertYu:20060515, new BB setting for VT3226D0 */

Just delete these, because we have version control.

regards,
dan carpenter

