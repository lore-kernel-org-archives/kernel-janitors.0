From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Date: Tue, 23 Mar 2010 07:00:58 +0000
Subject: Re: [patch] kcore: fix test for end of list
Message-Id: <2375c9f91003230000m171f35c0t66fc3a5094b0d881@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120509.GC21571@bicker>
	 <20100322233113.f17d0e0c.akpm@linux-foundation.org>
In-Reply-To: <20100322233113.f17d0e0c.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <error27@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Jiri Slaby <jirislaby@gmail.com>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 23, 2010 at 11:31 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Mon, 22 Mar 2010 15:05:09 +0300 Dan Carpenter <error27@gmail.com> wrote:
>
>> "m" is never NULL here.  We need a different test for the end of list
>> condition.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>> ---
>> Found with a static checker and compile tested only.  Please review
>> carefully.
>>
>> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
>> index a44a789..b442dac 100644
>> --- a/fs/proc/kcore.c
>> +++ b/fs/proc/kcore.c
>> @@ -490,7 +490,7 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
>>               }
>>               read_unlock(&kclist_lock);
>>
>> -             if (m = NULL) {
>> +             if (&m->list = &kclist_head) {
>>                       if (clear_user(buffer, tsz))
>>                               return -EFAULT;
>>               } else if (is_vmalloc_or_module_addr((void *)start)) {
>
> hm, that code's been there for five years.  I wonder if it's actually necessary.

Nope, not that long, please see commit 2ef43ec7. :)
