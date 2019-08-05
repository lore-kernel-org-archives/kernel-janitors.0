From: shuah <shuah@kernel.org>
Date: Mon, 05 Aug 2019 15:04:14 +0000
Subject: Re: [PATCH]][next] selftests: nettest: fix spelling mistake: "potocol" -> "protocol"
Message-Id: <75376116-74e5-83ea-2bf8-837b10ff5439@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190805105211.27229-1-colin.king@canonical.com>
In-Reply-To: <20190805105211.27229-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, shuah <shuah@kernel.org>

On 8/5/19 4:52 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error messgae. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   tools/testing/selftests/net/nettest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/nettest.c b/tools/testing/selftests/net/nettest.c
> index 9278f8460d75..83515e5ea4dc 100644
> --- a/tools/testing/selftests/net/nettest.c
> +++ b/tools/testing/selftests/net/nettest.c
> @@ -1627,7 +1627,7 @@ int main(int argc, char *argv[])
>   				args.protocol = pe->p_proto;
>   			} else {
>   				if (str_to_uint(optarg, 0, 0xffff, &tmp) != 0) {
> -					fprintf(stderr, "Invalid potocol\n");
> +					fprintf(stderr, "Invalid protocol\n");
>   					return 1;
>   				}
>   				args.protocol = tmp;
> 

Assuming this will go through net tree

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
