From: Johan Hovold <johan@kernel.org>
Date: Mon, 10 Dec 2018 09:24:17 +0000
Subject: Re: [PATCH -next] USB: serial: mos7840: remove set but not used variables 'number, serial'
Message-Id: <20181210092417.GD31358@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544151042-120303-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544151042-120303-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 07, 2018 at 02:50:42AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/serial/mos7840.c: In function 'mos7840_send_cmd_write_baud_rate':
> drivers/usb/serial/mos7840.c:1584:16: warning:
>  variable 'number' set but not used [-Wunused-but-set-variable]
> 
> drivers/usb/serial/mos7840.c: In function 'mos7840_change_port_settings':
> drivers/usb/serial/mos7840.c:1695:21: warning:
>  variable 'serial' set but not used [-Wunused-but-set-variable]
> 
> 'number' never used since introduction in commit 3f5429746d91 ("USB: Moschip
> 7840 USB-Serial Driver")
> 
> 'serial' not used since commit 5833041f1b13 ("USB: serial: remove unnecessary
> reinitialisations of urb->dev")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied for -next, thanks.

Johan
