From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 06 Jul 2005 08:39:40 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qla1280.c: pci_get_device instead of
Message-Id: <20050706083940.GA21650@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52287513640419947=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb30405070514134ebef46@mail.gmail.com>
In-Reply-To: <cbecb30405070514134ebef46@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============52287513640419947==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 05, 2005 at 06:13:10PM -0300, Rodrigo Nascimento wrote:
> This patch changes the pci_find_device to pci_get_device.
> Please correct me, whether it's wrong. It is my first patch. :)

The code is in a 2.4.x ifdef block, for 2.6 it uses the proper pci_driver
model.


--===============52287513640419947==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52287513640419947==--
