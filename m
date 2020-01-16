From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 16 Jan 2020 23:50:14 +0000
Subject: Re: [PATCH] ubi: Fix an error pointer dereference in error handling code
Message-Id: <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
In-Reply-To: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-stm32@st-md-mailman.stormreply.com, Vignesh Raghavendra <vigneshr@ti.com>

On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> and we try to kfree() it which results in an Oops.
>
> This patch re-arranges the error handling so now it only frees things
> which have been allocated successfully.
>
> Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> ---
>  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

This patch seems badly formatted.
Copy&paste error?

> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 1c7be4eb3ba6..6b544665318a 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -1137,7 +1137,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         struct rb_node *tmp_rb;
>         int ret, i, j, free_peb_count, used_peb_count, vol_count;
>         int scrub_peb_count, erase_peb_count;
> -       unsigned long *seen_pebs = NULL;
> +       unsigned long *seen_pebs;
>
>         fm_raw = ubi->fm_buf;
>         memset(ubi->fm_buf, 0, ubi->fm_size);
> @@ -1151,7 +1151,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         dvbuf = new_fm_vbuf(ubi, UBI_FM_DATA_VOLUME_ID);
>         if (!dvbuf) {
>                 ret = -ENOMEM;
> -               goto out_kfree;
> +               goto out_free_avbuf;
>         }
>
>         avhdr = ubi_get_vid_hdr(avbuf);
> @@ -1160,7 +1160,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         seen_pebs = init_seen(ubi);
>         if (IS_ERR(seen_pebs)) {
>                 ret = PTR_ERR(seen_pebs);
> -               goto out_kfree;
> +               goto out_free_dvbuf;
>         }
>
>         spin_lock(&ubi->volumes_lock);
> @@ -1328,7 +1328,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avbuf);
>         if (ret) {
>                 ubi_err(ubi, "unable to write vid_hdr to fastmap SB!");
> -               goto out_kfree;
> +               goto out_free_seen;
>         }
>
>         for (i = 0; i < new_fm->used_blocks; i++) {
> @@ -1350,7 +1350,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>                 if (ret) {
>                         ubi_err(ubi, "unable to write vid_hdr to PEB %i!",
>                                 new_fm->e[i]->pnum);
> -                       goto out_kfree;
> +                       goto out_free_seen;
>                 }
>         }
>
> @@ -1360,7 +1360,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>                 if (ret) {
>                         ubi_err(ubi, "unable to write fastmap to PEB %i!",
>                                 new_fm->e[i]->pnum);
> -                       goto out_kfree;
> +                       goto out_free_seen;
>                 }
>         }
>
> @@ -1370,10 +1370,13 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         ret = self_check_seen(ubi, seen_pebs);
>         dbg_bld("fastmap written!");
>
> -out_kfree:
> -       ubi_free_vid_buf(avbuf);
> -       ubi_free_vid_buf(dvbuf);
> +out_free_seen:
>         free_seen(seen_pebs);
> +out_free_dvbuf:
> +       ubi_free_vid_buf(dvbuf);
> +out_free_avbuf:
> +       ubi_free_vid_buf(avbuf);
> +
>  out:
>         return ret;
>  }
> --
> 2.11.0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
