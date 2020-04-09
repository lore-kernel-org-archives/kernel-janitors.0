From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 09 Apr 2020 18:52:38 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <59d1ef8f-4fb0-9af2-f761-b52559c8a699@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
 <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
 <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
 <60c732a1-aa4e-afab-d223-894a67713003@wanadoo.fr>
 <bcdfa5ae68b8cb7d9324a89aedf452f6209b570c.camel@perches.com>
 <05379b22-6755-368b-8127-8827fa020189@wanadoo.fr>
 <f212b3ad6c09e595cb91c2f7e8728d71e27f6833.camel@perches.com>
In-Reply-To: <f212b3ad6c09e595cb91c2f7e8728d71e27f6833.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 09/04/2020 à 19:50, Joe Perches a écrit :
> On Thu, 2020-04-09 at 19:34 +0200, Christophe JAILLET wrote:
>> Le 09/04/2020 à 17:29, Joe Perches a écrit :
> []
>>> lib/percpu-refcount.c:#define pr_fmt(fmt) "%s: " fmt "\n", __func__
>> In this file, there are some WARN_ON.
>> Are these log functions also influenced by pr_fmt?
> No.
Ok, thx.
>
>>> drivers/md/bcache/bcache.h:#define pr_fmt(fmt) "bcache: %s() " fmt "\n", __func__
>>> drivers/md/bcache/bset.c:#define pr_fmt(fmt) "bcache: %s() " fmt "\n", __func__
>>> tools/usb/usbip/libsrc/usbip_common.h:#define pr_fmt(fmt)       "%s: %s: " fmt "\n", PROGNAME
>> Tricky because all files that include it have to be checked.
>> I won't touch these ones.
> What a pity I do not know the French equivalent
> for the children's taunt of "chicken!"...

I don't know why the french one is wet, but the translation would be 
"poule mouillée".

In fact, I don't really see the need to modify many files just for some 
kind of style.
(same reason why I think that checkpatch is a better place for a test 
than submitting hundreds of patches based on coccinelle)


 From your point of view, does auditing and fixing these missing \n make 
sense?
Wouldn't it just be a lot of noise for a small benefit?


CJ
