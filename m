From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 11:35:24 +0000
Subject: Re: [v2] net: qrtr: fix null pointer dereference in qrtr_ns_remove
Message-Id: <20210106113524.GI2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210105055754.16486-1-miaoqinglang@huawei.com>
 <4596fb37-5e74-5bf6-60e5-ded6fbb83969@web.de>
 <fdea7394-3e4a-0afe-6b22-7e3a258f5607@huawei.com>
 <b70726b8-0965-1fb9-2af1-2e05609905ea@web.de>
 <1a736322-42ce-e803-f91c-dc7595acffdd@huawei.com>
In-Reply-To: <1a736322-42ce-e803-f91c-dc7595acffdd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qinglang Miao <miaoqinglang@huawei.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

On Wed, Jan 06, 2021 at 05:46:22PM +0800, Qinglang Miao wrote:
> 
> 
> 在 2021/1/6 16:09, Markus Elfring 写道:
> > > > > A null-ptr-deref bug is reported by Hulk Robot like this:
> > > > 
> > > > Can it be clearer to use the term “null pointer dereference” for the final commit message?
> > > This advice is too detailed for 'null-ptr-deref' is known as a general phrase
> > 
> > This key word was provided already by the referenced KASAN report.
> > 
> Yep, you're right. 'null-ptr-deref' is not really proper here.
> > 
> > > like 'use-after-free' for kernel developer, I think.
> > I suggest to reconsider the use of abbreviations at some places.
> >  >
> > > > > Fix it by making …
> > > > 
> > > > Would you like to replace this wording by the tag “Fixes”?
> > > Sorry, I didn't get your words.
> > > 
> > > 'Fix it by' follows the solution
> > 
> > I propose to specify the desired adjustments without such a prefix
> > in the change description.
> Sorry, I can understand what you means, but I still disagree with this one,
> for:
> 
> 1. 'Fix it by' is everywhere in kernel commit message.
> 2. I think adding it or not makes no change for understanding.
> 3. I'm not sure this is an official proposal.
> 

Feel free to ignore Markus...  :/  We have asked him over and over to
stop sending these sort of advice but he refused and eventually he was
banned from the mailing lists.  The rest of us can't see his messages to
you unless we're included personally in the CC list.

regards,
dan carpenter
