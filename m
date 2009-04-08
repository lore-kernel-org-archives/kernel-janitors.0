From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 12:22:52 +0000
Subject: Re: [PATCH 35/56] ntfs: Remove void casts
Message-Id: <36ca99e90904080522o4813667fx535e02179b1f3688@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:22, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/ntfs/compress.c |    2 +-
>  fs/ntfs/dir.c      |    8 ++++----
>  fs/ntfs/index.c    |    2 +-
>  fs/ntfs/logfile.c  |    2 +-
>  fs/ntfs/mft.c      |    4 ++--
>  fs/ntfs/super.c    |    8 ++++----
>  fs/ntfs/usnjrnl.c  |    2 +-
>  7 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 9669541..12297ee 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -280,7 +280,7 @@ return_error:
>        }
>
>        /* We have a valid destination page. Setup the destination pointers. */
> -       dp_addr = (u8*)page_address(dp) + do_sb_start;
> +       dp_addr = page_address(dp) + do_sb_start;
Pointer arithmetic.

>
>        /* Now, we are ready to process the current sub-block (sb). */
>        if (!(le16_to_cpup((le16*)cb) & NTFS_SB_IS_COMPRESSED)) {
> diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
> index d7932e9..b6be7c4 100644
> --- a/fs/ntfs/logfile.c
> +++ b/fs/ntfs/logfile.c
> @@ -549,7 +549,7 @@ bool ntfs_check_logfile(struct inode *log_vi, RESTART_PAGE_HEADER **rp)
>                                goto err_out;
>                        }
>                }
> -               kaddr = (u8*)page_address(page) + (pos & ~PAGE_CACHE_MASK);
> +               kaddr = page_address(page) + (pos & ~PAGE_CACHE_MASK);
Pointer arithmetic.

>                /*
>                 * A non-empty block means the logfile is not empty while an
>                 * empty block after a non-empty block has been encountered
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 23bf684..552f91b 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1196,7 +1196,7 @@ static int ntfs_mft_bitmap_find_and_alloc_free_rec_nolock(ntfs_volume *vol,
>                                                "bitmap, aborting.");
>                                return PTR_ERR(page);
>                        }
> -                       buf = (u8*)page_address(page) + page_ofs;
> +                       buf = page_address(page) + page_ofs;
Pointer arithmetic.

>                        bit = data_pos & 7;
>                        data_pos &= ~7ull;
>                        ntfs_debug("Before inner for loop: size 0x%x, "
> @@ -1334,7 +1334,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(ntfs_volume *vol)
>                ntfs_error(vol->sb, "Failed to read from lcn bitmap.");
>                return PTR_ERR(page);
>        }
> -       b = (u8*)page_address(page) + (ll & ~PAGE_CACHE_MASK);
> +       b = page_address(page) + (ll & ~PAGE_CACHE_MASK);
Pointer arithmetic.

>        tb = 1 << (lcn & 7ull);
>        down_write(&vol->lcnbmp_lock);
>        if (*b != 0xff && !(*b & tb)) {
> --
Bert
