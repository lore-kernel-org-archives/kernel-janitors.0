From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Tue, 29 Jul 2008 23:27:24 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <a4423d670807291627v7bae37ecj403fbb34fabb5b51@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2008/7/30 Jacob <jacobchappelle@gmail.com>:
> If we haven't beat this to death yet, the right way to fix these warnings
> is to return a "smth" data type... which most people have commented on
>
> // original version
> smth function()
> {
>       switch (var) {
>       case one:
>               return 1;
>       default:
>               BUG();
>       }
> }
>
> // modified version
> smth function()
> {
>       smth ret = 0;
>       switch (var) {   // unless this is a global var is undefined
>       case one:
>               ret = 1;  // 1 was not a 'smth' type so we should use
> the function's return type or face compiler errors/warnings
>               break;   // unless you want hard to find bugs always
> include a break;
>       default:
>               BUG(); // if this is a macro does it return a value?
>               ret = 0;
>               break;
>       }
>       return ret;  // since we are returning a 'smth' type we do not
> let control reach the end of this non-void funtion
> }

Looks good, but how can I know which value should it return in that case?
>
>
> Where does this function get used, and what is it used for?
Ok, some examples

kernel/cpuset.c:

static u64 cpuset_read_u64(struct cgroup *cont, struct cftype *cft)
{
        struct cpuset *cs = cgroup_cs(cont);
        cpuset_filetype_t type = cft->private;
        switch (type) {
        case FILE_CPU_EXCLUSIVE:
                return is_cpu_exclusive(cs);
        case FILE_MEM_EXCLUSIVE:
                return is_mem_exclusive(cs);
        case FILE_MEM_HARDWALL:
                return is_mem_hardwall(cs);
        case FILE_SCHED_LOAD_BALANCE:
                return is_sched_load_balance(cs);
        case FILE_MEMORY_MIGRATE:
                return is_memory_migrate(cs);
        case FILE_MEMORY_PRESSURE_ENABLED:
                return cpuset_memory_pressure_enabled;
        case FILE_MEMORY_PRESSURE:
                return fmeter_getrate(&cs->fmeter);
        case FILE_SPREAD_PAGE:
                return is_spread_page(cs);
        case FILE_SPREAD_SLAB:
                return is_spread_slab(cs);
        default:
                BUG();
        }
}

static s64 cpuset_read_s64(struct cgroup *cont, struct cftype *cft)
{
        struct cpuset *cs = cgroup_cs(cont);
        cpuset_filetype_t type = cft->private;
        switch (type) {
        case FILE_SCHED_RELAX_DOMAIN_LEVEL:
                return cs->relax_domain_level;
        default:
                BUG();
        }
}


mm/mempolicy.c:

/*
 * Depending on the memory policy provide a node from which to allocate the
 * next slab entry.
 * @policy must be protected by freeing by the caller.  If @policy is
 * the current task's mempolicy, this protection is implicit, as only the
 * task can change it's policy.  The system default policy requires no
 * such protection.
 */
unsigned slab_node(struct mempolicy *policy)
{
        if (!policy || policy->flags & MPOL_F_LOCAL)
                return numa_node_id();

        switch (policy->mode) {
        case MPOL_PREFERRED:
                /*
                 * handled MPOL_F_LOCAL above
                 */
                return policy->v.preferred_node;

        case MPOL_INTERLEAVE:
                return interleave_nodes(policy);

        case MPOL_BIND: {
                /*
                 * Follow bind policy behavior and start allocation at the
                 * first node.
                 */
                struct zonelist *zonelist;
                struct zone *zone;
                enum zone_type highest_zoneidx = gfp_zone(GFP_KERNEL);
                zonelist = &NODE_DATA(numa_node_id())->node_zonelists[0];
                (void)first_zones_zonelist(zonelist, highest_zoneidx,
                                                        &policy->v.nodes,
                                                        &zone);
                return zone->node;
        }

        default:
                BUG();
        }
}


drivers/net/sky2.c:

/* Chip internal frequency for clock calculations */
static u32 sky2_mhz(const struct sky2_hw *hw)
{
        switch (hw->chip_id) {
        case CHIP_ID_YUKON_EC:
        case CHIP_ID_YUKON_EC_U:
        case CHIP_ID_YUKON_EX:
        case CHIP_ID_YUKON_SUPR:
        case CHIP_ID_YUKON_UL_2:
                return 125;

        case CHIP_ID_YUKON_FE:
                return 100;

        case CHIP_ID_YUKON_FE_P:
                return 50;

        case CHIP_ID_YUKON_XL:
                return 156;

        default:
                BUG();
        }
}
