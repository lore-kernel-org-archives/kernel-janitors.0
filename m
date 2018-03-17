From: Liran Alon <liran.alon@oracle.com>
Date: Sat, 17 Mar 2018 15:11:42 +0000
Subject: Re: [PATCH] kvm: x86: hyperv: delete dead code in kvm_hv_hypercall()
Message-Id: <215dd844-a7ce-4b24-82e0-dc2fa0c9daed@default>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180317114827.GA4035@mwanda>
In-Reply-To: <20180317114827.GA4035@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


----- dan.carpenter@oracle.com wrote:

> "rep_done" is always zero so the "(((u64)rep_done & 0xfff) << 32)"
> expression is just zero.  We can remove the "res" temporary variable
> as
> well and just use "ret" directly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

I think this commit should better be dropped than applied.
The original code makes sense.
It will make it easier to implement an hyper-v rep hypercall (which require rep_done).
I don't think it makes current code much more complicated than it is without it.

-Liran
