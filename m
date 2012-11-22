From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Thu, 22 Nov 2012 19:58:33 +0000
Subject: [PATCH 0/2] staging/dgrp/dgrp_tty.c: audit function return values
Message-Id: <1353613595-8505-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, alan@lxorguk.ukuu.org.uk, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch series fixes two issues in dgrp driver:
i) Removes the TIOCSSOFTCAR ioctl handler from dgrp driver so as to allow the
core tty layer to take care of this ioctl instead.

ii) Audits the return value of get_user() and put_user() and return -EFAULT in
case of error.

-- 
1.7.9.5

