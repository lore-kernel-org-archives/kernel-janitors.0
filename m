From: Salil Mehta <salil.mehta@huawei.com>
Date: Wed, 13 Dec 2017 11:36:19 +0000
Subject: RE: [bug report] net: hns3: Refactor of the reset interrupt handling logic
Message-Id: <F4CC6FACFEB3C54C9141D49AD221F7F93BB763A6@FRAEML521-MBX.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171213104130.tieq5tqujjbvdkjz@mwanda>
In-Reply-To: <20171213104130.tieq5tqujjbvdkjz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, December 13, 2017 10:42 AM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: Salil Mehta <salil.mehta@huawei.com>; kernel-
> janitors@vger.kernel.org
> Subject: [bug report] net: hns3: Refactor of the reset interrupt
> handling logic
> 
> Hello Salil Mehta,
> 
> The patch ca1d7669b714: "net: hns3: Refactor of the reset interrupt
> handling logic" from Dec 4, 2017, leads to the following static
> checker warning:
> 
> 	drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2439
> hclge_misc_irq_handle()
> 	error: uninitialized symbol 'clearval'.
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
>   2416  static irqreturn_t hclge_misc_irq_handle(int irq, void *data)
>   2417  {
>   2418          struct hclge_dev *hdev = data;
>   2419          u32 event_cause;
>   2420          u32 clearval;
>   2421
>   2422          hclge_enable_vector(&hdev->misc_vector, false);
>   2423          event_cause = hclge_check_event_cause(hdev, &clearval);
>   2424
>   2425          /* vector 0 interrupt is shared with reset and mailbox
> source events.
>   2426           * For now, we are not handling mailbox events.
>   2427           */
>   2428          switch (event_cause) {
>   2429          case HCLGE_VECTOR0_EVENT_RST:
>   2430                  hclge_reset_task_schedule(hdev);
>   2431                  break;
>   2432          default:
>   2433                  dev_dbg(&hdev->pdev->dev,
>   2434                          "received unknown or unhandled event of
> vector0\n");
>   2435                  break;
>                         ^^^^^^
> This break should probably just call hclge_enable_vector() and then
> return?
Ok yes and maybe return IRQ_NONE for such cases.

I will change this after HNS3 VF driver will get accepted otherwise this change
Will cause conflict with the VF driver patches. Hope this is okay?

Thanks
Salil
