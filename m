From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Oct 2010 11:36:31 +0000
Subject: Re: [patch] ps3disk: passing wrong variable to bvec_kunmap_irq()
Message-Id: <AANLkTik6XaGoiiaarfoAp6EhG5xjy9Rnq0VXjnuJ3Uc-@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011191335.GH5851@bicker> <4CB3689F.1050601@fusionio.com>
	<AANLkTi=wQDgAHC0Zm+psdP2g+B7JZJ8ot1NPCE+AAqU0@mail.gmail.com>
	<4CBA9C79.7050908@fusionio.com>
In-Reply-To: <4CBA9C79.7050908@fusionio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jens Axboe <jaxboe@fusionio.com>
Cc: "cbe-oss-dev@lists.ozlabs.org" <cbe-oss-dev@lists.ozlabs.org>, Dan Carpenter <error27@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Geoff Levand <geoff@infradead.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On Sun, Oct 17, 2010 at 08:49, Jens Axboe <jaxboe@fusionio.com> wrote:
> On 2010-10-16 21:39, Geert Uytterhoeven wrote:
>> On Mon, Oct 11, 2010 at 21:42, Jens Axboe <jaxboe@fusionio.com> wrote:
>>> On 2010-10-11 21:13, Dan Carpenter wrote:
>>>> This should pass "buf" to bvec_kunmap_irq() instead of "bv".  The api is
>>>> like kmap_atomic() instead of kmap().
>>>>
>>>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>>>>
>>>> diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
>>>> index e9da874..03688c2 100644
>>>> --- a/drivers/block/ps3disk.c
>>>> +++ b/drivers/block/ps3disk.c
>>>> @@ -113,7 +113,7 @@ static void ps3disk_scatter_gather(struct ps3_storage_device *dev,
>>>>                       memcpy(buf, dev->bounce_buf+offset, size);
>>>>               offset += size;
>>>>               flush_kernel_dcache_page(bvec->bv_page);
>>>> -             bvec_kunmap_irq(bvec, &flags);
>>>> +             bvec_kunmap_irq(buf, &flags);
>>>>               i++;
>>>>       }
>>>>  }
>>>
>>> Thanks applied, that bug is all too common.
>>
>> Because  bvec_kunmap_irq() is a macro if !CONFIG_HIGHMEM, and thus there's no
>> argument type checking on e.g. pp64, which doesn't support HIGHMEM?
>
> It's a generic problem, not isolated to this case. The problem is that
> the API isn't symmetric, and the unmap parts take a void * pointer.

No, the unmap takes a char *:

static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)

So it could be detected. Patch will follow.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
