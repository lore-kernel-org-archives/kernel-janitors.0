From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Oct 2015 20:26:10 +0000
Subject: re: mailbox: Add generic mechanism for testing Mailbox Controllers
Message-Id: <20151021202610.GA31470@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Lee Jones,

The patch 8ea4484d0c2b: "mailbox: Add generic mechanism for testing
Mailbox Controllers" from Oct 16, 2015, leads to the following static
checker warning:

	drivers/mailbox/mailbox-test.c:71 mbox_test_signal_write()
	warn: copy_to/from_user() returns a positive value

drivers/mailbox/mailbox-test.c
    42  static ssize_t mbox_test_signal_write(struct file *filp,
    43                                         const char __user *userbuf,
    44                                         size_t count, loff_t *ppos)
    45  {
    46          struct mbox_test_device *tdev = filp->private_data;
    47          int ret;
    48  
    49          if (!tdev->tx_channel) {
    50                  dev_err(tdev->dev, "Channel cannot do Tx\n");
    51                  return -EINVAL;
    52          }
    53  
    54          if (count > MBOX_MAX_SIG_LEN) {
    55                  dev_err(tdev->dev,
    56                          "Signal length %zd greater than max allowed %d\n",
    57                          count, MBOX_MAX_SIG_LEN);
    58                  return -EINVAL;
    59          }
    60  
    61          tdev->signal = kzalloc(MBOX_MAX_SIG_LEN, GFP_KERNEL);
    62          if (!tdev->signal)
    63                  return -ENOMEM;


This feels racy.  Also if ->signal has already been allocated then this
leaks.

    64  
    65          ret = copy_from_user(tdev->signal, userbuf, count);
    66          if (ret) {
    67                  kfree(tdev->signal);
    68                  return -EFAULT;
    69          }

Normally we do it like this:

	if (copy_from_user(tdev->signal, userbuf, count)) {
		kfree(tdev->signal);
		tdev->signal;  <-- also let's set it to NULL or it leads
				   to a use after free.
		return -EFAULT;
	}



    70  
    71          return ret < 0 ? ret : count;

"ret" is always zero here.  But we can just get rid of that variable
completely.

    72  }

regards,
dan carpenter
