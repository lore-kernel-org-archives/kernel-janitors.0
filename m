From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Fri, 02 Dec 2005 19:45:26 +0000
Subject: Re: [KJ] [patch] potential data-corruption fix in md.c
Message-Id: <a01a16b50512021145oc902681x60c6ccf3459eb75d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
In-Reply-To: <8378.192.96.150.57.1133516341.squirrel@mail.interexcel.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 12/2/05, Jaco Kroon <jaco@kroon.co.za> wrote:
> Or just cast to (unsigned int) for the check?
> Perhaps that happens implicitly?
> Would that be compiler dependant?

The conversion does indeed happen implicit, and the C standard
(ISO/IEC 9899:1990) does very specific specify how this should be done,
see "6.2.1.5 Usual arithmetic conversions" for details.

The short version is that a smallest type is promoted to the biggest type
as well that unsigned "wins" over signed. The last point can result in
some unexpected results if you are not careful.
Example: What does the following program print?

#include <stdio.h>
int main(int argc, char *argv[])
{
        unsigned int i =3D 12345;
        if (i < -1)
                printf("(%d < -1)\n", i);
        else
                printf("! (%d < -1)\n", i);
        return 0;
}

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
