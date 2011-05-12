From: matt mooney <mfmooney@gmail.com>
Date: Thu, 12 May 2011 05:41:31 +0000
Subject: Re: [PATCH 00/12] staging: usbip: miscellaneous code cleanup
Message-Id: <BANLkTikAVC6vR0SEu86fQ-9mwn9853Qgbg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
	<20110511211401.GC4893@kroah.com>
	<BANLkTikjf9ZAthr3jTUkoUKGJt2UGS73Cg@mail.gmail.com>
	<20110511231843.GC7362@kroah.com>
	<BANLkTim_WZdmE31qjChg8u0M8RKzez3fqg@mail.gmail.com>
	<20110512053109.GA26926@kroah.com>
In-Reply-To: <20110512053109.GA26926@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 10:31 PM, Greg KH <greg@kroah.com> wrote:
> On Wed, May 11, 2011 at 08:24:12PM -0700, matt mooney wrote:
>> > We add it to drivers/staging/usbip/userspace/ and build it like the pe=
rf
>> > code is built.
>>
>> Okay, I will add the code as is to userspace/ except for the module
>> name changes of course. Now I am suppose to add this to
>> scripts/packages/Makefile or is there another way for staging?
>
> I really don't know as I haven't looked at that part of the build system
> in years. =A0If you have problems, I will be glad to help out, but give it
> a try first :)

Not a problem; I just wanted to make sure. I actually sent in a patch
to fix a bug with building perf earlier today so hopefully Michal
picks it up quickly.

I resent two patches that don't rely on my pr_*() commit in a new
thread. The other patches will be resent once I get the dev_*()
changes in. But I will send in the userspace utility patch asap
although I might have created a conflict with the perf patch I sent in
earlier.

Thanks,
matt

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
