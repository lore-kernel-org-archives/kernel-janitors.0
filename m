From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 08 Mar 2012 16:08:18 +0000
Subject: Re: [patch] tty: moxa: fix bit test in moxa_start()
Message-Id: <20120308160818.6411c83e@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120307100500.GD25452@elgon.mountain>
In-Reply-To: <20120307100500.GD25452@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 7 Mar 2012 13:05:00 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This is supposed to be doing a shift before the comparison instead of
> just doing a bitwise AND directly.  The current code means the start()
> just returns without doing anything.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alan Cox <alan@linux.intel.com>
