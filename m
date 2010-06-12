From: Scott Feldman <scofeldm@cisco.com>
Date: Sat, 12 Jun 2010 00:05:37 +0000
Subject: Re: [patch] enic: cleanup vic_provinfo_alloc()
Message-Id: <C8381D61.38957%scofeldm@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100610075903.GL5483@bicker>
In-Reply-To: <20100610075903.GL5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Vasanthy Kolluri <vkolluri@cisco.com>, Roopa Prabhu <roprabhu@cisco.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 6/10/10 12:59 AM, "Dan Carpenter" <error27@gmail.com> wrote:

> If oui were a null variable then vic_provinfo_alloc() would leak memory.
> But this function is only called from one place and oui is not null so
> I removed the check.
> 
> I also moved the memory allocation down a line so it was easier to spot.
> (No one ever reads variable declarations).
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

We'll pick this one up and resubmit with the next enic patch bomb.  Thanks
Dan.

-scott

