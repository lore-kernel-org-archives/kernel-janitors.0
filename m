From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 12:03:08 +0000
Subject: Re: [PATCH] scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()
Message-Id: <20201203120308.GM2789@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928091300.GD377727@mwanda>
 <54f36c62-10bf-8736-39ce-27ece097d9de@proxmox.com>
In-Reply-To: <54f36c62-10bf-8736-39ce-27ece097d9de@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Cc: James.Bottomley@suse.de, jayamohank@HDRedirect-LB5-1afb6e2973825a56.elb.us-east-1.amazonaws.com, jejb@linux.ibm.com, jitendra.bhivare@broadcom.com, kernel-janitors@vger.kernel.org, ketan.mukadam@broadcom.com, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, subbu.seetharaman@broadcom.com, stable@vger.kernel.org

On Thu, Dec 03, 2020 at 11:10:09AM +0100, Thomas Lamprecht wrote:
> > The be_fill_queue() function can only fail when "eq_vaddress" is NULL
> > and since it's non-NULL here that means the function call can't fail.
> > But imagine if it could, then in that situation we would want to store
> > the "paddr" so that dma memory can be released.
> > 
> > Fixes: bfead3b2cb46 ("[SCSI] be2iscsi: Adding msix and mcc_rings V3")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This came in here through the stable 5.4 tree with v5.4.74, and we have some
> users of ours report that it results in kernel oopses and delayed boot on their
> HP DL 380 Gen 9 (and other Gen 9, FWICT) servers:
> 

Thanks for the report Thomas.  I see the bug in my patch:

drivers/scsi/be2iscsi/be_main.c
  3008                  eq_for_mcc = 1;
  3009          else
  3010                  eq_for_mcc = 0;
  3011          for (i = 0; i < (phba->num_cpus + eq_for_mcc); i++) {
  3012                  eq = &phwi_context->be_eq[i].q;
  3013                  mem = &eq->dma_mem;
  3014                  phwi_context->be_eq[i].phba = phba;
  3015                  eq_vaddress = dma_alloc_coherent(&phba->pcidev->dev,
  3016                                                     num_eq_pages * PAGE_SIZE,
  3017                                                     &paddr, GFP_KERNEL);
  3018                  if (!eq_vaddress) {
  3019                          ret = -ENOMEM;
  3020                          goto create_eq_error;
  3021                  }
  3022  
  3023                  mem->dma = paddr;
                        ^^^^^^^^^^^^^^^^
I moved this assignment ahead of the call to be_fill_queue().

  3024                  mem->va = eq_vaddress;
  3025                  ret = be_fill_queue(eq, phba->params.num_eq_entries,
  3026                                      sizeof(struct be_eq_entry), eq_vaddress);
  3027                  if (ret) {
  3028                          beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_INIT,
  3029                                      "BM_%d : be_fill_queue Failed for EQ\n");
  3030                          goto create_eq_error;
  3031                  }


drivers/scsi/be2iscsi/be_main.c
  2978  static int be_fill_queue(struct be_queue_info *q,
  2979                  u16 len, u16 entry_size, void *vaddress)
  2980  {
  2981          struct be_dma_mem *mem = &q->dma_mem;
  2982  
  2983          memset(q, 0, sizeof(*q));
                ^^^^^^^^^^^^^^^^^^^^^^^
But the first thing that it does is it overwrites it with zeros.

  2984          q->len = len;
  2985          q->entry_size = entry_size;
  2986          mem->size = len * entry_size;
  2987          mem->va = vaddress;

It also overwrites the "mem->va = eq_vaddress;" assignment as well, but
but it sets that back again here...

  2988          if (!mem->va)
  2989                  return -ENOMEM;
  2990          memset(mem->va, 0, mem->size);
  2991          return 0;
  2992  }

I will just revert my patch.  This code is messy but it works so far as
I can see.

regards,
dan carpenter
