From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Jul 2018 17:43:58 +0000
Subject: [PATCH] lib/mpi: remove redundant variable esign
Message-Id: <20180720174358.20588-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable esign is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'esign' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/mpi/mpi-pow.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/mpi/mpi-pow.c b/lib/mpi/mpi-pow.c
index 468fb7cd1221..a5c921e6d667 100644
--- a/lib/mpi/mpi-pow.c
+++ b/lib/mpi/mpi-pow.c
@@ -41,7 +41,7 @@ int mpi_powm(MPI res, MPI base, MPI exp, MPI mod)
 	mpi_ptr_t tspace = NULL;
 	mpi_ptr_t rp, ep, mp, bp;
 	mpi_size_t esize, msize, bsize, rsize;
-	int esign, msign, bsign, rsign;
+	int msign, bsign, rsign;
 	mpi_size_t size;
 	int mod_shift_cnt;
 	int negative_result;
@@ -53,7 +53,6 @@ int mpi_powm(MPI res, MPI base, MPI exp, MPI mod)
 	esize = exp->nlimbs;
 	msize = mod->nlimbs;
 	size = 2 * msize;
-	esign = exp->sign;
 	msign = mod->sign;
 
 	rp = res->d;
-- 
2.17.1

