From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Jan 2004 17:52:31 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040112095231.13778d2c.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 12 Jan 2004 12:23:39 +0100 Domen Puncer <domen@coderock.org> wrote:

| On Monday 12 of January 2004 04:36, Randy.Dunlap wrote:
| > If you haven't already noticed it, the kernel janitors web page
| > has moved to http://janitor.kernelnewbies.org .
| >
| > That web page tells you about KJ CVS, #irc, email, etc.
| 
| # host irc.openprojects.net
| Host irc.openprojects.net not found: 3(NXDOMAIN)
| 
| In TODO and README there's still the old ml address:
| kernel-janitor-discuss@lists.sourceforge.net
| 
| README:
| Linux 2.5 kernel bugs are tracked at <http://bugzilla.kernel.org/>
| 2.5/2.6 might be better?

davej fixed these (above).

| TODO:
| http://www.lib.uaa.alaska.edu/linux-kernel/archive/2001-Week-11/0150.html
| gives 404

Now says Dead URL in the TODO file.  alaska.edu seems to have purged
their 2001 archives (still have 2002 and later).
If we knew what that contained, we could point to a different archive
for it.

| May i suggest adding this to TODO:
| - replacing __FUNCTION__ with __func__ .
| - pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
| - same for pr_info()
| - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.

All added, with changes from later emails from Christoph and Domen.

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
