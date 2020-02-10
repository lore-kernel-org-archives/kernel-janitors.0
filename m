From: Johan Hovold <johan@kernel.org>
Date: Mon, 10 Feb 2020 09:40:58 +0000
Subject: Re: [PATCH] USB: serial: digi_acceleport: remove redundant assignment to pointer priv
Message-Id: <20200210094058.GC3539@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208164601.30032-1-colin.king@canonical.com>
In-Reply-To: <20200208164601.30032-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 08, 2020 at 04:46:01PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer priv is being assigned with a value that is never read, it is
> assigned a new value later on in a for-loop. The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

Johan
