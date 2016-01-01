From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 Jan 2016 08:37:03 +0000
Subject: [PATCH] staging: lustre: obdecho: constify lu_device_operations and cl_device_operations structures
Message-Id: <1451637423-23153-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

These lu_device_operations and cl_device_operations structures are never
modified, so declare them as const.  Other structures of these types are
already const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdecho/echo_client.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdecho/echo_client.c b/drivers/staging/lustre/lustre/obdecho/echo_client.c
index 7b53f7d..f32f1e7 100644
--- a/drivers/staging/lustre/lustre/obdecho/echo_client.c
+++ b/drivers/staging/lustre/lustre/obdecho/echo_client.c
@@ -582,13 +582,13 @@ static struct lu_object *echo_object_alloc(const struct lu_env *env,
 	return obj;
 }
 
-static struct lu_device_operations echo_device_lu_ops = {
+static const struct lu_device_operations echo_device_lu_ops = {
 	.ldo_object_alloc   = echo_object_alloc,
 };
 
 /** @} echo_lu_dev_ops */
 
-static struct cl_device_operations echo_device_cl_ops = {
+static const struct cl_device_operations echo_device_cl_ops = {
 };
 
 /** \defgroup echo_init Setup and teardown

