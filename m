From: "Vorobiev Dmitri" <dmitri.vorobiev@movial.fi>
Date: Wed, 10 Dec 2008 22:06:34 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from
Message-Id: <42393.88.114.236.15.1228946794.squirrel@webmail.movial.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk>
    <20081210163819.17cf4628@lxorguk.ukuu.org.uk>
    <45755.88.114.236.15.1228932236.squirrel@webmail.movial.fi>
    <20081210212659.GA6132@zarina>
In-Reply-To: <20081210212659.GA6132@zarina>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cbouatmailru@gmail.com
Cc: Vorobiev Dmitri <dmitri.vorobiev@movial.fi>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

> On Wed, Dec 10, 2008 at 08:03:56PM +0200, Vorobiev Dmitri wrote:
>> > On Wed, 10 Dec 2008 17:26:26 +0100 (CET)
>> > Julia Lawall <julia@diku.dk> wrote:
>> >
>> >> From: Julia Lawall <julia@diku.dk>
>> >>
>> >> The return value of the remove function of a driver structure, and
>> thus
>> >> of
>> >> a platform_driver structure, is ultimately ignored
>> >
>> > Currently
>>
>> Are there really any plans about actually using the return value?
>
> It's often used by the drivers, but currently not handled by
> the subsystem. For example, _remove() callback might return -EBUSY
> or -EAGAIN, which means that whoever called the _remove() should
> try later.

Sure, it's easy to find drivers, which that return a non-dummy value from
the remove() callback thinking that someone up there will take care of the
error.

The point is, however, that

1) the SGI Indy SCSI controller driver doesn't compile cleanly [2], and
SCSI maintainers do not apply the patch because, in principle, the
(*remove)() callback should not return int since the return value is
discarded [1];

2) the changes in the platform driver framework are, as it seems, not
acceptable because the non-dummy return values can, in principle, be used
for error checking.

All that I actually care about is to get rid of this:

<<<

  CC [M]  drivers/scsi/sgiwd93.o
drivers/scsi/sgiwd93.c:314: warning: initialization from incompatible
pointer type

<<<

I don't care whether the compilation warning is gone because [2] is
applied, or the entire platform driver framework is combed though to
change int to void.

Thanks,
Dmitri

[1] http://kerneltrap.org/mailarchive/linux-scsi/2008/12/3/4300474

[2] http://kerneltrap.org/mailarchive/linux-scsi/2008/11/20/4169644
