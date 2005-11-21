From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Mon, 21 Nov 2005 23:01:42 +0000
Subject: Re: [KJ] [PATCH] sound/oss/maestro3.c printk args concatenation
Message-Id: <a01a16b50511211501w6c965c8fj68b91f74eefb4057@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437E8107.2000103@nhw.pl>
In-Reply-To: <437E8107.2000103@nhw.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/19/05, Witold Rugowski <rugowski@nhw.pl> wrote:
> Removed string concatenation in printk args

Why would you turn a compile-time string concatenation into a run-time
string concatenation? I am not sure what the benefits from doing that shoul=
d be.

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
