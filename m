From: "Mike Frysinger" <vapier.adi@gmail.com>
Date: Fri, 12 Dec 2008 21:00:02 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from platform_driver remove functions
Message-Id: <8bd0f97a0812121300p6c509336pde936b7f8c5ca6a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk>
	 <8bd0f97a0812100928l2c75d373n7eba5aa0cc3882fd@mail.gmail.com>
	 <53806.88.114.236.15.1228947522.squirrel@webmail.movial.fi>
	 <8bd0f97a0812101437r4abb9346p8bc8d512ddc02cde@mail.gmail.com>
	 <20081212051759.GA12563@suse.de>
In-Reply-To: <20081212051759.GA12563@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: Vorobiev Dmitri <dmitri.vorobiev@movial.fi>, Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 12, 2008 at 00:17, Greg KH wrote:
> On Wed, Dec 10, 2008 at 05:37:42PM -0500, Mike Frysinger wrote:
>> On Wed, Dec 10, 2008 at 17:18, Vorobiev Dmitri wrote:
>> >> On Wed, Dec 10, 2008 at 11:26, Julia Lawall wrote:
>> >>  you'll get a
>> >> warning in C about the assignment, but you wont get a build failure,
>> >
>> > ...unless you compile with -Werror, which frequently the case.
>>
>> anyone crazy enough to build with -Werror is crazy enough to send in a fix ;)
>
> Hm, have you noted that some arches have that flag enabled in their
> build?

i dont see anyone building things beyond a select dir or two (none of
which contain platform drivers) with -Werror.  where are you seeing
this ?

besides, while using -Werror in development may make sense, sticking
it into the release for end users is just plain mean.  gcc is so
unreliable with warnings across versions.
-mike
