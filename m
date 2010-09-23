From: matt mooney <mfmooney@gmail.com>
Date: Thu, 23 Sep 2010 18:01:04 +0000
Subject: Re: threaded patch series
Message-Id: <AANLkTi=kSCnoR_wGJ=kN1QyxS8edEO_O9wW=RhA3-x8L@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
In-Reply-To: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, Sep 23, 2010 at 8:58 AM, Julia Lawall <julia@diku.dk> wrote:
> On Thu, 23 Sep 2010, Joe Perches wrote:
>
>> On Thu, 2010-09-23 at 16:00 +0400, Vasiliy Kulikov wrote:
>> > On Thu, Sep 23, 2010 at 13:09 +0400, Vasiliy Kulikov wrote:
>> > > On Thu, Sep 23, 2010 at 10:55 +0200, Julia Lawall wrote:
>> > > > I made some changes to git-send-email to get it to send mail to di=
fferent
>> > > > people, ie a different set of addresses for each patch. =A0Is that=
 now
>> > > > possible with the standard version? =A0If not I can submit a patch=
 with my
>> > > > changes at some point.
>> > > I use git-send-email --cc-cmd=3Dscript_to_form_cc_list.
>>
>> I believe that Julia means some mechanism to vary the
>> "to" addresses for each patch, ie: some "--to-cmd=3Dcmd".
>
> Yes, sort of. =A0I took the strategy of precomputing the To addresses, so=
 I
> just have a collection of files that have different To and Cc addresses.
> But a --to-cmd option seems like a good idea too.
>
> julia
>
>
>> > I mean this:
>> > for f in *.patch; do
>> > =A0 =A0 CMD=3D"script_to_form_cc_list $f"
>> > =A0 =A0 git-send-email --cc-cmd=3D"$CMD" ... "$f"
>> > done
>>
>> You could also do that with a single line as the target
>> cc-cmd receives each $f as argument.
>>
>> git send-email --cc-cmd=3Dscript_to_form_cc_list ... *.patch
>>

Thanks, all much saner solutions than my own.  I should have read the
manpages; I didn't know that format-patch has a --thread option or
that send-email has --cc-cmd.

It does seem that a --to-cmd would also be beneficial.

-mfm

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
