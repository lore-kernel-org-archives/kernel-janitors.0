From: "Om." <om.turyx@gmail.com>
Date: Sun, 30 Jul 2006 08:09:07 +0000
Subject: Re: [KJ] patch to fix initialization code of edd.c [3rd try]
Message-Id: <6b4e42d10607300109n4491c078qb19aef154c700b8b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
In-Reply-To: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/29/06, Jaco Kroon <jaco@kroon.co.za> wrote:
> Om. wrote:
> > On 7/29/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> >
> >>On Sat, Jul 29, 2006 at 06:31:49PM -0700, Om. wrote:
> >>
> >>>Hi,
> >>>BIOS Enhanced Disk Drive Services (EDD) driver's failed return from
> >>>the init function causes memory leaks in src/drivers/firmware/edd.c
> >>>This is my first patch submission. It is generated against 2.6.18-rc2.
> >>>
> >>>Review comments welcome.
> >>>Regards,
> >>>Om.
> >>>
> >>
> >>Looks good, but instead of adding a stack variable failno to free the allocated
> >>devices on failure, why not just use the same i variable and count backwards in
> >>the loop under alloc_fail?
> >
> > I tried that first. But there would be some ambiguity between i=0 as a
> > failure and i=0 as a success.
> > What I meant is,
> >       int i;
> > ...
> >       for (i = 0; i < edd_num_devices(); i++) {
> >               edev = kzalloc(sizeof (*edev), GFP_KERNEL);
> >               if (!edev) {
> >                       rc = -ENOMEM;
> >                       goto alloc_fail;
> >               }
> > ....
> >               edd_devices[i] = edev;
> >       }
> > ...
> > alloc_fail:
> >       for (; i >= 0; i--) {
> >               edd_device_unregister (edd_devices[i]);
> >               kfree (edd_devices[i]);
> >       }
>
> i is unsigned and this code would crash for _all_ error values of i.
I had changed i to int i;
> I'm thinking something like this might work better:
>
> while(i-- > 0) {
>         edd_device_unregister(edd_devices[i]);
>         kfree(edd_devices[i]);
> }
Works fine. The updated patch is here. Thanks to Jaco for the fix.

Signed-off-by: Om Turyx <xhandle@gmail.com>

 drivers/firmware/edd.c |   26 +++++++++++++++++---------
 1 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index b4502ed..878f135 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -738,7 +738,7 @@ static inline int edd_num_devices(void)
 static int __init
 edd_init(void)
 {
-	unsigned int i;
+	int i;
 	int rc=0;
 	struct edd_device *edev;

@@ -754,21 +754,29 @@ edd_init(void)
 	if (rc)
 		return rc;

-	for (i = 0; i < edd_num_devices() && !rc; i++) {
+	for (i = 0; i < edd_num_devices(); i++) {
 		edev = kzalloc(sizeof (*edev), GFP_KERNEL);
-		if (!edev)
-			return -ENOMEM;
-
+		if (!edev) {
+			rc = -ENOMEM;
+			goto alloc_fail;
+		}
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
-			break;
+			goto devreg_fail;
 		}
 		edd_devices[i] = edev;
 	}
+	return rc;

-	if (rc)
-		firmware_unregister(&edd_subsys);
+devreg_fail:
+	kfree(edev);
+
+alloc_fail:
+    while (i-- > 0) {
+		edd_device_unregister(edd_devices[i]);
+		kfree(edd_devices[i]);
+	}
+	firmware_unregister(&edd_subsys);
 	return rc;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
