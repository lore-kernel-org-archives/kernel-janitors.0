From: Boaz Harrosh <bharrosh@panasas.com>
Date: Mon, 30 Jan 2012 13:37:29 +0000
Subject: Re: [patch] exofs: add a cap on the memcpy() size
Message-Id: <4F269D19.5030200@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120130075949.GA22364@elgon.mountain>
In-Reply-To: <20120130075949.GA22364@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/30/2012 09:59 AM, Dan Carpenter wrote:
> This data comes from the device, so probably it's fairly trustworthy but
> it makes the static checkers happy if we check it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/exofs/super.c b/fs/exofs/super.c
> index d22cd16..755812a 100644
> --- a/fs/exofs/super.c
> +++ b/fs/exofs/super.c
> @@ -529,6 +529,8 @@ static int exofs_devs_2_odi(struct exofs_dt_device_info *dt_dev,
>  			     struct osd_dev_info *odi)
>  {
>  	odi->systemid_len = le32_to_cpu(dt_dev->systemid_len);
> +	if (odi->systemid_len > OSD_SYSTEMID_LEN)
> +		return -EINVAL;
>  	memcpy(odi->systemid, dt_dev->systemid, odi->systemid_len);
>  
>  	odi->osdname_len = le32_to_cpu(dt_dev->osdname_len);

Hi Dan

I was going over this code and for the life of me I can't remember
why I have dt_dev->systemid_len at all. The ->systemid field
is just a constant 20 bytes buffer that is always there. at all
ends of the spectrum. (Including user-mode mkfs.exofs)

I think my thought was that dt_dev->systemid_len could be
either 20 or zero, for ignoring it.

I think I'd like something like:
-  	memcpy(odi->systemid, dt_dev->systemid, odi->systemid_len);
+	if (likely(odi->systemid_len))
+ 		memcpy(odi->systemid, dt_dev->systemid, OSD_SYSTEMID_LEN);

Which should also make the static checkers happy. What do you think?

Thanks
Boaz
