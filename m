From: Corey Minyard <minyard@acm.org>
Date: Mon, 04 Apr 2016 13:03:32 +0000
Subject: Re: [patch] ipmi_ssif: silence an uninitialized variable warning
Message-Id: <57026624.7000007@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160404111657.GA26910@mwanda>
In-Reply-To: <20160404111657.GA26910@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/04/2016 06:16 AM, Dan Carpenter wrote:
> My static checker complains that "ret" could be zero here.  (Presumably
> that means the hardware is badly busted).  But the result would be that
> the caller assumes *resp_len is initialized when it's not and it leads
> to a warning.  Let's just silence the warning.

I don't think i2c_smbus_read_block_data() can return a zero, it's either 
an error or a message.

I'm ok with this, but can you add a comment saying why this is here?  I 
don't like strange looking code without explanations.

Thanks,
-corey

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 8b3be8b..512c5b6 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1232,6 +1232,8 @@ static int do_cmd(struct i2c_client *client, int len, unsigned char *msg,
>   			break;
>   	}
>   
> +	if (ret = 0)
> +		ret = -EINVAL;
>   	if (ret > 0) {
>   		/* Validate that the response is correct. */
>   		if (ret < 3 ||

