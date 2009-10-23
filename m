From: =?ISO-8859-1?Q?Kevyn=2DAlexandre_Par=E9?=
Date: Fri, 23 Oct 2009 21:26:25 +0000
Subject: Re: Write and Submit Your First Kernel Patch
Message-Id: <dc1d0f40910231426j45184429qbe3531bc76555c77@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
	 <alpine.LNX.2.00.0910231621550.14365@iabervon.org>
	 <7vskd9akv6.fsf@alter.siamese.dyndns.org>
In-Reply-To: <7vskd9akv6.fsf@alter.siamese.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Junio C Hamano <gitster@pobox.com>
Cc: Daniel Barkalow <barkalow@iabervon.org>, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, git@vger.kernel.org

My mistake but I learn a lot from you guys!

I should simply have done:
./scripts/checkpatch.pl --terse --patch
0001-Staging-comedi-driver-fix-coding-style.patch

or

./scripts/checkpatch.pl --terse --patch
0001-Staging-comedi-driver-fix-coding-style.patch
# Since --patch is the default!

No warning to the output, I will change my blog

thx again

kap

On Fri, Oct 23, 2009 at 4:58 PM, Junio C Hamano <gitster@pobox.com> wrote:
> Daniel Barkalow <barkalow@iabervon.org> writes:
>
>> On Fri, 23 Oct 2009, Kevyn-Alexandre Par=E9 wrote:
>>
>>> Just before I send my patch I got this error with:
>>> ./scripts/checkpatch.pl --terse --file
>>> 0001-Staging-comedi-driver-fix-coding-style.patch
>>
>> You're using checkpatch --file on a patch. I hope you don't intend your
>> patch to be added to the kernel source as a file, but rather applied to
>> the kernel source, changing other files. (I bet "gcc 0001-Staging*.patch"
>> will get interesting errors, too...) The patch format adds a single
>> character at the beginning of each line to say whether it's a addition, a
>> deletion, or a context line, and the context lines are identified by a
>> space character. This means that a blank context line consists of just
>> this space character, which is therefore a trailing space. We get the sa=
me
>> type of complaints when we have expected diff output in our test scripts.
>>
>> I'm kind of surprised that checkpatch doesn't completely blow up when it=
's
>> expecting a source file and getting a patch (and maybe tell you what
>> you've done). But that's the source of your errors, anyway.
>
> Ah, your analysis is correct. =A0This is a usage error of checkpatch scri=
pt
> and there is nothing for us to worry about.
>
> Thanks; I also failed to spot --file option when I responded.
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
