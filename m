From: Jiri Slaby <jslaby@suse.cz>
Date: Thu, 16 Aug 2012 13:56:30 +0000
Subject: Re: [patch] TTY: tty_alloc_driver() returns error pointers
Message-Id: <502CFC0E.9020907@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120816131656.GB23279@elgon.mountain>
In-Reply-To: <20120816131656.GB23279@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/16/2012 03:16 PM, Dan Carpenter wrote:
> We changed these from alloc_tty_driver() to tty_alloc_driver() so the
> error handling needs to modified to check for IS_ERR() instead of NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Shame.

Acked-by: Jiri Slaby <jslaby@suse.cz>

thanks,
-- 
js
suse labs
