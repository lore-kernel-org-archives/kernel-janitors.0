From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Mon, 25 Jul 2016 13:15:49 +0000
Subject: Re: [PATCH 0/2] drivers: w1: coding style corrections
Message-Id: <186151469452549@web10h.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
In-Reply-To: <1469247089-8093-1-git-send-email-ben.werbowyj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Ben

25.07.2016, 00:27, "Ben Werbowyj" <ben.werbowyj@gmail.com>:

>>  Please combine the whole w1 space-string cleanups into single patch,
>>  it will be much easier to review and ack.
>
> Thanks for the feedback/review. I will group together any more
> cleanups. I was working
> with smaller patches as the kernel patching guides I've read mention
> that this is a good
> way to get started.

That's generally a good idea to work with smaller patches,
but if you perform a large portion of quite similar things like cleaning
up coding style, it is much easier to combine them into single patchset.

You can send separate patch per file if you like, but it is really
much easier to review it this will be a single patchset with many separate
patches (and mails) than many different sets.
