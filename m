From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 25 Jan 2019 05:41:52 +0000
Subject: Re: [PATCH -next] EDAC: Drop pointless static qualifier in edac_fake_inject_write()
Message-Id: <alpine.DEB.2.21.1901250640430.2438@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548383420-163054-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548383420-163054-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org



On Fri, 25 Jan 2019, YueHaibing wrote:

> There is no need to have the 'enum hw_event_mc_err_typetype' variable
> static since new value always be assigned before use it.

How did you find this?  If you used some tool, it would really be kind if
you would reference that tool.  People who make tools may need to justify
that the time that they spend doing so is worthwhile.

julia

>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/edac/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
> index 0a92772..6736543 100644
> --- a/drivers/edac/debugfs.c
> +++ b/drivers/edac/debugfs.c
> @@ -8,7 +8,7 @@ static ssize_t edac_fake_inject_write(struct file *file,
>  {
>  	struct device *dev = file->private_data;
>  	struct mem_ctl_info *mci = to_mci(dev);
> -	static enum hw_event_mc_err_type type;
> +	enum hw_event_mc_err_type type;
>  	u16 errcount = mci->fake_inject_count;
>
>  	if (!errcount)
>
>
>
>
>
>
