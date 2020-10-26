From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 26 Oct 2020 10:01:12 +0000
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-Id: <20201026100112.qaorff6c6vucakyg@steredhat>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023122113.35517-1-colin.king@canonical.com>
 <20201023140947.kurglnklaqteovkp@steredhat>
 <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
 <20201026084300.5ag24vck3zeb4mcz@steredhat>
 <d893e3251f804cffa797b6eb814944fd@AcuMS.aculab.com>
 <20201026093917.5zgginii65pq6ezd@steredhat>
 <3e34e4121f794355891fd7577c9dfbc0@AcuMS.aculab.com>
In-Reply-To: <3e34e4121f794355891fd7577c9dfbc0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@aculab.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 26, 2020 at 09:46:17AM +0000, David Laight wrote:
>From: Stefano Garzarella
>> Sent: 26 October 2020 09:39
>>
>> On Mon, Oct 26, 2020 at 09:13:23AM +0000, David Laight wrote:
>> >From: Stefano Garzarella
>> >> Sent: 26 October 2020 08:43
>> >...
>> >> >Isn't the canonical error for unknown ioctl codes -ENOTTY?
>> >> >
>> >>
>> >> Oh, thanks for pointing that out!
>> >>
>> >> I had not paid attention to the error returned, but looking at it I
>> >> noticed that perhaps the most appropriate would be -ENOIOCTLCMD.
>> >> In the ioctl syscall we return -ENOTTY, if the callback returns
>> >> -ENOIOCTLCMD.
>> >>
>> >> What do you think?
>> >
>> >It is 729 v 443 in favour of ENOTTY (based on grep).
>>
>> Under net/ it is 6 vs 83 in favour of ENOIOCTLCMD.
>>
>> >
>> >No idea where ENOIOCTLCMD comes from, but ENOTTY probably
>> >goes back to the early 1970s.
>>
>> Me too.
>>
>> >
>> >The fact that the ioctl wrapper converts the value is a good
>> >hint that userspace expects ENOTTY.
>>
>> Agree on that, but since we are not interfacing directly with userspace,
>> I think it is better to return the more specific error (ENOIOCTLCMD).
>
>I bet Linux thought it could use a different error code then
>found that 'unknown ioctl' was spelt ENOTTY.

It could be :-)

Anyway, as you pointed out, I think we should change the -EINVAL with 
-ENOTTY or -ENOIOCTLCMD.

@Jakub what do you suggest?

Thanks,
Stefano
