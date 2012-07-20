From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 20 Jul 2012 14:00:45 +0000
Subject: Re: [patch] tty: save newly allocated buffer in tty_free_termios()
Message-Id: <20120720150045.43828c39@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120720133245.GD22245@elgon.mountain>
In-Reply-To: <20120720133245.GD22245@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 20 Jul 2012 16:32:45 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We're trying to save the termios state and we need to allocate a buffer
> to do it.  Smatch complains that the buffer is leaked at the end of the
> function.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alan Cox <alan@linux.intel.com>

(introduced in the recent patches so no need to go back into stable or
anywhere like that)
