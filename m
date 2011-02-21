From: "Luis R. Rodriguez" <mcgrof@gmail.com>
Date: Mon, 21 Feb 2011 05:04:55 +0000
Subject: Re: [patch 1/2] staging: ath6kl: cleanup in SEND_FRAME ioctl
Message-Id: <AANLkTik8Dp5-1F5DKPSfRNNJg_3psmR07Y4bgbUX=_p_@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124832.GA1898@bicker>
In-Reply-To: <20110220124832.GA1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 9:02 PM, Greg KH <greg@kroah.com> wrote:
> On Sun, Feb 20, 2011 at 08:45:44PM -0800, Luis R. Rodriguez wrote:
>> On Sun, Feb 20, 2011 at 8:14 PM, Greg KH <greg@kroah.com> wrote:
>> > On Sun, Feb 20, 2011 at 08:00:38PM -0800, Luis R. Rodriguez wrote:
>> >> On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrote:
>> >> > On Sun, Feb 20, 2011 at 04:49:08AM -0800, Dan Carpenter wrote:
>> >> >> The original code was written in a funny way where every statement was
>> >> >> part of else if blocks.  I broke them up into separate statements by
>> >> >> adding breaks on failure conditions.
>> >> >>
>> >> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
>> >>
>> >> Can you guys please join IRC? ...
>> >
>> > That is not a requirement for kernel development, sorry.
>>
>> No, but I'm not asking you, I'm asking Vipin and other developers,
>> using IRC is a good idea for internal coordination.
>
> I agree, but that wasn't what you said here :)
>
>> I see no way Vipin checking with Joe if he had his first set of
>> patches ready. We need to do major cleanup on the driver *now* and
>> these sort of miscommunication is just irritating. How do you
>> recommend we coordinate cleanup with random patches being ACKed in the
>> process without proper coordination?
>
> You get Joe and Vipin to work together and agree with what to do.  You
> don't email 4 other people and 2 mailing lists with a request to join
> IRC :)

I've already told Vipin and friends about things, the purpose of
e-mailing other lists is to get people interested in sending patches
for ath6kl to help us coordinate better with them. If I only e-mail
private people I would have missed Dan Carpenter who sent these
patches out.

> It's not like we don't do this kind of things all the time, and have
> been for years, it just takes a willingness for the people involved to
> work together.  Hopefully that is the case here.

The will is there, but:

1) Vipin told me he was going on vacation Friday, and yet he's ACKing
patches now
2) Who is the new maintainer for ath6kl ? I'm still waiting for the
respective patches from Vipin so I guess I'll do that now

  Luis
