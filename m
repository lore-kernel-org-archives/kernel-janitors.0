From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 08:18:41 +0000
Subject: [bug report] platform/chrome: wilco_ec: Add event handling
Message-Id: <20190607081841.GA27206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219193702.GA16050@kadam>
In-Reply-To: <20190219193702.GA16050@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Nick Crews,

The patch f7b0bc5eafa4: "platform/chrome: wilco_ec: Add event
handling" from May 23, 2019, leads to the following static checker
warning:

  drivers/platform/chrome/wilco_ec/event.c:352 event_read()
  warn: inconsistent returns 'dev_data->lock'.
    Locked on  : 345
    Unlocked on: 323,333,352

drivers/platform/chrome/wilco_ec/event.c
   306  static ssize_t event_read(struct file *filp, char __user *buf, size_t count,
   307                            loff_t *pos)
   308  {
   309          struct event_device_data *dev_data = filp->private_data;
   310          struct ec_event_entry *entry;
   311          ssize_t n_bytes_written = 0;
   312          int err;
   313  
   314          /* We only will give them the entire event at once */
   315          if (count != 0 && count < EC_ACPI_MAX_EVENT_SIZE)
   316                  return -EINVAL;
   317  
   318          mutex_lock(&dev_data->lock);
   319  
   320          while (dev_data->num_events = 0) {
   321                  if (filp->f_flags & O_NONBLOCK) {
   322                          mutex_unlock(&dev_data->lock);
   323                          return -EAGAIN;
   324                  }
   325                  /* Need to unlock so that data can actually get added to the
   326                   * queue, and since we recheck before use and it's just
   327                   * comparing pointers, this is safe unlocked.
   328                   */
   329                  mutex_unlock(&dev_data->lock);
   330                  err = wait_event_interruptible(dev_data->wq,
   331                                                 dev_data->num_events);
   332                  if (err)
   333                          return err;
   334  
   335                  /* Device was removed as we waited? */
   336                  if (!dev_data->exist)
   337                          return -ENODEV;
   338                  mutex_lock(&dev_data->lock);
   339          }
   340  
   341          entry = list_first_entry(&dev_data->events,
   342                                   struct ec_event_entry, list);
   343          n_bytes_written = entry->size;
   344          if (copy_to_user(buf, &entry->event, n_bytes_written))
   345                  return -EFAULT;

We need to unlock here.  But also maybe we should do other error
handling like the list_del() as well?  I'm not sure.

   346          list_del(&entry->list);
   347          kfree(entry);
   348          dev_data->num_events--;
   349  
   350          mutex_unlock(&dev_data->lock);
   351  
   352          return n_bytes_written;
   353  }

regards,
dan carpenter
