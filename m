From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Fri, 22 Dec 2017 18:58:30 +0000
Subject: Re: [PATCH] drm/ttm: fix double lock on glob->lru_lock
Message-Id: <5b7a1a11-2cb0-e8e2-0b84-336981340eb6@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171222180336.4250-1-colin.king@canonical.com>
In-Reply-To: <20171222180336.4250-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Roger He <Hongbo.He@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

NAK,=C2=A0 ttm_bo_cleanup_refs() is dropping the lock.

Your backtrace is cause by an issue I've fixed this morning on=20
amd-staging-drm-next.

Regards,
Christian.

Am 22.12.2017 um 19:03 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> Lock glob->lru_lock is locked before the while loop and also
> locked again at the end of the while loop; it appears that the
> lock at the end of the while loop is a double lock that should
> be removed.  CoverityScan picked this up with the introduction
> of the referenced commit inthe Fixes tag, however, it may have
> existed before this.  I've not been able to test this, but it
> does look incorrect to me.
>
> Detected by CoverityScan, CID#1268846 ("Double lock")
>
> Fixes: 827ed2b06b05 ("drm/ttm: use try_lock in ttm_bo_delayed_delete agai=
n")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 60bb5c12b568..fb8d13a4bc94 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -595,7 +595,6 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_devic=
e *bdev, bool remove_all)
>   		}
>  =20
>   		kref_put(&bo->list_kref, ttm_bo_release_list);
> -		spin_lock(&glob->lru_lock);
>   	}
>   	list_splice_tail(&removed, &bdev->ddestroy);
>   	empty =3D list_empty(&bdev->ddestroy);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
