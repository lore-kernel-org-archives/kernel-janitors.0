From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 22 Sep 2017 21:34:57 +0000
Subject: Re: [PATCH] lib: zstd: make const array rtbTable static, reduces object code size
Message-Id: <2c51727b-8adf-add9-5292-a267cfec3a04@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922145946.14316-1-colin.king@canonical.com>
 <6C490CCD-32E1-4AC3-BCCF-5EB3A56EA887@fb.com>
In-Reply-To: <6C490CCD-32E1-4AC3-BCCF-5EB3A56EA887@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Nick Terrell <terrelln@fb.com>, Chris Mason <clm@fb.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 22/09/17 20:14, Nick Terrell wrote:
> On 9/22/17, 8:00 AM, "linux-kernel-owner@vger.kernel.org on behalf of Col=
in King" <linux-kernel-owner@vger.kernel.org on behalf of colin.king@canoni=
cal.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate const array rtbTable on the stack, instead make it
>> static. Also split overly long line to clean a chechkpach warning.
>> Makes the object code smaller by nearly 500 bytes:
>>
>> Before:
>>    text	   data	    bss	    dec	    hex	filename
>>   13297	    104	      0	  13401	   3459	lib/zstd/fse_compress.o
>>
>> After:
>>    text	   data	    bss	    dec	    hex	filename
>>   12742	    160	      0	  12902	   3266	lib/zstd/fse_compress.o
>>
>> (gcc 6.3.0, x86-64)
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>=20
> I tested your patch with gcc-7.1 on x86, and benchmarked the speed on
> upstream zstd. There isn't a noticeable speed difference, since it isn't a
> particularly hot piece of code. Would you be able to submit the same patch
> upstream [1], or would you be okay with me porting it back upstream, so it
> doesn't get lost on an update?

Since you have more contact with the zstd codebase it may be preferable
for me to pass the port back to upstream over to you Nick (if that's
OK). As it stands, I did a quick check by building the original zstd
codebase with gcc 7.2 and didn't observe any object code size changes
between the original and the patched code. I see that it's optimized
with -O3 and its not using the same gcc flags as the kernel, so I
suspect that may need exploring further to see why there is such a large
change on the kernel version and that of the native user space library
build.

>=20
> I didn't expect gcc to leave constant arrays on the stack, that seems
> silly. Clang makes it static, but gcc loads it onto the stack, and in 6.3+
> it saves the data statically, and then uses vector instructions to load it
> onto the stack [2].

Oh, that latter information is interesting, didn't know that.

Thanks for testing.

Colin
>=20
> Tested-by: Nick Terrell <terrelln@fb.com>
>=20
> [1] https://github.com/facebook/zstd
> [2] https://godbolt.org/g/fvTcED
>=20
>=20
> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=BF=
=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=BF=BD^=EF=BF=
=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=DE=966=EF=BF=
=BD=EF=BF=BD=EF=BF=BD+=EF=BF=BD)=EF=BF=BD=EF=BF=BD=EF=BF=BDw*=1Fjg=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=1E=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=A2j/=
=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=DE=96=EF=BF=BD=EF=BF=BD2=EF=BF=BD=DE=
=99=EF=BF=BD=EF=BF=BD=EF=BF=BD&=EF=BF=BD)=DF=A1=EF=BF=BDa=EF=BF=BD=EF=BF=BD=
=7F=EF=BF=BD=EF=BF=BD=1E=EF=BF=BDG=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=0F=
=EF=BF=BDj:+v=EF=BF=BD=EF=BF=BD=EF=BF=BDw=EF=BF=BD=D9=A5
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
