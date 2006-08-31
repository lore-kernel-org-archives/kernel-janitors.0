From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Thu, 31 Aug 2006 08:35:47 +0000
Subject: Re: [KJ] [Patch] [updated] use time_after macro in iphase.c
Message-Id: <82faac5b0608310135o13db4c02l5ceaca4d5562adb0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156937382.24061.5.camel@localhost.localdomain>
In-Reply-To: <1156937382.24061.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

G'day again :).

On 8/31/06, Artur D'Assump=E7=E3o <ad@tagus.ist.utl.pt> wrote:
> Yap, we've talked about that remember? I'm "flea" at #kerneljantors.

G'day. You were right about the book, it is good. :)

>
> I understand very well and I respect your choices.
>
> Anyway I have to disagree here in one point. I don't think this is a
> janitorial patch tough, but rather a potencial bug fix. When we're stick
> to i386 arch we know that the internal kernel representation of an
> unsigned long has 4 bytes (jiffies one, although it has 64bits) and
> rx_tmp_jif is stated has an u32 type. Until here I agree that a cast
> does resolve the nasty warnings, although it isn't very pretty to see if
> it's avoidable.
> Anyway there are architectures where the internal unsigned long
> representation is 8 bytes wide and this timestamp may well loose
> precision here. It's difficult with this timer resolution for an 8byte
> precision to overflow (584 million years?!? :P), but an 4byte may well
> overflow (50 days at 1000 HZ). The time_after() function does handle
> well with unsigned long (4 byte) counter wrap arounds, but I don't know
> if because of the potencial different data types width at compare, there
> could be situations where this could actually fail.

You are right again, however:
Looking at drivers/atm/Kconfig

292 	depends on PCI && ATM && !64BIT

So no 64bit platforms. Also

303  See the file <file:Documentation/networking/iphase.txt> for
further details.

Looking at that file

27      - Only x86 platforms are supported.

As we are stuck with i386 I think it is pretty safe, and that's one of
the reasons why I didn't think there was a need to change it.

> I guess I'd prefer to stick with the unsigned long representation since
> it's the native jiffies one and leaves out doubts.

Thats what I would do if I was going to change it.



Darren J.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
