From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 03 Jul 2006 22:55:13 +0000
Subject: Re: [KJ] [PATCH 3] drivers/atm/idt77252.c: Fix even more KERN_* in
Message-Id: <20060703225513.GA30710@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A9B2BC.60002@chello.nl>
In-Reply-To: <44A9B2BC.60002@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 04.07.2006 [02:13:48 +0200], Richard wrote:
> Last patch to fix KERN_* in printk statements in idt77252.c
> 
> Signed-of-by: Richard van Berkum

FYI, your SOB lines are incomplete.

It should be, per Documentation/SubmittingPatches:

Signed-off-by: Random J Developer <random@developer.example.org>

(Yours are missing the e-mail address.)

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
