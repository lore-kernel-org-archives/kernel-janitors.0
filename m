From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Mon, 23 Oct 2006 19:42:22 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <a01a16b50610231242w371b0c33w630797fc23ceccee@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
In-Reply-To: <20061023171910.GA23714@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 23/10/06, Neil Horman <nhorman@tuxdriver.com> wrote:>         if (misc_r=
egister(&mmtimer_miscdev)) {>                 printk(KERN_ERR "%s: failed t=
o register device\n",>                        MMTIMER_NAME);> -            =
   return -1;> +               goto out1;>         }
Domen Puncer recently asked someone else not to use numbered labels(they ha=
ve the same "benefits" as line numbers in BASIC...).You might want to consi=
der that.
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
