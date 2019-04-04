From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 04 Apr 2019 10:45:27 +0000
Subject: Re: [PATCH 1/2] cpumask: Introduce possible_cpu_safe()
Message-Id: <20190404104527.GX4038@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404100218.GA26946@kadam>
In-Reply-To: <20190404100218.GA26946@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Amritha Nambiar <amritha.nambiar@intel.com>, Willem de Bruijn <willemb@google.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 04, 2019 at 01:02:19PM +0300, Dan Carpenter wrote:
> There have been two cases recently where we pass user a controlled "cpu"
> to possible_cpus().  That's not allowed.  If it's invalid, it will
> trigger a WARN_ONCE() and an out of bounds read which could result in an
> Oops.

> +/**
> + * cpumask_test_cpu_safe - test for a cpu in a cpumask
> + * @cpu: cpu number
> + * @cpumask: the cpumask pointer
> + *
> + * Returns 1 if @cpu is valid and set in @cpumask, else returns 0
> + */
> +static inline int cpumask_test_cpu_safe(int cpu, const struct cpumask *cpumask)
> +{
> +	if ((unsigned int)cpu >= nr_cpu_ids)
> +		return 0;
> +	cpu = array_index_nospec(cpu, NR_CPUS);

That should be:

	cpu = array_index_nospec(cpu, nr_cpu_ids);

NR_CPUS might still be out-of-bounds for dynamically allocated cpumasks.

> +	return test_bit(cpu, cpumask_bits(cpumask));
> +}

That said; I don't particularly like this interface not its naming, how
about something like:

static inline unsigned int cpumask_validate_cpu(unsigned int cpu)
{
	if (cpu >= nr_cpumask_bits)
		return nr_cpumask_bits;
	return array_index_nospec(cpu, nr_cpumask_bits);
}

Which you can then use like:

	cpu = cpumask_validate_cpu(user_cpu);
	if (cpu >= nr_cpu_ids)
		return -ENORANGE;

	/* @cpu is valid, do what needs doing */
