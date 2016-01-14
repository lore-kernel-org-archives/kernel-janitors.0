From: Huang Rui <ray.huang@amd.com>
Date: Thu, 14 Jan 2016 05:48:24 +0000
Subject: Re: [patch] x86/AMD: remove an unneeded condition in srat_detect_node()
Message-Id: <20160114054823.GB4638@hr-amur2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160113123940.GE19993@mwanda>
In-Reply-To: <20160113123940.GE19993@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Borislav Petkov <bp@suse.de>, Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>, Andy Lutomirski <luto@kernel.org>, Hector Marco-Gisbert <hecmargi@upv.es>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 13, 2016 at 03:39:40PM +0300, Dan Carpenter wrote:
> Originally we calculated ht_nodeid as "ht_nodeid = apicid - boot_cpu_id;"
> so presumably it could be negative.  But after commit 01aaea1afbcd
> ('x86: introduce initial apicid') we use c->initial_apicid which is an
> unsigned short and thus always >= 0.
> 
> It causes a static checker warning to test for impossible conditions so
> let's remove it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Looks OK for me.

Reviewed-by: Huang Rui <ray.huang@amd.com>

> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index e678dde..a07956a 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -434,8 +434,7 @@ static void srat_detect_node(struct cpuinfo_x86 *c)
>  		 */
>  		int ht_nodeid = c->initial_apicid;
>  
> -		if (ht_nodeid >= 0 &&
> -		    __apicid_to_node[ht_nodeid] != NUMA_NO_NODE)
> +		if (__apicid_to_node[ht_nodeid] != NUMA_NO_NODE)
>  			node = __apicid_to_node[ht_nodeid];
>  		/* Pick a nearby node */
>  		if (!node_online(node))
