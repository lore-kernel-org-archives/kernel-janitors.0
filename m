From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 24 Jan 2005 15:28:12 +0000
Subject: [KJ] [PATCH] unified spinlock initialization drivers/acpi/ec.c
Message-Id: <200501242046.13778.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0337006369037125=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============0337006369037125==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/drivers/acpi/ec.c	2005-01-19 11:19:24.000000000 +0530
+++ linux-2.6.10/drivers/acpi/ec.c	2005-01-24 15:01:45.000000000 +0530
@@ -599,7 +599,7 @@ acpi_ec_add (
 
 	ec->handle = device->handle;
 	ec->uid = -1;
-	ec->lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&ec->lock);
 	strcpy(acpi_device_name(device), ACPI_EC_DEVICE_NAME);
 	strcpy(acpi_device_class(device), ACPI_EC_CLASS);
 	acpi_driver_data(device) = ec;
@@ -813,7 +813,7 @@ acpi_ec_ecdt_probe (void)
 	ec_ecdt->status_addr = ecdt_ptr->ec_control;
 	ec_ecdt->data_addr = ecdt_ptr->ec_data;
 	ec_ecdt->gpe_bit = ecdt_ptr->gpe_bit;
-	ec_ecdt->lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&ec_ecdt->lock);
 	/* use the GL just to be safe */
 	ec_ecdt->global_lock = TRUE;
 	ec_ecdt->uid = ecdt_ptr->uid;


--===============0337006369037125==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0337006369037125==--
