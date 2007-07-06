From: James Morris <jmorris@namei.org>
Date: Fri, 06 Jul 2007 22:07:20 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <Line.LNX.4.64.0707061806390.18415@d.namei>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr> <20070706175552.GF3400@zakalwe.fi>
In-Reply-To: <20070706175552.GF3400@zakalwe.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Orsila <shdl@zakalwe.fi>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, 6 Jul 2007, Heikki Orsila wrote:

> > Transform some calls to kmalloc/memset to a single kzalloc (or 
> > kcalloc).
> 
> I looked all the files through. They looked good to me, except 
> one case:

I checked the drivers/net and net/ changes and they looked ok (aside from 
the above).


- James
-- 
James Morris
<jmorris@namei.org>
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
