From: Bryan Wu <cooloney@gmail.com>
Date: Thu, 30 May 2013 18:01:34 +0000
Subject: Re: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <CAK5ve-+1a08jaY7wW7Lu1D9JGfF0EVpkskDR7eq=OkimyXooqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529070150.GC25133@debian>
In-Reply-To: <20130529070150.GC25133@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2013 at 5:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, May 30, 2013 at 10:59:35AM +0200, walter harms wrote:
>>
>>
>> Am 29.05.2013 23:15, schrieb Dan Carpenter:
>> > On Wed, May 29, 2013 at 07:34:39PM +0200, walter harms wrote:
>> >
>> >> int would be a more "natural" choice.
>> >>
>> >
>> > You should never use signed types for a bit field.  That's just
>> > asking for a sign expansion bug.
>>
>> my idea was more to use unsigned int instead of u16.
>> Personally i try to avoid this (artificial) types as much as possible,
>
> Obviously no one wants to go nuts with the type specifiers like the
> e1000e people who never use "int" and only "s32".  But in this case
> u16 is more readable and more accurate.
>

Do you mind to clean up this driver with u16? or I will do it.

Thanks,
-Bryan
