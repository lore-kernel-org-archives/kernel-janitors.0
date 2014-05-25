From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 25 May 2014 18:08:55 +0000
Subject: Re: [PATCH 3/8 V2] drivers/staging: Remove useless return variables
Message-Id: <20140525180855.GA30986@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400929608-31128-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400929608-31128-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 24, 2014 at 01:06:48PM +0200, Peter Senna Tschudin wrote:
> This patch remove variables that are initialized with a constant,
> are never updated, and are only used as parameter of return.
> Return the constant instead of using a variable.
> 
> Verified by compilation only.
> 
> The coccinelle script that find and fixes this issue is:
> // <smpl>
> @@
> type T;
> constant C;
> identifier ret;
> @@
> - T ret = C;
> ... when != ret
>     when strict
> return
> - ret
> + C
> ;
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> ---
> Changes from V1:
>  - Updated semantic patch
>  - Refreshed for next-20140523

Can you refresh again?  It still doesn't apply :(

thanks,

greg k-h
