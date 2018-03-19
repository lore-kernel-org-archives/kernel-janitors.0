From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 19 Mar 2018 16:01:27 +0000
Subject: Re: [PATCH] kvm: x86: hyperv: delete dead code in kvm_hv_hypercall()
Message-Id: <a75c0f83-e49e-cfdb-6328-b1d2f1fd284e@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180317114827.GA4035@mwanda>
In-Reply-To: <20180317114827.GA4035@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17/03/2018 16:11, Liran Alon wrote:
> 
>> "rep_done" is always zero so the "(((u64)rep_done & 0xfff) << 32)"
>> expression is just zero.  We can remove the "res" temporary variable
>> as
>> well and just use "ret" directly.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
> I think this commit should better be dropped than applied.
> The original code makes sense.
> It will make it easier to implement an hyper-v rep hypercall (which require rep_done).
> I don't think it makes current code much more complicated than it is without it.

If we really want to be ready for rep hypercalls, it would be better to
have a macro

#define HVCALL_MAKE_RESULT(retcode, rep_done)

and call it with a constant 0 as the second argument.  A variable that
is never written except in the initializer is only adding noise.

Paolo
