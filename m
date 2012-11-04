From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 04 Nov 2012 19:58:18 +0000
Subject: Re: [PATCH] drivers/misc/kgdbts.c: remove eprintk
Message-Id: <alpine.DEB.2.02.1211042051190.1960@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <509509F8.2010407@bfs.de> <alpine.DEB.2.02.1211031525500.1955@localhost6.localdomain6> <201211041939.51608.arnd@arndb.de>
In-Reply-To: <201211041939.51608.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org



On Sun, 4 Nov 2012, Arnd Bergmann wrote:

> On Saturday 03 November 2012, Julia Lawall wrote:
>> @@ -113,10 +113,6 @@
>>                 printk(KERN_INFO a); \
>>                 touch_nmi_watchdog();   \
>>         } while (0)
>> -#define eprintk(a...) do { \
>> -               printk(KERN_ERR a); \
>> -               WARN_ON(1); \
>> -       } while (0)
>>   #define MAX_CONFIG_LEN                40
>>
>>   static struct kgdb_io kgdbts_io_ops;
>> @@ -323,7 +319,7 @@ static int check_and_rewind_pc(char *put_str, char *arg)
>>                 v2printk("Emul: rewind hit single step bp\n");
>>                 restart_from_top_after_write = 1;
>>         } else if (strcmp(arg, "silent") && ip + offset != addr) {
>> -               eprintk("kgdbts: BP mismatch %lx expected %lx\n",
>> +               WARN(1, KERN_ERR "kgdbts: BP mismatch %lx expected %lx\n",
>>                            ip + offset, addr);
>>                 return 1;
>>         }
>
> Hmm, I did not think that WARN() took a KERN_ERR argument, which should
> really be implied here. Looking at the code, it really seems to be required
> at the moment, but only 5 out of 117 callers use it this way.
>
> Any idea what is going on here?

I'm not sure to understand the 5 and 117.  Using grep, I get 30 with 
KERN_ERR, 61 with some KERN thing, and 1207 without KERN.  If things are 
set up such that warn_slowpath_fmt is called, then that function adds
KERN_WARNING.  There is an alternate definition of __WARN_printf that just 
does a printk.

So if eprintk wants KERN_ERR, then it seems that rewriting it with WARN is 
not a good idea.  I will check whether this problems arises with the other 
printks and WARNs that I suggested to merge.

thanks,
julia
