From: David Hildenbrand <david@redhat.com>
Date: Mon, 06 May 2019 09:40:12 +0000
Subject: Re: [PATCH -next] KVM: s390: fix typo in parameter description
Message-Id: <5a720ed2-0cd3-bae6-2a4d-e3e228f2d576@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504065145.53665-1-weiyongjun1@huawei.com>
In-Reply-To: <20190504065145.53665-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 04.05.19 08:51, Wei Yongjun wrote:
> Fix typo in parameter description.
> 
> Fixes: 8b905d28ee17 ("KVM: s390: provide kvm_arch_no_poll function")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  arch/s390/kvm/kvm-s390.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 8d6d75db8de6..ac6163c334d6 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -181,7 +181,7 @@ MODULE_PARM_DESC(hpage, "1m huge page backing support");
>  /* maximum percentage of steal time for polling.  >100 is treated like 100 */
>  static u8 halt_poll_max_steal = 10;
>  module_param(halt_poll_max_steal, byte, 0644);
> -MODULE_PARM_DESC(hpage, "Maximum percentage of steal time to allow polling");
> +MODULE_PARM_DESC(halt_poll_max_steal, "Maximum percentage of steal time to allow polling");
>  
>  /*
>   * For now we handle at most 16 double words as this is what the s390 base
> 
> 
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb
