From: Shuah Khan <shuah@kernel.org>
Date: Fri, 04 May 2018 19:45:59 +0000
Subject: Re: [PATCH] selftests: fix spelling mistake: "desciptor" -> "descriptor"
Message-Id: <55d4fa6c-2870-afd4-2506-b7a3d721e711@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180429115425.9378-1-colin.king@canonical.com>
In-Reply-To: <20180429115425.9378-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 04/29/2018 05:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/filesystems/devpts_pts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
> index b9055e974289..ea5de8271521 100644
> --- a/tools/testing/selftests/filesystems/devpts_pts.c
> +++ b/tools/testing/selftests/filesystems/devpts_pts.c
> @@ -279,7 +279,7 @@ int main(int argc, char *argv[])
>  	int ret;
>  
>  	if (!isatty(STDIN_FILENO)) {
> -		fprintf(stderr, "Standard input file desciptor is not attached "
> +		fprintf(stderr, "Standard input file descriptor is not attached "
>  				"to a terminal. Skipping test\n");
>  		exit(EXIT_FAILURE);
>  	}
> 

Thanks. I will queue this up for 4.18-rc1

-- Shuah
