From: Corey Minyard <minyard@acm.org>
Date: Thu, 18 Apr 2019 14:15:42 +0000
Subject: Re: [PATCH] char/ipmi: fix spelling mistake "receieved_messages" -> "received_messages"
Message-Id: <20190418141542.GH2479@minyard.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418101502.9748-1-colin.king@canonical.com>
In-Reply-To: <20190418101502.9748-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Aishwarya Pant <aishpant@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 18, 2019 at 11:15:02AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the documentation. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, queued for 5.2

-corey

> ---
>  Documentation/ABI/testing/sysfs-devices-platform-ipmi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ipmi b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> index 2a781e7513b7..afb5db856e1c 100644
> --- a/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> @@ -212,7 +212,7 @@ Description:
>  					Messages may be broken into parts if
>  					they are long.
>  
> -		receieved_messages:	(RO) Number of message responses
> +		received_messages:	(RO) Number of message responses
>  					received.
>  
>  		received_message_parts: (RO) Number of message fragments
> -- 
> 2.20.1
> 
