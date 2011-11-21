From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Nov 2011 14:50:56 +0000
Subject: [patch] mpi/mpi-mpow: NULL dereference on allocation failure
Message-Id: <20111121145056.GB19092@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't call mpi_free() on the elements if the first kzalloc() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/mpi/mpi-mpow.c b/lib/mpi/mpi-mpow.c
index 4cc7593..7328d0d 100644
--- a/lib/mpi/mpi-mpow.c
+++ b/lib/mpi/mpi-mpow.c
@@ -73,7 +73,7 @@ int mpi_mulpowm(MPI res, MPI *basearray, MPI *exparray, MPI m)
 
 	G = kzalloc((1 << k) * sizeof *G, GFP_KERNEL);
 	if (!G)
-		goto nomem;
+		goto err_out;
 
 	/* and calculate */
 	tmp = mpi_alloc(mpi_get_nlimbs(m) + 1);
@@ -129,5 +129,6 @@ nomem:
 	for (i = 0; i < (1 << k); i++)
 		mpi_free(G[i]);
 	kfree(G);
+err_out:
 	return rc;
 }
