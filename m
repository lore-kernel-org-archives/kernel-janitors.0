From: matt mooney <mfmooney@gmail.com>
Date: Fri, 20 May 2011 02:30:39 +0000
Subject: Re: [PATCH] staging: usbip: replace usbip_u{dbg,err,info} and printk
Message-Id: <BANLkTi=FZ57TrOa48qxkO6Myf0pwgtPp7g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2db81796703063c0816d0d99040c6fbd6da50007.1305847719.git.mfm@muteddisk.com>
	<20110520000013.GA8908@kroah.com>
	<BANLkTik=S-FRB25gNHcb0OLMW5dhqLE1eA@mail.gmail.com>
	<20110520002401.GA17623@kroah.com>
In-Reply-To: <20110520002401.GA17623@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <greg@kroah.com>
Cc: matt mooney <mfm@muteddisk.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 19, 2011 at 5:24 PM, Greg KH <greg@kroah.com> wrote:
> On Thu, May 19, 2011 at 05:17:45PM -0700, matt mooney wrote:
>> On Thu, May 19, 2011 at 5:00 PM, Greg KH <greg@kroah.com> wrote:
>> > Also, the merge window for the .40 tree for the staging tree is now
>> > closed, so I'll only take bugfixes for the usbip code for now.
>>
>> The userspace code isn't getting merged in .40, is it? Because my
>> patch "staging: usbip: userspace: stub_driver.c: update kernel module
>> name" actually relies on a change in my own tree, so I made a mistake
>> by thinking that it was needed right away to get the userspace tools
>> working.
>
> It's in my tree, so yes. =A0You can send me patches to fix the problem, as
> I would recommend :)

Can I send you a 10 patch series (or 9 if you apply the patch in this
thread)? The changes I have that fix that are towards the end. The
problem is a lot of my changes rely on the patch sent in this thread
and one that follows it, so to avoid any conflicts it is easiest (at
least for me :) to just send the whole series. They have been tested
and pretty much leave usbip in the state it was originally in.

Thanks,
matt

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
