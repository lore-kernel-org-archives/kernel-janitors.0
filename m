From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 04 Apr 2004 02:28:06 +0000
Subject: Re: [Kernel-janitors] [PATCH 5/5] remove concatenation with
Message-Id: <20040403182806.2fc2b129.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 4 Apr 2004 10:20:19 +0800 Tony Breeds <tony@bakeyournoodle.com> wrote:

| On Thu, Apr 01, 2004 at 01:55:31PM -0800, Randy.Dunlap wrote:
|  
| > 2.  Some of these aren't related to $SUBJECT (__FUNCTION__), but are
| > correct IIRC (for some versions of gcc).  Can someone confirm that?
| 
| By way of a followup see:
| http://marc.theaimsgroup.com/?l=linux-kernel&m8060877327415
| 
| I think from my point of view the best way to handle this would be,
| ignore the varargs issue unless I'm already editing a statement that
| contains the bug (or I created the bug myself).
| 
| Then if it is desirable to fix all the places where gcc-2.95 has
| problems with varargs I can generate a separate patch for that.

Yes, that sounds good.

Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
