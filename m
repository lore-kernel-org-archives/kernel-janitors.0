From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Tue, 29 Nov 2005 11:51:27 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <438C40BF.4000207@comhem.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83659719162143054=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============83659719162143054==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Thank you Alexey for reviewing my patch.

About the chunk you didn't understand.
The function must return an unsigned int, therefore "return -ENODEV;" is wrong.



Alexey Dobriyan wrote:
> On Mon, Nov 28, 2005 at 10:43:58PM +0100, Daniel Marjam?ki wrote:
> 
>>--- a/drivers/ide/pci/via82cxxx.c
>>+++ b/drivers/ide/pci/via82cxxx.c
>>@@ -282,7 +285,7 @@ static unsigned int __devinit init_chips
>> 	via_config = via_config_find(&isa);
>> 	if (!via_config->id) {
>> 		printk(KERN_WARNING "VP_IDE: Unknown VIA SouthBridge,
>> 		disabling DMA.\n");
>>-		return -ENODEV;
>>+		return ENODEV;
>> 	}
> 
> 
> I do not understand this chunk.
> 
> 
>>@@ -430,6 +435,7 @@ static void __devinit init_hwif_via82cxx
>> 	ide_set_hwifdata(hwif, vdev);
>>
>> 	vdev->via_config = via_config_find(&isa);
>>+	if (isa) pci_dev_put(isa);
>> 	via_cable_detect(hwif->pci_dev, vdev);
> 
> 
> 	if (isa)
> 		pci_...
> 
> 


--===============83659719162143054==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83659719162143054==--
