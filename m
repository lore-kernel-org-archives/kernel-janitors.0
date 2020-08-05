From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 05 Aug 2020 00:54:18 +0000
Subject: Re: [PATCH] selftests/net: skip msg_zerocopy test if we have less than 4 CPUs
Message-Id: <b99004ea-cd9d-bec3-5f9f-82dcb00a6284@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804123012.378750-1-colin.king@canonical.com>
In-Reply-To: <20200804123012.378750-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 8/4/20 5:30 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The current test will exit with a failure if it cannot set affinity on
> specific CPUs which is problematic when running this on single CPU
> systems. Add a check for the number of CPUs and skip the test if
> the CPU requirement is not met.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/testing/selftests/net/msg_zerocopy.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/msg_zerocopy.sh b/tools/testing/selftests/net/msg_zerocopy.sh
> index 825ffec85cea..97bc527e1297 100755
> --- a/tools/testing/selftests/net/msg_zerocopy.sh
> +++ b/tools/testing/selftests/net/msg_zerocopy.sh
> @@ -21,6 +21,11 @@ readonly DADDR6='fd::2'
>  
>  readonly path_sysctl_mem="net.core.optmem_max"
>  
> +if [[ $(nproc) -lt 4 ]]; then
> +	echo "SKIP: test requires at least 4 CPUs"
> +	exit 4
> +fi
> +
>  # No arguments: automated test
>  if [[ "$#" -eq "0" ]]; then
>  	$0 4 tcp -t 1
> 

Test explicitly uses CPU 2 and 3, right ?

nproc could be 500, yet cpu 2 or 3 could be offline

# cat /sys/devices/system/cpu/cpu3/online
0
# echo $(nproc)
71
