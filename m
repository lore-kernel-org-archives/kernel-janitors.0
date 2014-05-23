From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 23 May 2014 17:18:26 +0000
Subject: Re: [PATCH 3/8] drivers/staging: Remove useless return variables
Message-Id: <20140523171826.GA4268@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400582028-24990-3-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400582028-24990-3-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 20, 2014 at 12:33:43PM +0200, Peter Senna Tschudin wrote:
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
> - return ret;
> + return C;
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

This patch no longer applies to my tree, can you refresh it and resend?

thanks,

greg k-h
