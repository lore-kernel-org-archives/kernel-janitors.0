From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 24 Feb 2006 11:17:55 +0000
Subject: Re: [KJ] [Patch] fs/ kzalloc conversions
Message-Id: <20060224111755.GA7801@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69088217838011579=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140772454.22453.1.camel@alice>
In-Reply-To: <1140772454.22453.1.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============69088217838011579==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 24, 2006 at 10:14:14AM +0100, Eric Sesterhenn wrote:
> this pacth coverts the all cases in fs/ i found with
> grep to kzalloc() usage.

Looks good.

> --- linux-2.6.16-rc4/fs/aio.c.orig
> +++ linux-2.6.16-rc4/fs/aio.c
> @@ -122,10 +122,9 @@ static int aio_setup_ring(struct kioctx

>  	if (nr_pages > AIO_RING_PAGES) {
> -		info->ring_pages = kmalloc(sizeof(struct page *) * nr_pages, GFP_KERNEL);
> +		info->ring_pages = kzalloc(sizeof(struct page *) * nr_pages, GFP_KERNEL);
>  		if (!info->ring_pages)
>  			return -ENOMEM;
> -		memset(info->ring_pages, 0, sizeof(struct page *) * nr_pages);
>  	}

I thought, kcalloc should be used here, but after looking at size(1)
outputs kzalloc wins. Which is slightly suspicious.

> --- linux-2.6.16-rc4/fs/reiserfs/file.c.orig
> +++ linux-2.6.16-rc4/fs/reiserfs/file.c
> @@ -318,12 +318,11 @@ static int reiserfs_allocate_blocks_for_
>  			/* area filled with zeroes, to supply as list of zero blocknumbers
>  			   We allocate it outside of loop just in case loop would spin for
>  			   several iterations. */
> -			char *zeros = kmalloc(to_paste * UNFM_P_SIZE, GFP_ATOMIC);	// We cannot insert more than MAX_ITEM_LEN bytes anyway.
> +			char *zeros = kzalloc(to_paste * UNFM_P_SIZE, GFP_ATOMIC);	// We cannot insert more than MAX_ITEM_LEN bytes anyway.
>  			if (!zeros) {
>  				res = -ENOMEM;
>  				goto error_exit_free_blocks;
>  			}
> -			memset(zeros, 0, to_paste * UNFM_P_SIZE);

Ditto.


--===============69088217838011579==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69088217838011579==--
