From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 12 Jun 2007 11:50:00 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-scsi/NCR53C9x.c
Message-Id: <20070612114959.GD11591@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181625877.11780.24.camel@merlin.linuxcoe.com>
In-Reply-To: <1181625877.11780.24.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh babu <vignesh.babu@wipro.com>
Cc: linux-scsi@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>

On Tue, Jun 12, 2007 at 10:54:36AM +0530, vignesh babu wrote:
> @@ -1651,7 +1652,7 @@ static inline int reconnect_target(struct NCR_ESP *esp, struct ESP_regs *eregs)
>  	if(!(it & me))
>  		return -1;
>  	it &= ~me;
> -	if(it & (it - 1))
> +	if(!is_power_of_2(it))
>  		return -1;
>  	while(!(it & 1))
>  		targ++, it >>= 1;

I think you actually want to do:

-	if(!(it & me))
-		return -1;
 	it &= ~me;
-	if(it & (it - 1))
+	if (!is_power_of_2(it))
 		return -1;

as it looks to me like the first test is checking for the n != 0 case in
is_power_of_two().

Not that it'll matter much -- AIUI, this driver is scheduled for
deletion soon.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
