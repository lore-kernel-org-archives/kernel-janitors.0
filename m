From: yoann padioleau <padator@wanadoo.fr>
Date: Sat, 07 Jul 2007 20:19:05 +0000
Subject: [KJ] Re: + some-kmalloc-memset-kzalloc-tree-wide.patch added to -mm
Message-Id: <1CA436EC-008F-4FB1-8589-9276EA637F48@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On 7 juil. 07, at 07:52, Jiri Slaby wrote:

> akpm@linux-foundation.org napsal(a):
>> Subject: some kmalloc/memset ->kzalloc (tree wide)
>> From: Yoann Padioleau <padator@wanadoo.fr>
>>
>> Transform some calls to kmalloc/memset to a single kzalloc (or  
>> kcalloc).
>
> ?NAK?
>
> Wouldn't this cause any problems (the test in kcalloc in the  
> concrete)?
>
> /**
>  * kcalloc - allocate memory for an array. The memory is set to zero.
>  * @n: number of elements.
>  * @size: element size.
>  * @flags: the type of memory to allocate.
>  */
> static inline void *kcalloc(size_t n, size_t size, gfp_t flags)

you are right, but why the type of kcalloc is not
static inline void *kcalloc(int n, size_t size, gfp_t flags) ?



_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
