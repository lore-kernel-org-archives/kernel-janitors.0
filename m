From: shuah <shuah@kernel.org>
Date: Thu, 16 Jan 2020 20:13:09 +0000
Subject: Re: [PATCH][next] selftests: fix spelling mistake "chainged" -> "chained"
Message-Id: <2a02d10f-2ae1-acfc-d5c3-fe49dee9cba3@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191210112455.171482-1-colin.king@canonical.com>
In-Reply-To: <20191210112455.171482-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Al Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, shuah <shuah@kernel.org>

On 12/10/19 4:24 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a literal string, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   tools/testing/selftests/openat2/resolve_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
> index 7a94b1da8e7b..bbafad440893 100644
> --- a/tools/testing/selftests/openat2/resolve_test.c
> +++ b/tools/testing/selftests/openat2/resolve_test.c
> @@ -230,7 +230,7 @@ void test_openat2_opath_tests(void)
>   		{ .name = "[in_root] garbage link to /root",
>   		  .path = "cheeky/garbageself",	.how.resolve = RESOLVE_IN_ROOT,
>   		  .out.path = "root",		.pass = true },
> -		{ .name = "[in_root] chainged garbage links to /root",
> +		{ .name = "[in_root] chained garbage links to /root",
>   		  .path = "abscheeky/garbageself", .how.resolve = RESOLVE_IN_ROOT,
>   		  .out.path = "root",		.pass = true },
>   		{ .name = "[in_root] relative path to 'root'",
> 

It didn't apply to linux-kselftest next

If this is going through opennat2 tree then,

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

If not I can this for 5.6-rc2

thanks,
-- Shuah
