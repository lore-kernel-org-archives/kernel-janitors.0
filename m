From: Ashwin Chaugule <ashwin.chaugule@linaro.org>
Date: Sat, 20 Dec 2014 14:56:47 +0000
Subject: Re: Mailbox: Add support for Platform Communication Channel
Message-Id: <CAJ5Y-eYmjzuUQggLM-Mqz+CB46cb8=Vf06oSYh2jMf8cwusgFA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141215215643.GA2882@mwanda>
In-Reply-To: <20141215215643.GA2882@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On 17 December 2014 at 13:56, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Dec 17, 2014 at 11:46:09AM -0500, Ashwin Chaugule wrote:
>> > Also this file has some Sparse warnings:
>>
>> I've looked at these previously too and I believe they're false
>> positives.  Will send a follow up patch at the earliest.
>>
>
> They're not bugs, it just means that there are some __iomem annotations
> missing and some functions should be made static or declared in a .h
> file or whatever.

True. We've been testing this driver on a non X86 platform in the past
few days and had to make a few modifications which make some of these
changes go away. Will send out a patch after some more testing. Very
much appreciate your review!

Cheers,
Ashwin
