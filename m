From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Jan 2004 23:54:58 +0000
Subject: Re: [Kernel-janitors] Calling yield() Considered Harmful
Message-Id: <20040112155458.15726ecd.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 7 Oct 2003 17:42:20 +0100 Matthew Wilcox <willy@debian.org> wrote:

| 
| In 2.6, the semantics of calling yield() changed from "sleep for a
| bit" to "I really don't want to run for a while".  This matches POSIX
| better, but there's a lot of drivers still using yield() when they mean
| cond_resched(), schedule() or even schedule_timeout().
| 
| Here's a list:
| 
| $ find drivers/ -type f |xargs grep 'yield[^a-z]*('
..
| 
| If you look at how sony_sleep() is typically used, what you really want to
| do is schedule_timeout(1).  But someone needs to look at all these cases..
| do I hear a volunteer?
| 
| -- 

Added to TODO list.

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
