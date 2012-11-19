From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Nov 2012 11:15:54 +0000
Subject: Re: [PATCH] staging: dgrp: dgrp_tty.c: Audit the return values of get/put_user()
Message-Id: <20121119111553.GC6186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1353322531-10092-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1353322531-10092-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: gregkh@linuxfoundation.org, alan@lxorguk.ukuu.org.uk, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 19, 2012 at 04:25:31PM +0530, Kumar Amit Mehta wrote:
> -- fix for missing audits for return values of get_user() and put_user().
> -- Remove the TIOCSSOFTCAR ioctl handling from dgrp driver.

These should be done in separate commits.

Are the calls to access_ok() still needed if we check get_user() and
put_user()?

regards,
dan carpenter

