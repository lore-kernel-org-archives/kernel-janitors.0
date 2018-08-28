From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Aug 2018 15:01:30 +0000
Subject: Re: [PATCH] ipmi: msghandler: ensure error value in rv is being returned on error
Message-Id: <20180828150130.de77knqsfyrvln7c@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180828143642.11138-1-colin.king@canonical.com>
In-Reply-To: <20180828143642.11138-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 28, 2018 at 03:36:42PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently ipmi_set_my_LUN returns 0 instead of -EINVAL if the channel
> is out of range.  Fix this by returning the error return rv instead of 0.
> 
> Detected by Clang ("variable 'rv' set but not used")
> 
> Fixes: 048f7c3e352e ("ipmi: Properly release srcu locks on error conditions")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Somebody just sent that some hours ago.

regards,
dan carpenter
