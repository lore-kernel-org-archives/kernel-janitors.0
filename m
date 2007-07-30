From: Grant Grundler <grundler@parisc-linux.org>
Date: Mon, 30 Jul 2007 05:39:09 +0000
Subject: Re: [PATCH 11/68] 0 -> NULL, for arch/parisc
Message-Id: <20070730053909.GF21206@colo.lackof.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270945.LAA17250@ifs.emn.fr>
In-Reply-To: <200707270945.LAA17250@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, matthew@wil.cx, grundler@parisc-linux.org, kyle@parisc-linux.org, parisc-linux@parisc-linux.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 11:45:05AM +0200, Yoann Padioleau wrote:
> 
> When comparing a pointer, it's clearer to compare it to NULL than to 0.
...
> diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
> index 04c7e1d..16fccbe 100644
> --- a/arch/parisc/kernel/smp.c
> +++ b/arch/parisc/kernel/smp.c
> @@ -333,7 +333,7 @@ smp_call_function (void (*func) (void *i
>  
>  	if (retry) {
>  		spin_lock (&lock);
> -		while (smp_call_function_data != 0)
> +		while (smp_call_function_data != NULL)
>  			barrier();
>  	}
>  	else {

Yoann,
Thanks!
I like comparing pointers to NULL since it makes it explicit we
are dealing with a pointer and is consistent with the assignment to NULL
later in the code.

But I'd like the later comparisons of smp_call_function_data to be
consistent with your suggestion above.
Patch below adds another "!= NULL".

thanks
grant

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>


diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 04c7e1d..c9ce659 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -333,12 +333,12 @@ smp_call_function (void (*func) (void *info), void *info, int retry, int wait)
 
 	if (retry) {
 		spin_lock (&lock);
-		while (smp_call_function_data != 0)
+		while (smp_call_function_data != NULL)
 			barrier();
 	}
 	else {
 		spin_lock (&lock);
-		if (smp_call_function_data) {
+		if (smp_call_function_data != NULL) {
 			spin_unlock (&lock);
 			return -EBUSY;
 		}
