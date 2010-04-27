From: Dan Carpenter <error27@gmail.com>
Date: Tue, 27 Apr 2010 09:05:33 +0000
Subject: Re: [patch] gpio: potential null dereference
Message-Id: <20100427090533.GZ29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100426192520.GU29093@bicker> <20100426230515.GA1388@emlix.com>
In-Reply-To: <20100426230515.GA1388@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jani Nikula <ext-jani.1.nikula@nokia.com>, David Brownell <dbrownell@users.sourceforge.net>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 27, 2010 at 01:05:15AM +0200, Daniel Gl=F6ckner wrote:
> On Mon, Apr 26, 2010 at 09:25:20PM +0200, Dan Carpenter wrote:
> > Smatch found a potential null dereference in gpio_setup_irq().  The=20
> > "pdesc" variable is allocated with idr_find() that can return NULL.  If
> > gpio_setup_irq() is called with 0 as gpio_flags and "pdesc" is null, it
> > would OOPs here.
>=20
> idr_find() doesn't allocate, idr_get_new_above() does.
> Assuming idr_find() never fails for an id if idr_get_new_above()
> successfully allocated that id, I don't think we can reach that
> line with pdesc being NULL:
>=20
> - There are two gotos leading to free_sd
> - #2 is after a block that allocates pdesc
> - #1 is in an if (!gpio_flags) block
> - We exit early if ((desc->flags & GPIO_TRIGGER_MASK) =3D gpio_flags)
> - Therefore (desc->flags & GPIO_TRIGGER_MASK) must be !=3D 0 to reach #1
> - Trigger flags are added to desc->flags only after we have
>   successfully allocated pdesc (i.e. right before return 0)
> - We start off with no trigger flags set
>=20

Are you sure?  If we know that the call to idr_find() returns a valid=20
pointer we could remove a lot of error handling code...

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 76be229..54922a6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -330,14 +330,6 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	return IRQ_HANDLED;
 }
=20
-static void gpio_notify_sysfs(struct work_struct *work)
-{
-	struct poll_desc	*pdesc;
-
-	pdesc =3D container_of(work, struct poll_desc, work);
-	sysfs_notify_dirent(pdesc->value_sd);
-}
-
 static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 		unsigned long gpio_flags)
 {
@@ -353,14 +345,10 @@ static int gpio_setup_irq(struct gpio_desc *desc, str=
uct device *dev,
 		return -EIO;
=20
 	id =3D desc->flags >> PDESC_ID_SHIFT;
+	/* idr_find() always returns a valid pointer here */
 	pdesc =3D idr_find(&pdesc_idr, id);
-	if (pdesc) {
-		free_irq(irq, &pdesc->work);
-		cancel_work_sync(&pdesc->work);
-	}
=20
 	desc->flags &=3D ~GPIO_TRIGGER_MASK;
-
 	if (!gpio_flags) {
 		ret =3D 0;
 		goto free_sd;
@@ -374,39 +362,6 @@ static int gpio_setup_irq(struct gpio_desc *desc, stru=
ct device *dev,
 		irq_flags |=3D test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
=20
-	if (!pdesc) {
-		pdesc =3D kmalloc(sizeof(*pdesc), GFP_KERNEL);
-		if (!pdesc) {
-			ret =3D -ENOMEM;
-			goto err_out;
-		}
-
-		do {
-			ret =3D -ENOMEM;
-			if (idr_pre_get(&pdesc_idr, GFP_KERNEL))
-				ret =3D idr_get_new_above(&pdesc_idr,
-						pdesc, 1, &id);
-		} while (ret =3D -EAGAIN);
-
-		if (ret)
-			goto free_mem;
-
-		desc->flags &=3D GPIO_FLAGS_MASK;
-		desc->flags |=3D (unsigned long)id << PDESC_ID_SHIFT;
-
-		if (desc->flags >> PDESC_ID_SHIFT !=3D id) {
-			ret =3D -ERANGE;
-			goto free_id;
-		}
-
-		pdesc->value_sd =3D sysfs_get_dirent(dev->kobj.sd, "value");
-		if (!pdesc->value_sd) {
-			ret =3D -ENODEV;
-			goto free_id;
-		}
-		INIT_WORK(&pdesc->work, gpio_notify_sysfs);
-	}
-
 	ret =3D request_irq(irq, gpio_sysfs_irq, irq_flags,
 			"gpiolib", &pdesc->work);
 	if (ret)
@@ -417,12 +372,9 @@ static int gpio_setup_irq(struct gpio_desc *desc, stru=
ct device *dev,
=20
 free_sd:
 	sysfs_put(pdesc->value_sd);
-free_id:
 	idr_remove(&pdesc_idr, id);
 	desc->flags &=3D GPIO_FLAGS_MASK;
-free_mem:
 	kfree(pdesc);
-err_out:
 	return ret;
 }
=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
