From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 02 Jul 2020 15:00:51 +0000
Subject: Re: [PATCH v4 02/14] irqchip/csky-apb-intc: Fix potential resource leaks
Message-Id: <20200702150051.GR2549@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-3-git-send-email-yangtiezhu@loongson.cn>
 <564ffff9-6043-7191-2458-f425dd8d0c11@web.de>
 <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
In-Reply-To: <1a0e007a-db94-501b-4ab9-0bb479ec093b@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 01, 2020 at 05:35:35PM +0800, Tiezhu Yang wrote:
> On 07/01/2020 04:40 PM, Markus Elfring wrote:
> > > … were not released in a few error cases. …
> > Another small wording adjustment:
> >    … in two error cases. …
> 
> OK

A lot of people have told Marcus over and over not to comment on commit
messages.  Greg has an automatic bot to respond to him.

https://lkml.org/lkml/2020/6/13/25

Marcus ignores us when we ask him to stop.  Some new developers have
emailed me privately that they were confused and discouraged with his
feedback because they assumed he was a senior developer or something.

regards,
dan carpenter
