From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Mon, 09 Jun 2008 08:35:52 +0000
Subject: Re: [PATCH 1/2] drivers/s390/char/tape_3590.c: introduce missing
Message-Id: <1213000552.19343.15.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806081456260.10294@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806081456260.10294@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: heiko.carstens@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2008-06-08 at 14:56 +0200, Julia Lawall wrote:
> diff -u -p a/drivers/s390/char/tape_3590.c
> b/drivers/s390/char/tape_3590.c
> --- a/drivers/s390/char/tape_3590.c
> +++ b/drivers/s390/char/tape_3590.c
> @@ -1598,7 +1598,7 @@ tape_3590_setup_device(struct tape_devic
>         rc = tape_3590_read_dev_chars(device, rdc_data);
>         if (rc) {
>                 DBF_LH(3, "Read device characteristics failed!\n");
> -               goto fail_kmalloc;
> +               goto fail_rdc_data;
>         }
>         rc = tape_std_assign(device);
>         if (rc)
> 

Nice catch! I'll add this to the git390 queue for 2.6.26.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.


