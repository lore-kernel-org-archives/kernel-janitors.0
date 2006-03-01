From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Wed, 01 Mar 2006 08:07:51 +0000
Subject: Re: [KJ][Patch][update] check return value of request_region in
Message-Id: <200603010907.52197.tim@aapopfiets.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0051436837030642835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141198185.7784.9.camel@localhost.localdomain>
In-Reply-To: <1141198185.7784.9.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============0051436837030642835==
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 01 March 2006 08:29, Darren Jenkins\ wrote:
> +	if (!request_region(card->iobase, 256,
> +				card_names[pci_id->driver_data])) {
> +		printk(KERN_ERR "ali_audio: request_region failed");
> +		kfree(card);
> +		return -EBUSY;
> +	}
You forgot a \n there.

Tim

--===============0051436837030642835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0051436837030642835==--
