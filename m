From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Thu, 04 Aug 2016 01:05:28 +0000
Subject: Re: [PATCH 0/2] drivers: w1: coding style corrections
Message-Id: <CAPBZ1qPXe5GALjivvf0wpaV7swEF4qwLW4UiGMF4h0AGZj6a7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
In-Reply-To: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Evgeniy,

On 25 July 2016 at 23:15, Evgeniy Polyakov <zbr@ioremap.net> wrote:
> Hi Ben
>
> 25.07.2016, 00:27, "Ben Werbowyj" <ben.werbowyj@gmail.com>:
>
>>>  Please combine the whole w1 space-string cleanups into single patch,
>>>  it will be much easier to review and ack.
>>
>> Thanks for the feedback/review. I will group together any more
>> cleanups. I was working
>> with smaller patches as the kernel patching guides I've read mention
>> that this is a good
>> way to get started.
>
> That's generally a good idea to work with smaller patches,
> but if you perform a large portion of quite similar things like cleaning
> up coding style, it is much easier to combine them into single patchset.
>
> You can send separate patch per file if you like, but it is really
> much easier to review it this will be a single patchset with many separate
> patches (and mails) than many different sets.

I'm working on the cleanups as one patch per file to combine into a
patchset as you suggested. I've previously submitted a patch for one
of the files and I'm not entirely sure if I should create further
patches with my earlier patch applied, or if I should use the current
state of the file from the linux-next repository.

I don't want to create merge conflicts and headaches from what are
essentially trivial cleanup patches.

Ben
