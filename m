From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sun, 04 Apr 2004 02:20:19 +0000
Subject: Re: [Kernel-janitors] [PATCH 5/5] remove concatenation with
Message-Id: <20040404022019.GU3445@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 01, 2004 at 01:55:31PM -0800, Randy.Dunlap wrote:
 
> 2.  Some of these aren't related to $SUBJECT (__FUNCTION__), but are
> correct IIRC (for some versions of gcc).  Can someone confirm that?

By way of a followup see:
http://marc.theaimsgroup.com/?l=linux-kernel&m8060877327415

I think from my point of view the best way to handle this would be,
ignore the varargs issue unless I'm already editing a statement that
contains the bug (or I created the bug myself).

Then if it is desirable to fix all the places where gcc-2.95 has
problems with varargs I can generate a separate patch for that.

Yours Tony

        linux.conf.au       http://lca2005.linux.org.au/
	Apr 18-23 2005      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
