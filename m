From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 08:28:34 +0000
Subject: [bug report] staging: New driver: Xillybus generic interface for FPGA
Message-Id: <20161012082834.GA23170@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Eli Billauer,

The patch 48bae0507410: "staging: New driver: Xillybus generic
interface for FPGA" from Jun 24, 2013, leads to the following static
checker warning:

	drivers/char/xillybus/xillybus_core.c:941 xillybus_read()
	error: double unlock 'mutex:&channel->wr_mutex'

drivers/char/xillybus/xillybus_core.c
   904  
   905                                  if (mutex_lock_interruptible(
   906                                              &channel->wr_mutex))
   907                                          goto interrupted;
                                                ^^^^^^^^^^^^^^^^
We were interrupted before we could take the lock.

   908                          } while (channel->wr_sleepy);
   909  
   910                          continue;
   911  
   912  interrupted: /* Mutex is not held if got here */
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Comment agrees.

   913                          if (channel->endpoint->fatal_error)
   914                                  return -EIO;
   915                          if (bytes_done)
   916                                  return bytes_done;
   917                          if (filp->f_flags & O_NONBLOCK)
   918                                  return -EAGAIN; /* Don't admit snoozing */
   919                          return -EINTR;
   920                  }
   921  
   922                  left_to_sleep = deadline - ((long) jiffies);
   923  
   924                  /*
   925                   * If our time is out, skip the waiting. We may miss wr_sleepy
   926                   * being deasserted but hey, almost missing the train is like
   927                   * missing it.
   928                   */
   929  
   930                  if (left_to_sleep > 0) {
   931                          left_to_sleep    932                                  wait_event_interruptible_timeout(
   933                                          channel->wr_wait,
   934                                          (!channel->wr_sleepy),
   935                                          left_to_sleep);
   936  
   937                          if (left_to_sleep > 0) /* wr_sleepy deasserted */
   938                                  continue;
   939  
   940                          if (left_to_sleep < 0) { /* Interrupt */
   941                                  mutex_unlock(&channel->wr_mutex);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The static checker thinks we still don't have the lock sio it complains.
Possibly a false positive though because of the wait earlier?

   942                                  if (channel->endpoint->fatal_error)
   943                                          return -EIO;
   944                                  if (bytes_done)
   945                                          return bytes_done;
   946                                  return -EINTR;
   947                          }
   948                  }

regards,
dan carpenter
