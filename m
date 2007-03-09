From: =?ISO-8859-1?Q?Artur_D=27Assump=E7=E3o?= <ad@tagus.ist.utl.pt>
Date: Fri, 09 Mar 2007 20:18:32 +0000
Subject: Re: [KJ] semaphores versus mutexes
Message-Id: <45F1C118.1050307@tagus.ist.utl.pt>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703082031050.14629@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703082031050.14629@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Robert,

Mutexes are a relatively recent addon to the kernel (2.6.16 I think).

In the old days of the linux kernel, I think semaphores where almost the=20
only blockable syncronization primitive available. Meanwhile, many other=20
implementations have appeared, that offered more optimization for=20
specific situations, previously covered by semaphores, for instance:
    - R/W Semaphores
    - Completions (kernel 2.4 ?)
    - And recently mutexes.

Has you can imagine, most of the semaphores usage, where to cover these=20
previsous situations. Mutexes are no exception. I don't think there is=20
much code using semaphores for allowing more than one process inside the=20
critical region, and if there is, it should be possible to port it to=20
one of the available alternatives.

With the appearing of a specific Mutex implementation (the missing=20
link), unless i'm missing something, i believe that the semaphore API=20
should be in it's way out of the kernel soon. So, code that uses=20
semaphores has a mutual exclusion primitive or even, to sincronize=20
multiple execution flows, should be ported to the mutex and completion=20
API, respectively.

Check here: http://lwn.net/Articles/167034/

Hope i've helped,

Artur D'Assump=E7=E3o






Robert P. J. Day wrote:
>   i'm not sure if there's some (lots of?) potential cleanup here, so
> if someone can clarify this, i'd be ever so grateful.
>
>   from what i read (and i could be way offbase), the semaphore.h
> header files technically define general counting semaphores, while the
> more specific mutex.h header files define strictly *binary*
> sempahores.  is that correct so far?
>
>   if that's true, then it would seem to follow that the semaphore.h
> files shouldn't define anything related strictly to mutexes, but at
> the moment, that's not what's happening.  asm-i386/semaphore.h
> contains stuff like:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> #define DECLARE_MUTEX(name) __DE=
CLARE_SEMAPHORE_GENERIC(name,1)
> #define DECLARE_MUTEX_LOCKED(name) __DECLARE_SEMAPHORE_GENERIC(name,0)
> ...
> static inline void init_MUTEX (struct semaphore *sem)
> {
>         sema_init(sem, 1);
> }
>
> static inline void init_MUTEX_LOCKED (struct semaphore *sem)
> {
>         sema_init(sem, 0);
> }
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> which would seem to belong more properly in mutex.h, no?
>
>   instead of DECLARE_MUTEX, one would use mutex.h's DEFINE_MUTEX, no?
> and instead of init_MUTEX(), you would use mutex_init(), right?
> except that mutex.h has no equivalent to DECLARE_MUTEX_LOCKED or
> init_MUTEX_LOCKED that i can see.
>
>   can someone clarify what should be happening here in a perfect
> world?  thanks.
>
> rday
>
>  =20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
