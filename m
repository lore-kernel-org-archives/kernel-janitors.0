From: Johan Hovold <johan@kernel.org>
Date: Mon, 27 Nov 2017 12:52:13 +0000
Subject: Re: [PATCH] USB: serial: iuu_phoenix: remove redundant assignment of DIV to itself
Message-Id: <20171127125213.GD9862@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171120174015.7191-1-colin.king@canonical.com>
In-Reply-To: <20171120174015.7191-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 20, 2017 at 05:40:15PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of DIV to itself is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Now applied, thanks.

Johan
