From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Nov 2012 11:21:45 +0000
Subject: re: ipc: cleanup do_msgrcv() aroung MSG_COPY feature
Message-Id: <20121105112145.GA11530@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Stanislav Kinsbursky,

This is a semi-automatic email about new static checker warnings.

The patch 6645154dd758: "ipc: cleanup do_msgrcv() aroung MSG_COPY 
feature" from Nov 3, 2012, leads to the following Smatch complaint:

ipc/msg.c:878 do_msgrcv()
	 error: we previously assumed 'msg' could be null (see line 865)

ipc/msg.c
   861                                  } else if (msgflg & MSG_COPY) {
   862                                          msg = fill_copy(copy_number,
   863                                                          msg_counter,
   864                                                          walk_msg, copy);
   865						if (msg)
                                                   ^^^^
New check.  fill_copy() either returns an error pointer, a valid pointer
or NULL.

   866							break;
   867					} else
   868						break;
   869					msg_counter++;
   870				}
   871				tmp = tmp->next;
   872			}
   873			if (!IS_ERR(msg)) {
   874				/*
   875				 * Found a suitable message.
   876				 * Unlink it from the queue.
   877				 */
   878				if ((bufsz < msg->m_ts) && !(msgflg & MSG_NOERROR)) {
                                             ^^^^^
Old dereference.

   879					msg = ERR_PTR(-E2BIG);
   880					goto out_unlock;

regards,
dan carpenter
