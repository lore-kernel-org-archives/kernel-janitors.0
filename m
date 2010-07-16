From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 09:47:10 +0000
Subject: process_reloc_for_got: no ENOMEM check
Message-Id: <20100716094710.GA24173@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>

Hi,

I've found in ./arch/alpha/kernel/module.c in process_reloc_for_got()
such code:
                     
  g = kmalloc (sizeof (*g), GFP_KERNEL);
  g->next = chains[r_sym].next;
  g->r_addend = r_addend;
  g->got_offset = *poffset;

Here we use 'g' without checking it for zero. I don't know what this
function does so I cannot write a patch myself.

Thanks.
