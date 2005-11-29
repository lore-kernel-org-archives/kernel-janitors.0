From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Tue, 29 Nov 2005 13:20:34 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <438C55A2.4040407@comhem.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29177824975168326=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============29177824975168326==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


>>About the chunk you didn't understand.
>>The function must return an unsigned int, therefore "return -ENODEV;" is
>>wrong.
> 
> 
> ->init_chipset method returns either small positive number (irq) or BIG
> positive number in case of error ((unsigned int) -ENODEV). In
> do_ide_setup_pci_device() function ->init_chipset return value is casted to int
> and checked for "< 0".
> 

I made a HUGE mistake then. Sorry.
Thank you Alexey!!


--===============29177824975168326==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29177824975168326==--
