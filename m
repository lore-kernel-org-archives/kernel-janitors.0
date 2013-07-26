From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 26 Jul 2013 15:55:03 +0000
Subject: Need clearance before sending patch
Message-Id: <51F29907.8040101@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1307261746260.2266@hadrien>
In-Reply-To: <alpine.DEB.2.02.1307261746260.2266@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

I had sent my first patch with lots of changes which wasn't correct.
Now i'm splitting them in parts as below:
1.One patch for variable name replacement (one patch per file)
2.One Patch for fixing coding style issue (one patch per file)
3.One Patch for fixing warning about using pr_warn,pr_error functions 
instead of printk(KERN_WARNING... and printk(KERN_ERR... (havn't 
replaced yet as last time you weren't convinced)

please tell me that should i apply these patches per file or one patch 
for replacement in all applied files?

Thanks

Kumar gaurav
