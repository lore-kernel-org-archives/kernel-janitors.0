From: Rob Herring <robh@kernel.org>
Date: Wed, 08 Feb 2017 13:40:41 +0000
Subject: Re: [patch] serdev: ttyport: check whether tty_init_dev() fails
Message-Id: <CAL_Jsq+hznc9=iPguScORVuKBUviPUfjUY+2Ncdf5dnmdOPyNA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170208072324.GA12916@mwanda>
In-Reply-To: <20170208072324.GA12916@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 8, 2017 at 1:23 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> My static checker complains that we don't have any error handling here.
> It's simple enough to add it.
>
> Fixes: bed35c6dfa6a ("serdev: add a tty port controller driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Rob Herring <robh@kernel.org>
