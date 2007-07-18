From: "Denver Gingerich" <denver@ossguy.com>
Date: Wed, 18 Jul 2007 22:34:51 +0000
Subject: Re: [KJ] [PATCH] Removal of compiler warnings in ipc/msg.c
Message-Id: <6defe8840707181534i20e6b18em23da67756353f463@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
In-Reply-To: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/17/07, Randy Dunlap <rdunlap@xenotime.net> wrote:
[...]
> next thing:  the patch used spaces for indentation.  It should
> use tab(s).  The gmail web interface is sucky for sending
> patches.  Hopefully you are using SMTP to gmail.com instead of
> the web interface.

I have successfully used the Gmail web interface to send patches.  I
think the reason that some people run into problems with spaces is
that they copy their patches from an application like GNOME Terminal,
which does not maintain tab characters in its output (it converts them
to spaces).  If you instead copy and paste from an editor such as
gedit, the tabs will be properly copied.

To test whether your mail client is keeping the tabs, I recommend
sending a test message to yourself before sending the patch to a
mailing list.

Denver
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
