From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 01 Apr 2004 23:00:53 +0000
Subject: Re: [Kernel-janitors] [PATCH 5/5] remove concatenation with
Message-Id: <20040401150053.4cdc5d8a.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2 Apr 2004 06:24:43 +0800 Tony Breeds wrote:

| On Thu, Apr 01, 2004 at 01:55:31PM -0800, Randy.Dunlap wrote:
| > Hi,
| > 
| > 1.  What's this trix_boot.h file in here for?
| 
| It;s an artifact fromt he build process that didn't get excluded in my
| dontdiff file and that I forgot to purge from the diff.  Sorry.

It does seem to be needed, though.  Doesn't it?

| > 2.  Some of these aren't related to $SUBJECT (__FUNCTION__), but are
| > correct IIRC (for some versions of gcc).  Can someone confirm that?
| 
| Arnd Bergmann poited them out to me so while I was in these files I also
| fixed those problems.  I can happily remove them and submitt if it's
| better.  Actually I see that I have some rather bad whitespace
| inconsistancies (mostly in the arch patch).  I'll fix them and retrans
| (take3)
|  
| > 3.  In a few cases, I noticed the addition of KERN_xyz levels to
| > printk() calls.  These are also not related to $SUBJECT so they
| > should be separate patches.  Furthermore, addition of a KERN_level
| > removes the ability to use the "default console log level" since
| > that applies only if the message doesn't have a log level, and
| > the author might actually want to use a default log level instead
| > of specifying one.
| 
| It was a bug, I deliberatly chose not to add KERN_xyz's to this patchser
| for the reasons above, but then I assumes that all the iptables DEBUGP
| marorc where ther same (which they are apart from the KERN_DEBUG in
| ip_conntrack_irc.c)  So I copied and pasted that change therby added
| inadvertabtly the KERN_DEBUG to the DEBUGP macro in the other files.
| 
| I'll definatly fix that in my take3.  Give the total size of the patches
| is <34k, should I keep them split or combine them into one patch?

Keep them split up, please.

| I'll wait to get and answer to Randy's second question before sending
| the 3rd attempt.

Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
