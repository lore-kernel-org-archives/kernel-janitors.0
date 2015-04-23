From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 07:48:19 +0000
Subject: [PATCH v2 0/15] Remove unneeded casts of void pointer
Message-Id: <1429775314-4171-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I used *smatch* and *Coccinelle* to find some unnessary void pointer casts.

The patches in this series are:
[PATCH v2 01/15] reiserfs: Avoid pointless casts in alloc codes.
[PATCH v2 02/15] procfs: Remove unnecessary cast proc alloc codes
[PATCH v2 03/15] nfs: Remove unneeded casts in nfs
[PATCH v2 04/15] ncpfs: Get rid of some pointless allocation cast
[PATCH v2 05/15] minix: No need to cast alloction return value in
[PATCH v2 06/15]  hpfs: Remove explicit casts of allocation.
[PATCH v2 07/15] efs: Remove unneeded cast
[PATCH v2 08/15] adfs: Remove unneeded cast
[PATCH v2 09/15] 9p: Remove unnessary void pointer cast
[PATCH v2 10/15] lpfc: Remove unnessary cast
[PATCH v2 11/15] hpsa: Remove unnessary cast
[PATCH v2 12/15] amdkfd: Remove unessary void pointer cast
[PATCH v2 13/15] cciss: Clean up unnessary void pointer cast
[PATCH v2 14/15] ARM: KVM: Remove pointless void pointer cast
[PATCH v2 15/15] crypto: sha1-mb - Remove pointless cast
