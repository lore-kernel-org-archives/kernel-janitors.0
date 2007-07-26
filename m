From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 26 Jul 2007 16:02:29 +0000
Subject: Re: [KJ] [PATCH] drivers/media/dvb/dvb-usb/vp7045.c: ARRAY_SIZE()
Message-Id: <20070726090229.ec809905.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707261656.16323.lists-receive@programmierforen.de>
In-Reply-To: <200707261656.16323.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 26 Jul 2007 16:56:16 +0200 Andi Drebes wrote:

> This patch replaces an array size calculation done using sizeof
> with an invocation of the ARRAY_SIZE macro.

Patches look good to me.

However, the real reason that I'm replying is to ask you and
others to begin using (only) the new KJ mailing list:
  kernel-janitors@vger.kernel.org

I'd like to ask the Linux Foundation to stop accepting email
on this list soon.

> _______________________________________________
> REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
> To resubscribe, send email to majordomo@vger.kernel.org with
> &quot;subscribe kernel-janitors&quot; in message body and follow instructions.
> 
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
