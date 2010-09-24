From: =?UTF-8?B?w4Z2YXIgQXJuZmrDtnLDsCBCamFybWFzb24=?= <avarab@gmail.com>
Date: Fri, 24 Sep 2010 16:47:36 +0000
Subject: Re: [PATCH V3] git-send-email.perl: Add --to-cmd
Message-Id: <AANLkTinGZ1H3ODYwRhvzya_UkA8t2QTW7cEyjb2Hx_7M@mail.gmail.com>
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
	<1285291098.25928.220.camel@Joe-Laptop>
	<m3lj6rgnub.fsf@localhost.localdomain>
	<1285344394.11616.23.camel@Joe-Laptop>
In-Reply-To: <1285344394.11616.23.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Jakub Narebski <jnareb@gmail.com>, Junio C Hamano <gitster@pobox.com>, Julia Lawall <julia@diku.dk>, git@vger.kernel.org, Vasiliy Kulikov <segooon@gmail.com>, Matt Mooney <mfmooney@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On Fri, Sep 24, 2010 at 16:06, Joe Perches <joe@perches.com> wrote:
> On Fri, 2010-09-24 at 08:32 -0700, Jakub Narebski wrote:
>> Joe Perches <joe@perches.com> writes:
>> > +# Execute a command (ie: $to_cmd) to get a list of email addresses
>> > +# and return a results array
>> > +sub recipients_cmd(@) {
>> Do not use subroutine prototypes: they do not do what you think they
>> do.  In this case using prototype is unnecessary and can be dangerous.
>
> It can be removed.  I was following the form of the
> other returned array in the code.

While we generally follow the rule that you should use the style of
the existing code, I think resaonable to discard that when the
surrounding code with less than wizard-level understanding of the
language.

In any case most of git-send-email.perl doesn't use prototypes, it's
just 2-3 subs out of ~30.
