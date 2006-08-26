From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Sat, 26 Aug 2006 08:54:53 +0000
Subject: Re: [KJ] [PATCH] Check setup_proc_entry function return values in
Message-Id: <a01a16b50608260154i4332ace2i34fe896c35e1de1f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156581649.3511.5.camel@localhost.localdomain>
In-Reply-To: <1156581649.3511.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 26/08/06, ville palo <ville.palo@vi64pa.net> wrote:>> -       setup_proc=
_entry( dev, dev->priv ); /* XXX check for failure */> +       if (setup_pr=
oc_entry( dev, dev->priv ) !=3D 0) /* XXX check for failure */> +          =
     printk(KERN_ERR "Failed to create proc entries for airo\n");> +>      =
   netif_start_queue(dev);
Hi. I assume this /* XXX check for failure */ comment no longer is necessar=
ysince this now is done, right?
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
