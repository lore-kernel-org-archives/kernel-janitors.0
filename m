From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 20 Jul 2012 09:48:31 +0000
Subject: Re: [patch] tty: handle NULL parameters in free_tty_struct()
Message-Id: <20120720104831.47cb4237@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120720070634.GC11710@elgon.mountain>
In-Reply-To: <20120720070634.GC11710@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 20 Jul 2012 10:06:34 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We sometimes pass NULL pointers to free_tty_struct().  One example where
> it can happen is in the error handling code in pty_common_install().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alan Cox <alan@linux.intel.com>

We probably shouldn't be passing NULLs there but making
free_tty_struct(NULL) a no-op matches the kfree and other behaviours and
is robust.
