From: Steve <steve@lonetwin.net>
Date: Fri, 14 Mar 2008 17:20:28 +0000
Subject: A ToDo list item ?
Message-Id: <46036.1205515228@lonetwin.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I recently started working my way through the 'Linux Device Driver' book (3rd edition)[1] and in Chapter 3, 'Char Drivers', page 57, i noticed the following paragraph:

"""
The Older Way
If you dig through much driver code in the 2.6 kernel, you may notice that quite a
few char drivers do not use the cdev interface that we have just described. What you
are seeing is older code that has not yet been upgraded to the 2.6 interface. Since that
code works as it is, this upgrade may not happen for a long time. For completeness,
we describe the older char device registration interface, but new code should not use
it; this mechanism will likely go away in a future kernel.
The classic way to register a char device driver is with:
      int register_chrdev(unsigned int major, const char *name,
                          struct file_operations *fops);
"""

Now, considering that ...
$ grep -r "register_chrdev" drivers/* | wc -l
217

...in the latest and greatest linus kernel, is this a janitor-worthy task ? If it is, I'd like to get started on this, since it would go well along with my current study.

regards,
- steve

[1] http://lwn.net/Kernel/LDD3/
 

