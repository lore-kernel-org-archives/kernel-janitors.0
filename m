From: "=?ISO-8859-2?Q?Marcin_=A6lusarz?=" <marcin.slusarz@gmail.com>
Date: Mon, 16 Apr 2007 21:25:04 +0000
Subject: Re: [KJ] Trivial patch2:changing const char foo* to const char
Message-Id: <4bacf17f0704161425s2b8790a8y3402579de1a4e78a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1176710308.15136.16.camel@bluegenie>
In-Reply-To: <1176710308.15136.16.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2007/4/16, surya.prabhakar@wipro.com <surya.prabhakar@wipro.com>:
your patch is corrupted - try to apply it

>diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
>index e6f5799..b9ef210 100644
>--- a/fs/binfmt_misc.c
>+++ b/fs/binfmt_misc.c
>@@ -445,7 +445,7 @@ static void entry_status(Node *e, char *page)
> {
> 	char *dp;
> 	char *status = "disabled";
>-	const char * flags = "flags: ";
>+	const char  flags[] = "flags: ";
>
> 	if (test_bit(Enabled, &e->flags))
> 		status = "enabled";
it creates more code (on every call, this string will be copied)
mark this variable as static

>@@ -2369,7 +2369,7 @@ int ntfs_truncate(struct inode *vi)
> 	ntfs_attr_search_ctx *ctx;
> 	MFT_RECORD *m;
> 	ATTR_RECORD *a;
>-	const char *te = "  Leaving file length out of sync with i_size.";
>+	const char te[] = "  Leaving file length out of sync with i_size.";
> 	int err, mp_size, size_change, alloc_change;
> 	u32 attr_len;
>
again

> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 1594c90..1fe6ddd 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -647,7 +647,7 @@ not_ntfs:
>  static struct buffer_head *read_ntfs_boot_sector(struct super_block
> *sb,
>                 const int silent)
>  {
> -       const char *read_err_str = "Unable to read %s boot sector.";
> +       const char read_err_str[] = "Unable to read %s boot sector.";
>         struct buffer_head *bh_primary, *bh_backup;
>         sector_t nr_blocks = NTFS_SB(sb)->nr_blocks;
>
again

> @@ -2156,9 +2156,9 @@ get_ctx_vol_failed:
>         }
>         /* If (still) a read-write mount, stamp the transaction log. */
>         if (!(sb->s_flags & MS_RDONLY) && !ntfs_stamp_usnjrnl(vol)) {
> -               static const char *es1 = "Failed to stamp transaction log "
> +               static const char []es1 = "Failed to stamp transaction log "
>                                 "($UsnJrnl)";
> -               static const char *es2 = ".  Run chkdsk.";
> +               static const char []es2 = ".  Run chkdsk.";
>
>                 /* Convert to a read-only mount. */
>                 if (!(vol->on_errors & (ON_ERRORS_REMOUNT_RO |
doesn't compile
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
