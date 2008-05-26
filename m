From: "Iwan Budi Kusnanto" <iwanbk@gmail.com>
Date: Mon, 26 May 2008 04:14:00 +0000
Subject: Re: sema_init fail in 2.6
Message-Id: <41f748550805252114v4677b6dau5db38da4e3cd5d23@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
In-Reply-To: <41f748550805251313n5f1c9579k52060a940a911cc5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 26, 2008 at 4:59 AM, Matthew Wilcox <matthew@wil.cx> wrote:
> On Mon, May 26, 2008 at 03:13:43AM +0700, Iwan Budi Kusnanto wrote:
>> /**
>>  * this code is compiled & working in 2.4 kernel.
>>  * Compiled in 2.6 but fail in module initialization.
>>  */
>> static struct semaphore sem_fail;
>>
>> static init __init my_module_init_fail(void)
>> {
>>         sema_init (&sem_fail, 1);
>> }
>
> I forgot to say that the intended way for you to do this in 2.6 is:
>
> static DECLARE_MUTEX(sem_fail);
>
> BTW, have you considered using a struct mutex instead of a struct
> semaphore?

Yes, i have . But, maybe what i need is not binary semaphore.

Thx



-- 
Iwan Budi Kusnanto
