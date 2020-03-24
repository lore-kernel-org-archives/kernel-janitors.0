From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Tue, 24 Mar 2020 12:50:01 +0000
Subject: Re: [PATCH V2] perf cpumap: Fix snprintf overflow check
Message-Id: <20200324125001.GA21569@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200324070319.10901-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200324070319.10901-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, kan.liang@linux.intel.com, zhe.he@windriver.com, dzickus@redhat.com, jstancek@redhat.com, David Laight <David.Laight@aculab.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Tue, Mar 24, 2020 at 08:03:19AM +0100, Christophe JAILLET escreveu:
> 'snprintf' returns the number of characters which would be generated for
> the given input.
> 
> If the returned value is *greater than* or equal to the buffer size, it
> means that the output has been truncated.
> 
> Fix the overflow test accordingling.
                                  y

You forgot to CC David and add this to your patch, which I did:

Suggested-by: David Laight <David.Laight@ACULAB.COM>

Ok?

- Arnaldo
 
> Fixes: 7780c25bae59f ("perf tools: Allow ability to map cpus to nodes easily")
> Fixes: 92a7e1278005b ("perf cpumap: Add cpu__max_present_cpu()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: keep snprintf
>     modifiy the tests for truncated output
>     Update subject and description
> ---
>  tools/perf/util/cpumap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/cpumap.c b/tools/perf/util/cpumap.c
> index 983b7388f22b..dc5c5e6fc502 100644
> --- a/tools/perf/util/cpumap.c
> +++ b/tools/perf/util/cpumap.c
> @@ -317,7 +317,7 @@ static void set_max_cpu_num(void)
>  
>  	/* get the highest possible cpu number for a sparse allocation */
>  	ret = snprintf(path, PATH_MAX, "%s/devices/system/cpu/possible", mnt);
> -	if (ret = PATH_MAX) {
> +	if (ret >= PATH_MAX) {
>  		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
>  		goto out;
>  	}
> @@ -328,7 +328,7 @@ static void set_max_cpu_num(void)
>  
>  	/* get the highest present cpu number for a sparse allocation */
>  	ret = snprintf(path, PATH_MAX, "%s/devices/system/cpu/present", mnt);
> -	if (ret = PATH_MAX) {
> +	if (ret >= PATH_MAX) {
>  		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
>  		goto out;
>  	}
> @@ -356,7 +356,7 @@ static void set_max_node_num(void)
>  
>  	/* get the highest possible cpu number for a sparse allocation */
>  	ret = snprintf(path, PATH_MAX, "%s/devices/system/node/possible", mnt);
> -	if (ret = PATH_MAX) {
> +	if (ret >= PATH_MAX) {
>  		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
>  		goto out;
>  	}
> @@ -441,7 +441,7 @@ int cpu__setup_cpunode_map(void)
>  		return 0;
>  
>  	n = snprintf(path, PATH_MAX, "%s/devices/system/node", mnt);
> -	if (n = PATH_MAX) {
> +	if (n >= PATH_MAX) {
>  		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
>  		return -1;
>  	}
> @@ -456,7 +456,7 @@ int cpu__setup_cpunode_map(void)
>  			continue;
>  
>  		n = snprintf(buf, PATH_MAX, "%s/%s", path, dent1->d_name);
> -		if (n = PATH_MAX) {
> +		if (n >= PATH_MAX) {
>  			pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
>  			continue;
>  		}
> -- 
> 2.20.1
> 

-- 

- Arnaldo
