From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Sep 2017 08:49:33 +0000
Subject: [bug report] x86/mm: Reinitialize TLB state on hotplug and resume
Message-Id: <20170908194730.rzrkdyiwqsxwmytc@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andy Lutomirski,

The patch 72c0098d92ce: "x86/mm: Reinitialize TLB state on hotplug
and resume" from Sep 6, 2017, leads to the following static checker
warning:

	arch/x86/mm/tlb.c:244 initialize_tlbstate_and_flush()
	warn: test_bit() takes a bit number

arch/x86/mm/tlb.c
   229  void initialize_tlbstate_and_flush(void)
   230  {
   231          int i;
   232          struct mm_struct *mm = this_cpu_read(cpu_tlbstate.loaded_mm);
   233          u64 tlb_gen = atomic64_read(&init_mm.context.tlb_gen);
   234          unsigned long cr3 = __read_cr3();
   235  
   236          /* Assert that CR3 already references the right mm. */
   237          WARN_ON((cr3 & CR3_ADDR_MASK) != __pa(mm->pgd));
   238  
   239          /*
   240           * Assert that CR4.PCIDE is set if needed.  (CR4.PCIDE initialization
   241           * doesn't work like other CR4 bits because it can only be set from
   242           * long mode.)
   243           */
   244          WARN_ON(boot_cpu_has(X86_CR4_PCIDE) &&
                                     ^^^^^^^^^^^^^
This will never trigger because it should be X86_CR4_PCIDE_BIT.  I'm not
going to send a patch because it stresses me out to deal with Gliexner
because he gets so angry about my changelogs.  :P

   245                  !(cr4_read_shadow() & X86_CR4_PCIDE));
   246  
   247          /* Force ASID 0 and force a TLB flush. */
   248          write_cr3(cr3 & ~CR3_PCID_MASK);
   249  
   250          /* Reinitialize tlbstate. */
   251          this_cpu_write(cpu_tlbstate.loaded_mm_asid, 0);
   252          this_cpu_write(cpu_tlbstate.next_asid, 1);
   253          this_cpu_write(cpu_tlbstate.ctxs[0].ctx_id, mm->context.ctx_id);
   254          this_cpu_write(cpu_tlbstate.ctxs[0].tlb_gen, tlb_gen);
   255  
   256          for (i = 1; i < TLB_NR_DYN_ASIDS; i++)
   257                  this_cpu_write(cpu_tlbstate.ctxs[i].ctx_id, 0);
   258  }

regards,
dan carpenter
