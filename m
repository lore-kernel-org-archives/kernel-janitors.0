From: Tony Breeds <tony@bakeyournoodle.com>
Date: Mon, 11 Sep 2006 04:12:29 +0000
Subject: Re: [KJ] fixing compile warnings
Message-Id: <20060911041229.GZ27551@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157941831.19479.9.camel@dfarning-desktop>
In-Reply-To: <1157941831.19479.9.camel@dfarning-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 10, 2006 at 09:30:31PM -0500, David Farning wrote:
> I am working my way through the compile warnings in /fs
> 
> I have come across this set of warning
> 
> fs/jfs/jfs_txnmgr.c: In function ???txCommit???:
> fs/jfs/jfs_txnmgr.c:1922: warning: ???pxd.addr2??? may be used uninitialized
> in this function
> fs/jfs/jfs_txnmgr.c:1922: warning: ???pxd.addr1??? may be used uninitialized
> in this function
> fs/jfs/jfs_txnmgr.c:1922: warning: ???pxd.len??? may be used uninitialized
> in this function

If I read xtLog() correctly there is no way pxd can be used with out
being initialised.

The code goes something like:
xtLog()
{
...
	if (tlck->type & tlckTRUNCATE) {
		pxd_t pxd;	/* truncated extent of xad */
		....
		if (twm = next - 1) {
			...
			pxd = pxdlock->pxd;	/* save to format maplock */
			...
		}
		...
		if (twm = next - 1) {
			...
			pxdlock->pxd = pxd;
			...
		}
	}
...
}

With no changes to twm or next between the 2 access.
 
> What is the proper (kernel) way to initialize pxd_t in jfs_txnmgr.c to
> silence the warnings?

I guess you could do something like:

---
        if (tlck->type & tlckTRUNCATE) {
-               pxd_t pxd;      /* truncated extent of xad */
+               /* truncated extent of xad */
+               pxd_t pxd = {0, 0, 0};  /* FIXME: shutup GCC */
                int twm;
---

But I don't really think that's acceptable.

However, in looking at this question I found a shadow variable, I think the
patch below is a reasonable fix.


From: Tony Breeds <tony@bakeyournoodle.com>

Remove shadow variable from fs/jfs/jfs_txnmgr.c:xtLog()

Signed-off-by: Tony Breeds <tony@bakeyournoodle.com>

---

 fs/jfs/jfs_txnmgr.c |    2 --
---

--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -2026,8 +2026,6 @@ static void xtLog(struct jfs_log * log, 
                 * truncate entry XAD[twm = next - 1]:
                 */
                if (twm = next - 1) {
-                       struct pxd_lock *pxdlock;
-
                        /* format a maplock for txUpdateMap() to update bmap
                         * to free truncated delta extent of the truncated
                         * entry XAD[next - 1];

---

Yours Tony

   linux.conf.au       http://linux.conf.au/ || http://lca2007.linux.org.au/
   Jan 15-20 2007      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
