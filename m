From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 13:12:16 +0000
Subject: [bug report] csky: Cache and TLB routines
Message-Id: <20190503131147.GK29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Guo Ren,

This is a semi-automatic email about new static checker warnings.

The patch 00a9730e1007: "csky: Cache and TLB routines" from Sep 5,
2018, leads to the following Smatch complaint:

    ./arch/csky/mm/tlb.c:130 flush_tlb_page()
    warn: variable dereferenced before check 'vma' (see line 128)

./arch/csky/mm/tlb.c
   127		int cpu = smp_processor_id();
   128		int newpid = cpu_asid(cpu, vma->vm_mm);
                                           ^^^^^^^^^^
Dereferenced

   129	
   130		if (!vma || cpu_context(cpu, vma->vm_mm) != 0) {
                    ^^^^
Checked too late.

   131			page &= (PAGE_MASK << 1);
   132	

regards,
dan carpenter
