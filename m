From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 13 Feb 2004 00:51:20 +0000
Subject: Re: [Kernel-janitors] Compiler cleanups question
Message-Id: <20040212165120.66da5f6b.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402121916.14139.ron@rongage.org>
In-Reply-To: <200402121916.14139.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 12 Feb 2004 19:44:40 -0500 Ron Gage <ron@rongage.org> wrote:

| On Thursday 12 February 2004 07:28 pm, Randy.Dunlap wrote:
| > On Thu, 12 Feb 2004 19:16:14 -0500 Ron Gage <ron@rongage.org> wrote:
| > | Ok, quick question...
| > |
| > | Is it worth while to pursue eliminating the "unused parameters" or
| > | "unused variable" warnings from the 2.6 kernel?
| > |
| > | Note: there are a LOT of these!
| > |
| > |
| > | I also plan to hit all the signed/unsigned warnings as well - I just
| > | wanted some guidance on the "unused" stuff.
| >
| > I guess there could be several opinions on these.
| > To me, the answer mostly is, "it depends."
| >
| > If the unused variables are a result of something being used only
| > if the module is built as a loadable module vs. in-kernel module,
| > it's not a very big deal IMO.
| >
| > Unused parameters:  still depends.  If they are likely never to be
| > used, then they should be eliminated.
| >
| > I guess that a few specific examples might help, Ron.
| 
| Right this second, I am looking at all the "stubs" in include/linux/security.h 
| - starting around line 1909. Right this second, the parameters aren't being 
| used but obviously will be used in the future.  I am (proposing) adding 
| simple lines like "parameter = parameter;" to these stub functions to 
| temporarily squelch out the warnings.
| 
| Example from line 1909...
| static inline int security_acct (struct file *file)
| {
|         file = file;
|         return 0;
| }
| 
| Without the file=file; statement, this routine generates an "unused parameter" 
| warning.  There are many more after this one.
| 
| I am (obviously) open to suggestions about this.

Hm, I might put that kind of patch into the KJ patchset, but I
probably wouldn't send it upstream.  IOW, I'd rather see you
spend time on warnings or other bugs that are not so trivial or
pedantic.  And I expect that these (your examples above) will
change in the future.

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
