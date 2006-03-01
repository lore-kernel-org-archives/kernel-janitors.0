From: "=?ISO-8859-1?Q?H=E5kon_L=F8vdal?=" <hlovdal@gmail.com>
Date: Wed, 01 Mar 2006 00:18:35 +0000
Subject: Re: [KJ] Re: [Patch] kzalloc() conversion in drivers/usb
Message-Id: <a01a16b50602281618j2ffa5d10x9194121ff2644862@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060227193309.GA9991@suse.de>
In-Reply-To: <20060227193309.GA9991@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/27/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> --- linux-2.6.16-rc4-mm2.orig/drivers/usb/host/ehci-mem.c       2006-02-2=
7 20:55:38.000000000 +0100
> +++ linux-2.6.16-rc4-mm2/drivers/usb/host/ehci-mem.c    2006-02-27 20:57:=
01.000000000 +0100
> @@ -220,13 +220,9 @@ static int ehci_mem_init (struct ehci_hc
>                 ehci->periodic [i] =3D EHCI_LIST_END;
>
>         /* software shadow of hardware table */
> -       ehci->pshadow =3D kmalloc (ehci->periodic_size * sizeof (void *),=
 flags);
> -       if (ehci->pshadow =3D NULL) {
> -               goto fail;
> -       }
> -       memset (ehci->pshadow, 0, ehci->periodic_size * sizeof (void *));
> -
> -       return 0;
> +       ehci->pshadow =3D kcalloc(ehci->periodic_size, sizeof(void *), fl=
ags);
> +       if (ehci->pshadow !=3D NULL)
> +               return 0;
>
>  fail:
>         ehci_dbg (ehci, "couldn't init memory\n");

The following is just my personal opinion, but I would rather have the
code written as

+       ehci->pshadow =3D kcalloc(ehci->periodic_size, sizeof(void *), flag=
s);
+       if (ehci->pshadow =3D NULL)
+               goto fail;
+       return 0;

so that the code conceptually reads
        normal_code...;
        if (error_condition)
                handle_error...;
        normal_code...;
instead of
        normal_code...;
        if (!error_condition)
                normal_code...;

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
