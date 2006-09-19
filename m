From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 06:18:49 +0000
Subject: Re: [KJ] proc entry path name
Message-Id: <1158646009.28299.54.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158320370.26510.62.camel@amol.verismonetworks.com>
In-Reply-To: <1158320370.26510.62.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> Also, isn't it true, if it is not called this way, (ie: if it is called as -
> create_proc_entry("foobar", 0644, parent)) then parent->name is the full path of
> the parent ?

parent->name does not contains the full path of the parent. I think the
only way to generate a full pathname is:

for (ent = leaf; ent != &proc_root; ent = ent->parent) {
	/* Extract ent->name and use it in preparing full pathname */
}
	

> 
> Regards
> Steve
> 
> 
> 
> 
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
