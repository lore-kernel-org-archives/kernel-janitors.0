From: Joe Perches <joe@perches.com>
Date: Sun, 10 Jan 2016 07:29:41 +0000
Subject: Re: [PATCH] [media] netup_unidvb: Remove a useless memset
Message-Id: <1452410981.7773.10.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1452410416-6362-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1452410416-6362-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, serjk@netup.ru, mchehab@osg.samsung.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2016-01-10 at 08:20 +0100, Christophe JAILLET wrote:
> This memory is allocated using kzalloc so there is no need to call
> memset(..., 0, ...)
[]
> diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers=
/media/pci/netup_unidvb/netup_unidvb_core.c
[]
> @@ -774,7 +774,6 @@ static int netup_unidvb_initdev(struct pci_dev *pci_d=
ev,
> =A0
> =A0	if (!ndev)
> =A0		goto dev_alloc_err;
> -	memset(ndev, 0, sizeof(*ndev));
> =A0	ndev->old_fw =3D old_firmware;
> =A0	ndev->wq =3D create_singlethread_workqueue(NETUP_UNIDVB_NAME);
> =A0	if (!ndev->wq) {

It's unusual to not see the alloc above the if

Perhaps it'd be more standard to do something like:
---
diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/m=
edia/pci/netup_unidvb/netup_unidvb_core.c
index 525ebfe..c94cecd 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -771,10 +771,9 @@ static int netup_unidvb_initdev(struct pci_dev *pci_de=
v,
=A0
=A0	/* allocate device context */
=A0	ndev =3D kzalloc(sizeof(*ndev), GFP_KERNEL);
-
=A0	if (!ndev)
=A0		goto dev_alloc_err;
-	memset(ndev, 0, sizeof(*ndev));
+
=A0	ndev->old_fw =3D old_firmware;
=A0	ndev->wq =3D create_singlethread_workqueue(NETUP_UNIDVB_NAME);
=A0	if (!ndev->wq) {

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
