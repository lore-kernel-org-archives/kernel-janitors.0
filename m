From: Corey Minyard <tcminyard@gmail.com>
Date: Fri, 31 May 2013 12:58:24 +0000
Subject: Re: [patch v2] ipmi: info leak in compat_ipmi_ioctl()
Message-Id: <51A89E70.3010703@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130531124658.GU23987@mwanda>
In-Reply-To: <20130531124658.GU23987@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/31/2013 07:46 AM, Dan Carpenter wrote:
> On x86_64 there is a 4 byte hole between ->recv_type and ->addr.

Got it, in my tree now.  Thanks.

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fixed the changelog a little.  Also added LKML because the
> openipmi is a moderated list (and the moderator thought my email was
> spam).

I apologize, the list gets a lot of spam, and I must have made a mistake.

-corey

>
> diff --git a/drivers/char/ipmi/ipmi_devintf.c b/drivers/char/ipmi/ipmi_devintf.c
> index 9eb360f..8e306ac 100644
> --- a/drivers/char/ipmi/ipmi_devintf.c
> +++ b/drivers/char/ipmi/ipmi_devintf.c
> @@ -810,6 +810,7 @@ static long compat_ipmi_ioctl(struct file *filep, unsigned int cmd,
>   		struct ipmi_recv   __user *precv64;
>   		struct ipmi_recv   recv64;
>   
> +		memset(&recv64, 0, sizeof(recv64));
>   		if (get_compat_ipmi_recv(&recv64, compat_ptr(arg)))
>   			return -EFAULT;
>   

