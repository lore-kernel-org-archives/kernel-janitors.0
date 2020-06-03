From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jun 2020 15:30:14 +0000
Subject: Re: [PATCH RFC] panic: Fix deadlock in panic()
Message-Id: <fabff510-bd19-1712-2aa2-b1d742349c39@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Cheng Jian <cj.chengjian@huawei.com>, kernel-janitors@vger.kernel.org
Cc: Wang ShaoBo <bobo.shaobowang@huawei.com>, Chen Wandun <chenwandun@huawei.com>, Li Bin <huawei.libin@huawei.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Xie XiuQi <xiexiuqi@huawei.com>, linux-kernel@vger.kernel.org

>  A deadlock caused by logbuf_lock occurs when panic:

I suggest a few wording adjustments for this change description.

Would you like to omit an extra space character at the beginning of this sentence?


> we try to re-init …

We …


> … deadlock, but it … here, because :

… deadlock. But it … here because:


> Firstly, …

1. …


> When the CPU bring down …, … CPU willn't

… CPU was brought down …, … CPU will not


> Secondly, …

2. …


> … callback, so if printk() …

… callback. If printk() …


> …, deadlock will still occurs. Eg, …

…, deadlock will still occur. E. g. …


Regards,
Markus
