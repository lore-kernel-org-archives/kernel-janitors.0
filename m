From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Jun 2011 19:50:38 +0000
Subject: Re: [PATCH 1/2 v2] mfd/ab3550: Convert to kstrtou8_from_user
Message-Id: <20110620195037.GA2534@p183.telecom.by>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BANLkTikKRVP4PW48YtR+mMMNsaxTDxoGtw@mail.gmail.com>
	<1308599189-28555-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1308599189-28555-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Jun 20, 2011 at 09:46:28PM +0200, Peter Huewe wrote:
> @@ -923,27 +916,16 @@ static ssize_t ab3550_address_write(struct file *file,
>  	size_t count, loff_t *ppos)
>  {
>  	struct ab3550 *ab = ((struct seq_file *)(file->private_data))->private;
> -	char buf[32];
> -	int buf_size;
> -	unsigned long user_address;
> +	u8 user_address;
>  	int err;
>  
> -	/* Get userspace string and assure termination */
> -	buf_size = min(count, (sizeof(buf) - 1));
> -	if (copy_from_user(buf, user_buf, buf_size))
> -		return -EFAULT;
> -	buf[buf_size] = 0;
> -
> -	err = strict_strtoul(buf, 0, &user_address);
> +	/* Get userspace string and convert to number */
> +	err = kstrtou8_from_user(user_buf, count, 0, &user_address);
>  	if (err)
> -		return -EINVAL;
> -	if (user_address > 0xff) {
> -		dev_err(&ab->i2c_client[0]->dev,
> -			"debugfs error input > 0xff\n");
> -		return -EINVAL;
> -	}
> +		return err;
> +
>  	ab->debug_address = user_address;
> -	return buf_size;
> +	return count;

You don't need temporary variable and should write straight to final location,
because kstrto* functions will never write to result unless it was converted
successfully.
