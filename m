From: walter harms <wharms@bfs.de>
Date: Sat, 16 Sep 2006 10:58:23 +0000
Subject: Re: [KJ] proc entry path name
Message-Id: <450BD8CF.2000008@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158320370.26510.62.camel@amol.verismonetworks.com>
In-Reply-To: <1158320370.26510.62.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi all,
 so far i understand the question was how to:

entry = create_proc_entry("alexey", 0644, NULL);
if (!entry) {
		printk(KERN_ERR "foo: create_proc_entry >%s< failed\n",realpath);
	}


KERN_ERR "foo: create_proc_entry  >/proc/maintainers/janitor/alexey< failed

in very nested configurations (that you should not have) there may be more than
one alexey. and you end up with a knowledge that one of them failed.
something like getcwd() would be helpful.


re,
 walter

Alexey Dobriyan wrote:
> On Fri, Sep 15, 2006 at 05:09:30PM +0530, Amol Lad wrote:
>> I'm doing create_proc_entry return code audit. On failure I would like
>> to print "Unable to create /proc/foo/bar".
>>
>> Is there a function that takes struct proc_dir_entry * and returns
>> fullpathname ?
> 
> Me not understand why would you want it.
> 
> 	entry = create_proc_entry("alexey", 0644, NULL);
> 	if (!entry) {
> 		printk(KERN_ERR "foo: create_proc_entry alexey failed\n");
> 			...
> 	}
> 
> 	Alexey #define KERN_ERR "" Dobriyan
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
