From: =?ISO-8859-1?Q?=22Rune_V=2E_Sj=F8en=22?= <rvsjoen@gmail.com>
Date: Tue, 17 Jul 2007 16:01:30 +0000
Subject: Re: [KJ] [PATCH] Removal of compiler warnings in ipc/msg.c
Message-Id: <469CE7DA.6040207@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
In-Reply-To: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> These warnings are bogus -- it would be more helpful to look at
> making GCC smarter so it doesn't emit this warning in this particular
> case.  I can prove quite easily that all paths to uses of qbytes
> initialise it.

So there's really no point in patching this ?



_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
