From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 10 Aug 2020 11:21:30 +0000
Subject: Re: [PATCH] kvm: selftests: fix spelling mistake: "missmatch" -> "missmatch"
Message-Id: <bb65571b-555d-c5e6-1242-a12881a13e01@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200810101647.62039-1-colin.king@canonical.com>
In-Reply-To: <20200810101647.62039-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/08/20 12:16, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/kvm/lib/sparsebit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
> index 031ba3c932ed..59ffba902e61 100644
> --- a/tools/testing/selftests/kvm/lib/sparsebit.c
> +++ b/tools/testing/selftests/kvm/lib/sparsebit.c
> @@ -1866,7 +1866,7 @@ void sparsebit_validate_internal(struct sparsebit *s)
>  		 * of total bits set.
>  		 */
>  		if (s->num_set != total_bits_set) {
> -			fprintf(stderr, "Number of bits set missmatch,\n"
> +			fprintf(stderr, "Number of bits set mismatch,\n"
>  				"  s->num_set: 0x%lx total_bits_set: 0x%lx",
>  				s->num_set, total_bits_set);
>  
> 

If you have a script that generates the commit message, that needs a
fix. :)  Queued though.

Paolo
