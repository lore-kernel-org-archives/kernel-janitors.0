From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 16 Feb 2021 14:05:09 +0000
Subject: NACK: [PATCH][next] tracing/tools: fix spelling mistake "functionph" -> "graph"
Message-Id: <87d92a26-ae1c-e76b-76b1-315e4cf759fc@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210216140112.159926-1-colin.king@canonical.com>
In-Reply-To: <20210216140112.159926-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 16/02/2021 14:01, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the -g help option, I believe
> it should be "graph". Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/tracing/latency/latency-collector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/tracing/latency/latency-collector.c b/tools/tracing/latency/latency-collector.c
> index 57b20802e71b..8d28234cd6fb 100644
> --- a/tools/tracing/latency/latency-collector.c
> +++ b/tools/tracing/latency/latency-collector.c
> @@ -1711,7 +1711,7 @@ static void show_usage(void)
>  "\t\t\tbeginning, end, and backtrace.\n\n"
>  
>  "-g, --graph\t\tEnable the display-graph option in trace_option. This\n"
> -"\t\t\toption causes ftrace to show the functionph of how\n"
> +"\t\t\toption causes ftrace to show the graph of how\n"
>  "\t\t\tfunctions are calling other functions.\n\n"
>  
>  "-c, --policy POL\tRun the program with scheduling policy POL. POL can be\n"
> 

Found another spelling mistake, sending a V2 soon.
