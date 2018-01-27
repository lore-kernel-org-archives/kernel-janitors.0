From: Johan Hovold <johan@kernel.org>
Date: Sat, 27 Jan 2018 05:16:24 +0000
Subject: Re: [PATCH] USB: wusbcore: remove redundant re-assignment to pointer 'dev'
Message-Id: <20180127051624.GA11128@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180126150712.6380-1-colin.king@canonical.com>
In-Reply-To: <20180126150712.6380-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 26, 2018 at 03:07:12PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer dev is initialized and then re-assigned with the same value
> a little later, hence the second assignment is redundant and can be
> removed.
> 
> Cleans up clang warning:
> drivers/usb/wusbcore/wa-nep.c:88:17: warning: Value stored to 'dev'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Johan Hovold <johan@kernel.org>
