From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 10:07:33 +0000
Subject: Re: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <1171619733.4096.5.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-16 at 10:46 +0100, Richard Knutsson wrote:
> Vignesh Babu BM wrote:
> > On Fri, 2007-02-16 at 08:47 +0100, Richard Knutsson wrote:
> >   
> >> Vignesh Babu BM wrote:
> >>     
> >>>  
> >>>  	size = memparse(str, &str);
> >>> -	if (*str || (size & (size-1)) || !(tr_pages & size) ||
> >>> +	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
> >>> +	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||
> >>>  		size <= PAGE_SIZE ||
> >>>  		size >= (1UL << PAGE_SHIFT << MAX_ORDER)) {
> >>>  		printk(KERN_WARNING "Invalid huge page size specified\n");  
> >>>       

> Yes, the result (I think) will be the same, but (size & (size-1)) is 0 
> when size = 0, while !is_power_of_2(0) is true (1). So can you say (size 
> & (size-1)) was intended as !is_power_of_2?
> 

In this context I'm sure that's the reason to have (size & (size-1))

Anyway...Im sending in the new ones with changes suggested by you and
rday and cc'd to the maintainers...so that should clear up and probabbly
uncover more issues ;)

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
