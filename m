From: Netanel Belgazal <netanel@annapurnalabs.com>
Date: Thu, 13 Oct 2016 16:18:09 +0000
Subject: Re: [bug report] net: ena: Add a driver for Amazon Elastic Network Adapters (ENA)
Message-Id: <aebd1137-73be-9101-a598-ccc2585fc132@annapurnalabs.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160930095520.GA10045@mwanda>
In-Reply-To: <20160930095520.GA10045@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,


Thank you for reporting this bug.

I will submit a patch that switch all the memsets in the code to be

memset(&cmd, 0, sizeof(cmd));


Note:

ena_admin_aq_destroy_cq_cmd and ena_admin_aq_destroy_sq_cmd

have the same size, so this bug does not suppose to create any memory corruption on

platforms with the existing driver.


Regards,

Netanel


On 10/12/2016 10:06 AM, Dan Carpenter wrote:
> Hello Netanel Belgazal,
>
> The patch 1738cd3ed342: "net: ena: Add a driver for Amazon Elastic
> Network Adapters (ENA)" from Aug 10, 2016, leads to the following
> static checker warning:
>
> 	drivers/net/ethernet/amazon/ena/ena_com.c:1259 ena_com_destroy_io_cq()
> 	warn: struct type mismatch 'ena_admin_aq_destroy_cq_cmd vs ena_admin_aq_destroy_sq_cmd'
>
> drivers/net/ethernet/amazon/ena/ena_com.c
>   1251  int ena_com_destroy_io_cq(struct ena_com_dev *ena_dev,
>   1252                            struct ena_com_io_cq *io_cq)
>   1253  {
>   1254          struct ena_com_admin_queue *admin_queue = &ena_dev->admin_queue;
>   1255          struct ena_admin_aq_destroy_cq_cmd destroy_cmd;
>                                             ^
>   1256          struct ena_admin_acq_destroy_cq_resp_desc destroy_resp;
>   1257          int ret;
>   1258  
>   1259          memset(&destroy_cmd, 0x0, sizeof(struct ena_admin_aq_destroy_sq_cmd));
>                                                                              ^
> These struct names are a million characters long but there is one
> character in the middle which is different.  See if you can spot which
> one it is.
>
> Presumably this is a cut and paste error because I really doubt that
> you are really basically transcribing the entire works of William
> Shakespear every time you declare a variable.  Why not just say:
>
> 		memset(&destroy, 0, sizeof(destroy));
>
> That's better style and more future proof.
>
>   1260  
>
> regards,
> dan carpenter

