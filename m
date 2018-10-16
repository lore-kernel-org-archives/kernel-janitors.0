From: Shuah Khan <shuah@kernel.org>
Date: Tue, 16 Oct 2018 14:47:29 +0000
Subject: Re: [PATCH] kvm: selftests: fix spelling mistake "Insufficent" -> "Insufficient"
Message-Id: <0dbed644-47bf-0b4d-78a8-a5a59945f663@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013154105.5999-1-colin.king@canonical.com>
In-Reply-To: <20181013154105.5999-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/13/2018 09:41 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in TEST_ASSERT message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 6fd8c089cafc..a56ef6b187bb 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -123,7 +123,7 @@ struct kvm_vm *vm_create(enum vm_guest_mode mode, uint64_t phy_pages, int perm)
>  
>  	/* Allocate memory. */
>  	vm = calloc(1, sizeof(*vm));
> -	TEST_ASSERT(vm != NULL, "Insufficent Memory");
> +	TEST_ASSERT(vm != NULL, "Insufficient Memory");
>  
>  	vm->mode = mode;
>  	vm_open(vm, perm);
> 

Thanks for the patch. Applied to linux-kselftest next for 4.20-rc1

thanks,
-- Shuah
