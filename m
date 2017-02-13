From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Mon, 13 Feb 2017 10:49:09 +0000
Subject: Re: IB/hfi1: Adjust another size determination in hfi1_user_sdma_alloc_queues()
Message-Id: <e12c52db-fa00-1cdf-286c-afead3641321@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
 <0fdf4d81-58d7-c6fc-b37f-41d47675dd83@users.sourceforge.net>
 <fc714096-8534-2231-17fd-8e3ca3f7a87b@suse.de>
 <4dca91c1-488d-120d-bd25-74f400242bd2@users.sourceforge.net>
 <9ce8c7b1-1ae5-fe15-2740-b4f7653555c4@suse.de>
 <8ec653df-9d73-3c94-9559-7a732417e578@users.sourceforge.net>
In-Reply-To: <8ec653df-9d73-3c94-9559-7a732417e578-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 02/13/2017 11:37 AM, SF Markus Elfring wrote:
>> and you introduce a stylistic glitch (the new line break in a function call).
> 
> There are different opinions about this implementation detail, aren't there?

As I said, I'm just a casual reader of the RDMA list and I expressed my
opinion that this change is counter productive. It's up to the RDMA
maintainers to decide whether they want to take the change or not.

But as someone who's dayjob is to work with this code (or better
backport patches to stable trees and fix customer issues) I prefer
keeping it as it was.

So enough bikeshedding for today.
-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
