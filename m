From: Coiby Xu <coiby.xu@gmail.com>
Date: Wed, 03 Feb 2021 13:50:09 +0000
Subject: Re: [PATCH][next] staging: qlge: fix read of an uninitialized pointer
Message-Id: <20210203135009.4boh3fhpaydysxej@Rk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203133834.22388-1-colin.king@canonical.com>
In-Reply-To: <20210203133834.22388-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, GR-Linux-NIC-Dev@marvell.com, Manish Chopra <manishc@marvell.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Feb 03, 2021 at 01:38:34PM +0000, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Currently the pointer 'reporter' is not being initialized and is
>being read in a netdev_warn message.  The pointer is not used
>and is redundant, fix this by removing it and replacing the reference
>to it with priv->reporter instead.
>
>Addresses-Coverity: ("Uninitialized pointer read")
>Fixes: 1053c27804df ("staging: qlge: coredump via devlink health reporter")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> drivers/staging/qlge/qlge_devlink.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/staging/qlge/qlge_devlink.c b/drivers/staging/qlge/qlge_devlink.c
>index c6ef5163e241..86834d96cebf 100644
>--- a/drivers/staging/qlge/qlge_devlink.c
>+++ b/drivers/staging/qlge/qlge_devlink.c
>@@ -150,7 +150,6 @@ static const struct devlink_health_reporter_ops qlge_reporter_ops = {
>
> void qlge_health_create_reporters(struct qlge_adapter *priv)
> {
>-	struct devlink_health_reporter *reporter;
> 	struct devlink *devlink;
>
> 	devlink = priv_to_devlink(priv);
>@@ -160,5 +159,5 @@ void qlge_health_create_reporters(struct qlge_adapter *priv)
> 	if (IS_ERR(priv->reporter))
> 		netdev_warn(priv->ndev,
> 			    "Failed to create reporter, err = %ld\n",
>-			    PTR_ERR(reporter));
>+			    PTR_ERR(priv->reporter));
> }
>--
>2.29.2
>

Thanks for fixing this issue.

Reviewed-by: Coiby Xu <coiby.xu@gmail.com>

--
Best regards,
Coiby
