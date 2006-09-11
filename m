From: David Farning <dfarning@gmail.com>
Date: Mon, 11 Sep 2006 02:30:31 +0000
Subject: [KJ] fixing compile warnings
Message-Id: <1157941831.19479.9.camel@dfarning-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

I am working my way through the compile warnings in /fs

I have come across this set of warning

fs/jfs/jfs_txnmgr.c: In function ‘txCommit’:
fs/jfs/jfs_txnmgr.c:1922: warning: ‘pxd.addr2’ may be used uninitialized
in this function
fs/jfs/jfs_txnmgr.c:1922: warning: ‘pxd.addr1’ may be used uninitialized
in this function
fs/jfs/jfs_txnmgr.c:1922: warning: ‘pxd.len’ may be used uninitialized
in this function

The relevant code is as follows

	if (tlck->type & tlckTRUNCATE) {
		pxd_t pxd;	/* truncated extent of xad */
		int twm;

pxd_t is defined as follows


 96 typedef struct {
 97         unsigned len:24;
 98         unsigned addr1:8;
 99         __le32 addr2;
100 } pxd_t;

What is the proper (kernel) way to initialize pxd_t in jfs_txnmgr.c to
silence the warnings?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
