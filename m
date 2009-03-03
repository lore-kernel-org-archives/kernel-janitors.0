From: Manish Katiyar <mkatiyar@gmail.com>
Date: Tue, 03 Mar 2009 16:53:47 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <ea11fea30903030853x12f0863ev1ed6d7b7cf100597@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Mar 3, 2009 at 9:52 PM, Stefan Richter
<stefanr@s5r6.in-berlin.de> wrote:
> Manish Katiyar wrote:
>> On Fri, Feb 20, 2009 at 8:19 PM, Manish Katiyar <mkatiyar@gmail.com> wro=
te:
>>> Below is the updated patch
>>
>> Hi Stefan,
>>
>> Has this been accepted, or is it still not worth it ?
>
> Your last posting looked good to me. =A0But I am not the one to take it;

Thanks a lot for your response Stefan.

I understand that this doesn't lie in purview of Ingo's interest, but
since one of the kernel maintainers is already in the mail chain, Ingo
can it be pulled by you, else I will send it to andrew or probably
trivial@kernel.org.

> I
> just looked at the thread coincidentally.
>
> One thing that wasn't answered in the discussion is whether
> device_initcall is not only the equivalent but also the /best/
> replacement of __initcall, specifically for kallsyms_init. =A0(Maybe it
> should be something else; then a mechanical replacement by
> device_initcall would lower awareness of the issue --- if there is an
> issue. =A0There probably isn't, but I don't know.)
hmm... I don't know much about this, and googling doesn't give
anything significant.

Thanks -
Manish


> --
> Stefan Richter
> -=3D=3D=3D-=3D--=3D --=3D ---=3D
> http://arcgraph.de/sr/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
