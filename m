From: Ed Cashin <ecashin@coraid.com>
Date: Thu, 25 Oct 2012 17:35:54 +0000
Subject: Re: [PATCH] aoe: avoid using skb member after dev_queue_xmit
Message-Id: <4918A364-8C8A-4F69-B03F-644339FC1A7B@coraid.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1523cdc8a606d65418dc242e958ff1c@coraid.com>
 <20121024150807.82ce2677.akpm@linux-foundation.org>
 <20121025063322.GH20754@mwanda>
In-Reply-To: <20121025063322.GH20754@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Oct 25, 2012, at 2:33 AM, Dan Carpenter wrote:

> On Wed, Oct 24, 2012 at 03:08:07PM -0700, Andrew Morton wrote:
>> On Wed, 24 Oct 2012 14:26:13 -0400
>> Ed Cashin <ecashin@coraid.com> wrote:
>> 
>>> After calling dev_queue_xmit it is no longer safe to access the
>>> members of the skb.
>>> 
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> 
>> hm, that was clever.  How did Dan detect this bug?
> 
> It was a Smatch thing, but it wasn't enabled by default.  I think I
> will enable it.  This is the second bug use after dev_queue_xmit()
> in two years.

OK, no more procrastinating.  I'm using smatch from today forward.

-- 
  Ed Cashin
  ecashin@coraid.com


