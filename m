From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 18 Sep 2005 03:38:12 +0000
Subject: Re: [KJ] Holding off patches 6 - 20 for a bit
Message-Id: <9CCF91D6-E859-4B21-B51E-BC22845E8988@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
In-Reply-To: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


On Sep 17, 2005, at 7:43 PM, Arnd Bergmann wrote:

> On S=FCnndag 18 September 2005 04:27, Jesse Millan wrote:
>
>>
>> I'll wait to see if there is any feedback before sending the rest.
>>
>
> Could you explain why you think your patches are a good idea? Defining
> an extra macro that is only used in a single well-known place appears
> a bit pointless to me. Also, looking through the existing drivers,
> less than one out of ten is currently doing it this way.
>
> IMHO, we should rather convert those to use the MODULE_*() macros
> directly.
>
>     Arnd <><
>

It's possible that I misunderstood.

TODO List: Add MODULE_VERSION() to modules

The description says to add the macro and that the preferred way to =20
use is MODULE_VERSION(DRV_VERSION).

Here is the description link and summary:

http://marc.theaimsgroup.com/?l=3Dkernel-janitor-discuss&m=109068085714776

which says:

"Request for Patches

The 2.6.x kernel includes a MODULE_VERSION() parameter for providing
one convenient way for all modules to state what  *their* version is
(as opposed to the version of the larger kernel they're included in).

I've started submitting patches to the subsystem maintainers to add
MODULE_VERSION() entries for drivers that I particularly care about,
and would appreciate assistance handling the others.

For modules which display their version as a string somewhere via
printk, the preferred mechanism is:

#define DRV_VERSION "1.0.0"
MODULE_VERSION(DRV_VERSION);"


--
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Homepage: www.system-calls.com

The question of whether a computer can think is no more interesting =20
than the question of whether a submarine can swim. ~E.W. Dijkstra



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
