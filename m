From: Song Liu <liu.song.a23@gmail.com>
Date: Tue, 01 Oct 2019 23:08:54 +0000
Subject: Re: [PATCH] md/raid0: Fix an error message in raid0_make_request()
Message-Id: <CAPhsuW7zfwX2GPEhXV_X5F7zKi-NvT0vmP-bCc9qYjmFwSJwFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921060031.GB18726@mwanda>
In-Reply-To: <20190921060031.GB18726@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: NeilBrown <neilb@suse.de>, linux-raid <linux-raid@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2019 at 11:00 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The first argument to WARN() is supposed to be a condition.  The
> original code will just print the mdname() instead of the full warning
> message.
>
> Fixes: c84a1372df92 ("md/raid0: avoid RAID0 data corruption due to layout confusion.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/md/raid0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index f61693e59684..3956ea502f97 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -615,7 +615,7 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
>                 tmp_dev = map_sector(mddev, zone, sector, &sector);
>                 break;
>         default:
> -               WARN("md/raid0:%s: Invalid layout\n", mdname(mddev));
> +               WARN(1, "md/raid0:%s: Invalid layout\n", mdname(mddev));
>                 bio_io_error(bio);
>                 return true;

Applied. Thanks for the fix!

Song
