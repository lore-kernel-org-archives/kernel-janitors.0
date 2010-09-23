From: Joe Perches <joe@perches.com>
Date: Thu, 23 Sep 2010 17:46:33 +0000
Subject: Re: [RFC PATCH] sit-send-email.pl: Add --to-cmd
Message-Id: <1285263993.31572.25.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTinsM5jdU194FR8L3hTvBXk0Tr_oV2E5752NOUpq@mail.gmail.com>
	 <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
	 <1285227413.7286.47.camel@Joe-Laptop>
	 <Pine.LNX.4.64.1009231054230.15528@ask.diku.dk>
	 <20100923090931.GA29789@albatros> <20100923120024.GA26715@albatros>
	 <1285253867.31572.13.camel@Joe-Laptop>
	 <Pine.LNX.4.64.1009231757090.11585@ask.diku.dk>
	 <1285262237.31572.18.camel@Joe-Laptop>
	 <AANLkTin_Y8w4ujNGTqGJPNDNfYz7hcjBVLcOG0emBjYn@mail.gmail.com>
In-Reply-To: <AANLkTin_Y8w4ujNGTqGJPNDNfYz7hcjBVLcOG0emBjYn@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?ISO-8859-1?Q?=C6var_Arnfj=F6r=F0?= Bjarmason <avarab@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, git <git@vger.kernel.org>, Vasiliy Kulikov <segooon@gmail.com>, matt mooney <mfmooney@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On Thu, 2010-09-23 at 17:29 +0000, Ævar Arnfjörð Bjarmason wrote:
> On Thu, Sep 23, 2010 at 17:17, Joe Perches <joe@perches.com> wrote:
> > I know there's a test harness in git, but
> > I don't know how to wire up the new options.
> You'd add the tests to t9001-send-email.sh and --tocmd out to some
> program you create. Is there anything in particular you need help
> with?

Just the doing.  I was (am) being lazy.

> > -if (!@to) {
> > +if (!@to && $to_cmd eq "") {
> 
> Why compare $to_cmd to "" instead of checking definedness?

No real reason.  Using define is the style used in the rest of
the file and it should be changed.

> > @@ -1238,6 +1242,23 @@ foreach my $t (@files) {
> >        }
> >        close F;
> >
> > +       if (defined $to_cmd) {
> > +               open(F, "$to_cmd \Q$t\E |")
> 
> quotemeta() is for escaping regexes, not shell syntax. You probably
> want IPC::Open2 or PC::Open3's functions which'll escape arguments for
> you.

I just copied the style from the equivalent cc_cmd section below,
so if it's necessary, it should be changed there too.

> I.e. do you need to strip whitespace from the beginning of the string?

I think so.


