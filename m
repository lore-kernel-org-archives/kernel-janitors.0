From: =?UTF-8?B?w4Z2YXIgQXJuZmrDtnLDsCBCamFybWFzb24=?= <avarab@gmail.com>
Date: Thu, 23 Sep 2010 23:16:06 +0000
Subject: Re: [PATCH V2] git-send-email.perl: Add --to-cmd
Message-Id: <AANLkTin2YvPxnbCXzWsugfaGvbUUcm6n5LtwkNVxhJfC@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTinsM5jdU194FR8L3hTvBXk0Tr_oV2E5752NOUpq@mail.gmail.com>
	<AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
	<1285227413.7286.47.camel@Joe-Laptop>
	<Pine.LNX.4.64.1009231054230.15528@ask.diku.dk>
	<20100923090931.GA29789@albatros>
	<20100923120024.GA26715@albatros>
	<1285253867.31572.13.camel@Joe-Laptop>
	<Pine.LNX.4.64.1009231757090.11585@ask.diku.dk>
	<1285262237.31572.18.camel@Joe-Laptop>
	<AANLkTin_Y8w4ujNGTqGJPNDNfYz7hcjBVLcOG0emBjYn@mail.gmail.com>
	<1285263993.31572.25.camel@Joe-Laptop>
	<AANLkTinCx=+n6bMZw4tQqrQ7WC1o_aeGG_n_PxywTyb8@mail.gmail.com>
	<1285267520.31572.34.camel@Joe-Laptop>
	<7v62xwqe7i.fsf@alter.siamese.dyndns.org>
In-Reply-To: <7v62xwqe7i.fsf@alter.siamese.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Junio C Hamano <gitster@pobox.com>
Cc: Joe Perches <joe@perches.com>, Julia Lawall <julia@diku.dk>, git <git@vger.kernel.org>, Vasiliy Kulikov <segooon@gmail.com>, matt mooney <mfmooney@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On Thu, Sep 23, 2010 at 22:37, Junio C Hamano <gitster@pobox.com> wrote:
> Joe Perches <joe@perches.com> writes:
>
>> +     if (defined $to_cmd) {
>> +             open(F, "$to_cmd \Q$t\E |")
>> +                     or die "(to-cmd) Could not execute '$to_cmd'";
>> +             while(<F>) {
>> +                     my $t = $_;
>
> "my $t" masks another $t in the outer scope; technically not a bug, but
> questionable as a style.
>
>> +                     $t =~ s/^\s*//g;
>> +                     $t =~ s/\n$//g;
>> +                     next if ($t eq $sender and $suppress_from);
>> +                     push @to, parse_address_line($t)
>> +                         if defined $t; # sanitized/validated later
>
> This "if defined $t" makes my head hurt.  Why?
>
>  * The "while (<F>)" loop wouldn't have given you an undef in $t in the
>   first place;
>
>  * You would have got "Use of uninitialized value" warning at these two
>   s/// statements if $t were undef; and
>
>  * Even if $t were undef, these two s/// statements would have made $t a
>   defined, empty string.

Well spotted. Also it *can't* be undef here by definition. Since $t is
taken from the $_ value which comes from the <> operator. That just
wraps readline(), which will exit the loop when it hit EOF (at which
point readline() *would* return undef).

So this whole business of checking for the definedness of $t doesn't
make any sense.
