From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 26 Jul 2012 17:19:54 +0000
Subject: Re: [nf-next:nf_tables 2/2] net/netlink/af_netlink.c:1202:1: error: redefinition of '__kstrtab_netli
Message-Id: <20120726171954.GA15538@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726021100.GA8240@localhost>
In-Reply-To: <20120726021100.GA8240@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thu, Jul 26, 2012 at 10:11:00AM +0800, Fengguang Wu wrote:
> Hi Pablo,
> 
> Kernel build failed on
> 
> tree:   nf-next/nf_tables nf_tables
> head:   0a56870cabef6f7c7d8130c752110f365129a62c
> commit: 0a56870cabef6f7c7d8130c752110f365129a62c [2/2] netfilter: nf_tables
> config: x86_64-randconfig-s004 (attached as .config)
> 
> All related error/warning messages:
> 
> net/netlink/af_netlink.c:1202:1: error: redefinition of '__kstrtab_netlink_set_err'
> net/netlink/af_netlink.c:1076:1: note: previous definition of '__kstrtab_netlink_set_err' was here
> net/netlink/af_netlink.c:1202:1: error: redefinition of '__ksymtab_netlink_set_err'
> net/netlink/af_netlink.c:1076:1: note: previous definition of '__ksymtab_netlink_set_err' was here
> 
> vim +1202 net/netlink/af_netlink.c
>   1199		read_unlock(&nl_table_lock);
>   1200		return ret;
>   1201	}
> > 1202	EXPORT_SYMBOL(netlink_set_err);

Fixed, thanks.

New branch nf_tables2 contains a fix for this.
