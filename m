From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 30 Sep 2004 22:28:24 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 zr36120.c][5/8] Convert
Message-Id: <56140000.1096583304@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23976318825093035=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <19730000.1096496900@w-hlinder.beaverton.ibm.com> <1096496127.16721.10.camel@localhost.localdomain> <24740000.1096500358@w-hlinder.beaverton.ibm.com> <20040930082748.GC20456@bytesex>
In-Reply-To: <20040930082748.GC20456@bytesex>
To: Gerd Knorr <kraxel@bytesex.org>
Cc: Hanna Linder <hannal@us.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, greg@kroah.com

--===============23976318825093035==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Thursday, September 30, 2004 10:27:48 AM +0200 Gerd Knorr <kraxel@bytesex.org> wrote:

>> The whole driver is CONFIG_BROKEN anyway... I only verified my changes
>> didn't add new compiler errors. What part should I remove? Just this check?
> 
> pci/quirks.c does these checks and sets the flags.
> Replacing with a check for "pci_pci_problems & PCIPCI_TRITON" should do.
> 
> bttv does simliar things in bttv_check_chipset() (bttv-cards.c),
> you might want to have a look there ...
> 
>   Gerd

Hi, 

Thanks a lot for your help. Is this what you were thinking?
Ive compile tested it.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/media/video/zr36120.c linux-2.6.9-rc2-mm4patch/drivers/media/video/zr36120.c
--- linux-2.6.9-rc2-mm4cln/drivers/media/video/zr36120.c	2004-09-28 14:58:36.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/drivers/media/video/zr36120.c	2004-09-30 15:17:56.201723784 -0700
@@ -145,14 +145,11 @@ static struct { const char name[8]; uint
 static
 void __init handle_chipset(void)
 {
-	struct pci_dev *dev = NULL;
-
 	/* Just in case some nut set this to something dangerous */
 	if (triton1)
 		triton1 = ZORAN_VDC_TRICOM;
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437, dev)))
-	{
+	if (pci_pci_problems & PCIPCI_TRITON) {
 		printk(KERN_INFO "zoran: Host bridge 82437FX Triton PIIX\n");
 		triton1 = ZORAN_VDC_TRICOM;
 	}



--===============23976318825093035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23976318825093035==--
