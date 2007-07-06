From: Heikki Orsila <shdl@zakalwe.fi>
Date: Fri, 06 Jul 2007 17:55:52 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <20070706175552.GF3400@zakalwe.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr>
In-Reply-To: <878x9ta320.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

> Transform some calls to kmalloc/memset to a single kzalloc (or 
> kcalloc).

I looked all the files through. They looked good to me, except 
one case:

In drivers/net/hamradio/dmascc.c you removed one comment, and I think 
it should not be removed:

/* Initialize what is necessary for write_scc and write_scc_data */ 

-- 
Heikki Orsila			Barbie's law:
heikki.orsila@iki.fi		"Math is hard, let's go shopping!"
http://www.iki.fi/shd
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
