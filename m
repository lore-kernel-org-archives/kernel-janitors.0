From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 27 Nov 2005 00:04:59 +0000
Subject: Re: [KJ] pci-sh7751.c request_region return value check
Message-Id: <20051127000459.GA13338@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39615100488523147=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200511262000.12480.carlos@embedded.cl>
In-Reply-To: <200511262000.12480.carlos@embedded.cl>
To: kernel-janitors@vger.kernel.org

--===============39615100488523147==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 26, 2005 at 08:00:11PM -0300, Carlos Manuel Duclos Vergara wrote:
>  	unsigned int tmp, id;
> +	struct resource * r = NULL;

CodingStyle says no space between the * and r.

> +			if( r == NULL )
> +			{

"if (!r) {

> +				printk( KERN_CRIT "PCI: Could not allocate memory for our controller (Address: %lu)\n", PCI_REG(SH7751_PCIPAR));

No space between the ( and the KERN_


--===============39615100488523147==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39615100488523147==--
