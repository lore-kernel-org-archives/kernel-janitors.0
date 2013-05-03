From: "devendra.aaru" <devendra.aaru@gmail.com>
Date: Fri, 03 May 2013 07:53:21 +0000
Subject: Re: [patch] staging: ft1000: add a range check in ft1000_ioctl()
Message-Id: <CAHdPZaOVgDm-7czCfQtTaMLs-bU397fettDqdS16FmcvBDqiGA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130503071728.GA29653@elgon.mountain>
In-Reply-To: <20130503071728.GA29653@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 3, 2013 at 12:47 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> msglen comes from get_user() so we need to check that it's not too
> large.
>
> The first element of "pioctl_dpram" is a short which holds the size of
> the data the user wants.  I have chosen a limit which lets us fill the
> rest of the struct.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> msglen is also apparently network endian?  My guess is that we should
> just delete this code instead of trying to fix it.
>
> diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c b/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
> index 3251d2e..e0056c9 100644
> --- a/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
> +++ b/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
> @@ -703,6 +703,8 @@ static long ft1000_ioctl (struct file *file, unsigned int command,
>                         break;
>                 msglen = htons(msglen);
>                  //DEBUG("FT1000:ft1000_ioctl:msg length = %x\n", msglen);
> +               if (msglen > sizeof(*pioctl_dpram) - sizeof(short))
> +                       msglen = sizeof(*pioctl_dpram) - sizeof(short);

doing this may be wrong too? because its in network endian format.
does deleting msglen = htons(msglen)
and adding your change makes sense?


>                  if(copy_to_user (&pioctl_dpram->pseudohdr, pdpram_blk->pbuffer, msglen))
>                                 {
>                                         DEBUG("FT1000:ft1000_ioctl: copy fault occurred\n");
