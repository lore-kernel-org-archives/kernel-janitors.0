From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 14 Jul 2009 15:18:19 +0000
Subject: Re: [PATCH 1/3] drivers/hid: Drop NULL test on list_entry result
Message-Id: <alpine.LNX.2.00.0907141717050.813@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907120942070.17416@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907120942070.17416@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-input@vger.kernel.org, gregkh@suse.de, jirislaby@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 12 Jul 2009, Julia Lawall wrote:

> diff --git a/drivers/hid/hid-lgff.c b/drivers/hid/hid-lgff.c
> index 95835ea..987abeb 100644
> --- a/drivers/hid/hid-lgff.c
> +++ b/drivers/hid/hid-lgff.c
> @@ -151,11 +151,6 @@ int lgff_init(struct hid_device* hid)
>  
>  	/* Check that the report looks ok */
>  	report = list_entry(report_list->next, struct hid_report, list);
> -	if (!report) {
> -		err_hid("NULL output report");
> -		return -1;
> -	}
> -
>  	field = report->field[0];
>  	if (!field) {
>  		err_hid("NULL field");
> 

Applied, thanks Julia.

-- 
Jiri Kosina
SUSE Labs
