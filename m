From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Wed, 15 Feb 2006 23:37:40 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <a01a16b50602151537j77285945x6b474795f8e1d73c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/16/06, Greg KH <greg@kroah.com> wrote:
> If you look at how this variable is used, it's not used as an ASCII
> value, but rather as a arithmetic value.
>
> That is why I said it should be 0, not '\0'.

Ah, I see. I must confess that I only looked at the patch itself and
when '\0' was used I assumed that this was because the variable was
used as a character later on. When this is not the case I have not done
a good enough review. Good that someone else is :)

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
