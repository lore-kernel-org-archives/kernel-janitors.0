From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 18 Apr 2019 10:53:42 +0000
Subject: Re: [PATCH] char/ipmi: fix spelling mistake "receieved_messages" -> "received_messages"
Message-Id: <ed610c60-329c-b4fa-56f7-fc6d39808e6c@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418101502.9748-1-colin.king@canonical.com>
In-Reply-To: <20190418101502.9748-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Aishwarya Pant <aishpant@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/18/2019 3:45 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   Documentation/ABI/testing/sysfs-devices-platform-ipmi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ipmi b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> index 2a781e7513b7..afb5db856e1c 100644
> --- a/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> @@ -212,7 +212,7 @@ Description:
>   					Messages may be broken into parts if
>   					they are long.
>   
> -		receieved_messages:	(RO) Number of message responses
> +		received_messages:	(RO) Number of message responses
>   					received.
>   
>   		received_message_parts: (RO) Number of message fragments
