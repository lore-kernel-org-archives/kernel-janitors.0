From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 23 Feb 2007 14:10:54 +0000
Subject: Re: [KJ] [RFC][PATCH] BIT macro cleanup
Message-Id: <45DEF5EE.4030002@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b44d3fb0702222056k1d2a9b57q69a3555a09a9058e@mail.gmail.com>	 <3b44d3fb0702230014x4ee4a1dewdc624c54b3635e15@mail.gmail.com>	 <45DEAC45.7090105@student.ltu.se> <3b44d3fb0702230215o2fbd5a3y25729e481a447149@mail.gmail.com>
In-Reply-To: <3b44d3fb0702230215o2fbd5a3y25729e481a447149@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, linux-input@atrey.karlin.mff.cuni.cz, linux-joystick@atrey.karlin.mff.cuni.cz

Milind Choudhary wrote:
> On 2/23/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>> > +#define BITWRAP(nr)    (1UL << ((nr) % BITS_PER_LONG))
>> >
>> > & make the whole input subsystem use it
>> > The change is huge, more than 125 files using input.h
>> > & almost all use the BIT macro.
>> It is as a big of change, but have you dismissed the "BIT(nr %
>> BITS_PER_LONG)" approach?
>
> no..
> but just looking at the number of places it is being used,
> it seems that adding a new  macro would be good
> which makes it look short n sweet
You have a point there but I still don't think it should be in bitops.h. 
Why should we favor long-wrap before byte-wrap, so what do you think 
about doing:

#define BITWRAP(x)	BIT((x) % BITS_PER_LONG)

in input.h? Otherwise I think it should be call LBITWRAP (or something) 
to both show what kind it is and enable us to add others later.
>> > -#define BIT(i)         (1UL << ((i)&(__NFDBITS-1)))
>> Are you sure you can just delete this one?
> yes...no users in this file
Ok
>> > -#define BIT(x)         (1ul<<(x))
>> > #define POW2(x)                (1ul<<(x))
>> Maybe you can clean up POW2 as well (or define it as "#define POW2(x)
>> BIT(x)")
> yes
> but want to go one step at a time
> currently just  cleaning up places where BIT macro is explicitly defined
> the implicit uses [replacing 1UL << (x)] will be handled in another 
> patch series
> "use BIT macro wherever appropriate"
Sounds good
>
>>
>> Also, it seems your mail-client swapped the tabs to spaces (aka not able
>> to apply).
> attaching the patch file
> bear with me for the time being
>
No problem :)
It is of course always a good idea to send the patches to yourself and 
then trying to apply that patch to see it is alright. But sometimes you 
can't get the mailer working, then sendpatchset can be of interest:
http://www.speakeasy.org/~pj99/sgi/sendpatchset

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
