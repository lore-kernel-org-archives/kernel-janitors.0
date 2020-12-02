From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 02 Dec 2020 09:14:41 +0000
Subject: Re: [PATCH] vhost_vdpa: return -EFAULT if copy_to_user() fails
Message-Id: <20201202091441.sjds7e42j5ivdcfi@steredhat>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c32z5EtDsMyyIL@mwanda>
In-Reply-To: <X8c32z5EtDsMyyIL@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org

On Wed, Dec 02, 2020 at 09:44:43AM +0300, Dan Carpenter wrote:
>The copy_to_user() function returns the number of bytes remaining to be
>copied but this should return -EFAULT to the user.
>
>Fixes: 1b48dc03e575 ("vhost: vdpa: report iova range")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> drivers/vhost/vdpa.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index d6a37b66770b..ef688c8c0e0e 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -344,7 +344,9 @@ static long vhost_vdpa_get_iova_range(struct vhost_vdpa *v, u32 __user *argp)
> 		.last = v->range.last,
> 	};
>
>-	return copy_to_user(argp, &range, sizeof(range));
>+	if (copy_to_user(argp, &range, sizeof(range)))
>+		return -EFAULT;
>+	return 0;
> }
>
> static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
>-- 
>2.29.2
>
>_______________________________________________
>Virtualization mailing list
>Virtualization@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/virtualization
>
