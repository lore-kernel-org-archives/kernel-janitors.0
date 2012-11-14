From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 14 Nov 2012 11:55:32 +0000
Subject: Re: [PATCH] staging: dgrp: dgrp_tty.c: return an -EFAULT if get_user() fails
Message-Id: <20121114115532.5b4fa80d@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352878879-19840-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1352878879-19840-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: gregkh@linuxfoundation.org, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Nov 2012 13:11:18 +0530
Kumar Amit Mehta <gmate.amit@gmail.com> wrote:

> Inspect the return value of get_user() and return -EFAULT on error.

You cam just delete all the TIOCSOFTCAR nonsense. That ioctl is handled
correctly by the core tty layer code rather than incorrectly by the dgrp
driver.

Alan
