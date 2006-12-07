From: "Anupam Kapoor" <anupam.kapoor@gmail.com>
Date: Thu, 07 Dec 2006 04:59:05 +0000
Subject: Re: [KJ] what is best: memcpy or for
Message-Id: <e3177630612062047x36949e8al4368a0c2b176c974@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
In-Reply-To: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 12/6/06, Daniel Marjam=E4ki <daniel.marjamaki@gmail.com> wrote:
> Hello!
>
> I am wondering if there is any real difference between "for" and "memcpy"=
..
>
>     int i, a[100], b[100];
>
>     // method 1
>     for (i =3D 0; i < 100; i++)
>         a[i] =3D b[i];
>
>     // method 2
>     memcpy(a, b, sizeof(a));
>
> Is there any difference in speed?
>
> With a good compiler, the output should be the same for both methods,
> shouldn't it?

in your example above yes. but i would wager that memcpy in general
would be much better. for example on 64bit machines, it can use 64bit
load/store operations. also, using memcpy, gives more info to the
compiler e.g. whether the regions overlap or not etc.

kind regards
anupam
--=20
In the beginning was the lambda, and the lambda was with Emacs, and
Emacs was the lambda.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
