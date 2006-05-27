From: trem <trem@zarb.org>
Date: Sat, 27 May 2006 20:33:30 +0000
Subject: Re: [KJ] [PATCH] drivers/char/mxser.c : replace pci_find_device by
Message-Id: <4478B79A.4080400@zarb.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030703090201070300020505"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4478AF44.3040701@yahoo.fr>
In-Reply-To: <4478AF44.3040701@yahoo.fr>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030703090201070300020505
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Nish Aravamudan wrote:
> On 5/27/06, trem <tremyfr@yahoo.fr> wrote:
>> From: trem <tremyfr@yahoo.fr>
>>
>> This patch simply change pci_find_device by pci_get_device, because
>> pci_find_device is deprecated. pci_dev_put has been added after the
>> loop to decrement the counter if necessary.
>
> Can't the pci_dev_put() be unconditional? pci_dev_put() does the
> checking for NULL itself, it would seem. There are two cases that are
> (logicall, not practically, possible):
>
> 1) We don't even enter the while loop, which can only occur if someone
> alters mxser_pcibrds[]. In this case, we'll call pci_dev_put(pdev),
> pdev == NULL, and return from the call immediately.
>
> 2) We need to clean-up the last iteration of the loop. In this case
> pci_dev_put(pdev) will do the right thing.
>
> Thanks,
> Nish
>
Hi

you're right pci_dev_put check if the parameter is NULL, so checking it
before
is useless. It just avoid to call the function.

I send a new patch

trem


--------------030703090201070300020505
Content-Type: text/x-patch;
	name="mxser_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="mxser_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
index 0fb2fb9..28298dc 100644
--- a/drivers/char/mxser.c
+++ b/drivers/char/mxser.c
@@ -817,7 +817,7 @@ static int mxser_init(void)
 	index = 0;
 	b = 0;
 	while (b < n) {
-		pdev = pci_find_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
+		pdev = pci_get_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
 			if (pdev == NULL) {
 			b++;
 			continue;
@@ -854,6 +854,7 @@ static int mxser_init(void)
 			m++;
 		}
 	}
+	pci_dev_put(pdev);
 #endif
 
 	retval = tty_register_driver(mxvar_sdriver);

--------------030703090201070300020505
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030703090201070300020505--
