From: "chas williams (contractor)" <chas@cmf.nrl.navy.mil>
Date: Thu, 14 Oct 2004 14:08:12 +0000
Subject: [KJ] Re: [PATCH 2.6] fore200e.c replace pci_find_device with
Message-Id: <200410141408.i9EE8BU5013543@ginger.cmf.nrl.navy.mil>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11460412002187503=="
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: Message from Hanna Linder <hannal@us.ibm.com> 
   of "Wed, 13 Oct 2004 15:18:30 PDT." <196790000.1097705910@w-hlinder.beaverton.ibm.com> 
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com

--===============11460412002187503==

i have to concur.  these need to be fixed the right way.  i can only
test the fore200e changes though.  the other drivers see somewhat
limited use so that is a mistake is made during conversion it isnt
critical.

In message <196790000.1097705910@w-hlinder.beaverton.ibm.com>,Hanna Linder writ
es:
>
>
>As pci_find_device is going away soon I have converted this file to use
>pci_get_device instead. I have compile tested it. If anyone has this ATM card
>and could test it that would be great.

--===============11460412002187503==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11460412002187503==--
