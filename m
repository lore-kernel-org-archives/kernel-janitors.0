From: Johan Hovold <johan@kernel.org>
Date: Mon, 12 Nov 2018 09:09:34 +0000
Subject: Re: [PATCH -next] USB: serial: quatech2: remove set but not used variable 'port_priv'
Message-Id: <20181112090934.GB13311@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 11, 2018 at 07:44:33AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/serial/quatech2.c: In function 'qt2_process_read_urb':
> drivers/usb/serial/quatech2.c:503:27: warning:
>  variable 'port_priv' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after
> commit 2be818a116b2 ("Revert "USB: quatech2: only write to the tty if the port is open."")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Now applied. Thanks for including the not-used-since information.

Johan
