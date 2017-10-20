From: Joe Perches <joe@perches.com>
Date: Fri, 20 Oct 2017 07:35:51 +0000
Subject: Re: [PATCH] IB/qib: remove redundant setting of any in for-loop
Message-Id: <1508484951.6806.46.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171020072103.10337-1-colin.king@canonical.com>
In-Reply-To: <20171020072103.10337-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, 2017-10-20 at 09:21 +0200, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable all is being set but is never read after this
> hence it can be removed from the for loop initialization.
> Cleans up clang warning:

any is really used as bool and is initialized at function
entry.  The earlier loop also reinitializes any unnecessarily.

> drivers/infiniband/hw/qib/qib_file_ops.c:640:7: warning: Value
> stored to 'any' is never read
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/qib/qib_file_ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniban=
d/hw/qib/qib_file_ops.c
> index 2d6a191afec0..b5c2e4223ee7 100644
> --- a/drivers/infiniband/hw/qib/qib_file_ops.c
> +++ b/drivers/infiniband/hw/qib/qib_file_ops.c
> @@ -637,7 +637,7 @@ static int qib_set_part_key(struct qib_ctxtdata *rcd,=
 u16 key)
>  		ret =3D -EBUSY;
>  		goto bail;
>  	}
> -	for (any =3D i =3D 0; i < ARRAY_SIZE(ppd->pkeys); i++) {
> +	for (i =3D 0; i < ARRAY_SIZE(ppd->pkeys); i++) {
>  		if (!ppd->pkeys[i] &&
>  		    atomic_inc_return(&ppd->pkeyrefs[i]) =3D 1) {
>  			rcd->pkeys[pidx] =3D key;

Perhaps the function is better written without
the empty bail: label and without setting ret
and just using return.

Combining the int/bool conversion of any and the
direct returns seems clearer to me.

Something like:
---
=A0drivers/infiniband/hw/qib/qib_file_ops.c | 70 ++++++++++++--------------=
------
=A01 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/=
hw/qib/qib_file_ops.c
index 2d6a191afec0..8078854e1cd6 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -568,20 +568,17 @@ static int qib_tid_free(struct qib_ctxtdata *rcd, uns=
igned subctxt,
=A0static int qib_set_part_key(struct qib_ctxtdata *rcd, u16 key)
=A0{
=A0	struct qib_pportdata *ppd =3D rcd->ppd;
-	int i, any =3D 0, pidx =3D -1;
+	int i;
+	bool any =3D false;
+	int pidx =3D -1;
=A0	u16 lkey =3D key & 0x7FFF;
-	int ret;
=A0
-	if (lkey =3D (QIB_DEFAULT_P_KEY & 0x7FFF)) {
-		/* nothing to do; this key always valid */
-		ret =3D 0;
-		goto bail;
-	}
+	/* nothing to do; this key always valid */
+	if (lkey =3D (QIB_DEFAULT_P_KEY & 0x7FFF))
+		return 0;
=A0
-	if (!lkey) {
-		ret =3D -EINVAL;
-		goto bail;
-	}
+	if (!lkey)
+		return -EINVAL;
=A0
=A0	/*
=A0	=A0* Set the full membership bit, because it has to be
@@ -594,18 +591,15 @@ static int qib_set_part_key(struct qib_ctxtdata *rcd,=
 u16 key)
=A0	for (i =3D 0; i < ARRAY_SIZE(rcd->pkeys); i++) {
=A0		if (!rcd->pkeys[i] && pidx =3D -1)
=A0			pidx =3D i;
-		if (rcd->pkeys[i] =3D key) {
-			ret =3D -EEXIST;
-			goto bail;
-		}
-	}
-	if (pidx =3D -1) {
-		ret =3D -EBUSY;
-		goto bail;
+		if (rcd->pkeys[i] =3D key)
+			return -EEXIST;
=A0	}
-	for (any =3D i =3D 0; i < ARRAY_SIZE(ppd->pkeys); i++) {
+	if (pidx =3D -1)
+		return -EBUSY;
+
+	for (i =3D 0; i < ARRAY_SIZE(ppd->pkeys); i++) {
=A0		if (!ppd->pkeys[i]) {
-			any++;
+			any =3D true;
=A0			continue;
=A0		}
=A0		if (ppd->pkeys[i] =3D key) {
@@ -613,44 +607,34 @@ static int qib_set_part_key(struct qib_ctxtdata *rcd,=
 u16 key)
=A0
=A0			if (atomic_inc_return(pkrefs) > 1) {
=A0				rcd->pkeys[pidx] =3D key;
-				ret =3D 0;
-				goto bail;
-			} else {
-				/*
-				=A0* lost race, decrement count, catch below
-				=A0*/
-				atomic_dec(pkrefs);
-				any++;
+				return 0;
=A0			}
+			/* lost race, decrement count, catch below */
+			atomic_dec(pkrefs);
+			any =3D true;
=A0		}
-		if ((ppd->pkeys[i] & 0x7FFF) =3D lkey) {
+		if ((ppd->pkeys[i] & 0x7FFF) =3D lkey)
=A0			/*
=A0			=A0* It makes no sense to have both the limited and
=A0			=A0* full membership PKEY set at the same time since
=A0			=A0* the unlimited one will disable the limited one.
=A0			=A0*/
-			ret =3D -EEXIST;
-			goto bail;
-		}
-	}
-	if (!any) {
-		ret =3D -EBUSY;
-		goto bail;
+			return -EEXIST;
=A0	}
-	for (any =3D i =3D 0; i < ARRAY_SIZE(ppd->pkeys); i++) {
+	if (!any)
+		return -EBUSY;
+
+	for (i =3D 0; i < ARRAY_SIZE(ppd->pkeys); i++) {
=A0		if (!ppd->pkeys[i] &&
=A0		=A0=A0=A0=A0atomic_inc_return(&ppd->pkeyrefs[i]) =3D 1) {
=A0			rcd->pkeys[pidx] =3D key;
=A0			ppd->pkeys[i] =3D key;
=A0			(void) ppd->dd->f_set_ib_cfg(ppd, QIB_IB_CFG_PKEYS, 0);
-			ret =3D 0;
-			goto bail;
+			return 0;
=A0		}
=A0	}
-	ret =3D -EBUSY;
=A0
-bail:
-	return ret;
+	return -EBUSY;
=A0}
=A0
=A0/**
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
