From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 13 Sep 2016 08:01:17 +0000
Subject: Re: [PATCH 03/47] block-rbd: Adjust the position of a jump label in rbd_header_from_disk()
Message-Id: <CAOi1vP9iQ6u7dm0dRMg4rs6tLaR5mv55yew0URTX00-y6C0S6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <57806eb1-10ed-582e-72d0-2975e1ee967a@users.sourceforge.net>
 <71b06567-1ea9-204d-d61b-2af4426d9cd1@users.sourceforge.net>
In-Reply-To: <71b06567-1ea9-204d-d61b-2af4426d9cd1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Ceph Development <ceph-devel@vger.kernel.org>, Alex Elder <elder@kernel.org>, Sage Weil <sage@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Sep 12, 2016 at 8:44 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 11 Sep 2016 13:37:34 +0200
>
> Add a space character before a single jump label in this function
> according to the current Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/rbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index f4212e1..d61a066 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -1064,7 +1064,7 @@ static int rbd_header_from_disk(struct rbd_device *rbd_dev,
>         header->snap_sizes = snap_sizes;
>
>         return 0;
> -out_2big:
> + out_2big:
>         ret = -EIO;
>         kfree(snap_sizes);
>   free_names:
> --
> 2.10.0
>

Can you point where this current convention is documented?  Certainly
not in CodingStyle, AFAICT...

I know some people prefer a single space in there because it makes
"diff -p" work better, but nowadays with "git diff" this argument is
pretty moot.

Thanks,

                Ilya
