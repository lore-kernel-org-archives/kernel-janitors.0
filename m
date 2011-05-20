From: matt mooney <mfmooney@gmail.com>
Date: Fri, 20 May 2011 00:17:45 +0000
Subject: Re: [PATCH] staging: usbip: replace usbip_u{dbg,err,info} and printk
Message-Id: <BANLkTik=S-FRB25gNHcb0OLMW5dhqLE1eA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2db81796703063c0816d0d99040c6fbd6da50007.1305847719.git.mfm@muteddisk.com>
	<20110520000013.GA8908@kroah.com>
In-Reply-To: <20110520000013.GA8908@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: matt mooney <mfm@muteddisk.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 19, 2011 at 5:00 PM, Greg KH <greg@kroah.com> wrote:
> On Thu, May 19, 2011 at 04:47:32PM -0700, matt mooney wrote:
>> This switches all of the usbip_u{dbg,err,info} and printk statements to
>> dev_<level>, if possible, or pr_<level> macros. And removes a few
>> unnecessary debug statements.
>>
>> Signed-off-by: matt mooney <mfm@muteddisk.com>
>> ---
>> Hi Greg,
>>
>> Not as many of these could be changed to dev_* as I had initially
>> thought. A few were not changed to dev_* that could have possibly been
>> due to the struct device being deeply embedded within another
>> structure. I did not want to introduce any null pointer deferences, so
>> I played it safe for the time being. But as development continues I
>> will modify these.
>
> Ok, that's fine.
>
>> I also wonder if anybody is currently using usbip because I get a kernel
>> crash on the remote side everytime I try to attach an exported device.
>> Of course, I am running the remote and host machines through kvm, but I
>> don't think that should make a difference. Anyway, I thought you should
>> know so that if this comes up, you know that it was in this state before
>> any of my changes ;)
>
> I have gotten a few reports of it not working right now, but no one
> stepped up and debugged it.
>
> If you could do that now, that would be great, as it would be nice to
> have a working base to go off of :)

Okay, I will do that first.

> Also, the merge window for the .40 tree for the staging tree is now
> closed, so I'll only take bugfixes for the usbip code for now.

The userspace code isn't getting merged in .40, is it? Because my
patch "staging: usbip: userspace: stub_driver.c: update kernel module
name" actually relies on a change in my own tree, so I made a mistake
by thinking that it was needed right away to get the userspace tools
working.

Thanks,
matt

-- 

GPG-Key: 9AFE00EA
