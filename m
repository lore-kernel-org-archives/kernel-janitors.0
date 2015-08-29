From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:04 +0000
Subject: [PATCH 0/8] put constant on the right of binary operator
Message-Id: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

Typically, constants appear to the right of binary operators.  The complete
semantic patch that performs this change is as follows
(http://coccinelle.lip6.fr/).  In particular, it doesn't change long
sequences of bit ors, or comparisons that are checking that some
expression has a value that is between two other values.

// <smpl>
@disable bitor_comm, neg_if_exp@
constant c,c1;
local idexpression i;
expression e,e1,e2;
binary operator b = {=,!=,&,|};
type t;
@@

(
c b (c1)
|
sizeof(t) b e1
|
sizeof e b e1
|
i b e1
|
c | e1 | e2 | ...
|
c | (e ? e1 : e2)
|
- c
+ e
b
- e
+ c
)

@disable gtr_lss, gtr_lss_eq, not_int2@
constant c,c1,c2;
expression e,e1,e2;
binary operator b;
binary operator b1 = {<,<=},b2 = {<,<=};
binary operator b3 = {>,>=},b4 = {>,>=};
local idexpression i;
type t;
@@

(
c b c1
|
sizeof(t) b e1
|
sizeof e b e1
|
 (e1 b1 e) && (e b2 e2)
|
 (e1 b3 e) && (e b4 e2)
|
i b e
|
- c < e
+ e > c
|
- c <= e
+ e >= c
|
- c > e
+ e < c
|
- c >= e
+ e <= c
)
// </smpl>

---

 drivers/staging/lustre/include/linux/lnet/types.h   |    2 +-
 drivers/staging/lustre/lnet/lnet/lib-ptl.c          |    4 ++--
 drivers/staging/lustre/lustre/ldlm/ldlm_flock.c     |    8 ++++----
 drivers/staging/lustre/lustre/libcfs/hash.c         |    6 +++---
 drivers/staging/lustre/lustre/llite/dir.c           |   10 +++++-----
 drivers/staging/lustre/lustre/llite/file.c          |   10 +++++-----
 drivers/staging/lustre/lustre/llite/llite_lib.c     |    2 +-
 drivers/staging/lustre/lustre/obdclass/cl_object.c  |    4 ++--
 drivers/staging/lustre/lustre/osc/osc_page.c        |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/client.c       |    2 +-
 drivers/staging/lustre/lustre/ptlrpc/import.c       |   10 +++++-----
 drivers/staging/lustre/lustre/ptlrpc/pack_generic.c |    2 +-
 12 files changed, 31 insertions(+), 31 deletions(-)
