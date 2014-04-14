From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Mon, 14 Apr 2014 18:50:18 +0000
Subject: Help required for Compiling a staging driver
Message-Id: <534C2B1A.203@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140414184618.GA13336@kroah.com>
In-Reply-To: <20140414184618.GA13336@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

I'm trying to upgrade a driver using semaphore to use mutex. I have 
applied the required changes. Now i want to compile it to ensure that i 
didn't broke the kernel.

Driver Path:drivers/staging/dgap/
I Marked this driver to load as loadable module

     kumar@anandlinux:/usr/linux-git$ grep CONFIG_DGAP .config
     CONFIG_DGAP=m

Now I'm trying to compile it using below command and getting result as given
     kumar@anandlinux:/usr/linux-git$ sudo make M=drivers/staging/dgap/
       Building modules, stage 2.
       MODPOST 0 modules

So, No module is getting build and again i'm not getting any Error as 
well. Please tell me where i'm doing wrong.

Regards,
Kumar Gaurav


