From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 09 Jan 2008 08:06:20 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <20080109080620.GE32560@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de>
In-Reply-To: <4785B7BC.5040106@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 10, 2008 at 11:44:20AM +0530, Nikanth Karthikesan wrote:
> -static int pt_ioctl(struct inode *inode, struct file *file,
> -	 unsigned int cmd, unsigned long arg)
> +static long pt_ioctl(struct file *file, unsigned int cmd, unsigned long
> arg)

this looks line-wrapper by your mailer.

> -		if (copy_from_user(&mtop, p, sizeof(struct mtop)))
> +		if (copy_from_user(&mtop, p, sizeof(struct mtop))) {
> +			unlock_kernel();
>  			return -EFAULT;
> +		}
> 
>  		switch (mtop.mt_op) {
> 
>  		case MTREW:
>  			pt_rewind(tape);
> +			unlock_kernel();

It's generally considered good style to only have as few as possible
return values.  And this is especially important when returning from
a section that's under a lock.  So in this case it would be much better
if you changes this function to have a local 'int error' variable
and then just do

	error = -EFOO;
	goto out_unlock;

wherever you have an early return with the end of the function looking
like


out_unlock:
	unlock_kernel();
	return error;
