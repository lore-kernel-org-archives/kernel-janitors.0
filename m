From: QLogic Support <support@qlogic.com>
Date: Mon, 18 Jun 2007 12:51:05 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <4658214.1182171064319.JavaMail.support@qlogic.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1129965869776247215=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <46405AB6.6040901@msgid.tls.msk.ru>
In-Reply-To: <46405AB6.6040901@msgid.tls.msk.ru>
To: kernel-janitors@vger.kernel.org

--===============1129965869776247215==
Content-Type: multipart/alternative; 
	boundary="----=_Part_217_4112476.1182171064198"

------=_Part_217_4112476.1182171064198
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Regards,
=20
Steve Newberger
QLogic Corporation
Support@QLogic.com

Please visit our web @
http://support.qlogic.com/ =20


---- Original Message ----
From: shani.moideen@wipro.com
Sent: 17-Jun-2007 22:33:56
To: support@pathscale.com
Cc: openib-general@openib.org; kernel-janitors@lists.osdl.org
Subject: [KJ PATCH] Replacing memset(&lt;addr&gt;,0,PAGE_SIZE) with=09clear=
_page(&lt;addr&gt;) in drivers/infiniband/hw/ipath/ipath_driver.c



Replacing memset(<addr>,0,PAGE_SIZE) with clear_page(<addr>)=20
in drivers/infiniband/hw/ipath/ipath_driver.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/infiniband/hw/ipath/ipath_driver.c b/drivers/infiniban=
d/hw/ipath/ipath_driver.c
index e3a2232..417e3ca 100644
--- a/drivers/infiniband/hw/ipath/ipath_driver.c
+++ b/drivers/infiniband/hw/ipath/ipath_driver.c
@@ -1509,7 +1509,7 @@ int ipath_create_rcvhdrq(struct ipath_devdata *dd,
=20
 =09/* clear for security and sanity on each use */
 =09memset(pd->port_rcvhdrq, 0, pd->port_rcvhdrq_size);
-=09memset(pd->port_rcvhdrtail_kvaddr, 0, PAGE_SIZE);
+=09clear_page(pd->port_rcvhdrtail_kvaddr);
=20
 =09/*
 =09 * tell chip each time we init it, even if we are re-using previous

--=20
Shani=20


The information contained in this electronic message and any attachments to=
 this message are intended for the exclusive use of the addressee(s) and ma=
y contain proprietary, confidential or privileged information. If you are n=
ot the intended recipient, you should not disseminate, distribute or copy t=
his e-mail. Please notify the sender immediately and destroy all copies of =
this message and any attachments.=20

WARNING: Computer viruses can be transmitted via email. The recipient shoul=
d check this email and any attachments for the presence of viruses. The com=
pany accepts no liability for any damage caused by any virus transmitted by=
 this email.
=20
www.wipro.com

------=_Part_217_4112476.1182171064198--


--===============1129965869776247215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============1129965869776247215==--
