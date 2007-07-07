From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 07 Jul 2007 22:05:24 +0000
Subject: [KJ] kcalloc prototype [Was: +
Message-Id: <46900E24.7090406@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707062316.l66NGQXp026235@imap1.linux-foundation.org> <468F2A02.10402@gmail.com> <1CA436EC-008F-4FB1-8589-9276EA637F48@wanadoo.fr>
In-Reply-To: <1CA436EC-008F-4FB1-8589-9276EA637F48@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yoann padioleau <padator@wanadoo.fr>
Cc: akpm@linux-foundation.org, kernel-janitors@lists.osdl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

yoann padioleau napsal(a):
>> static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
> 
> you are right, but why the type of kcalloc is not
> static inline void *kcalloc(int n, size_t size, gfp_t flags) ?

Maybe C89 calloc prototype...

-- 
Jiri Slaby (jirislaby@gmail.com)
Faculty of Informatics, Masaryk University
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
