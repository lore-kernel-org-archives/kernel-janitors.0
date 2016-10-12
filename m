From: Eli Billauer <eli.billauer@gmail.com>
Date: Wed, 12 Oct 2016 17:28:30 +0000
Subject: Re: [bug report] staging: New driver: Xillybus generic interface for FPGA
Message-Id: <57FE72BE.2050107@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012082834.GA23170@mwanda>
In-Reply-To: <20161012082834.GA23170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dan,

Thanks for reviewing the driver.

I've taken a look on the code. Since your line numbering and path match 
xillybus_core.c current state, I relate to that, and not to the said patch.

This seems like a false positive to me: Throughout the relevant function 
(xillybus_read), the unlock of wr_mutex is always followed by a return 
command, except for the do-loop, which is partly cited in your message. 
As for the latter, there are only two ways out of that loop: Either 
return immediately (via the "interrupted" label) or re-acquire the mutex.

So again, not having the mutex locked (outside that do-loop) means a 
return command coming very soon.

This makes me conclude that a double unlock isn't possible in this function.

I can't say much on why the static checker raised this error. Maybe 
because it didn't detect that reaching "interrupted" means a certain 
return command?

Regards,
    Eli

On 12/10/16 11:28, Dan Carpenter wrote:
> Hello Eli Billauer,
>
> The patch 48bae0507410: "staging: New driver: Xillybus generic
> interface for FPGA" from Jun 24, 2013, leads to the following static
> checker warning:
>
> 	drivers/char/xillybus/xillybus_core.c:941 xillybus_read()
> 	error: double unlock 'mutex:&channel->wr_mutex'
>
> drivers/char/xillybus/xillybus_core.c
>     904
>     905                                  if (mutex_lock_interruptible(
>     906&channel->wr_mutex))
>     907                                          goto interrupted;
>                                                  ^^^^^^^^^^^^^^^^
> We were interrupted before we could take the lock.
>
>     908                          } while (channel->wr_sleepy);
>     909
>     910                          continue;
>     911
>     912  interrupted: /* Mutex is not held if got here */
>                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Comment agrees.
>
>     913                          if (channel->endpoint->fatal_error)
>     914                                  return -EIO;
>     915                          if (bytes_done)
>     916                                  return bytes_done;
>     917                          if (filp->f_flags&  O_NONBLOCK)
>     918                                  return -EAGAIN; /* Don't admit snoozing */
>     919                          return -EINTR;
>     920                  }
>     921
>     922                  left_to_sleep = deadline - ((long) jiffies);
>     923
>     924                  /*
>     925                   * If our time is out, skip the waiting. We may miss wr_sleepy
>     926                   * being deasserted but hey, almost missing the train is like
>     927                   * missing it.
>     928                   */
>     929
>     930                  if (left_to_sleep>  0) {
>     931                          left_to_sleep >     932                                  wait_event_interruptible_timeout(
>     933                                          channel->wr_wait,
>     934                                          (!channel->wr_sleepy),
>     935                                          left_to_sleep);
>     936
>     937                          if (left_to_sleep>  0) /* wr_sleepy deasserted */
>     938                                  continue;
>     939
>     940                          if (left_to_sleep<  0) { /* Interrupt */
>     941                                  mutex_unlock(&channel->wr_mutex);
>                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> The static checker thinks we still don't have the lock sio it complains.
> Possibly a false positive though because of the wait earlier?
>
>     942                                  if (channel->endpoint->fatal_error)
>     943                                          return -EIO;
>     944                                  if (bytes_done)
>     945                                          return bytes_done;
>     946                                  return -EINTR;
>     947                          }
>     948                  }
>
> regards,
> dan carpenter
>
>    

