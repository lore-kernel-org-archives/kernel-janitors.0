From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 15 Jul 2014 15:04:28 +0000
Subject: Re: [PATCH V4 1/6] staging: vt6556: Cleanup trivial coding style issues
Message-Id: <20140715150428.GA14053@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405365333-17170-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1405365333-17170-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: forest@alittletooquiet.net, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 14, 2014 at 09:15:28PM +0200, Peter Senna Tschudin wrote:
> This patch cleans up the following checkpatch issues:
>  - tabs instead of spaces on the beginning of a line
>  - use correct /* */ comment style
>  - put { and } on the correct places
>  - line over 80 chars
>  - indentation style for multi-line calls / comments
>  - space after semicolon ,
>  - new line after declaration
> 
> Tested by compilation only.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
> Cahnges from V3:
>  - Splitted the patches by change type

That's a lot of things to be doing all in one single patch, why didn't
you split this up further?

Please do so.

thanks,

greg k-h
