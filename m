From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Dec 2017 10:41:30 +0000
Subject: [bug report] net: hns3: Refactor of the reset interrupt handling logic
Message-Id: <20171213104130.tieq5tqujjbvdkjz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Salil Mehta,

The patch ca1d7669b714: "net: hns3: Refactor of the reset interrupt
handling logic" from Dec 4, 2017, leads to the following static
checker warning:

	drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2439 hclge_misc_irq_handle()
	error: uninitialized symbol 'clearval'.

drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
  2416  static irqreturn_t hclge_misc_irq_handle(int irq, void *data)
  2417  {
  2418          struct hclge_dev *hdev = data;
  2419          u32 event_cause;
  2420          u32 clearval;
  2421  
  2422          hclge_enable_vector(&hdev->misc_vector, false);
  2423          event_cause = hclge_check_event_cause(hdev, &clearval);
  2424  
  2425          /* vector 0 interrupt is shared with reset and mailbox source events.
  2426           * For now, we are not handling mailbox events.
  2427           */
  2428          switch (event_cause) {
  2429          case HCLGE_VECTOR0_EVENT_RST:
  2430                  hclge_reset_task_schedule(hdev);
  2431                  break;
  2432          default:
  2433                  dev_dbg(&hdev->pdev->dev,
  2434                          "received unknown or unhandled event of vector0\n");
  2435                  break;
                        ^^^^^^
This break should probably just call hclge_enable_vector() and then
return?

  2436          }
  2437  
  2438          /* we should clear the source of interrupt */
  2439          hclge_clear_event_cause(hdev, event_cause, clearval);
  2440          hclge_enable_vector(&hdev->misc_vector, true);
  2441  
  2442          return IRQ_HANDLED;
  2443  }

regards,
dan carpenter
