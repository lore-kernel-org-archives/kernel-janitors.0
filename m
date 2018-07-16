From: Johan Hovold <johan@kernel.org>
Date: Mon, 16 Jul 2018 12:11:02 +0000
Subject: Re: [PATCH] usb: serial: mos7720: remove redundant variables iflag, mask and serial
Message-Id: <20180716121102.GM10204@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713100831.29120-1-colin.king@canonical.com>
In-Reply-To: <20180713100831.29120-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 13, 2018 at 11:08:31AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables iflag, mask and serial are being assigned but ar never used
> hence are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'iflag' set but not used [-Wunused-but-set-variable]
> warning: variable 'mask' set but not used [-Wunused-but-set-variable]
> warning: variable 'serial' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Now applied, thanks.

Johan
