From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Sep 2013 12:01:29 +0000
Subject: Re: [PATCH 02/19] hv: Change variable type to bool
Message-Id: <20130923120129.GI6192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
 <1379802471-30252-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: kys@microsoft.com, devel@linuxdriverproject.org, haiyangz@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 22, 2013 at 12:27:34AM +0200, Peter Senna Tschudin wrote:
> diff --git a/drivers/hv/hv_util.c b/drivers/hv/hv_util.c
> index cb82233..fa37369 100644
> --- a/drivers/hv/hv_util.c
> +++ b/drivers/hv/hv_util.c
> @@ -82,7 +82,7 @@ static void shutdown_onchannelcallback(void *context)
>  	struct vmbus_channel *channel = context;
>  	u32 recvlen;
>  	u64 requestid;
> -	u8  execute_shutdown = false;
> +	bool  execute_shutdown = false;
>  	u8  *shut_txf_buf = util_shutdown.recv_buffer;
>  

The two spaces are meant so first letters 'r', 'r', 'e', and 's' are on
the same column.  It should just be one space so we don't have to
re-align everything when we make a change like this.

regards,
dan carpenter

