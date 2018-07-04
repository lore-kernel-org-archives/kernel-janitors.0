From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 10:00:38 +0000
Subject: [bug report] mei: revamp client disconnection flow
Message-Id: <20180704100038.te7zvykomfkttdy2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tomas Winkler,

The patch 3c66618295ca: "mei: revamp client disconnection flow" from
May 4, 2015, leads to the following static checker warning:

drivers/misc/mei/client.c:869 mei_cl_irq_disconnect() warn: 'slots' possible negative type promoted to high
drivers/misc/mei/client.c:1062 mei_cl_irq_connect() warn: 'slots' possible negative type promoted to high
drivers/misc/mei/client.c:1300 mei_cl_irq_notify() warn: 'slots' possible negative type promoted to high
drivers/misc/mei/interrupt.c:179 mei_cl_irq_disconnect_rsp() warn: 'slots' possible negative type promoted to high
drivers/misc/mei/interrupt.c:212 mei_cl_irq_read() warn: 'slots' possible negative type promoted to high


drivers/misc/mei/client.c
  1048  int mei_cl_irq_connect(struct mei_cl *cl, struct mei_cl_cb *cb,
  1049                         struct list_head *cmpl_list)
  1050  {
  1051          struct mei_device *dev = cl->dev;
  1052          u32 msg_slots;
                ^^^^^^^^^^^^^
  1053          int slots;
  1054          int rets;
  1055  
  1056          msg_slots = mei_data2slots(sizeof(struct hbm_client_connect_request));
  1057          slots = mei_hbuf_empty_slots(dev);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch thinks this can return -EOVERFLOW.  Which is weird.  I didn't
look at the code.

  1058  
  1059          if (mei_cl_is_other_connecting(cl))
  1060                  return 0;
                        ^^^^^^^^
It's weird that we return success if mei_hbuf_empty_slots() fails.

  1061  
  1062          if (slots < msg_slots)

It gets type promoted to a high positive value (success).


  1063                  return -EMSGSIZE;
  1064  
  1065          rets = mei_cl_send_connect(cl, cb);
  1066          if (rets)
  1067                  list_move_tail(&cb->list, cmpl_list);
  1068  
  1069          return rets;
  1070  }

The other warnings are the same.

regards,
dan carpenter
