From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 07 Jul 2005 22:15:59 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 01/23] Audit return code of create_proc_*
Message-Id: <200507080215.59655.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707154513.561800000@rhum.iomeda.fr>
In-Reply-To: <20050707154513.561800000@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 07 July 2005 19:44, Christophe Lucas wrote:
> --- 2.6.13-rc1.orig/net/sctp/objcnt.c
> +++ 2.6.13-rc1/net/sctp/objcnt.c
>  void sctp_dbg_objcnt_init(void)
>  {
> -	create_proc_read_entry("sctp_dbg_objcnt", 0, proc_net_sctp,
> +	struct proc_dir_entry* ent;

	struct proc_dir_entry *ent;

> +	ent = create_proc_read_entry("sctp_dbg_objcnt", 0, proc_net_sctp,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
