From: Colin Ian King <colin.king@canonical.com>
Date: Sat, 07 Dec 2019 15:39:37 +0000
Subject: Re: [PATCH] cpu: microcode: remove redundant check on pointer entry
Message-Id: <c1330327-56ee-0c6f-583f-58d0560cce1f@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191207153343.112887-1-colin.king@canonical.com>
In-Reply-To: <20191207153343.112887-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry, I didn't mean to cc this to kernel-janitors. please ignore.

On 07/12/2019 15:33, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for a null entry is redundant as the while loop
> also checks for this.  Remove the redundant check. Cleans
> up cppcheck style warning:
> 
> src/cpu/microcode/microcode.c:203:14: style: Condition 'entry' is
> always true [knownConditionTrueFalse]
>          if (entry &&
> 
> src/cpu/microcode/microcode.c:202:32: note: Assuming that condition
> '(entry=readdir(dir))!=NULL' is not redundant
> 
>  while ((entry = readdir(dir)) != NULL) {
> 
> src/cpu/microcode/microcode.c:203:14: note: Condition 'entry' is
> always true
>          if (entry &&
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  src/cpu/microcode/microcode.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/src/cpu/microcode/microcode.c b/src/cpu/microcode/microcode.c
> index 974fdec9..65abe50a 100644
> --- a/src/cpu/microcode/microcode.c
> +++ b/src/cpu/microcode/microcode.c
> @@ -200,8 +200,7 @@ static int microcode_test1(fwts_framework *fw)
>  
>  	/* Scan and check */
>  	while ((entry = readdir(dir)) != NULL) {
> -	        if (entry &&
> -		    (strlen(entry->d_name) > 3) &&
> +	        if ((strlen(entry->d_name) > 3) &&
>  		    (strncmp(entry->d_name,"cpu", 3) = 0) &&
>  		    (isdigit(entry->d_name[3]))) {
>  			char path[PATH_MAX];
> 
