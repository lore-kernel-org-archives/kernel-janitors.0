From: Marcos Souza <marcos.souza.org@gmail.com>
Date: Wed, 18 Apr 2012 19:03:21 +0000
Subject: Re: Patches that add sparse annotations
Message-Id: <CAH0vN5Jp5ye+Nm2MuBJ6Y1ECZPDC3GW+2qc0NBD9dwp0ZRkp5g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334759646-16415-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1334759646-16415-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em 18 de abril de 2012 15:41, Dan Carpenter <dan.carpenter@oracle.com> escr=
eveu:
> On Wed, Apr 18, 2012 at 04:34:06PM +0200, Emil Goode wrote:
>> Hello all,
>>
>> I just wanted to get your opinion on if maintainers will find the
>> patch bellow (and other like it) to be annoying or somewhat useful?
>>
>> In the following lwn article Linus is saying that if you intend to
>> grab a lock in one function and release it in another, you need to
>> inform sparse of this by adding annotations to the functions.
>>
>> http://lwn.net/Articles/109066/
>>
>> The patch silences the following sparse warnings:
>> arch/x86/kernel/apic/io_apic.c:1115:6: warning:
>> context imbalance in 'lock_vector_lock' - wrong count at exit
>> arch/x86/kernel/apic/io_apic.c:1123:6: warning:
>> context imbalance in 'unlock_vector_lock' - unexpected unlock
>
> If you have to ask, then probably it's not worth it.
>
> If you don't run Sparse then this warning doesn't affect you.
> I run Sparse every day but I only look at new warnings so this
> warning doesn't affect me. =A0If I did see the warning message, it
> wouldn't be hard to see why it was there and ignore it.
>
> The downside of sending the patch is that it is a bit of work for
> the maintainer to review and apply. =A0It's also two extra lines of
> code that they might not care about or might think is ugly.
>
> Adding the annotations to the .c file silences the warning, but it
> doesn't add any more information for finding future bugs. =A0To do
> that you would have to add it to .h file as well. =A0(But don't do
> that because it will find two false positives and zero real bugs).
>
> Also the format isn't right. =A0It should be:
>
> void lock_vector_lock(void)
> __acquires(vector_lock)
> {
>
> Your way works, but it looks weird.
>
> Of course, there are times when adding Sparse annotations is the
> correct thing to do. =A0You when that is if you feel it in your heart.
> :P
>
> regards,
> dan carpenter
>
> PS. if you are looking for inspiration, you could just do what I do
> and read Axel Lin's postings to LKML and copy his ideas.

Nice Dan,

When I look to your patches(you and Axel), I feel motived too :)

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Att,

Marcos Paulo de Souza
Acad=EAmico de Ciencia da Computa=E7=E3o - FURB - SC
"Uma vida sem desafios =E9 uma vida sem raz=E3o"
"A life without challenges, is a non reason life"
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
