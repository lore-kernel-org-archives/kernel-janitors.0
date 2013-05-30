From: Bryan Wu <cooloney@gmail.com>
Date: Thu, 30 May 2013 17:59:49 +0000
Subject: Re: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <CAK5ve-KXAHRG35pTgMGuz5ot4H6fpCLunOF+Wo+uqGUbAtBzfA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529070150.GC25133@debian>
In-Reply-To: <20130529070150.GC25133@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2013 at 1:59 AM, walter harms <wharms@bfs.de> wrote:
>
>
> Am 29.05.2013 23:15, schrieb Dan Carpenter:
>> On Wed, May 29, 2013 at 07:34:39PM +0200, walter harms wrote:
>>
>>> int would be a more "natural" choice.
>>>
>>
>> You should never use signed types for a bit field.  That's just
>> asking for a sign expansion bug.
>
> my idea was more to use unsigned int instead of u16.
> Personally i try to avoid this (artificial) types as much as possible,
>

In this case, "val" is an unsigned 16 bits value for register
operation nothing else. 'u16' is correct for this usage and it's more
portable. It should be always unsigned 16 bits type crossing all the
architecture. But unsigned int is not always 32 bits and unsigned
short is not always 16 bits on every platform.

Thanks,
-Bryan
