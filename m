From: <steve@lonetwin.net>
Date: Mon, 18 Sep 2006 13:39:29 +0000
Subject: Re: [KJ] proc entry path name
Message-Id: <200609181339.k8IDdVnV022727@smtp.osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158320370.26510.62.camel@amol.verismonetworks.com>
In-Reply-To: <1158320370.26510.62.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

walter harms wrote:
> hi all,
>  so far i understand the question was how to:
>
> entry = create_proc_entry("alexey", 0644, NULL);
> if (!entry) {
> 		printk(KERN_ERR "foo: create_proc_entry >%s
> 	}
>
>
> KERN_ERR "foo: create_proc_entry  >/proc/maintainers/janitor/alexey
>
> in very nested configurations (that you should not have) there may be more than
> one alexey. and you end up with a knowledge that one of them failed.
> something like getcwd() would be helpful.

Correct me if I am wrong but isn't it true that if create_proc_entry() is called
with the 3rd parameter as NULL, it implies that the parent directory is '/proc'
(or technically the symbol - 'proc_root') ?

Also, isn't it true, if it is not called this way, (ie: if it is called as -
create_proc_entry("foobar", 0644, parent)) then parent->name is the full path of
the parent ?

Regards
Steve






_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
