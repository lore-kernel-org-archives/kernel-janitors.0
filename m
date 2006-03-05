From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 21:02:43 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/mca
Message-Id: <1141592563.17717.20.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23261625941330516=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============23261625941330516==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/mca/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/mca/mca-bus.c.orig	2006-03-05 16:09:32.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/mca/mca-bus.c	2006-03-05 16:09:41.000000000 +0100
@@ -157,10 +157,9 @@ struct mca_bus * __devinit mca_attach_bu
 		return NULL;
 	}
 
-	mca_bus = kmalloc(sizeof(struct mca_bus), GFP_KERNEL);
+	mca_bus = kzalloc(sizeof(struct mca_bus), GFP_KERNEL);
 	if (!mca_bus)
 		return NULL;
-	memset(mca_bus, 0, sizeof(struct mca_bus));
 	sprintf(mca_bus->dev.bus_id,"mca%d",bus);
 	sprintf(mca_bus->name,"Host %s MCA Bridge", bus ? "Secondary" : "Primary");
 	device_register(&mca_bus->dev);



--===============23261625941330516==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23261625941330516==--
