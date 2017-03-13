From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Mon, 13 Mar 2017 14:07:22 +0000
Subject: Re: [PATCH] staging: atomisp: use k{v}zalloc instead of k{v}alloc and memset
Message-Id: <CAHb8M2BOcuW8ToYTT3EUm-GieOMz6+xUhmzwW+3hbygti11k0A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170313105421.GA32342@SEL-JYOUN-D1> <20170313115129.GC4136@mwanda>
In-Reply-To: <20170313115129.GC4136@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: mchehab@kernel.org, devel <devel@driverdev.osuosl.org>, Greg KH <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, alan@linux.intel.com, linux-media@vger.kernel.org

2017-03-13 20:51 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> On Mon, Mar 13, 2017 at 07:54:21PM +0900, Daeseok Youn wrote:
>> If the atomisp_kernel_zalloc() has "true" as a second parameter, it
>> tries to allocate zeroing memory from kmalloc(vmalloc) and memset.
>> But using kzalloc is rather than kmalloc followed by memset with 0.
>> (vzalloc is for same reason with kzalloc)
>>
>> And also atomisp_kernel_malloc() can be used with
>> atomisp_kernel_zalloc(<size>, false);
>>
>
> We should just change all the callers to kvmalloc() and kvzmalloc().
ok. I will try to change all the callers to kvmalloc() and kvzalloc().

Thanks.
Regards,
Daeseok Youn
>
> regards,
> dan carpenter
>
