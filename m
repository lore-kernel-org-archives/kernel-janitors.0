From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 14:32:08 +0000
Subject: Re: [patch] clk: shmobile: r8a7779: silence some static checker warnings
Message-Id: <20140801143208.GN4804@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801081926.GB28869@mwanda>
In-Reply-To: <20140801081926.GB28869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


The code here checks for NULL and then prints an error and there is a
comment saying that it won't handle it correctly because why bother?

It's more normal to just not check for NULL at all.  I am able to find
2 places which do that:

mm/vmalloc.c:1198 vmalloc_init() error: potential null dereference 'va'.  (kzalloc returns null)
drivers/tty/vt/vt.c:2979 con_init() error: potential null dereference 'vc'.  (kzalloc returns null)

We used to have a lot more code like that but it caused static checker
warnings so people updated it to look like this:

	uv_blade_info = kzalloc(bytes, GFP_KERNEL);
	BUG_ON(!uv_blade_info);

Then btrfs started handling allocation errors that way so I made that
trigger a static checker warning as well.  Here are the places that
handle memory allocation that way during bootup.

kernel/power/snapshot.c:861 __register_nosave_region() warn: bug on allocation failure 'region'
kernel/workqueue.c:4802 wq_numa_init() warn: bug on allocation failure 'tbl'
kernel/params.c:741 locate_module_kobject() warn: bug on allocation failure 'mk'
arch/x86/kernel/apic/x2apic_uv_x.c:904 uv_system_init() warn: bug on allocation failure 'uv_blade_info'
arch/x86/kernel/apic/x2apic_uv_x.c:913 uv_system_init() warn: bug on allocation failure 'uv_node_to_blade'
arch/x86/kernel/apic/x2apic_uv_x.c:918 uv_system_init() warn: bug on allocation failure 'uv_cpu_to_blade'
arch/x86/platform/uv/uv_nmi.c:712 uv_nmi_setup() warn: bug on allocation failure 'uv_hub_nmi_list'
mm/memory_hotplug.c:133 register_memory_resource() warn: bug on allocation failure 'res'
mm/slub.c:5109 create_unique_id() warn: bug on allocation failure 'name'
mm/hugetlb.c:2165 hugetlb_init() warn: bug on allocation failure 'htlb_fault_mutex_table'
drivers/block/xen-blkfront.c:1544 blkif_recover() warn: bug on allocation failure 'split_bio'

13 warnings is very small in terms of the whole kernel which means that
most people just gave in and added NULL checks and error handling to
handle errors during boot even though they knew the errors weren't
recoverable.

Another option is would be to use __GFP_NOFAIL.  I don't know if anyone
has done that just to silence static checker warnings but it would work.

regards,
dan carpenter
