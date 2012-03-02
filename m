From: Chris Kelly <ckelly@ozmodevices.com>
Date: Fri, 02 Mar 2012 16:32:47 +0000
Subject: RE: [patch] Staging: ozwpan: prevent bogus dereference
Message-Id: <57C28D85C66F5C49B9E212CBFAFDAC1F2301AB2F@CH1PRD0802MB120.namprd08.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065955.GG24508@elgon.mountain>
In-Reply-To: <20120302065955.GG24508@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter wrote:

> app_id comes from the network and can't be trusted.  If it's zero then it will lead to a kernel crash.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Chris Kelly <ckelly@ozmodevices.com>

Many thanks
Chris

> diff --git a/drivers/staging/ozwpan/ozpd.c b/drivers/staging/ozwpan/ozpd.c index 8c460f0..e3381ad 100644
> --- a/drivers/staging/ozwpan/ozpd.c
>+++ b/drivers/staging/ozwpan/ozpd.c
> @@ -806,7 +806,7 @@ void oz_apps_term(void)  void oz_handle_app_elt(struct oz_pd *pd, u8 app_id, struct > > oz_elt *elt)  {
> 	struct oz_app_if *ai;
>-	if (app_id > OZ_APPID_MAX)
>+	if (app_id = 0 || app_id > OZ_APPID_MAX)
> 		return;
> 	ai = &g_app_if[app_id-1];
> 	ai->rx(pd, elt);


