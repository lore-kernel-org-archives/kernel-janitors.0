From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Sun, 12 Feb 2006 21:13:12 +0000
Subject: Re: [KJ] Fwd: libata janitor project
Message-Id: <a01a16b50602121313g48852899xc17e85bf6fb1fdd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
In-Reply-To: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/11/06, Darren Jenkins" <darrenrjenkins@gmail.com> wrote:
> I assume in the case of unlikely(test1 && test2) GCC will bail out if
> test1 is not true (no I have not checked yet)
> before testing test2.

This behaviour is in fact required by the standard. I do not have
access to a copy
of a released version of it right now, so I the following text is taken fro=
m one
of the drafts available (http://wwwold.dkuug.dk/jtc1/sc22/open/n2794/):

       6.5.13  Logical AND operator
       ...
       Unlike  the bitwise binary & operator, the && operator
       guarantees left-to-right evaluation;  there  is  a  sequence
       point  after  the  evaluation  of the first operand.  If the
       first operand compares equal to 0, the second operand is not
       evaluated.

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
