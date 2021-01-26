From: Johan Hovold <johan@kernel.org>
Date: Tue, 26 Jan 2021 14:31:26 +0000
Subject: Re: [PATCH] USB: serial: mos7840: fix error code in mos7840_write()
Message-Id: <YBAnvtBE4H0ef+5a@hovoldconsulting.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA/ubifCUlJXxG5g@mwanda>
In-Reply-To: <YA/ubifCUlJXxG5g@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul B Schroeder <pschroeder@uplogix.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 26, 2021 at 01:26:54PM +0300, Dan Carpenter wrote:
> This should return -ENOMEM instead of 0 if the kmalloc() fails.
> 
> Fixes: 3f5429746d91 ("USB: Moschip 7840 USB-Serial Driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Johan
