From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 18 Jun 2010 19:43:25 +0000
Subject: Re: Strange behavior for create_proc_read_entry
Message-Id: <20100618194325.GK9298@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100618105210.af9bf8f1.rdunlap@xenotime.net>
In-Reply-To: <20100618105210.af9bf8f1.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 18, 2010 at 11:16:29PM +0530, Prashant Shah wrote:
> Hi,
> 
> Below is a small module that I was trying out (code at the end of message)
> 
> This module creates a file called /proc/jiffies that adds a message to
> the log file using printk and shows the current jiffies value to the
> user when it is read.
> 
> If I cat the /proc/jiffies file once, in the dmesg log there are three
> entries. The function create_proc_read_entry() is calling the
> my_proc_read() thrice.
> 
> o/p :
> [  997.261195] ******** Reading jiffies files *********
> [  997.261205] ******** Reading jiffies files *********
> [  997.261233] ******** Reading jiffies files *********

Try running 'strace cat /proc/jiffies'.  I wouldn't be surprised if cat
is reading the file more than once.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
