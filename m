From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 26 Jul 2012 23:29:20 +0000
Subject: Re: [nf-next:nf_tables2 2/2] ERROR: "nft_payload_fast_ops" [net/netfilter/nf_tables.ko] undefined!
Message-Id: <20120726232920.GA8884@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5011a101.KfeIRQeAFcxeQB93%fengguang.wu@intel.com>
In-Reply-To: <5011a101.KfeIRQeAFcxeQB93%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Fri, Jul 27, 2012 at 03:56:49AM +0800, Fengguang Wu wrote:
> Hi Pablo,
> 
> Kernel build failed on
> 
> tree:   git://150.214.188.80/nf-next nf_tables2
> head:   e293718b4f615e155e22ce4d6cc14c98291b69cc
> commit: e293718b4f615e155e22ce4d6cc14c98291b69cc [2/2] netfilter: nf_tables
> config: s390-allmodconfig (attached as .config)
> 
[...]
> All related error/warning messages:
> ERROR: "nft_payload_fast_ops" [net/netfilter/nf_tables.ko] undefined!

This is fixed in latest nf_tables4. Thanks.

This is an experimental forward port of nftables. You may experience
further issues, this is work in progress.

Regards.
