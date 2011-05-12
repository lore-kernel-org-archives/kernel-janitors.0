From: matt mooney <mfmooney@gmail.com>
Date: Thu, 12 May 2011 03:24:12 +0000
Subject: Re: [PATCH 00/12] staging: usbip: miscellaneous code cleanup
Message-Id: <BANLkTim_WZdmE31qjChg8u0M8RKzez3fqg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
	<20110511211401.GC4893@kroah.com>
	<BANLkTikjf9ZAthr3jTUkoUKGJt2UGS73Cg@mail.gmail.com>
	<20110511231843.GC7362@kroah.com>
In-Reply-To: <20110511231843.GC7362@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 4:18 PM, Greg KH <greg@kroah.com> wrote:
> On Wed, May 11, 2011 at 04:08:07PM -0700, matt mooney wrote:
>> On Wed, May 11, 2011 at 2:14 PM, Greg KH <greg@kroah.com> wrote:
>> > On Wed, May 11, 2011 at 01:54:12AM -0700, matt mooney wrote:
>> >> Hi Greg,
>> >>
>> >> I am interested in hearing your thoughts on the userspace interface?
>> >
>> > Which one? =A0The user/kernel interface?
>>
>> Yes.
>>
>> >
>> >> Even as is, it definitely needs some work. For one thing I was thinki=
ng
>> >> of removing the debug flag from userspace. The userspace utilites are
>> >> not using it anyway, and it is not 100% working yet.
>> >
>> > I haven't looked at the interface much yet, what is your issue with the
>> > debug flag?
>>
>> I guess it just added a lot of code (most was actually eliminated in
>> the pr_*() change), is not complete, and is inconsistently used. But I
>> see that it would be helpful especially due to the amount of debug
>> messages printed by default. So ignore that complaint.
>
> Ok.
>
>> > To make things easier, and allow you to be able to change the userspace
>> > interface, I suggest moving the userspace code into the kernel tree, a=
nd
>> > building it here. =A0That would allow you to move forward with changing
>> > things easier, doing it all in one place allows you to keep stuff in
>> > sync, and provides people an easier way to actually get the needed too=
ls
>> > to drive the code.
>> >
>> > What do you think about doing that?
>>
>> Sure, I didn't even know that was an option. How do you propose that
>> is done though?
>
> We add it to drivers/staging/usbip/userspace/ and build it like the perf
> code is built.

Okay, I will add the code as is to userspace/ except for the module
name changes of course. Now I am suppose to add this to
scripts/packages/Makefile or is there another way for staging?

Thanks,
matt

>> > I've applied a number of these patches, care to respin the others and
>> > resend them based on my latest tree?
>>
>> Okay, I will do that. I noticed some were missed but that may be
>> because they depended on a few of the unapplied ones anyway, so I will
>> also resend those as well.
>
> Yes, they couldn't be applied so I didn't.
>
> thanks,
>
> greg k-h
>

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
