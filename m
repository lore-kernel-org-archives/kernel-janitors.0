From: Eric Sandeen <sandeen@redhat.com>
Date: Sat, 09 Aug 2014 13:26:01 +0000
Subject: Re: [PATCH] btrfs: Drop stray check of fixup_workers creation
Message-Id: <53E62169.1010905@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407585075-31035-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1407585075-31035-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>, clm@fb.com, jbacik@fb.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/9/14, 6:51 AM, Andrey Utkin wrote:
> The issue was introduced in a79b7d4b3e8118f265dcb4bdf9a572c392f02708,
> adding allocation of extent_workers, so this stray check is surely not
> meant to be a check of something else.
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=82021
> Reported-by: Maks Naumov <maksqwe1@ukr.net>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Yup, harmless but unneeded.

However, might as well put the extent_workers & qgroup_rescan_workers checks
on the same line now...

Could probably do a V2 or fix it on commit, but anyway:

Reviewed-by: Eric Sandeen <sandeen@redhat.com>

> ---
>  fs/btrfs/disk-io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index 08e65e9..1881713 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -2601,7 +2601,7 @@ int open_ctree(struct super_block *sb,
>  	      fs_info->endio_freespace_worker && fs_info->rmw_workers &&
>  	      fs_info->caching_workers && fs_info->readahead_workers &&
>  	      fs_info->fixup_workers && fs_info->delayed_workers &&
> -	      fs_info->fixup_workers && fs_info->extent_workers &&
> +	      fs_info->extent_workers &&
>  	      fs_info->qgroup_rescan_workers)) {
>  		err =3D -ENOMEM;
>  		goto fail_sb_buffer;
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
