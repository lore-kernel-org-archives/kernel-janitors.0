From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sun, 04 Apr 2004 03:16:00 +0000
Subject: [Kernel-janitors] [PATCH 0/5] remove concatenation with
Message-Id: <1081048590.755@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello all, 
	Somewhere the the recent past GCC started warning: 
"concatenation of string literals with __FUNCTION__ is deprecated" 

The following 5 patches work to change most of the offending code from: 
	printk("Hi" __FUNCTION__ "\n"); to 
	printk("Hi%s\n.", __FUNCTION__); 

In addition, these patches also "fix" the broken varargs for gcc-2.95 and
earlier (as pointed out by Arnd Bergmann) in statements I'm already touching.

I've taken these patches against 2.6.5-rc3.

I think I've gotten things correct this time but as always feedback welcome. 

Yours Tony

        linux.conf.au       http://lca2005.linux.org.au/
	Apr 18-23 2005      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
