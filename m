From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 10 Feb 2005 22:36:10 +0000
Subject: Re: [KJ] [PATCH][18/26] drivers/usb/image/* - compile warning cleanup
Message-Id: <200502110127.55762.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1918278488385039=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF84.5020.58734F@localhost>
In-Reply-To: <420BEF84.5020.58734F@localhost>
To: kernel-janitors@vger.kernel.org

--===============1918278488385039==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday 10 February 2005 23:34, Stephen Biggs wrote:

> --- linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c
> +++ linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c
> @@ -809,7 +809,11 @@ static int mts_usb_probe(struct usb_inte
>  		goto out_free_urb;
>  
>  	new_desc->host->hostdata[0] = (unsigned long)new_desc;
> -	scsi_add_host(new_desc->host, NULL); /* XXX handle failure */
> +	if(scsi_add_host(new_desc->host, NULL)) {
> +		usb_free_urb(new_desc->urb);
> +		kfree(new_desc);
> +		return -EIO;
> +	}

Should be:

	if (scsi_add_host(new_desc->host, NULL)) {
		rc = -E____;
		goto out_free_urb;
	}

Yes, yes, I know. There is no rc in mts_usb_probe. ;-)

	Alexey

--===============1918278488385039==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1918278488385039==--
