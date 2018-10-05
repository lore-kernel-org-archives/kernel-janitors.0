From: Johan Hovold <johan@kernel.org>
Date: Fri, 05 Oct 2018 13:40:43 +0000
Subject: Re: [PATCH v2 -next] USB: cypress_m8: remove set but not used variables 'iflag'
Message-Id: <20181005134043.GI3774@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538636993-126815-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538636993-126815-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 04, 2018 at 07:09:53AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/serial/cypress_m8.c: In function 'cypress_set_termios':
> drivers/usb/serial/cypress_m8.c:866:18: warning:
>  variable 'iflag' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: only fix 'iflag' warning

Now applied, thanks.

Johan
